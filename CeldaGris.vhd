----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:16:42 10/21/2015 
-- Design Name: 
-- Module Name:    CeldaGris - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
Library UNISIM;
use UNISIM.vcomponents.all;



entity CeldaGris is


port( x1,y1,x2: in std_logic;
 x12: out std_logic);
end CeldaGris;

architecture Behavioral of CeldaGris is
signal S :std_logic;
begin 
u1: MULT_AND port  map (S,y1,x1);
x12 <= x2 or s;
end Behavioral;

