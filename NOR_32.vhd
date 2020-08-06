----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:17:08 07/28/2020 
-- Design Name: 
-- Module Name:    NOR_32 - Behavioral 
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

entity NOR_32 is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);			-- Entrada de 32 bits A[31:0]
           Z : out  STD_LOGIC);									-- Operacion NOR entre los 32 bits de la entrada A.
end NOR_32;

architecture Behavioral of NOR_32 is
	signal nor_stage : STD_LOGIC_VECTOR (7 downto 0);		-- Señales para cada una de las etapas del árbol de 
	signal nand_stage : STD_LOGIC_VECTOR (3 downto 0);		-- compuertas NOR y NAND que conforman la compuerta NOR de 32 entradas																	-- NOR de 32 entradas para calcular el valor de Z.
begin
	nor_stage(0) <= not(A(0) or A(1) or A(2) or A(3));				-- Etapa de 8 compuertas NOR de 4 entradas.
	nor_stage(1) <= not(A(4) or A(5) or A(6) or A(7));
	nor_stage(2) <= not(A(8) or A(9) or A(10) or A(11));
	nor_stage(3) <= not(A(12) or A(13) or A(14) or A(15));
	nor_stage(4) <= not(A(16) or A(17) or A(18) or A(19));
	nor_stage(5) <= not(A(20) or A(21) or A(22) or A(23));
	nor_stage(6) <= not(A(24) or A(25) or A(26) or A(27));
	nor_stage(7) <= not(A(28) or A(29) or A(30) or A(31));
	
	nand_stage(0) <= nor_stage(0) nand nor_stage(1);		-- Etapa de 4 compuertas NAND de 2 entradas.
	nand_stage(1) <= nor_stage(2) nand nor_stage(3);
	nand_stage(2) <= nor_stage(4) nand nor_stage(5);
	nand_stage(3) <= nor_stage(6) nand nor_stage(7);
	
	Z <= not(nand_stage(0) or nand_stage(1) or nand_stage(2) or nand_stage(3));		-- Compuerta NOR de 4 entradas cuya salida se conecta a la salida Z


end Behavioral;

