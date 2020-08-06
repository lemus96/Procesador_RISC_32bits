----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:38:08 07/27/2020 
-- Design Name: 
-- Module Name:    TOP - Behavioral 
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


entity TOP is
    Port ( ID : in  STD_LOGIC_VECTOR (31 downto 0);			-- Contenido de la instruccion a ejecutar, proveniente de la memoria principal.
           MRD : in  STD_LOGIC_VECTOR (31 downto 0);			-- Datos provenientes de la memoria principal.
           IRQ : in  STD_LOGIC;										-- Solicitud de interrupciones.
           RESET : in  STD_LOGIC;									-- Entrada de reset o de encendido.
           clk : in  STD_LOGIC;										-- Reloj.
           IA : out  STD_LOGIC_VECTOR (31 downto 0);			-- Direccion de la instruccion a ejecutar.
           MA : out  STD_LOGIC_VECTOR (31 downto 0);			-- Direccion de memoria para la lectura de datos.
           MOE : out  STD_LOGIC;										-- Habilita la lectura de datos en la memoria principal.
           MWR : out  STD_LOGIC;										-- Habilita la escritura de datos en la memoria principal.
           MWD : out  STD_LOGIC_VECTOR (31 downto 0));		-- Direccion de memoria para la escritura de datos.
end TOP;

architecture Behavioral of TOP is
component PC																		-- Declaracion del componente PC.
    Port ( ID : in  STD_LOGIC_VECTOR (15 downto 0);					-- Constante de 16 bits signada.
           JT : in  STD_LOGIC_VECTOR (31 downto 2);					-- Contenido del registro Ra excluyendo los dos bits menos significativos.
           PCSEL : in  STD_LOGIC_VECTOR (2 downto 0);					-- Entrada de control para el multiplexor que determina el siguiente valor del registro PC.
           RESET : in  STD_LOGIC;											-- Entrada de reset o encendido.
           clk : in  STD_LOGIC;												-- Entrada de reloj.
           PC : out  STD_LOGIC_VECTOR (31 downto 0);					-- Valor actual del registro PC.
           PC_INC : out  STD_LOGIC_VECTOR (31 downto 0);				-- Valor PC + 4.
           PC_OFFSET : out  STD_LOGIC_VECTOR (31 downto 0));		-- Offset para instrucciones de salto.
end component;

component REGFILE															-- Declaracion del componente REGFILE.
    Port ( RA : in  STD_LOGIC_VECTOR (4 downto 0);				-- Dirección del registro A.
           RB : in  STD_LOGIC_VECTOR (4 downto 0);				-- Dirección del registro B.
           RA2SEL : in  STD_LOGIC;									-- Selección de la dirección para el registro B.
           RC : in  STD_LOGIC_VECTOR (4 downto 0);				-- Dirección del registro C.
           WASEL : in  STD_LOGIC;									-- Selección de la dirección para el registro C.
           WERF : in  STD_LOGIC;										-- Habilita la escritura de datos en el bloque.
           WDATA : in  STD_LOGIC_VECTOR (31 downto 0);		-- Contenido a escribir en el registro C.
           RADATA : out  STD_LOGIC_VECTOR (31 downto 0);		-- Contenido del registro A.
           RBDATA : out  STD_LOGIC_VECTOR (31 downto 0);		-- Contenido del registro B.
           clk : in  STD_LOGIC);										-- Entrada de reloj.
end component;

component CTL																-- Declaracion del componente CTL.
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
end component;

component ALU															-- Declaracion del componente ALU.
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);			-- Operando A[31:0]
           B : in  STD_LOGIC_VECTOR (31 downto 0);			-- Operando B[31:0]
           FN : in  STD_LOGIC_VECTOR (5 downto 0);			-- Operacion a realizar FN[5:0]
           Y : out  STD_LOGIC_VECTOR (31 downto 0));		-- Salida Y[31:0]
