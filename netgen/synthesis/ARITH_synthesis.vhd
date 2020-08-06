--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.68d
--  \   \         Application: netgen
--  /   /         Filename: ARITH_synthesis.vhd
-- /___/   /\     Timestamp: Sun Jul 19 03:56:25 2020
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm ARITH -w -dir netgen/synthesis -ofmt vhdl -sim ARITH.ngc ARITH_synthesis.vhd 
-- Device	: xc3s500e-4-fg320
-- Input file	: ARITH.ngc
-- Output file	: C:\Documents and Settings\Procesador_RISC_32bits\netgen\synthesis\ARITH_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: ARITH
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

entity ARITH is
  port (
    N : out STD_LOGIC; 
    V : out STD_LOGIC; 
    Z : out STD_LOGIC; 
    AFN : in STD_LOGIC := 'X'; 
    S : out STD_LOGIC_VECTOR ( 31 downto 0 ); 
    A : in STD_LOGIC_VECTOR ( 31 downto 0 ); 
    B : in STD_LOGIC_VECTOR ( 31 downto 0 ) 
  );
end ARITH;

architecture Structure of ARITH is
  signal AFN_IBUF_64 : STD_LOGIC; 
  signal A_0_IBUF_65 : STD_LOGIC; 
  signal A_10_IBUF_66 : STD_LOGIC; 
  signal A_11_IBUF_67 : STD_LOGIC; 
  signal A_12_IBUF_68 : STD_LOGIC; 
  signal A_13_IBUF_69 : STD_LOGIC; 
  signal A_14_IBUF_70 : STD_LOGIC; 
  signal A_15_IBUF_71 : STD_LOGIC; 
  signal A_16_IBUF_72 : STD_LOGIC; 
  signal A_17_IBUF_73 : STD_LOGIC; 
  signal A_18_IBUF_74 : STD_LOGIC; 
  signal A_19_IBUF_75 : STD_LOGIC; 
  signal A_1_IBUF_76 : STD_LOGIC; 
  signal A_20_IBUF_77 : STD_LOGIC; 
  signal A_21_IBUF_78 : STD_LOGIC; 
  signal A_22_IBUF_79 : STD_LOGIC; 
  signal A_23_IBUF_80 : STD_LOGIC; 
  signal A_24_IBUF_81 : STD_LOGIC; 
  signal A_25_IBUF_82 : STD_LOGIC; 
  signal A_26_IBUF_83 : STD_LOGIC; 
  signal A_27_IBUF_84 : STD_LOGIC; 
  signal A_28_IBUF_85 : STD_LOGIC; 
  signal A_29_IBUF_86 : STD_LOGIC; 
  signal A_2_IBUF_87 : STD_LOGIC; 
  signal A_30_IBUF_88 : STD_LOGIC; 
  signal A_31_IBUF_89 : STD_LOGIC; 
  signal A_3_IBUF_90 : STD_LOGIC; 
  signal A_4_IBUF_91 : STD_LOGIC; 
  signal A_5_IBUF_92 : STD_LOGIC; 
  signal A_6_IBUF_93 : STD_LOGIC; 
  signal A_7_IBUF_94 : STD_LOGIC; 
  signal A_8_IBUF_95 : STD_LOGIC; 
  signal A_9_IBUF_96 : STD_LOGIC; 
  signal B_0_IBUF_129 : STD_LOGIC; 
  signal B_10_IBUF_130 : STD_LOGIC; 
  signal B_11_IBUF_131 : STD_LOGIC; 
  signal B_12_IBUF_132 : STD_LOGIC; 
  signal B_13_IBUF_133 : STD_LOGIC; 
  signal B_14_IBUF_134 : STD_LOGIC; 
  signal B_15_IBUF_135 : STD_LOGIC; 
  signal B_16_IBUF_136 : STD_LOGIC; 
  signal B_17_IBUF_137 : STD_LOGIC; 
  signal B_18_IBUF_138 : STD_LOGIC; 
  signal B_19_IBUF_139 : STD_LOGIC; 
  signal B_1_IBUF_140 : STD_LOGIC; 
  signal B_20_IBUF_141 : STD_LOGIC; 
  signal B_21_IBUF_142 : STD_LOGIC; 
  signal B_22_IBUF_143 : STD_LOGIC; 
  signal B_23_IBUF_144 : STD_LOGIC; 
  signal B_24_IBUF_145 : STD_LOGIC; 
  signal B_25_IBUF_146 : STD_LOGIC; 
  signal B_26_IBUF_147 : STD_LOGIC; 
  signal B_27_IBUF_148 : STD_LOGIC; 
  signal B_28_IBUF_149 : STD_LOGIC; 
  signal B_29_IBUF_150 : STD_LOGIC; 
  signal B_2_IBUF_151 : STD_LOGIC; 
  signal B_30_IBUF_152 : STD_LOGIC; 
  signal B_31_IBUF_153 : STD_LOGIC; 
  signal B_3_IBUF_154 : STD_LOGIC; 
  signal B_4_IBUF_155 : STD_LOGIC; 
  signal B_5_IBUF_156 : STD_LOGIC; 
  signal B_6_IBUF_157 : STD_LOGIC; 
  signal B_7_IBUF_158 : STD_LOGIC; 
  signal B_8_IBUF_159 : STD_LOGIC; 
  signal B_9_IBUF_160 : STD_LOGIC; 
  signal N0 : STD_LOGIC; 
  signal N1 : STD_LOGIC; 
  signal S_0_OBUF_196 : STD_LOGIC; 
  signal S_10_OBUF_197 : STD_LOGIC; 
  signal S_11_OBUF_198 : STD_LOGIC; 
  signal S_12_OBUF_199 : STD_LOGIC; 
  signal S_13_OBUF_200 : STD_LOGIC; 
  signal S_14_OBUF_201 : STD_LOGIC; 
  signal S_15_OBUF_202 : STD_LOGIC; 
  signal S_16_OBUF_203 : STD_LOGIC; 
  signal S_17_OBUF_204 : STD_LOGIC; 
  signal S_18_OBUF_205 : STD_LOGIC; 
  signal S_19_OBUF_206 : STD_LOGIC; 
  signal S_1_OBUF_207 : STD_LOGIC; 
  signal S_20_OBUF_208 : STD_LOGIC; 
  signal S_21_OBUF_209 : STD_LOGIC; 
  signal S_22_OBUF_210 : STD_LOGIC; 
  signal S_23_OBUF_211 : STD_LOGIC; 
  signal S_24_OBUF_212 : STD_LOGIC; 
  signal S_25_OBUF_213 : STD_LOGIC; 
  signal S_26_OBUF_214 : STD_LOGIC; 
  signal S_27_OBUF_215 : STD_LOGIC; 
  signal S_28_OBUF_216 : STD_LOGIC; 
  signal S_29_OBUF_217 : STD_LOGIC; 
  signal S_2_OBUF_218 : STD_LOGIC; 
  signal S_30_OBUF_219 : STD_LOGIC; 
  signal S_31_OBUF_220 : STD_LOGIC; 
  signal S_3_OBUF_221 : STD_LOGIC; 
  signal S_4_OBUF_222 : STD_LOGIC; 
  signal S_5_OBUF_223 : STD_LOGIC; 
  signal S_6_OBUF_224 : STD_LOGIC; 
  signal S_7_OBUF_225 : STD_LOGIC; 
  signal S_8_OBUF_226 : STD_LOGIC; 
  signal S_9_OBUF_227 : STD_LOGIC; 
  signal V_OBUF_229 : STD_LOGIC; 
  signal Z_OBUF_231 : STD_LOGIC; 
  signal ADDR_32_0_int_c : STD_LOGIC_VECTOR ( 30 downto 0 ); 
  signal Z_wg_cy : STD_LOGIC_VECTOR ( 6 downto 0 ); 
  signal Z_wg_lut : STD_LOGIC_VECTOR ( 7 downto 0 ); 
