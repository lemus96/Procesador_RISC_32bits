----------------------------------------------------------------------------------
-- Engineer: Alejandro Daniel Lemus Najera 
-- 
-- Create Date:    03:56:57 07/12/2020 
-- Design Name:	 Full Adder
-- Module Name:    alu_fa - Behavioral 
-- Project Name:	 Procesador_RISC_32bits
-- Target Devices: 
-- Tool versions:	 ISE Design Suite 14.6
-- Description:	 El presente modulo consiste en la implementacion de un sumador completo
--						 en utilizando su representacion estandar de suma de productos (SOP).
--
-- Dependencies:	 None 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FA is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           CIN : in  STD_LOGIC;
           S : out  STD_LOGIC;
           COUT : out  STD_LOGIC);
end FA;

architecture Behavioral of FA is
signal pp_s: STD_LOGIC_VECTOR(3 downto 0);				-- Declaraci�n de se�ales para los productos parciales
signal pp_c: STD_LOGIC_VECTOR(3 downto 0);				-- asociados con cada una de las salidas S y COUT
begin
	pp_s(0) <= (not A) and (not B) and CIN;				-- Asignacion de productos parciales al vector s
	pp_s(1) <= (not A) and B and (not CIN);
	pp_s(2) <= A and (not B) and (not CIN);
	pp_s(3) <= A and B and CIN;
	
	pp_c(0) <= (not A) and B and CIN;						-- Asignacion de productos parciales al vector c
	pp_c(1) <= A and (not B) and CIN;
	pp_c(2) <= A and B and (not CIN);
	pp_c(3) <= A and B and CIN;
	
	S <= pp_s(0) or pp_s(1) or pp_s(2) or pp_s(3);		-- Conexion de productos parciales a las compuertas
	COUT <= pp_c(0) or pp_c(1) or pp_c(2) or pp_c(3);	-- OR para producir las salidas S y COUT
end Behavioral;