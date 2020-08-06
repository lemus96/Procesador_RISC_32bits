--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   03:00:46 07/23/2020
-- Design Name:   
-- Module Name:   C:/Documents and Settings/Procesador_RISC_32bits/REGFILE_tb.vhd
-- Project Name:  Procesador_RISC_32bits
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: REGFILE
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
 
ENTITY REGFILE_tb IS
END REGFILE_tb;
 
ARCHITECTURE behavior OF REGFILE_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT REGFILE
    PORT(
         RA : IN  std_logic_vector(4 downto 0);
         RB : IN  std_logic_vector(4 downto 0);
         RA2SEL : IN  std_logic;
         RC : IN  std_logic_vector(4 downto 0);
         WASEL : IN  std_logic;
         WERF : IN  std_logic;
         WDATA : IN  std_logic_vector(31 downto 0);
         RADATA : OUT  std_logic_vector(31 downto 0);
         RBDATA : OUT  std_logic_vector(31 downto 0);
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal RA : std_logic_vector(4 downto 0) := (others => '0');
   signal RB : std_logic_vector(4 downto 0) := (others => '0');
   signal RA2SEL : std_logic := '0';
   signal RC : std_logic_vector(4 downto 0) := (others => '0');
   signal WASEL : std_logic := '0';
   signal WERF : std_logic := '0';
   signal WDATA : std_logic_vector(31 downto 0) := (others => '0');
   signal clk : std_logic := '0';

 	--Outputs
   signal RADATA : std_logic_vector(31 downto 0);
   signal RBDATA : std_logic_vector(31 downto 0);

   signal RADATA_actual : std_logic_vector(31 downto 0);
   signal RBDATA_actual : std_logic_vector(31 downto 0);
	
	file input_buf : text;
	
	signal reset : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: REGFILE PORT MAP (
          RA => RA,
          RB => RB,
          RA2SEL => RA2SEL,
          RC => RC,
          WASEL => WASEL,
          WERF => WERF,
          WDATA => WDATA,
          RADATA => RADATA,
          RBDATA => RBDATA,
          clk => clk
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
	reset <= '1', '0' after clk_period/2;		-- Reset es igual a 1 para el primer ciclo, y cero para los demas.
	
	file_open(input_buf, "Test_files\regfile_tests.csv", read_mode);
	
   -- Stimulus process
   stim_proc: process(clk)
	variable read_col_from_input_buf : line;
	
	variable val_RA2SEL_WASEL : std_logic_vector(1 downto 0);
	variable val_WERF : std_logic;
	variable val_RA, val_RB, val_RC : std_logic_vector(4 downto 0);
	variable val_WDATA, val_RADATA, val_RBDATA : std_logic_vector(31 downto 0);
	variable val_comma : character;
   begin
		if (rising_edge(clk) and reset /= '1') then
			readline(input_buf, read_col_from_input_buf);
		
			read(read_col_from_input_buf, val_RA2SEL_WASEL);
			read(read_col_from_input_buf, val_comma);
			
			read(read_col_from_input_buf, val_WERF);
			read(read_col_from_input_buf, val_comma);
			 
			read(read_col_from_input_buf, val_RA);
			read(read_col_from_input_buf, val_comma);
			
			read(read_col_from_input_buf, val_RB);
			read(read_col_from_input_buf, val_comma);
			
			read(read_col_from_input_buf, val_RC);
			read(read_col_from_input_buf, val_comma);
			
			read(read_col_from_input_buf, val_WDATA);
			read(read_col_from_input_buf, val_comma);
			
			read(read_col_from_input_buf, val_RADATA);
			read(read_col_from_input_buf, val_comma);
			
			read(read_col_from_input_buf, val_RBDATA);
			
			RA2SEL <= val_RA2SEL_WASEL(1);
			WASEL <= val_RA2SEL_WASEL(0);
			WERF <= val_WERF;
			RA <= val_RA;
			RB <= val_RB;
			RC <= val_RC;
			WDATA <= val_WDATA;
			RADATA_actual <= val_RADATA;
			RBDATA_actual <= val_RBDATA;

			assert ((RADATA_actual = RADATA) and (RBDATA_actual = RBDATA))
			report "test failed for input combination" severity error; 
		end if;
   end process;
END;
