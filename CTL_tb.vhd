--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   05:09:24 07/24/2020
-- Design Name:   
-- Module Name:   C:/Documents and Settings/Procesador_RISC_32bits/CTL_tb.vhd
-- Project Name:  Procesador_RISC_32bits
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CTL
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
 
ENTITY CTL_tb IS
END CTL_tb;
 
ARCHITECTURE behavior OF CTL_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CTL
    PORT(
         RESET : IN  std_logic;
         IRQ : IN  std_logic;
         Z : IN  std_logic;
         OP : IN  std_logic_vector(5 downto 0);
         ALUFN : OUT  std_logic_vector(5 downto 0);
         ASEL : OUT  std_logic;
         BSEL : OUT  std_logic;
         MOE : OUT  std_logic;
         MWR : OUT  std_logic;
         PCSEL : OUT  std_logic_vector(2 downto 0);
         RA2SEL : OUT  std_logic;
         WASEL : OUT  std_logic;
         WDSEL : OUT  std_logic_vector(1 downto 0);
         WERF : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal RESET : std_logic := '0';
   signal IRQ : std_logic := '0';
   signal Z : std_logic := '0';
   signal OP : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal ALUFN : std_logic_vector(5 downto 0);
   signal ASEL : std_logic;
   signal BSEL : std_logic;
	signal MOE : std_logic;
   signal MWR : std_logic;
   signal PCSEL : std_logic_vector(2 downto 0);
   signal RA2SEL : std_logic;
   signal WASEL : std_logic;
   signal WDSEL : std_logic_vector(1 downto 0);
   signal WERF : std_logic;

   signal ALUFN_actual : std_logic_vector(5 downto 0);
   signal ASEL_actual : std_logic;
   signal BSEL_actual : std_logic;
	signal MOE_actual : std_logic;
   signal MWR_actual : std_logic;
   signal PCSEL_actual : std_logic_vector(2 downto 0);
   signal RA2SEL_actual : std_logic;
   signal WASEL_actual : std_logic;
   signal WDSEL_actual : std_logic_vector(1 downto 0);
   signal WERF_actual : std_logic;

	file input_buf : text;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CTL PORT MAP (
          RESET => RESET,
          IRQ => IRQ,
          Z => Z,
          OP => OP,
          ALUFN => ALUFN,
          ASEL => ASEL,
          BSEL => BSEL,
          MOE => MOE,
          MWR => MWR,
          PCSEL => PCSEL,
          RA2SEL => RA2SEL,
          WASEL => WASEL,
          WDSEL => WDSEL,
          WERF => WERF
        );

   -- Stimulus process
   stim_proc: process
	variable read_col_from_input_buf : line;
	
	variable val_OP : std_logic_vector(5 downto 0);
	variable val_RESET_IRQ_Z : std_logic_vector(2 downto 0);
	
	variable val_ALUFN : std_logic_vector(5 downto 0);
	variable val_ASEL_BSEL : std_logic_vector(1 downto 0);
	variable val_MOE_MWR : std_logic_vector(1 downto 0);
	variable val_PCSEL : std_logic_vector(2 downto 0);
	variable val_RA2SEL : std_logic;
	variable val_WASEL_WDSEL_WERF : std_logic_vector(3 downto 0);
	variable val_comma : character;
	
	variable good_num : boolean;
   begin		
		file_open(input_buf, "Test_files\ctl_tests.csv", read_mode);
		while not endfile(input_buf) loop
			readline(input_buf, read_col_from_input_buf);
			
			read(read_col_from_input_buf, val_OP, good_num);
			next when not good_num;
			read(read_col_from_input_buf, val_comma);
			
			read(read_col_from_input_buf, val_RESET_IRQ_Z);
			read(read_col_from_input_buf, val_comma);
			
			read(read_col_from_input_buf, val_ALUFN);
			read(read_col_from_input_buf, val_comma);
			
			read(read_col_from_input_buf, val_ASEL_BSEL);
			read(read_col_from_input_buf, val_comma);
			
			read(read_col_from_input_buf, val_MOE_MWR);
			read(read_col_from_input_buf, val_comma);
			
			read(read_col_from_input_buf, val_PCSEL);
			read(read_col_from_input_buf, val_comma);
			
			read(read_col_from_input_buf, val_RA2SEL);
			read(read_col_from_input_buf, val_comma);
			
			read(read_col_from_input_buf, val_WASEL_WDSEL_WERF);
			
			RESET <= val_RESET_IRQ_Z(2);
			IRQ <= val_RESET_IRQ_Z(1);
			Z <= val_RESET_IRQ_Z(0);
			OP <= val_OP;
			
			ALUFN_actual <= val_ALUFN;
			ASEL_actual <= val_ASEL_BSEL(1);
			BSEL_actual <= val_ASEL_BSEL(0);
			MOE_actual <= val_MOE_MWR(1);
			MWR_actual <= val_MOE_MWR(0);
			PCSEL_actual <= val_PCSEL;
			RA2SEL_actual <= val_RA2SEL;
			WASEL_actual <= val_WASEL_WDSEL_WERF(3);
			WDSEL_actual <= val_WASEL_WDSEL_WERF(2) & val_WASEL_WDSEL_WERF(1);
			WERF_actual <= val_WASEL_WDSEL_WERF(0);


			wait for 20 ns;
			assert ( ((ALUFN_actual = ALUFN) or (ALUFN_actual = "------")) and
						((ASEL_actual = ASEL) or (ASEL_actual = '-')) and
						((BSEL_actual = BSEL) or (BSEL_actual = '-')) and
						((MOE_actual = MOE) or (MOE_actual = '-')) and
						((MWR_actual = MWR) or (MWR_actual = '-')) and
						((PCSEL_actual = PCSEL) or (PCSEL_actual = "---")) and
						((RA2SEL_actual = RA2SEL) or (RA2SEL_actual = '-')) and
						((WASEL_actual = WASEL) or (WASEL_actual = '-')) and
						((WDSEL_actual = WDSEL) or (WDSEL_actual = "--")) and
						((WERF_actual = WERF) or (WERF_actual = '-')))
			report "test failed for input combination" severity error;
		end loop;
      wait;
   end process;
END;
