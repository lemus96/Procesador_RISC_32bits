--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.68d
--  \   \         Application: netgen
--  /   /         Filename: FA_synthesis.vhd
-- /___/   /\     Timestamp: Wed Jul 15 03:15:59 2020
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm FA -w -dir netgen/synthesis -ofmt vhdl -sim FA.ngc FA_synthesis.vhd 
-- Device	: xc3s500e-4-fg320
-- Input file	: FA.ngc
-- Output file	: C:\Documents and Settings\Procesador_RISC_32bits\netgen\synthesis\FA_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: FA
-- Xilinx	: C:\Xilinx\14.6\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity FA is
  port (
    COUT : out STD_LOGIC; 
    A : in STD_LOGIC := 'X'; 
    B : in STD_LOGIC := 'X'; 
    S : out STD_LOGIC; 
    CIN : in STD_LOGIC := 'X' 
  );
end FA;

architecture Structure of FA is
  signal A_IBUF_1 : STD_LOGIC; 
  signal B_IBUF_3 : STD_LOGIC; 
  signal CIN_IBUF_5 : STD_LOGIC; 
  signal COUT_OBUF_7 : STD_LOGIC; 
  signal S_OBUF_9 : STD_LOGIC; 
begin
  COUT1 : LUT3
    generic map(
      INIT => X"E8"
    )
    port map (
      I0 => B_IBUF_3,
      I1 => CIN_IBUF_5,
      I2 => A_IBUF_1,
      O => COUT_OBUF_7
    );
  S1 : LUT3
    generic map(
      INIT => X"93"
    )
    port map (
      I0 => B_IBUF_3,
      I1 => CIN_IBUF_5,
      I2 => A_IBUF_1,
      O => S_OBUF_9
    );
  A_IBUF : IBUF
    port map (
      I => A,
      O => A_IBUF_1
    );
  B_IBUF : IBUF
    port map (
      I => B,
      O => B_IBUF_3
    );
  CIN_IBUF : IBUF
    port map (
      I => CIN,
      O => CIN_IBUF_5
    );
  COUT_OBUF : OBUF
    port map (
      I => COUT_OBUF_7,
      O => COUT
    );
  S_OBUF : OBUF
    port map (
      I => S_OBUF_9,
      O => S
    );

end Structure;

