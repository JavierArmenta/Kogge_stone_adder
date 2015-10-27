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

type arreglo is array (0 to 4) of std_logic_vector (9 downto 0); --renglones, columna
signal P,G: arreglo;


begin
PG_logic : for i in 7 downto 0 generate

	begin
	u1: MULT_AND port  map (g(0)(i+1),y(i),x(i));
	u2: XORCY port map (p(0)(i+1),y(i),x(i));
	end generate;
g(0)(0)<='0';

---------------------------------------------------------------------- primer renglon de la logica kogge-stone
gris1: CeldaGris port map (g(0)(1),p(0)(1),g(0)(0),g(1)(1));

negro1: CeldaNegra port map (g(0)(2),p(0)(2),g(0)(1),p(0)(1),g(1)(2),p(1)(2));

negro2: CeldaNegra port map (g(0)(3),p(0)(3),g(0)(2),p(0)(2),g(1)(3),p(1)(3));

negro3: CeldaNegra port map (g(0)(4),p(0)(4),g(0)(3),p(0)(3),g(1)(4),p(1)(4));

negro4: CeldaNegra port map (g(0)(5),p(0)(5),g(0)(4),p(0)(4),g(1)(5),p(1)(5));

negro5: CeldaNegra port map (g(0)(6),p(0)(6),g(0)(5),p(0)(5),g(1)(6),p(1)(6));

negro6: CeldaNegra port map (g(0)(7),p(0)(7),g(0)(6),p(0)(6),g(1)(7),p(1)(7));

negro7: CeldaNegra port map (g(0)(8),p(0)(8),g(0)(7),p(0)(7),g(1)(8),p(1)(8));
-------------------------------------------------------------------------^^^^^^^^^^^^


Gris1Renglon2 : CeldaGris port map (g(1)(2),p(1)(2),g(0)(0),g(2)(2));

Gris2Renglon2 : CeldaGris port map (g(1)(3),p(1)(3),g(1)(1),g(2)(3));

Negra1Renglon2 : CeldaNegra port map (g(1)(4),p(1)(4),g(1)(2),p(1)(2),g(2)(4),p(2)(4));

Negra2Renglon2 : CeldaNegra port map (g(1)(5),p(1)(5),g(1)(3),p(1)(3),g(2)(5),p(2)(5));

Negra3Renglon2 : CeldaNegra port map (g(1)(6),p(1)(6),g(1)(4),p(1)(4),g(2)(6),p(2)(6));

Negra4Renglon2 : CeldaNegra port map (g(1)(7),p(1)(7),g(1)(5),p(1)(5),g(2)(7),p(2)(7));

Negra5Renglon2 : CeldaNegra port map (g(1)(8),p(1)(8),g(1)(6),p(1)(6),g(2)(8),p(2)(8));

----------------------------------------------------------------------------------------------------

Gris1Renglon3 : CeldaGris port map (g(2)(4),p(2)(4),g(0)(0),g(3)(4));

Gris2Renglon3 : CeldaGris port map (g(2)(5),p(2)(5),g(1)(1),g(3)(5));

Gris3Renglon3 : CeldaGris port map (g(2)(6),p(2)(6),g(2)(2),g(3)(6));

Gris4Renglon3 : CeldaGris port map (g(2)(7),p(2)(7),g(2)(3),g(3)(7));

Negra1Renglon3 : CeldaNegra port map (g(2)(8),p(2)(8),g(2)(4),p(2)(4),g(3)(8),p(3)(8));

-----------------------------------------------------------------------------------------------------

Gris1Renglon4 : CeldaGris port map (g(3)(8),p(3)(8),g(0)(0),g(4)(8));
-------------------------------------------------------------------------------------------------

s0: XORCY port map (salida(0),p(0)(1),g(0)(0));
s1: XORCY port map (salida(1),p(0)(2),g(1)(1));
s2: XORCY port map (salida(2),p(0)(3),g(2)(2));
s3: XORCY port map (salida(3),p(0)(4),g(2)(3));
s4: XORCY port map (salida(4),p(0)(5),g(3)(4));
s5: XORCY port map (salida(5),p(0)(6),g(3)(5));
s6: XORCY port map (salida(6),p(0)(7),g(3)(6));
s7: XORCY port map (salida(7),p(0)(8),g(3)(7));

u5: MULT_AND port  map (g(4)(0),p(0)(8),g(3)(7));
u6: xorcy port map (salida(8),g(4)(0),g(0)(8));

--begin
----salida(i)<=g(3)(i);
--u3: XORCY port map (salida(i),p(0)(i+1),g(3)(i));
--end generate; 
end Behavioral;

