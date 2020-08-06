----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:39:37 07/24/2020 
-- Design Name: 
-- Module Name:    CTL - Behavioral 
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

entity CTL is
    Port ( RESET : in  STD_LOGIC;									-- Entrada de reset o encendido.
           IRQ : in  STD_LOGIC;										-- Solicitud de interrupción.
           Z : in  STD_LOGIC;											-- Indica si el contenido de RA es igual a cero.
           OP : in  STD_LOGIC_VECTOR (5 downto 0);				-- Opcode de 6 bits.
           ALUFN : out  STD_LOGIC_VECTOR (5 downto 0);		-- Indica la operación que debe realizar la ALU.
           ASEL : out  STD_LOGIC;									-- Determina la fuente de datos para el operando A de la ALU.
           BSEL : out  STD_LOGIC;									-- Determina la fuente de datos para el operando B de la ALU.
           MOE : out  STD_LOGIC;										-- Habilita la lectura desde la memoria principal.
           MWR : out  STD_LOGIC;										-- Habilita la escritura en la memoria principal.
           PCSEL : out  STD_LOGIC_VECTOR (2 downto 0);		-- Determina el siguiente valor del registro PC.
           RA2SEL : out  STD_LOGIC;									-- Determina la fuente de datos para la dirección del registro RB.
           WASEL : out  STD_LOGIC;									-- Determina la fuente de datos para la dirección del registro RC.
           WDSEL : out  STD_LOGIC_VECTOR (1 downto 0);		-- Determina la fuente de datos para la escritura en el registro RC.
           WERF : out  STD_LOGIC);									-- Habilita la escritura en el bloque de registros.
end CTL;

architecture Behavioral of CTL is
	component ROM																	-- Declaracion del componente ROM.
		    Port ( ADDR : in  STD_LOGIC_VECTOR (5 downto 0);			-- Dirección de la localidad a leer.
					  DATA : out  STD_LOGIC_VECTOR (17 downto 0));		-- Contenido de la loalidad de memoria.
	end component;
	
	signal d : STD_LOGIC_VECTOR (17 downto 0);		-- Señal para almacenar los datos obtenidos desde la ROM.
	signal sel : STD_LOGIC_VECTOR (2 downto 0);		-- Señales intermedias.
	signal control : STD_LOGIC;
	signal s3, s2, s1, s0 : STD_LOGIC;					-- Productos parciales para calcular la señal control.
begin
	ROM_64x18 : ROM						-- Instanciacion de la ROM de 64*18.
		port map( ADDR => OP,
					 DATA => d);

	ALUFN <= d(17) & d(16) & d(15) & d(14) & d(13) & d(12);
	ASEL <= d(11);		
	BSEL <= d(10);
	MOE <= d(9);
	MWR <= (d(8) and not(IRQ)) and not(RESET);
	
	with IRQ select
		PCSEL <= "100" when '1',			-- Multiplexor de 2 líneas para determinar el valor de PCSEL.
					sel when '0',
					"000" when others;
	
	
	s0 <= not(OP(5)) and OP(4) and OP(3);						-- Verifica si el opcode corresponde con BEQ y si Z = 0.
	s1 <= OP(2) and not(OP(1)) and not(OP(0)) and Z;
	
	s2 <= not(OP(5)) and OP(4) and OP(3);						-- Verifica si el opcode corresponde con BNE y si Z no es igual a 0.
	s3 <= OP(2) and not(OP(1)) and OP(0) and not(Z);
	
	control <= (s0 and s1) or (s2 and s3);						-- Determina si se debe tomar un salto en instrucciones BEQ y BNE.
	
	with control select
		sel <= "001" when '1',							-- Multiplexor de 2 líneas para determinar el valor de sel.
				 d(7) & d(6) & d(5) when '0',		
				 "000" when others;
				 
	RA2SEL <= d(4);
	WASEL <= IRQ or d(3);
	
	with IRQ select						
		WDSEL <= "00" when '1',				-- Multiplexor de 2 lineas para determinar el valor de WDSEL.
					d(2) & d(1) when '0',
					"00" when others;
					
	WERF <= IRQ or d(0);
	
end Behavioral;

