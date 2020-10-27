LIBRARY IEEE;
IEEE.std_logic_1164.ALL;
use IEEE.MATH_REAL.ALL;

package fft_pkg is 

type complex is 
    record
    r : real; 
    i : real;
    end record;
    
type complex_array is array (0 to 7)  of complex;
type complex_array2 is array (0 to 3) of complex; 

function add (n1,n2 : complex) return complex;
function sub (n1,n2 : complex) return complex;
function mul (n1,n2 : complex) return complex;

end fft_pkg;

package body fft_pkg is 

function add (n1,n2 : complex) return complex is

variable sum : complex;

begin 
sum.r:=n1.r + n2.r;
sum.i:=n1.i + n2.i;
return sum;
end add;

function sub (n1,n2 : complex) return complex is

variable diff : complex;

begin
diff.r = n1.r - n2.r;
diff.i = n1.i - n2.i;
return diff;
end sub;


function mul (n1,n2 : complex) return complex is

variable prod : complex;
prod.r = n1.r*n2.r;
prod.i=n1.i*n2.i;
return prod;
end mul;

end fft_pkg; 
