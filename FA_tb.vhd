--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   04:19:55 07/16/2020
-- Design Name:   
-- Module Name:   C:/Documents and Settings/Procesador_RISC_32bits/FA_tb.vhd
-- Project Name:  Procesador_RISC_32bits
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FA
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
USE ieee.std_logic_1164.ALL;
USE std.textio.ALL;
USE ieee.std_logic_textio.ALL;
 

ENTITY FA_tb IS
END FA_tb;
 
ARCHITECTURE behavior OF FA_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FA
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         CIN : IN  std_logic;
         S : OUT  std_logic;
         COUT : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic;
   signal B : std_logic;
   signal CIN : std_logic;

 	--Outputs
   signal S : std_logic;
   signal COUT : std_logic;
	
	signal S_actual : std_logic;
	signal COUT_actual : std_logic;
	file input_buf : text;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FA PORT MAP (
          A => A,
          B => B,
          CIN => CIN,
          S => S,
          COUT => COUT
        );

   -- Stimulus process
   stim_proc: process
	variable read_col_from_input_buf : line;

	variable val_a, val_b, val_cin : std_logic;
	variable val_s, val_cout : std_logic;
	variable val_comma : character;
	
	variable good_num : boolean;
   begin
		file_open(input_buf, "Test_files\fa_tests.csv", read_mode);
		
		while not endfile(input_buf) loop
			readline(input_buf, read_col_from_input_buf);
			
			read(read_col_from_input_buf, val_a, good_num);
			next when not good_num;
			read(read_col_from_input_buf, val_comma);
			
			read(read_col_from_input_buf, val_b);
			read(read_col_from_input_buf, val_comma);
			
			read(read_col_from_input_buf, val_cin);
			read(read_col_from_input_buf, val_comma);
			
			read(read_col_from_input_buf, val_s);
			read(read_col_from_input_buf, val_comma);
			
			read(read_col_from_input_buf, val_cout);
			
			A <= val_a;
			B <= val_b;
			CIN <= val_cin;
			S_actual <= val_s;
			COUT_actual <= val_cout;
			
			wait for 20 ns;
			assert ((S_actual = S) and (COUT_actual = COUT))
			report "test failed for input combination" severity error;
		end loop;
		file_close(input_buf);
		wait;
   end process;

END behavior;
