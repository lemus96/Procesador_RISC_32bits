----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:37:11 07/15/2020 
-- Design Name: 
-- Module Name:    ADDR_32 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 	 FA.vhd
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ADDR_32 is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);		-- Operando A[31:0].
           B : in  STD_LOGIC_VECTOR (31 downto 0);		-- Operando B[31:0].
           CIN : in  STD_LOGIC;								-- Acarreo de entrada CIN.
           S : out  STD_LOGIC_VECTOR (31 downto 0);	-- Resultado de la operación S[31:0].
           COUT : out  STD_LOGIC);							-- Acarreo de salida COUT.
end ADDR_32;

architecture Behavioral of ADDR_32 is

component FA
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           CIN : in  STD_LOGIC;
           S : out  STD_LOGIC;
           COUT : out  STD_LOGIC);
end component;

signal int_c : STD_LOGIC_VECTOR (31 downto 0);		-- Contiene cada uno de los 31 acarreos producidos por los módulos FA.
signal int_cout : STD_LOGIC;								-- Esta señal se conecta a la salida S[31].

begin
	Full_Adder_0: FA
		port map (A => A(0), B => B(0), CIN => CIN, S => S(0), COUT => int_c(0));		-- Instanciación del módulo FA0.
		
	cascade : for i in 1 to 31 generate
		Full_Adder_i: FA
		port map (A => A(i), B => B(i), CIN => int_c(i - 1), S => S(i), COUT => int_c(i));		-- Instanciación de los 31 módulos FA restantes.
	end generate;

	int_cout <= int_c(31);		-- Conexión del acarreo de salida del último módulo FA con la salida COUT
	COUT <= int_cout;				
end Behavioral;

