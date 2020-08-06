----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:55:55 07/23/2020 
-- Design Name: 
-- Module Name:    RAM_REGS - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;


entity RAM_REGS is
	 Generic ( addr_width : integer := 5;
			   data_width : integer := 32);

    Port ( RADDR1 : in  STD_LOGIC_VECTOR (4 downto 0);
           RADDR2 : in  STD_LOGIC_VECTOR (4 downto 0);
           WADDR : in  STD_LOGIC_VECTOR (4 downto 0);
           WDATA : in  STD_LOGIC_VECTOR (31 downto 0);
			  WEN : in STD_LOGIC;
           DATA1 : out  STD_LOGIC_VECTOR (31 downto 0);
           DATA2 : out  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC);
end RAM_REGS;

architecture Behavioral of RAM_REGS is
	type RAM_type is array ((2 ** addr_width - 1) downto 0) of STD_LOGIC_VECTOR ((data_width - 1) downto 0);
	signal ram_3_ports : RAM_type; 
begin
	process(clk)
	begin
			if (rising_edge(clk)) then
				if (WEN = '1') then
					ram_3_ports(to_integer(unsigned(WADDR))) <= WDATA;
				end if;
			end if;
	end process;
	
	DATA1 <= ram_3_ports(to_integer(unsigned(RADDR1)));
	DATA2 <= ram_3_ports(to_integer(unsigned(RADDR2)));
end Behavioral;

