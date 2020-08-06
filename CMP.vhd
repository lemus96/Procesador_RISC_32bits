----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    06:25:25 07/19/2020 
-- Design Name: 
-- Module Name:    CMP - Behavioral 
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

entity CMP is
    Port ( Z : in  STD_LOGIC;										-- Entrada Z, proveniente del módulo ARITH.
           V : in  STD_LOGIC;										-- Entrada V, proveniente del módulo ARITH.
           N : in  STD_LOGIC;										-- Entrada N, proveniente del módulo ARITH.
           CFN : in  STD_LOGIC_VECTOR (1 downto 0);		-- Entrada de control CFN[1:0], determina el tipo de comparación a realizar.
           Y : out  STD_LOGIC_VECTOR (31 downto 0));		-- Salida Y[31:0]
end CMP;

architecture Behavioral of CMP is

signal s3, s2, s1, s0 : STD_LOGIC;

begin
	s3 <= Z or (N xor V);		-- Especificación funcional para determinar si A[31:0] es menor o igual a B[31:0].
	s2 <= N xor V;					-- Especificacion funcional para determinar si A[31:0] es menor a B[31:0].
	s1 <= Z;							-- Especificacion funcional para determinar si [31:0] es igual a B[31:0].
	s0 <= '0';						-- Entrada restante del multiplexor.

	with CFN select
		Y(0) <= s3 when "11",			-- Especificación del multiplexor de 4 entradas cuya salida se conecta al bit Y[0].
				  s2 when "10",			
				  s1 when "01",
				  s0 when "00",
				  '0' when others;
	
	zeros : for i in 1 to 31 generate
		Y(i) <= '0';								-- Asignación de los valores de los 31 bits restantes Y[31:1] = 0
	end generate;
end Behavioral;

