--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   06:22:34 07/21/2020
-- Design Name:   
-- Module Name:   C:/Documents and Settings/Procesador_RISC_32bits/CMP_tb.vhd
-- Project Name:  Procesador_RISC_32bits
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CMP
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE std.textio.ALL;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_textio.ALL;
 
ENTITY CMP_tb IS
END CMP_tb;

ARCHITECTURE behavior OF CMP_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CMP
    PORT(
         Z : IN  std_logic;
         V : IN  std_logic;
         N : IN  std_logic;
         CFN : IN  std_logic_vector(1 downto 0);
         Y : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Z : std_logic := '0';
   signal V : std_logic := '0';
   signal N : std_logic := '0';
   signal CFN : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal Y : std_logic_vector(31 downto 0);

	signal Y_actual: std_logic_vector(31 downto 0);
	file input_buf : text;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CMP PORT MAP (
          Z => Z,
          V => V,
          N => N,
          CFN => CFN,
          Y => Y
        );
 
 
   -- Stimulus process
   stim_proc: process
	variable read_col_from_input_buf : line;
	
	variable val_CFN : std_logic_vector(1 downto 0);
	variable val_ZVN : std_logic_vector(2 downto 0);
	variable val_Y : std_logic_vector(31 downto 0);

	variable val_comma : character;
	
	variable good_num : boolean;
   begin		
		file_open(input_buf, "Test_files\cmp_tests.csv", read_mode);
		while not endfile(input_buf) loop
			readline(input_buf, read_col_from_input_buf);
			
			read(read_col_from_input_buf, val_CFN, good_num);
			next when not good_num;
			read(read_col_from_input_buf, val_comma);
			
			read(read_col_from_input_buf, val_ZVN);
			read(read_col_from_input_buf, val_comma);
			
			read(read_col_from_input_buf, val_Y);
			
			CFN <= val_CFN;
			Z <= val_ZVN(2);
			V <= val_ZVN(1);
			N <= val_ZVN(0);
			Y_actual <= val_Y;
		
			wait for 20 ns;
			assert (Y_actual = Y)
			report "test failed for input combination" severity error;
		end loop;
      wait for 20 ns;

      wait;
   end process;

END;
