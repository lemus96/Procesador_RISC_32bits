----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:03:02 07/26/2020 
-- Design Name: 
-- Module Name:    PC - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC is
    Port ( ID : in  STD_LOGIC_VECTOR (15 downto 0);					-- Constante de 16 bits signada.
           JT : in  STD_LOGIC_VECTOR (31 downto 2);					-- Contenido del registro Ra excluyendo los dos bits menos significativos.
           PCSEL : in  STD_LOGIC_VECTOR (2 downto 0);					-- Entrada de control para el multiplexor que determina el siguiente valor del registro PC.
           RESET : in  STD_LOGIC;											-- Entrada de reset o encendido.
           clk : in  STD_LOGIC;												-- Entrada de reloj.
           PC : out  STD_LOGIC_VECTOR (31 downto 0);					-- Valor actual del registro PC.
           PC_INC : out  STD_LOGIC_VECTOR (31 downto 0);				-- Valor PC + 4.
           PC_OFFSET : out  STD_LOGIC_VECTOR (31 downto 0));		-- Offset para instrucciones de salto.
end PC;

architecture Behavioral of PC is
	component ADDR_32													-- Declaracion del modulo sumador de 32 bits como componente.
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           CIN : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (31 downto 0);
           COUT : out  STD_LOGIC);
	end component;
	
	component REG_D_32												-- Declaracion del modulo del registro de 32 bits como componente.
    Port ( D : in  STD_LOGIC_VECTOR (31 downto 0);			-- Entrada de datos.
           clk : in  STD_LOGIC;									-- Entrada de reloj.
           Q : out  STD_LOGIC_VECTOR (31 downto 0));		-- Salida de datos.
	end component;

	signal d : STD_LOGIC_VECTOR(31 downto 0);								-- Entrada de datos del registro de 32 bits.
	signal q : STD_LOGIC_VECTOR(31 downto 0);								-- Salida de datos del registro de 32 bits.
	signal pc_4 : STD_LOGIC_VECTOR(31 downto 0);							-- Valor PC + 4, sin modificacion de seguridad del bit de supervisor.
	signal sign : STD_LOGIC_VECTOR(13 downto 0);							-- Señal de extension de signo para ID[15:0]
	signal offset : STD_LOGIC_VECTOR(31 downto 0);						-- Señal de offset.
	signal pc_16 : STD_LOGIC_VECTOR(31 downto 0);						-- Valor PC + offset, sin modificacion de seguridad del bit de supervisor.
	signal mux4_out, mux2_out : STD_LOGIC_VECTOR(31 downto 0);		-- Señal de control del multiplexor de 5 entradas.
	signal next_pc : STD_LOGIC;												-- Siguiente valor para el bit de supervisor.
	signal cout1, cout2 : STD_LOGIC;
begin	
	REG_D_32_0 : REG_D_32
		port map (D => d, clk => clk, Q => q);
	
	PC <= q;		-- Conexion de la salida del registro, q, con la salida PC.
	
	ADDR_32_1: ADDR_32
		port map (A => x"00000004", B => q, CIN => '0', S => pc_4);		-- Instanciación del sumador PC + 4.
		
	PC_INC <= q(31) & pc_4(30 downto 0);		-- Modificacion de la señal pc_4 para conservar el bit de supervisor.
	
	sign_extension : for i in 0 to 13 generate
		sign(i) <= ID(15);
	end generate;
	
	offset <= sign(13 downto 0) & ID & "00";		-- Calculo de 4*(SEXT(ID[15:0]))
	
	ADDR_32_2: ADDR_32
		port map (A => pc_4, B => offset, CIN => '0', S => pc_16);		-- Instanciación del sumador PC + 4 + 4(SEXT(ID[15:0])).
	
	PC_OFFSET <= q(31) & pc_16(30 downto 0);		-- Modificacion de la señal pc_16 para conservar el bit de supervisor.
	next_pc <= JT(31) and q(31);						-- Determina el nuevo bit de supervisor.
	
	with PCSEL(1 downto 0) select												-- Multiplexor de 4 entradas controlado por PCSEL[1:0].
		mux4_out <= x"80000004" when "11",									-- Direccion para manejo de opcodes ilegales (ILLOP).
						next_pc & JT(30 downto 2) & "00" when "10",		-- Direccion para saltos con la instruccion JMP.
						q(31) & pc_16(30 downto 0) when "01",				-- Salida del sumador PC + 4 modificada.
						q(31) & pc_4(30 downto 0) when "00",				-- Salida del sumador PC + 4 + 4(SEXT(ID[15:0])) modificada.
						x"80000004" when others;
	
	with PCSEL(2) select								-- Multiplexor de 2 entradas controlado por PCSEL[2].
		mux2_out <= x"80000008" when '1',		-- Direccion para manejo de excepciones (XADR).
						mux4_out when '0',			-- Salida del multiplexor de 4 entradas.
						x"80000000" when others;

	with RESET select									-- Multiplexor controlado por la entrada RESET.
		d <= x"80000000" when '1',					-- Direccion de RESET.
			  mux2_out when '0',
			  x"80000000" when others;
end Behavioral;

