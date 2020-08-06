----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:57:22 07/19/2020 
-- Design Name: 
-- Module Name:    BOOL - Behavioral 
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

entity BOOL is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);			-- Operando A[31:0]
           B : in  STD_LOGIC_VECTOR (31 downto 0);			-- Operando B[31:0]
           BFN : in  STD_LOGIC_VECTOR (3 downto 0);		-- Indica la operacion a realizar BFN[3:0]
           Y : out  STD_LOGIC_VECTOR (31 downto 0));		-- Salida Y[31:0]
end BOOL;

architecture Behavioral of BOOL is

component MUX_4
    Port ( DATA : in  STD_LOGIC_VECTOR (3 downto 0);
           CTL : in  STD_LOGIC_VECTOR (1 downto 0);
           Y : out  STD_LOGIC);
end component;

begin
	bitwise_bool : for i in 0 to 31 generate											-- Generacion de 32 multiplexores
		LUTs : MUX_4																		-- para cada una de las operaciones
		port map(DATA => BFN, CTL(1) => B(i), CTL(0) => A(i), Y => Y(i));		-- entre los bits B(i) y A(i)
	end generate;
end Behavioral;

