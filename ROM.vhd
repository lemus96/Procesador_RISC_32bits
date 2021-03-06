----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:53:24 07/23/2020 
-- Design Name: 
-- Module Name:    ROM - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

entity ROM is
	 Generic( addr_width : integer := 6;		-- Ancho de las direcciones, 6 bits
				 data_width : integer := 18);		-- Ancho de las localidades, 18 bits
				 
    Port ( ADDR : in  STD_LOGIC_VECTOR (5 downto 0);			-- Direcci�n de la localidad a leer.
           DATA : out  STD_LOGIC_VECTOR (17 downto 0));		-- Contenido de la loalidad de memoria.
end ROM;

architecture Behavioral of ROM is
	type ROM_type is array (0 to (2**addr_width - 1)) of STD_LOGIC_VECTOR((data_width - 1) downto 0);		-- Definicion un nuevo tipo, una ROM de 18*64
	
	signal rom_signal : ROM_type := (							-- Especificacion de los contenidos de la memoria
							-- Contenido			-- Localidad
							"000000000001101001",		-- 0x00		ILLOP
							"000000000001101001",		-- 0x01
							"000000000001101001",		-- 0x02
							"000000000001101001",		-- 0x03
							"000000000001101001",		-- 0x04
							"000000000001101001",		-- 0x05
							"000000000001101001",		-- 0x06
							"000000000001101001",		-- 0x07


							"000000000001101001",		-- 0x08
							"000000000001101001",		-- 0x09
							"000000000001101001",		-- 0x0A
							"000000000001101001",		-- 0x0B
							"000000000001101001",		-- 0x0C
							"000000000001101001",		-- 0x0D
							"000000000001101001",		-- 0x0E
							"000000000001101001",		-- 0x0F


							"000000000001101001",		-- 0x10
							"000000000001101001",		-- 0x11
							"000000000001101001",		-- 0x12
							"000000000001101001",		-- 0x13
							"000000000001101001",		-- 0x14
							"000000000001101001",		-- 0x15
							"000000000001101001",		-- 0x16
							"000000000001101001",		-- 0x17


							"010000011000000101",		-- 0x18
							"010000010100010000",		-- 0x19
							"000000000001101001",		-- 0x1A
							"000000000001000001",		-- 0x1B
							"000000000000000001",		-- 0x1C
							"000000000000000001",		-- 0x1D
							"000000000001101001",		-- 0x1E
							"101010101000000101",		-- 0x1F


							"010000000000000011",		-- 0x20
							"010001000000000011",		-- 0x21
							"000000000001101001",		-- 0x22
							"000000000001101001",		-- 0x23
							"000011000000000011",		-- 0x24
							"000101000000000011",		-- 0x25
							"000111000000000011",		-- 0x26
							"000000000001101001",		-- 0x27


							"101000000000000011",		-- 0x28
							"101110000000000011",		-- 0x29
							"100110000000000011",		-- 0x2A
							"101001000000000011",		-- 0x2B
							"110000000000000011",		-- 0x2C
							"110001000000000011",		-- 0x2D
							"110011000000000011",		-- 0x2E
							"000000000001101001",		-- 0x2F


							"010000010000000011",		-- 0x30
							"010001010000000011",		-- 0x31
							"000000000001101001",		-- 0x32
							"000000000001101001",		-- 0x33
							"000011010000000011",		-- 0x34
							"000101010000000011",		-- 0x35
							"000111010000000011",		-- 0x36
							"000000000001101001",		-- 0x37


							"101000010000000011",		-- 0x38
							"101110010000000011",		-- 0x39
							"100110010000000011",		-- 0x3A
							"101001010000000011",		-- 0x3B
							"110000010000000011",		-- 0x3C
							"110001010000000011",		-- 0x3D
							"110011010000000011",		-- 0x3E
							"000000000001101001"			-- 0x3F							
	);
begin
	DATA <= rom_signal(to_integer(unsigned(ADDR)));
end Behavioral;

