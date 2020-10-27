library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.MATH_REAL.ALL;
library work;
use work.ff_pkg.ALL;

entity of butterfly is
port ( S1, S2 : in complex; -- inputs 
       w      : in complex; -- phase factor
       g1, g2 : outcomplex); -- outputs 
end butterfly;

architecture Behavioral of butterfly is 

begin 

--butterfly equations

g1 <= add(S1,mult(S2,w));
g2 <= sub(S1,mult(S2,w));       

end Behavioral;