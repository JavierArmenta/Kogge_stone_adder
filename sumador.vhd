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
library UNISIM;
use UNISIM.VComponents.all;

entity sumador is
port( x,y: in std_logic_vector(7 downto 0);
	salida: out STD_LOGIC_vector (8 downto 0));
end sumador;

architecture Behavioral of sumador is


component CeldaGris port( x1,y1,x2: in std_logic; --p y g actuales y g anterior 
 x12: out std_logic);
end component;

component CeldaNegra port( x1,y1,x2,y2: in std_logic;
 x12,y12: out std_logic);
end component;

type arreglo is array (0 to 3) of std_logic_vector (9 downto 0); --renglones, columna
signal P,G: arreglo;


begin
PG_logic : for i in 7 downto 0 generate

	begin
	u1: MULT_AND port  map (g(0)(i+1),y(i),x(i));
	u2: XORCY port map (p(0)(i+1),y(i),x(i));
	end generate;
g(0)(0)<='0';
gris1: CeldaGris port map (g(0)(1),p(0)(1),g(0)(0),g(1)(1));

primer_vector_negro : for i in 8 downto 2 generate 
begin
negro1: CeldaNegra port map (g(0)(i),p(0)(i),g(0)(i-1),p(0)(i-1),g(1)(i),p(1)(i)); 	
end generate;

segundo_vector_gris : for i in 3 downto 2 generate 
begin 
gris2: CeldaGris port map (g(1)(i),p(1)(i),g(3)(i-2),g(2)(i));
end generate;

segundo_vector_negro : for i in 8 downto 4 generate
begin 
negro2: CeldaNegra port map (g(1)(i),p(1)(i),g(1)(i-2),p(1)(i-2),g(2)(i),p(2)(i));
end generate;

tercer_vector_gris : for i in 3 downto 0 generate 
begin 
gris3: CeldaGris port map ( g(2)(i+4),p(2)(i+4),g(3)(i),g(3)(i+4));
end generate;
g(3)(0)<=g(0)(0);
g(1)(0)<=g(0)(0);
g(2)(0)<=g(0)(0);
g(2)(1)<=g(1)(1);
g(3)(1)<=g(1)(1);
g(3)(2)<=g(2)(2);
g(3)(3)<=g(2)(3);
salida(8)<=g(0)(7)or( p(0)(7)and g(3)(6));
Logica_salida : for i in 7 downto 0 generate 
begin
--salida(i)<=g(3)(i);
u3: XORCY port map (salida(i),p(0)(i+1),g(3)(i));
end generate; 
end Behavioral;

