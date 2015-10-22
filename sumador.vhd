----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:13:48 10/21/2015 
-- Design Name: 
-- Module Name:    sumador - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sumador is
port( x,y: in std_logic_vector(15 downto 0);
	salida: out STD_LOGIC_vector (16 downto 0));
end sumador;

architecture Behavioral of sumador is


component CeldaGris port( x1,y1,x2: in std_logic; --p y g actuales y g anterior 
 x12: out std_logic);
end component;

begin
type arreglo is array (0 to 2) of std_logic_vector (2 downto 0); --renglones, columna
signal P,G: arreglo;

PG_logic : for i in 15 downto 0 generate

	begin
	u1: MULT_AND port  map (P(0)(i),y(i),x(i));
	u2: xor_cy port map (G(0)(i),y(i),x(i));
	end generate;
	
gris1: CeldaGris port map (g(0)(1),p(0)(1),g(0)(0),g(1)(0));
black:  	
	
end Behavioral;

