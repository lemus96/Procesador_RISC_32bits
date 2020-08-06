----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:01:20 07/22/2020 
-- Design Name: 
-- Module Name:    REGFILE - Behavioral 
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

entity REGFILE is
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
end REGFILE;

architecture Behavioral of REGFILE is
	component RAM_REGS
		 Port ( RADDR1 : in  STD_LOGIC_VECTOR (4 downto 0);
				  RADDR2 : in  STD_LOGIC_VECTOR (4 downto 0);
				  WADDR : in  STD_LOGIC_VECTOR (4 downto 0);
				  WDATA : in  STD_LOGIC_VECTOR (31 downto 0);
				  WEN : in STD_LOGIC;
				  DATA1 : out  STD_LOGIC_VECTOR (31 downto 0);
				  DATA2 : out  STD_LOGIC_VECTOR (31 downto 0);
				  clk : in  STD_LOGIC);
	end component;

signal da, db : STD_LOGIC_VECTOR (31 downto 0);
signal rx, ry : STD_LOGIC_VECTOR (4 downto 0);
signal sa, sb : STD_LOGIC;
begin
	Registers : RAM_REGS
		port map( RADDR1 => RA,		-- Instanciacion de una RAM de 3 puertos 
					 RADDR2 => rx,
					 WADDR => ry,
					 WDATA => WDATA,
					 WEN => WERF,
					 DATA1 => da,
					 DATA2 => db, 
					 clk => clk);
	
	with RA2SEL select
		rx <= RC when '1',
				RB when '0',
				"11111" when others;		-- Direccion del registro R31
				
	with WASEL select
		ry <= "11110" when '1',			-- Direccion del registro R30 o XP
				RC when '0',
				"11111" when others;
	
	sa <= RA(4) and RA(3) and RA(2) and RA(1) and RA(0);
	sb <= rx(4) and rx(3) and rx(2) and rx(1) and rx(0);
	
	with sa select
		RADATA <= x"00000000" when '1',
					 da when '0',
					 x"00000000" when  others;

	with sb select
		RBDATA <= x"00000000" when '1',
					 db when '0',
					 x"00000000" when  others;
end Behavioral;

