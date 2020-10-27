library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.MATH_REAL.ALL;
library work;
use work.fft8_pkg.ALL;

ENTITY tb is 
END tb;

ARCHITECTURE BEHAVIOR OF tb is 
    signal s,y : in complex_array;
    
BEGIN

-- instantiate unit under test 

uut : entity work.fft8 PORT MAP (
             S => s,
             Y => y
      );
             

-- stimulus process
  stim_proc: process
  begin
  -- sample inputs in time domain.
  s(0) <= (-2.0,1.2);
  s(1) <= (-2.2,1.7);
  s(2) <= (1.0,-2.0);
  s(3) <= (-3.0,-3.2);
  s(4) <= (4.5, -2.5);
  s(5) <= (-1.6,0.2);
  s(6) <= (0.5,1.5);
  s(7) <= (-2.8,-4.2);
  wait;
  end process;
  
  
END;

  
  

 