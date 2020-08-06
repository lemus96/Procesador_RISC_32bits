--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   05:26:43 07/21/2020
-- Design Name:   
-- Module Name:   C:/Documents and Settings/Procesador_RISC_32bits/ARITH_tb.vhd
-- Project Name:  Procesador_RISC_32bits
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ARITH
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
 
ENTITY ARITH_tb IS
END ARITH_tb;
 
ARCHITECTURE behavior OF ARITH_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ARITH
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         AFN : IN  std_logic;
         S : OUT  std_logic_vector(31 downto 0);
         Z : OUT  std_logic;
         V : OUT  std_logic;
         N : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');
   signal AFN : std_logic := '0';

 	--Outputs
   signal S : std_logic_vector(31 downto 0);
   signal Z : std_logic;
   signal V : std_logic;
   signal N : std_logic;
	
	signal S_actual: std_logic_vector(31 downto 0);
	signal ZVN_actual: std_logic_vector(2 downto 0);
	file input_buf : text;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ARITH PORT MAP (
          A => A,
          B => B,
          AFN => AFN,
          S => S,
          Z => Z,
          V => V,
          N => N
        );
 

   -- Stimulus process
   stim_proc: process
	variable read_col_from_input_buf : line;
	
	variable val_A, val_B : std_logic_vector(31 downto 0);
	variable val_AFN : std_logic;
	variable val_S : std_logic_vector(31 downto 0);
	variable val_ZVN : std_logic_vector(2 downto 0);
	variable val_comma : character;
	
	variable good_num : boolean;
   begin		
		file_open(input_buf, "Test_files\arith_tests.csv", read_mode);
		while not endfile(input_buf) loop
			readline(input_buf, read_col_from_input_buf);
			
			read(read_col_from_input_buf, val_AFN, good_num);
			next when not good_num;
			read(read_col_from_input_buf, val_comma);
			
			read(read_col_from_input_buf, val_A);
			read(read_col_from_input_buf, val_comma);
			
			read(read_col_from_input_buf, val_B);
			read(read_col_from_input_buf, val_comma);
			
			read(read_col_from_input_buf, val_S);
			read(read_col_from_input_buf, val_comma);
			
			read(read_col_from_input_buf, val_ZVN);
			
			AFN <= val_AFN;
			A <= val_A;
			B <= val_B;
			S_actual <= val_S;
			ZVN_actual <= val_ZVN;
		
			wait for 20 ns;
			assert ((S_actual = S) and (ZVN_actual(2) = Z) and (ZVN_actual(1) = V) and (ZVN_actual(0) = N))
			report "test failed for input combination" severity error;
		end loop;	 

      wait;
   end process;

END;
