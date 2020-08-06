----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    06:08:46 07/19/2020 
-- Design Name: 
-- Module Name:    MUX_4 - Behavioral 
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

entity MUX_4 is
    Port ( DATA : in  STD_LOGIC_VECTOR (3 downto 0);		-- Entrada de datos DATA[31:0].
           CTL : in  STD_LOGIC_VECTOR (1 downto 0);		-- Entrada de control CTL[1:0].
           Y : out  STD_LOGIC);									-- Salida del multiplexor Y.
end MUX_4;

architecture Behavioral of MUX_4 is

begin
	with CTL select						-- Especificación de un multiplexor de 4 líneas de datos
		Y <= DATA(3) when "11",			
			  DATA(2) when "10",
			  DATA(1) when "01",
			  DATA(0) when "00",
			  '0' when others;

end Behavioral;

