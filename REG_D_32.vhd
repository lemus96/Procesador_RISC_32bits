----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:52:06 07/26/2020 
-- Design Name: 
-- Module Name:    REG_D_32 - Behavioral 
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

entity REG_D_32 is
    Port ( D : in  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (31 downto 0));
end REG_D_32;

architecture Behavioral of REG_D_32 is

begin
	process (clk, D)
	begin
			if rising_edge(clk) then
				Q <= D;
			end if;
	end process;

end Behavioral;