begin
  XST_GND : GND
    port map (
      G => N0
    );
  XST_VCC : VCC
    port map (
      P => N1
    );
  Z_wg_lut_0_Q : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => S_23_OBUF_211,
      I1 => S_22_OBUF_210,
      I2 => S_24_OBUF_212,
      I3 => S_21_OBUF_209,
      O => Z_wg_lut(0)
    );
  Z_wg_cy_0_Q : MUXCY
    port map (
      CI => N1,
      DI => N0,
      S => Z_wg_lut(0),
      O => Z_wg_cy(0)
    );
  Z_wg_lut_1_Q : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => S_20_OBUF_208,
      I1 => S_19_OBUF_206,
      I2 => S_25_OBUF_213,
      I3 => S_18_OBUF_205,
      O => Z_wg_lut(1)
    );
  Z_wg_cy_1_Q : MUXCY
    port map (
      CI => Z_wg_cy(0),
      DI => N0,
      S => Z_wg_lut(1),
      O => Z_wg_cy(1)
    );
  Z_wg_lut_2_Q : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => S_17_OBUF_204,
      I1 => S_16_OBUF_203,
      I2 => S_26_OBUF_214,
      I3 => S_15_OBUF_202,
      O => Z_wg_lut(2)
    );
  Z_wg_cy_2_Q : MUXCY
    port map (
      CI => Z_wg_cy(1),
      DI => N0,
      S => Z_wg_lut(2),
      O => Z_wg_cy(2)
    );
  Z_wg_lut_3_Q : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => S_14_OBUF_201,
      I1 => S_13_OBUF_200,
      I2 => S_27_OBUF_215,
      I3 => S_12_OBUF_199,
      O => Z_wg_lut(3)
    );
  Z_wg_cy_3_Q : MUXCY
    port map (
      CI => Z_wg_cy(2),
      DI => N0,
      S => Z_wg_lut(3),
      O => Z_wg_cy(3)
    );
  Z_wg_lut_4_Q : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => S_11_OBUF_198,
      I1 => S_10_OBUF_197,
      I2 => S_28_OBUF_216,
      I3 => S_9_OBUF_227,
      O => Z_wg_lut(4)
    );
  Z_wg_cy_4_Q : MUXCY
    port map (
      CI => Z_wg_cy(3),
      DI => N0,
      S => Z_wg_lut(4),
      O => Z_wg_cy(4)
    );
  Z_wg_lut_5_Q : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => S_8_OBUF_226,
      I1 => S_7_OBUF_225,
      I2 => S_29_OBUF_217,
      I3 => S_6_OBUF_224,
      O => Z_wg_lut(5)
    );
  Z_wg_cy_5_Q : MUXCY
    port map (
      CI => Z_wg_cy(4),
      DI => N0,
      S => Z_wg_lut(5),
      O => Z_wg_cy(5)
    );
  Z_wg_lut_6_Q : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => S_5_OBUF_223,
      I1 => S_4_OBUF_222,
      I2 => S_30_OBUF_219,
      I3 => S_3_OBUF_221,
      O => Z_wg_lut(6)
    );
  Z_wg_cy_6_Q : MUXCY
    port map (
      CI => Z_wg_cy(5),
      DI => N0,
      S => Z_wg_lut(6),
      O => Z_wg_cy(6)
    );
  Z_wg_lut_7_Q : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => S_2_OBUF_218,
      I1 => S_1_OBUF_207,
      I2 => S_31_OBUF_220,
      I3 => S_0_OBUF_196,
      O => Z_wg_lut(7)
    );
  Z_wg_cy_7_Q : MUXCY
    port map (
      CI => Z_wg_cy(6),
      DI => N0,
      S => Z_wg_lut(7),
      O => Z_OBUF_231
    );
  AFN_IBUF : IBUF
    port map (
      I => AFN,
      O => AFN_IBUF_64
    );
  A_31_IBUF : IBUF
    port map (
      I => A(31),
      O => A_31_IBUF_89
    );
  A_30_IBUF : IBUF
    port map (
      I => A(30),
      O => A_30_IBUF_88
    );
  A_29_IBUF : IBUF
    port map (
      I => A(29),
      O => A_29_IBUF_86
    );
  A_28_IBUF : IBUF
    port map (
      I => A(28),
      O => A_28_IBUF_85
    );
  A_27_IBUF : IBUF
    port map (
      I => A(27),
      O => A_27_IBUF_84
    );
  A_26_IBUF : IBUF
    port map (
      I => A(26),
      O => A_26_IBUF_83
    );
  A_25_IBUF : IBUF
    port map (
      I => A(25),
      O => A_25_IBUF_82
    );
  A_24_IBUF : IBUF
    port map (
      I => A(24),
      O => A_24_IBUF_81
    );
  A_23_IBUF : IBUF
    port map (
      I => A(23),
      O => A_23_IBUF_80
    );
  A_22_IBUF : IBUF
    port map (
      I => A(22),
      O => A_22_IBUF_79
    );
  A_21_IBUF : IBUF
    port map (
      I => A(21),
      O => A_21_IBUF_78
    );
  A_20_IBUF : IBUF
    port map (
      I => A(20),
      O => A_20_IBUF_77
    );
  A_19_IBUF : IBUF
    port map (
      I => A(19),
      O => A_19_IBUF_75
    );
  A_18_IBUF : IBUF
    port map (
      I => A(18),
      O => A_18_IBUF_74
    );
  A_17_IBUF : IBUF
    port map (
      I => A(17),
      O => A_17_IBUF_73
    );
  A_16_IBUF : IBUF
    port map (
      I => A(16),
      O => A_16_IBUF_72
    );
  A_15_IBUF : IBUF
    port map (
      I => A(15),
      O => A_15_IBUF_71
    );
  A_14_IBUF : IBUF
    port map (
      I => A(14),
      O => A_14_IBUF_70
    );
  A_13_IBUF : IBUF
    port map (
      I => A(13),
      O => A_13_IBUF_69
    );
  A_12_IBUF : IBUF
    port map (
      I => A(12),
      O => A_12_IBUF_68
    );
  A_11_IBUF : IBUF
    port map (
      I => A(11),
      O => A_11_IBUF_67
    );
  A_10_IBUF : IBUF
    port map (
      I => A(10),
      O => A_10_IBUF_66
    );
  A_9_IBUF : IBUF
    port map (
      I => A(9),
      O => A_9_IBUF_96
    );
  A_8_IBUF : IBUF
    port map (
      I => A(8),
      O => A_8_IBUF_95
    );
  A_7_IBUF : IBUF
    port map (
      I => A(7),
      O => A_7_IBUF_94
    );
  A_6_IBUF : IBUF
    port map (
      I => A(6),
      O => A_6_IBUF_93
    );
  A_5_IBUF : IBUF
    port map (
      I => A(5),
      O => A_5_IBUF_92
    );
  A_4_IBUF : IBUF
    port map (
      I => A(4),
      O => A_4_IBUF_91
    );
  A_3_IBUF : IBUF
    port map (
      I => A(3),
      O => A_3_IBUF_90
    );
  A_2_IBUF : IBUF
    port map (
      I => A(2),
      O => A_2_IBUF_87
    );
  A_1_IBUF : IBUF
    port map (
      I => A(1),
      O => A_1_IBUF_76
    );
  A_0_IBUF : IBUF
    port map (
      I => A(0),
      O => A_0_IBUF_65
    );
  B_31_IBUF : IBUF
    port map (
      I => B(31),
      O => B_31_IBUF_153
    );
  B_30_IBUF : IBUF
    port map (
      I => B(30),
      O => B_30_IBUF_152
    );
  B_29_IBUF : IBUF
    port map (
      I => B(29),
      O => B_29_IBUF_150
    );
  B_28_IBUF : IBUF
    port map (
      I => B(28),
      O => B_28_IBUF_149
    );
  B_27_IBUF : IBUF
    port map (
      I => B(27),
      O => B_27_IBUF_148
    );
  B_26_IBUF : IBUF
    port map (
      I => B(26),
      O => B_26_IBUF_147
    );
  B_25_IBUF : IBUF
    port map (
      I => B(25),
      O => B_25_IBUF_146
    );
  B_24_IBUF : IBUF
    port map (
      I => B(24),
      O => B_24_IBUF_145
    );
  B_23_IBUF : IBUF
    port map (
      I => B(23),
      O => B_23_IBUF_144
    );
  B_22_IBUF : IBUF
    port map (
      I => B(22),
      O => B_22_IBUF_143
    );
  B_21_IBUF : IBUF
    port map (
      I => B(21),
      O => B_21_IBUF_142
    );
  B_20_IBUF : IBUF
    port map (
      I => B(20),
      O => B_20_IBUF_141
    );
  B_19_IBUF : IBUF
    port map (
      I => B(19),
      O => B_19_IBUF_139
    );
  B_18_IBUF : IBUF
    port map (
      I => B(18),
      O => B_18_IBUF_138
    );
  B_17_IBUF : IBUF
    port map (
      I => B(17),
      O => B_17_IBUF_137
    );
  B_16_IBUF : IBUF
    port map (
      I => B(16),
      O => B_16_IBUF_136
    );
  B_15_IBUF : IBUF
    port map (
      I => B(15),
      O => B_15_IBUF_135
    );
  B_14_IBUF : IBUF
    port map (
      I => B(14),
      O => B_14_IBUF_134
    );
  B_13_IBUF : IBUF
    port map (
      I => B(13),
      O => B_13_IBUF_133
    );
  B_12_IBUF : IBUF
    port map (
      I => B(12),
      O => B_12_IBUF_132
    );
  B_11_IBUF : IBUF
    port map (
      I => B(11),
      O => B_11_IBUF_131
    );
  B_10_IBUF : IBUF
    port map (
      I => B(10),
      O => B_10_IBUF_130
    );
  B_9_IBUF : IBUF
    port map (
      I => B(9),
      O => B_9_IBUF_160
    );
  B_8_IBUF : IBUF
    port map (
      I => B(8),
      O => B_8_IBUF_159
    );
  B_7_IBUF : IBUF
    port map (
      I => B(7),
      O => B_7_IBUF_158
    );
  B_6_IBUF : IBUF
    port map (
      I => B(6),
      O => B_6_IBUF_157
    );
  B_5_IBUF : IBUF
    port map (
      I => B(5),
      O => B_5_IBUF_156
    );
  B_4_IBUF : IBUF
    port map (
      I => B(4),
      O => B_4_IBUF_155
    );
  B_3_IBUF : IBUF
    port map (
      I => B(3),
      O => B_3_IBUF_154
    );
  B_2_IBUF : IBUF
    port map (
      I => B(2),
      O => B_2_IBUF_151
    );
  B_1_IBUF : IBUF
    port map (
      I => B(1),
      O => B_1_IBUF_140
    );
  B_0_IBUF : IBUF
    port map (
      I => B(0),
      O => B_0_IBUF_129
    );
  N_OBUF : OBUF
    port map (
      I => S_31_OBUF_220,
      O => N
    );
  V_OBUF : OBUF
    port map (
      I => V_OBUF_229,
      O => V
    );
  Z_OBUF : OBUF
    port map (
      I => Z_OBUF_231,
      O => Z
    );
  S_31_OBUF : OBUF
    port map (
      I => S_31_OBUF_220,
      O => S(31)
    );
  S_30_OBUF : OBUF
    port map (
      I => S_30_OBUF_219,
      O => S(30)
    );
  S_29_OBUF : OBUF
    port map (
      I => S_29_OBUF_217,
      O => S(29)
    );
  S_28_OBUF : OBUF
    port map (
      I => S_28_OBUF_216,
      O => S(28)
    );
  S_27_OBUF : OBUF
    port map (
      I => S_27_OBUF_215,
      O => S(27)
    );
  S_26_OBUF : OBUF
    port map (
      I => S_26_OBUF_214,
      O => S(26)
    );
  S_25_OBUF : OBUF
    port map (
      I => S_25_OBUF_213,
      O => S(25)
    );
  S_24_OBUF : OBUF
    port map (
      I => S_24_OBUF_212,
      O => S(24)
    );
  S_23_OBUF : OBUF
    port map (
      I => S_23_OBUF_211,
      O => S(23)
    );
  S_22_OBUF : OBUF
    port map (
      I => S_22_OBUF_210,
      O => S(22)
    );
  S_21_OBUF : OBUF
    port map (
      I => S_21_OBUF_209,
      O => S(21)
    );
  S_20_OBUF : OBUF
    port map (
      I => S_20_OBUF_208,
      O => S(20)
    );
  S_19_OBUF : OBUF
    port map (
      I => S_19_OBUF_206,
      O => S(19)
    );
  S_18_OBUF : OBUF
    port map (
      I => S_18_OBUF_205,
      O => S(18)
    );
  S_17_OBUF : OBUF
    port map (
      I => S_17_OBUF_204,
      O => S(17)
    );
  S_16_OBUF : OBUF
    port map (
      I => S_16_OBUF_203,
      O => S(16)
    );
  S_15_OBUF : OBUF
    port map (
      I => S_15_OBUF_202,
      O => S(15)
    );
  S_14_OBUF : OBUF
    port map (
      I => S_14_OBUF_201,
      O => S(14)
    );
  S_13_OBUF : OBUF
    port map (
      I => S_13_OBUF_200,
      O => S(13)
    );
  S_12_OBUF : OBUF
    port map (
      I => S_12_OBUF_199,
      O => S(12)
    );
  S_11_OBUF : OBUF
    port map (
      I => S_11_OBUF_198,
      O => S(11)
    );
  S_10_OBUF : OBUF
    port map (
      I => S_10_OBUF_197,
      O => S(10)
    );
  S_9_OBUF : OBUF
    port map (
      I => S_9_OBUF_227,
      O => S(9)
    );
  S_8_OBUF : OBUF
    port map (
      I => S_8_OBUF_226,
      O => S(8)
    );
  S_7_OBUF : OBUF
    port map (
      I => S_7_OBUF_225,
      O => S(7)
    );
  S_6_OBUF : OBUF
    port map (
      I => S_6_OBUF_224,
      O => S(6)
    );
  S_5_OBUF : OBUF
    port map (
      I => S_5_OBUF_223,
      O => S(5)
    );
  S_4_OBUF : OBUF
    port map (
      I => S_4_OBUF_222,
      O => S(4)
    );
  S_3_OBUF : OBUF
    port map (
      I => S_3_OBUF_221,
      O => S(3)
    );
  S_2_OBUF : OBUF
    port map (
      I => S_2_OBUF_218,
      O => S(2)
    );
  S_1_OBUF : OBUF
    port map (
      I => S_1_OBUF_207,
      O => S(1)
    );
  S_0_OBUF : OBUF
    port map (
      I => S_0_OBUF_196,
      O => S(0)
    );
  ADDR_32_0_FA_0_S1 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => A_0_IBUF_65,
      I1 => B_0_IBUF_129,
      O => S_0_OBUF_196
    );
  ADDR_32_0_FA_0_COUT1 : LUT3
    generic map(
      INIT => X"D8"
    )
    port map (
      I0 => B_0_IBUF_129,
      I1 => A_0_IBUF_65,
      I2 => AFN_IBUF_64,
      O => ADDR_32_0_int_c(0)
    );
  ADDR_32_0_cascade_1_FA_i_S1 : LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => A_1_IBUF_76,
      I1 => AFN_IBUF_64,
      I2 => B_1_IBUF_140,
      I3 => ADDR_32_0_int_c(0),
      O => S_1_OBUF_207
    );
  ADDR_32_0_cascade_2_FA_i_S1 : LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => A_2_IBUF_87,
      I1 => AFN_IBUF_64,
      I2 => B_2_IBUF_151,
      I3 => ADDR_32_0_int_c(1),
      O => S_2_OBUF_218
    );
  ADDR_32_0_cascade_3_FA_i_S1 : LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => A_3_IBUF_90,
      I1 => AFN_IBUF_64,
      I2 => B_3_IBUF_154,
      I3 => ADDR_32_0_int_c(2),
      O => S_3_OBUF_221
    );
  ADDR_32_0_cascade_4_FA_i_S1 : LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => A_4_IBUF_91,
      I1 => AFN_IBUF_64,
      I2 => B_4_IBUF_155,
      I3 => ADDR_32_0_int_c(3),
      O => S_4_OBUF_222
    );
  ADDR_32_0_cascade_5_FA_i_S1 : LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => A_5_IBUF_92,
      I1 => AFN_IBUF_64,
      I2 => B_5_IBUF_156,
      I3 => ADDR_32_0_int_c(4),
      O => S_5_OBUF_223
    );
  ADDR_32_0_cascade_6_FA_i_S1 : LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => A_6_IBUF_93,
      I1 => AFN_IBUF_64,
      I2 => B_6_IBUF_157,
      I3 => ADDR_32_0_int_c(5),
      O => S_6_OBUF_224
    );
  ADDR_32_0_cascade_7_FA_i_S1 : LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => A_7_IBUF_94,
      I1 => AFN_IBUF_64,
      I2 => B_7_IBUF_158,
      I3 => ADDR_32_0_int_c(6),
      O => S_7_OBUF_225
    );
  ADDR_32_0_cascade_8_FA_i_S1 : LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => A_8_IBUF_95,
      I1 => AFN_IBUF_64,
      I2 => B_8_IBUF_159,
      I3 => ADDR_32_0_int_c(7),
      O => S_8_OBUF_226
    );
  ADDR_32_0_cascade_9_FA_i_S1 : LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => A_9_IBUF_96,
      I1 => AFN_IBUF_64,
      I2 => B_9_IBUF_160,
      I3 => ADDR_32_0_int_c(8),
      O => S_9_OBUF_227
    );
  ADDR_32_0_cascade_10_FA_i_S1 : LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => A_10_IBUF_66,
      I1 => AFN_IBUF_64,
      I2 => B_10_IBUF_130,
      I3 => ADDR_32_0_int_c(9),
      O => S_10_OBUF_197
    );
  ADDR_32_0_cascade_11_FA_i_S1 : LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => A_11_IBUF_67,
      I1 => AFN_IBUF_64,
      I2 => B_11_IBUF_131,
      I3 => ADDR_32_0_int_c(10),
      O => S_11_OBUF_198
    );
  ADDR_32_0_cascade_12_FA_i_S1 : LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => A_12_IBUF_68,
      I1 => AFN_IBUF_64,
      I2 => B_12_IBUF_132,
      I3 => ADDR_32_0_int_c(11),
      O => S_12_OBUF_199
    );
  ADDR_32_0_cascade_13_FA_i_S1 : LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => A_13_IBUF_69,
      I1 => AFN_IBUF_64,
      I2 => B_13_IBUF_133,
      I3 => ADDR_32_0_int_c(12),
      O => S_13_OBUF_200
    );
  ADDR_32_0_cascade_14_FA_i_S1 : LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => A_14_IBUF_70,
      I1 => AFN_IBUF_64,
      I2 => B_14_IBUF_134,
      I3 => ADDR_32_0_int_c(13),
      O => S_14_OBUF_201
    );
  ADDR_32_0_cascade_15_FA_i_S1 : LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => A_15_IBUF_71,
      I1 => AFN_IBUF_64,
      I2 => B_15_IBUF_135,
      I3 => ADDR_32_0_int_c(14),
      O => S_15_OBUF_202
    );
  ADDR_32_0_cascade_16_FA_i_S1 : LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => A_16_IBUF_72,
      I1 => AFN_IBUF_64,
      I2 => B_16_IBUF_136,
      I3 => ADDR_32_0_int_c(15),
      O => S_16_OBUF_203
    );
  ADDR_32_0_cascade_17_FA_i_S1 : LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => A_17_IBUF_73,
      I1 => AFN_IBUF_64,
      I2 => B_17_IBUF_137,
      I3 => ADDR_32_0_int_c(16),
      O => S_17_OBUF_204
    );
  ADDR_32_0_cascade_18_FA_i_S1 : LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => A_18_IBUF_74,
      I1 => AFN_IBUF_64,
      I2 => B_18_IBUF_138,
      I3 => ADDR_32_0_int_c(17),
      O => S_18_OBUF_205
    );
  ADDR_32_0_cascade_19_FA_i_S1 : LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => A_19_IBUF_75,
      I1 => AFN_IBUF_64,
      I2 => B_19_IBUF_139,
      I3 => ADDR_32_0_int_c(18),
      O => S_19_OBUF_206
    );
  ADDR_32_0_cascade_20_FA_i_S1 : LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => A_20_IBUF_77,
      I1 => AFN_IBUF_64,
      I2 => B_20_IBUF_141,
      I3 => ADDR_32_0_int_c(19),
      O => S_20_OBUF_208
    );
  ADDR_32_0_cascade_21_FA_i_S1 : LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => A_21_IBUF_78,
      I1 => AFN_IBUF_64,
      I2 => B_21_IBUF_142,
      I3 => ADDR_32_0_int_c(20),
      O => S_21_OBUF_209
    );
  ADDR_32_0_cascade_22_FA_i_S1 : LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => A_22_IBUF_79,
      I1 => AFN_IBUF_64,
      I2 => B_22_IBUF_143,
      I3 => ADDR_32_0_int_c(21),
      O => S_22_OBUF_210
    );
  ADDR_32_0_cascade_23_FA_i_S1 : LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => A_23_IBUF_80,
      I1 => AFN_IBUF_64,
      I2 => B_23_IBUF_144,
      I3 => ADDR_32_0_int_c(22),
      O => S_23_OBUF_211
    );
  ADDR_32_0_cascade_24_FA_i_S1 : LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => A_24_IBUF_81,
      I1 => AFN_IBUF_64,
      I2 => B_24_IBUF_145,
      I3 => ADDR_32_0_int_c(23),
      O => S_24_OBUF_212
    );
  ADDR_32_0_cascade_25_FA_i_S1 : LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => A_25_IBUF_82,
      I1 => AFN_IBUF_64,
      I2 => B_25_IBUF_146,
      I3 => ADDR_32_0_int_c(24),
      O => S_25_OBUF_213
    );
  ADDR_32_0_cascade_26_FA_i_S1 : LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => A_26_IBUF_83,
      I1 => AFN_IBUF_64,
      I2 => B_26_IBUF_147,
      I3 => ADDR_32_0_int_c(25),
      O => S_26_OBUF_214
    );
  ADDR_32_0_cascade_27_FA_i_S1 : LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => A_27_IBUF_84,
      I1 => AFN_IBUF_64,
      I2 => B_27_IBUF_148,
      I3 => ADDR_32_0_int_c(26),
      O => S_27_OBUF_215
    );
  ADDR_32_0_cascade_28_FA_i_S1 : LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => A_28_IBUF_85,
      I1 => AFN_IBUF_64,
      I2 => B_28_IBUF_149,
      I3 => ADDR_32_0_int_c(27),
      O => S_28_OBUF_216
    );
  ADDR_32_0_cascade_29_FA_i_S1 : LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => A_29_IBUF_86,
      I1 => AFN_IBUF_64,
      I2 => B_29_IBUF_150,
      I3 => ADDR_32_0_int_c(28),
      O => S_29_OBUF_217
    );
  ADDR_32_0_cascade_30_FA_i_S1 : LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => A_30_IBUF_88,
      I1 => AFN_IBUF_64,
      I2 => B_30_IBUF_152,
      I3 => ADDR_32_0_int_c(29),
      O => S_30_OBUF_219
    );
  ADDR_32_0_cascade_9_FA_i_COUT1 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => AFN_IBUF_64,
      I1 => B_9_IBUF_160,
      I2 => ADDR_32_0_int_c(8),
      I3 => A_9_IBUF_96,
      O => ADDR_32_0_int_c(9)
    );
  ADDR_32_0_cascade_8_FA_i_COUT1 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => AFN_IBUF_64,
      I1 => B_8_IBUF_159,
      I2 => ADDR_32_0_int_c(7),
      I3 => A_8_IBUF_95,
      O => ADDR_32_0_int_c(8)
    );
  ADDR_32_0_cascade_7_FA_i_COUT1 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => AFN_IBUF_64,
      I1 => B_7_IBUF_158,
      I2 => ADDR_32_0_int_c(6),
      I3 => A_7_IBUF_94,
      O => ADDR_32_0_int_c(7)
    );
  ADDR_32_0_cascade_6_FA_i_COUT1 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => AFN_IBUF_64,
      I1 => B_6_IBUF_157,
      I2 => ADDR_32_0_int_c(5),
      I3 => A_6_IBUF_93,
      O => ADDR_32_0_int_c(6)
    );
  ADDR_32_0_cascade_5_FA_i_COUT1 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => AFN_IBUF_64,
      I1 => B_5_IBUF_156,
      I2 => ADDR_32_0_int_c(4),
      I3 => A_5_IBUF_92,
      O => ADDR_32_0_int_c(5)
    );
  ADDR_32_0_cascade_4_FA_i_COUT1 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => AFN_IBUF_64,
      I1 => B_4_IBUF_155,
      I2 => ADDR_32_0_int_c(3),
      I3 => A_4_IBUF_91,
      O => ADDR_32_0_int_c(4)
    );
  ADDR_32_0_cascade_3_FA_i_COUT1 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => AFN_IBUF_64,
      I1 => B_3_IBUF_154,
      I2 => ADDR_32_0_int_c(2),
      I3 => A_3_IBUF_90,
      O => ADDR_32_0_int_c(3)
    );
  ADDR_32_0_cascade_30_FA_i_COUT1 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => AFN_IBUF_64,
      I1 => B_30_IBUF_152,
      I2 => ADDR_32_0_int_c(29),
      I3 => A_30_IBUF_88,
      O => ADDR_32_0_int_c(30)
    );
  ADDR_32_0_cascade_2_FA_i_COUT1 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => AFN_IBUF_64,
      I1 => B_2_IBUF_151,
      I2 => ADDR_32_0_int_c(1),
      I3 => A_2_IBUF_87,
      O => ADDR_32_0_int_c(2)
    );
  ADDR_32_0_cascade_29_FA_i_COUT1 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => AFN_IBUF_64,
      I1 => B_29_IBUF_150,
      I2 => ADDR_32_0_int_c(28),
      I3 => A_29_IBUF_86,
      O => ADDR_32_0_int_c(29)
    );
  ADDR_32_0_cascade_28_FA_i_COUT1 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => AFN_IBUF_64,
      I1 => B_28_IBUF_149,
      I2 => ADDR_32_0_int_c(27),
      I3 => A_28_IBUF_85,
      O => ADDR_32_0_int_c(28)
    );
  ADDR_32_0_cascade_27_FA_i_COUT1 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => AFN_IBUF_64,
      I1 => B_27_IBUF_148,
      I2 => ADDR_32_0_int_c(26),
      I3 => A_27_IBUF_84,
      O => ADDR_32_0_int_c(27)
    );
  ADDR_32_0_cascade_26_FA_i_COUT1 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => AFN_IBUF_64,
      I1 => B_26_IBUF_147,
      I2 => ADDR_32_0_int_c(25),
      I3 => A_26_IBUF_83,
      O => ADDR_32_0_int_c(26)
    );
  ADDR_32_0_cascade_25_FA_i_COUT1 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => AFN_IBUF_64,
      I1 => B_25_IBUF_146,
      I2 => ADDR_32_0_int_c(24),
      I3 => A_25_IBUF_82,
      O => ADDR_32_0_int_c(25)
    );
  ADDR_32_0_cascade_24_FA_i_COUT1 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => AFN_IBUF_64,
      I1 => B_24_IBUF_145,
      I2 => ADDR_32_0_int_c(23),
      I3 => A_24_IBUF_81,
      O => ADDR_32_0_int_c(24)
    );
  ADDR_32_0_cascade_23_FA_i_COUT1 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => AFN_IBUF_64,
      I1 => B_23_IBUF_144,
      I2 => ADDR_32_0_int_c(22),
      I3 => A_23_IBUF_80,
      O => ADDR_32_0_int_c(23)
    );
  ADDR_32_0_cascade_22_FA_i_COUT1 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => AFN_IBUF_64,
      I1 => B_22_IBUF_143,
      I2 => ADDR_32_0_int_c(21),
      I3 => A_22_IBUF_79,
      O => ADDR_32_0_int_c(22)
    );
  ADDR_32_0_cascade_21_FA_i_COUT1 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => AFN_IBUF_64,
      I1 => B_21_IBUF_142,
      I2 => ADDR_32_0_int_c(20),
      I3 => A_21_IBUF_78,
      O => ADDR_32_0_int_c(21)
    );
  ADDR_32_0_cascade_20_FA_i_COUT1 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => AFN_IBUF_64,
      I1 => B_20_IBUF_141,
      I2 => ADDR_32_0_int_c(19),
      I3 => A_20_IBUF_77,
      O => ADDR_32_0_int_c(20)
    );
  ADDR_32_0_cascade_1_FA_i_COUT1 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => AFN_IBUF_64,
      I1 => B_1_IBUF_140,
      I2 => ADDR_32_0_int_c(0),
      I3 => A_1_IBUF_76,
      O => ADDR_32_0_int_c(1)
    );
  ADDR_32_0_cascade_19_FA_i_COUT1 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => AFN_IBUF_64,
      I1 => B_19_IBUF_139,
      I2 => ADDR_32_0_int_c(18),
      I3 => A_19_IBUF_75,
      O => ADDR_32_0_int_c(19)
    );
  ADDR_32_0_cascade_18_FA_i_COUT1 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => AFN_IBUF_64,
      I1 => B_18_IBUF_138,
      I2 => ADDR_32_0_int_c(17),
      I3 => A_18_IBUF_74,
      O => ADDR_32_0_int_c(18)
    );
  ADDR_32_0_cascade_17_FA_i_COUT1 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => AFN_IBUF_64,
      I1 => B_17_IBUF_137,
      I2 => ADDR_32_0_int_c(16),
      I3 => A_17_IBUF_73,
      O => ADDR_32_0_int_c(17)
    );
  ADDR_32_0_cascade_16_FA_i_COUT1 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => AFN_IBUF_64,
      I1 => B_16_IBUF_136,
      I2 => ADDR_32_0_int_c(15),
      I3 => A_16_IBUF_72,
      O => ADDR_32_0_int_c(16)
    );
  ADDR_32_0_cascade_15_FA_i_COUT1 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => AFN_IBUF_64,
      I1 => B_15_IBUF_135,
      I2 => ADDR_32_0_int_c(14),
      I3 => A_15_IBUF_71,
      O => ADDR_32_0_int_c(15)
    );
  ADDR_32_0_cascade_14_FA_i_COUT1 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => AFN_IBUF_64,
      I1 => B_14_IBUF_134,
      I2 => ADDR_32_0_int_c(13),
      I3 => A_14_IBUF_70,
      O => ADDR_32_0_int_c(14)
    );
  ADDR_32_0_cascade_13_FA_i_COUT1 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => AFN_IBUF_64,
      I1 => B_13_IBUF_133,
      I2 => ADDR_32_0_int_c(12),
      I3 => A_13_IBUF_69,
      O => ADDR_32_0_int_c(13)
    );
  ADDR_32_0_cascade_12_FA_i_COUT1 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => AFN_IBUF_64,
      I1 => B_12_IBUF_132,
      I2 => ADDR_32_0_int_c(11),
      I3 => A_12_IBUF_68,
      O => ADDR_32_0_int_c(12)
    );
  ADDR_32_0_cascade_11_FA_i_COUT1 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => AFN_IBUF_64,
      I1 => B_11_IBUF_131,
      I2 => ADDR_32_0_int_c(10),
      I3 => A_11_IBUF_67,
      O => ADDR_32_0_int_c(11)
    );
  ADDR_32_0_cascade_10_FA_i_COUT1 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => AFN_IBUF_64,
      I1 => B_10_IBUF_130,
      I2 => ADDR_32_0_int_c(9),
      I3 => A_10_IBUF_66,
      O => ADDR_32_0_int_c(10)
    );
  ADDR_32_0_cascade_31_FA_i_S1 : LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => A_31_IBUF_89,
      I1 => AFN_IBUF_64,
      I2 => B_31_IBUF_153,
      I3 => ADDR_32_0_int_c(30),
      O => S_31_OBUF_220
    );
  V1 : LUT4
    generic map(
      INIT => X"4128"
    )
    port map (
      I0 => A_31_IBUF_89,
      I1 => AFN_IBUF_64,
      I2 => B_31_IBUF_153,
      I3 => ADDR_32_0_int_c(30),
      O => V_OBUF_229
    );

end Structure;

