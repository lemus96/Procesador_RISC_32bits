----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:56:57 07/12/2020 
-- Design Name: 
-- Module Name:    alu_fa - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu_fa is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           CIN : in  STD_LOGIC;
           S : out  STD_LOGIC;
           COUT : out  STD_LOGIC);
end alu_fa;

architecture Behavioral of alu_fa is

begin
	S <= ((not A) and (not B) and (not CIN)) or ((not A) and B and (not CIN)) or (A and (not B) and (not CIN)) or (A and B and CIN);
	COUT <= ((not A) and B and CIN) or (A and (not B) and CIN) or (A and B and (not CIN)) or (A and B and CIN);
end Behavioral;