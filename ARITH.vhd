----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    06:23:21 07/15/2020 
-- Design Name: 
-- Module Name:    ARITH - Behavioral 
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

entity ARITH is
	Port ( A : in STD_LOGIC_VECTOR (31 downto 0);		-- Operando A[31:0]
			 B : in STD_LOGIC_VECTOR (31 downto 0);		-- Operando B[31:0]
			 AFN : in STD_LOGIC;									-- Entrada AFN, indica el tipo de operación (suma o resta)
			 S : out STD_LOGIC_VECTOR (31 downto 0);		-- Resultado S[31:0]
			 Z : out STD_LOGIC;									-- Indicador de cero en el resultado
			 V : out STD_LOGIC;									-- Indicador de sobreflujo en el resultado
			 N : out STD_LOGIC);									-- Indicador de resultado negativo
end ARITH;


architecture Behavioral of ARITH is

component ADDR_32
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           CIN : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (31 downto 0);
           COUT : out  STD_LOGIC);
end component;

component NOR_32														-- Declaracion de una compuerta NOR de 32 entradas como componente.
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);			-- Entrada de 32 bits A[31:0]
           Z : out  STD_LOGIC);									-- Operacion NOR entre los 32 bits de la entrada A.
end component;

signal xb, sum : STD_LOGIC_VECTOR (31 downto 0);			-- Complemento a uno y salida del sumador de 32 bits.
signal cout : STD_LOGIC;

begin
	complement_1 : for i in 0 to 31 generate		-- Compuertas XOR encargadas de encontrar el
		xb(i) <= B(i) xor AFN;							-- complemento a 1 de B y asignarlo a xb.
	end generate;
	
	Adder_32_Bit : ADDR_32						-- Instanciación del módulo ADR_32.
		port map ( A => A,
					  B => xb,
					  CIN => AFN,
					  S => sum,
					  COUT => cout);		
	
	S <= sum;		-- Conexión de la señal sum con la salida S
	
	NOR_32_Inputs : NOR_32			-- Instanciación del módulo NOR_32.
		port map( A => sum,
					 Z => Z);
	

	V <= (A(31) and xb(31) and not(sum(31))) or (not(A(31)) and not(xb(31)) and sum(31));		-- Expresión SOP para la salida V 
	
	N <= sum(31);		-- El bit de signo sum(31) se conecta con la salida N
	
end Behavioral;