----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:47:36 07/28/2020 
-- Design Name: 
-- Module Name:    MUX_2_32 - Behavioral 
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

entity MUX_2_32 is
    Port ( D1 : in  STD_LOGIC_VECTOR (31 downto 0);
           D0 : in  STD_LOGIC_VECTOR (31 downto 0);
           SEL : in  STD_LOGIC;
           DATA : out  STD_LOGIC_VECTOR (31 downto 0));
end MUX_2_32;

architecture Behavioral of MUX_2_32 is

begin
	with SEL select
		DATA <= D1 when '1',
				  D0 when '0',
				  D0 when others;

end Behavioral;

