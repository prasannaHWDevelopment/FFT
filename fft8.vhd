Library IEEE;
IEEE.std_logic_1164.ALL;
use IEEE.MATH_REAL.ALL;
library work;
use work.fft_pkg.ALL;

entity fft8 is 
port (S : in complex_array; -- input signal in time domain
      Y : out complex_array; -- output signal in time domain 
      );
end fft8;

architecture Behavioral of fft8 is 

component butterfly is 
port ( s1,s2 : in complex; -- inputs 
        w : in complex; -- phase factors
        g1,g2 : out complex); -- outputs 
end component;

signal g1,g2 : complex_array := (others =>(0,0,0,0));

constant w : complex_array2 := ( (1.0,1.0), (0.7071,-0.7071), (1.0, -1.0), (-0.7071,-0.7071));
  

begin 
-- first stage of butterfly's.
bf11: butterfly(S(0),S(4),w(0),g1(0),g1(1));
bf12: butterfly(S(2),S(6),w(0),g1(2),g1(3));
bf13: butterfly(S(1),S(5),w(0),g1(4),g1(5));
bf14: butterfly(S(3),S(7),w(0),g1(6),g1(7));

-- second stage of butterfly's.
bf21: butterfly(g1(0),g1(2),w(0),g2(0),g2(2));
bf22: butterfly(g1(1),g1(3),w(2),g2(1),g2(3));
bf23: butterfly(g1(4),g1(6),w(0),g2(4),g2(6));
bf24: butterfly(g1(5),g1(7),w(2),g2(5),g2(7));

-- third stage of butterfly's1
bf31: butterfly(g2(0),g2(2),w(0),y(0),y(4));
bf32: butterfly(g2(1),g2(3),w(1),y(1),y(5));
bf33: butterfly(g2(4),g2(6),w(2),y(2),y(6));
bf34: butterfly(g2(5),g2(7),w(3),y(3),y(7));

end Behavioral;
