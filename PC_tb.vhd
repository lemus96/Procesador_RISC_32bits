--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   05:04:37 07/26/2020
-- Design Name:   
-- Module Name:   C:/Documents and Settings/Procesador_RISC_32bits/PC_tb.vhd
-- Project Name:  Procesador_RISC_32bits
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PC
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
 
ENTITY PC_tb IS
END PC_tb;
 
ARCHITECTURE behavior OF PC_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PC
    PORT(
         ID : IN  std_logic_vector(15 downto 0);
         JT : IN  std_logic_vector(31 downto 2);
         PCSEL : IN  std_logic_vector(2 downto 0);
         RESET : IN  std_logic;
         clk : IN  std_logic;
         PC : OUT  std_logic_vector(31 downto 0);
         PC_INC : OUT  std_logic_vector(31 downto 0);
         PC_OFFSET : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ID : std_logic_vector(15 downto 0) := (others => '1');
   signal JT : std_logic_vector(31 downto 2) := (others => '0');
   signal PCSEL : std_logic_vector(2 downto 0) := "011";
   signal RESET : std_logic := '1';
   signal clk : std_logic := '0';

 	--Outputs
   signal PC_S : std_logic_vector(31 downto 0);
   signal PC_INC : std_logic_vector(31 downto 0);
   signal PC_OFFSET : std_logic_vector(31 downto 0);

   signal PC_actual : std_logic_vector(31 downto 0);
   signal PC_INC_actual : std_logic_vector(31 downto 0);
   signal PC_OFFSET_actual : std_logic_vector(31 downto 0);
	
	file input_buf : text;
	
	--signal rst : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PC PORT MAP (
          ID => ID,
          JT => JT,
          PCSEL => PCSEL,
          RESET => RESET,
          clk => clk,
          PC => PC_S,
          PC_INC => PC_INC,
          PC_OFFSET => PC_OFFSET
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
	--rst <= '1', '0' after clk_period/2;		-- Reset es igual a 1 para el primer ciclo, y cero para los demas.
	
	file_open(input_buf, "Test_files\pc_tests.csv", read_mode);

   -- Stimulus process
   stim_proc: process(clk)
	variable read_col_from_input_buf : line;
	
	variable val_RESET : std_logic;
	variable val_PCSEL : std_logic_vector(2 downto 0);
	variable val_ID : std_logic_vector(15 downto 0);
	variable val_JT : std_logic_vector(31 downto 2);
	variable val_PC, val_PC_INC, val_PC_OFFSET : std_logic_vector(31 downto 0);
	variable val_comma : character;
   begin		
		if rising_edge(clk) then											-- Lectura de los valores de salida en flancos de subida.
			readline(input_buf, read_col_from_input_buf);
			
			read(read_col_from_input_buf, val_PC);
			read(read_col_from_input_buf, val_comma);
			
			read(read_col_from_input_buf, val_PC_INC);
			read(read_col_from_input_buf, val_comma);
			
			read(read_col_from_input_buf, val_PC_OFFSET);
			
			PC_actual <= val_PC;
			PC_INC_actual <= val_PC_INC;
			PC_OFFSET_actual <= val_PC_OFFSET;

			--assert ((PC_actual = PC_S) and (PC_INC_actual = PC_INC) and (PC_OFFSET_actual = PC_OFFSET))
			--report "Test failed for input combination" severity error;
		end if;
	 
		if falling_edge(clk) then											-- Lectura de los valores de entrada en flancos de bajada.
			readline(input_buf, read_col_from_input_buf);
			
			read(read_col_from_input_buf, val_RESET);
			read(read_col_from_input_buf, val_comma);
			
			read(read_col_from_input_buf, val_PCSEL);
			read(read_col_from_input_buf, val_comma);

			read(read_col_from_input_buf, val_ID);
			read(read_col_from_input_buf, val_comma);			
			
			read(read_col_from_input_buf, val_JT);
			
			RESET <= val_RESET;
			PCSEL <= val_PCSEL;
			ID <= val_ID;
			JT <= val_JT;
		end if;
   end process;

END;
