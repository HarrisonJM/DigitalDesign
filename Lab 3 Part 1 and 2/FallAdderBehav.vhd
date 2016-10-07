-- fulladderbahvioural
library ieee;
use ieee.std_logic_1164.all;

entity FullAdderBehav is
port(A, B, CarryIn : in std_logic;
		CarryOut: out std_logic;
		S:	out std_logic);
end entity;