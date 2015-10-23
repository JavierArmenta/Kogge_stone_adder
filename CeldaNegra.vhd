----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:14:10 10/21/2015 
-- Design Name: 
-- Module Name:    CeldaNegra - Behavioral 
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;


entity CeldaNegra is
port( x1,y1,x2,y2: in std_logic;
 x12,y12: out std_logic);
end CeldaNegra;
architecture Behavioral of CeldaNegra is
signal s1,s2: std_logic;
begin
u1: MULT_AND port  map (S1,y1,x1);
u2: MULT_AND port  map (S2,y1,y2);
x12 <= x2 or s1;
y12 <= s2;
end Behavioral;
