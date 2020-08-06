--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   04:02:23 07/21/2020
-- Design Name:   
-- Module Name:   C:/Documents and Settings/Procesador_RISC_32bits/BOOL_tb.vhd
-- Project Name:  Procesador_RISC_32bits
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: BOOL
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY BOOL_tb IS
END BOOL_tb;
 
ARCHITECTURE behavior OF BOOL_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BOOL
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         BFN : IN  std_logic_vector(3 downto 0);
         Y : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');
   signal BFN : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Y : std_logic_vector(31 downto 0);
	
	signal Y_actual: std_logic_vector(31 downto 0);
	file input_buf : text;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BOOL PORT MAP (
          A => A,
          B => B,
          BFN => BFN,
          Y => Y
        );


   -- Stimulus process
   stim_proc: process
	variable read_col_from_input_buf : line;
	
	variable val_A, val_B : std_logic_vector(31 downto 0);
	variable val_BFN : std_logic_vector(3 downto 0);
	variable val_Y : std_logic_vector(31 downto 0);
	variable val_comma : character;
	
	variable good_num : boolean;
   begin	
		file_open(input_buf, "Test_files\bool_tests.csv", read_mode);
		while not endfile(input_buf) loop
			readline(input_buf, read_col_from_input_buf);
			
			read(read_col_from_input_buf, val_BFN, good_num);
			next when not good_num;
			read(read_col_from_input_buf, val_comma);
			
			read(read_col_from_input_buf, val_A);
			read(read_col_from_input_buf, val_comma);
			
			read(read_col_from_input_buf, val_B);
			read(read_col_from_input_buf, val_comma);
		
			read(read_col_from_input_buf, val_Y);
			
			BFN <= val_BFN;
			A <= val_A;
			B <= val_B;
			Y_actual <= val_Y;
		
			wait for 20 ns;
			assert (Y_actual = Y)
			report "test failed for input combination" severity error;
		end loop;

      wait;
   end process;

END;
