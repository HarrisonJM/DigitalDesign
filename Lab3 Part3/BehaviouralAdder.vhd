--thingy
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BehaviouralAdder is
port (A, B 		: in std_logic_vector(3 downto 0);
		Hex3		: out std_logic_vector(7 downto 0); -- A
		Hex2		: out std_logic_vector(7 downto 0); -- B
		Hex1		: out std_logic_vector(7 downto 0); -- CARRY
		Hex0		: out std_logic_vector(7 downto 0) -- SUM
		);
end;

architecture structural of BehaviouralAdder is

component CalculatorBehav is
port (A, B			: in std_logic_vector(3 downto 0);
		CarryOut 	: out std_logic;
		Sum			: out std_logic_vector(3 downto 0); -- Hex 2
		Aout, Bout 	: out std_logic_vector(3 downto 0)  --Hex 3
		);
end component;

component Decoder is
port(
	A, B	: in std_logic_vector(3 downto 0);
	sin 	: in std_logic_vector(3 downto 0);
	cout 	: in std_logic;
	D3		: out std_logic_vector(7 downto 0); -- A -- Hex 3
	D2		: out std_logic_vector(7 downto 0); -- B -- Hex 2
	D1 	: out std_logic_vector(7 downto 0); -- carry -- Hex 1
	D0 	: out std_logic_vector(7 downto 0)  -- number -- hex 0
);
end component;

signal asig : std_logic_vector(3 downto 0);
signal bsig : std_logic_vector(3 downto 0);
signal csig : std_logic;
signal sumsig : std_logic_vector(3 downto 0);

begin

CALC  : CalculatorBehav port map(A, B, csig, sumsig, asig, bsig);
DEC	: Decoder port map(asig, bsig, sumsig, csig, Hex3, Hex2, Hex1, Hex0);

end structural;
