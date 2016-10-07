library ieee;
use ieee.std_logic_1164.all;

entity Lab3Calculator is
port (A, B		: in std_logic_vector(3 downto 0);
		CarryIn  : in std_logic;
		CarryOut : out std_logic;
		S			: out std_logic_vector(3 downto 0));
end entity;

architecture structural of Lab3Calculator is

component FullAdder is
port(A, B, CarryIn : in std_logic;
		CarryOut: out std_logic;
		S:	out std_logic);
end component;

--Signals, "internal wires"
signal Carry : std_logic_vector (2 downto 0);

begin
--components instantiation
--three instances are required here
--inst1: HalfAdder port map(A, B, Carry(0), Sum); --First half adder
--inst2: HalfAdder port map(Sum, CarryIn, Carry(1), S); --Second half adder
--inst3: TwoOr	  port map(Carry(0), Carry(1), CarryOut); --Final OR gate#

FA1: FullAdder port map(A(0), B(0), CarryIn, Carry(0), S(0));
FA2: FullAdder port map(A(1), B(1), Carry(0), Carry(1), S(1));
FA3: FullAdder port map(A(2), B(2), Carry(1), Carry(2), S(2));
FA4: FullAdder port map(A(3), B(3), Carry(2), CarryOut, S(3));

end structural;