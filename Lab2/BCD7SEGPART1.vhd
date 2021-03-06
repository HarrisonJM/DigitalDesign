library ieee;
use ieee.std_logic_1164.all;

entity BCD7Segpart1 is
port(
A,B,C,D : in std_logic; -- inputs A,B,C,D
display : out std_logic_vector(6 downto 0) -- outputs D0,D1,D2,D3,D4,D5,D6
);
end ;


ARCHITECTURE dataflow OF BCD7Segpart1 IS
BEGIN
--for D0
display(6) <= ((not c) and (not d) and (b)) or ((not b) and (not c) and (d));

--D1
display(5) <= b and (c or d);

--D2
display(4) <= (not b) and c and (not d);

--D3
display(3) <= b or ((not c) and d);

--D4
display(2) <= (b or (not c)) or d;

--D5
display(1) <= (c and d) or (((not a) and (not b)) and (d or c));

--D6
display(0) <= ((not a) and (not b) and (not c)) or (b and c and d);
END dataflow;