end component;

component NOR_32														-- Declaracion de una compuerta NOR de 32 entradas como componente.
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);			-- Entrada de 32 bits A[31:0]
           Z : out  STD_LOGIC);									-- Operacion NOR entre los 32 bits de la entrada A.
end component;


signal radata, rbdata : STD_LOGIC_VECTOR(31 downto 0);			-- Señales para la interconexion de los modulos.
signal pcsel : STD_LOGIC_VECTOR(2 downto 0);							
signal pc_inc, pc_offset : STD_LOGIC_VECTOR(31 downto 0); 		
signal ra2sel, werf, wasel : STD_LOGIC;
signal wdata : STD_LOGIC_VECTOR(31 downto 0);
signal irq_modified, z, asel, bsel : STD_LOGIC;
signal alufn : STD_LOGIC_VECTOR(5 downto 0);	
signal wdsel : STD_LOGIC_VECTOR(1 downto 0);	
signal a, b, y : STD_LOGIC_VECTOR(31 downto 0);
signal sign_extended : STD_LOGIC_VECTOR(31 downto 0);
signal ia_signal : STD_LOGIC_VECTOR(31 downto 0);									
begin
	Program_Counter : PC										
		port map( ID => ID(15 downto 0),					-- Instanciación del módulo PC.
					 JT => radata(31 downto 2),	
					 PCSEL => pcsel,
					 RESET => RESET,
					 clk => clk,
					 PC => ia_signal,
					 PC_INC => pc_inc,
					 PC_OFFSET => pc_offset);
					 
	Registers_File : REGFILE								
		port map( RA => ID(20 downto 16),				-- Instanciación del módulo REGFILE.
					 RB => ID(15 downto 11),
					 RA2SEL => ra2sel,
					 RC => ID(25 downto 21),
					 WASEL => wasel,
					 WERF => werf,
					 WDATA => wdata,
					 RADATA => radata,
					 RBDATA => rbdata,
					 clk => clk);
	
	Control_Logic : CTL
		port map( RESET => RESET,										-- Instanciación del módulo CTL.
					 IRQ => irq_modified,										
					 Z => z,											
					 OP => ID(31 downto 26),				
					 ALUFN => alufn,		
					 ASEL => asel,									
					 BSEL => bsel,									
					 MOE => MOE,										
					 MWR => MWR,										
					 PCSEL => PCSEL,		
					 RA2SEL => ra2sel,									
					 WASEL => wasel,									
					 WDSEL => wdsel,		
					 WERF => werf);
	
	Aritmetic_Logic_Unit : ALU											-- Instanciación del módulo ALU.
		port map( A => a,
					 B => b,
					 FN => alufn,
					 Y => y);
					 
	
	IA <= ia_signal;
	
	
	MWD <= rbdata;
	
	
	sign_extension : for i in 16 to 31 generate					-- Extension de signo de la constante ID[15:0].
		sign_extended(i) <= ID(15);
	end generate;
	
	sign_extended(15 downto 0) <= ID(15 downto 0);
	
	
	with bsel select								-- Multiplexor controlado por bsel.
		b <= sign_extended when '1',
			  rbdata when '0',
			  rbdata when others;
			  
			  
	with asel select
		a <= '0' & pc_offset(30 downto 0) when '1',			-- Multiplexor controlado por asel.
			  radata when '0',
			  radata when others;
			  
			  
	MA <= y;
	
	
	with wdsel select									-- Multiplexor controlado por wdsel[1:0].
		wdata <= MRD when "10",
					y when "01",
					pc_inc when "00",
					x"00000000" when others;
					
					
	NOR_32_Inputs : NOR_32			-- Instanciación del módulo NOR_32.
		port map( A => radata,
					 Z => z);
					 
	irq_modified <= IRQ and not(ia_signal(31));			-- Interrupciones solo se permiten en modo usuario.
		
end Behavioral;

