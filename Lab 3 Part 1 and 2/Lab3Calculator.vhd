library ieee;
use ieee.std_logic_1164.all;

entity Lab3Calculator is
port (A, B		: in std_logic_vector(3 downto 0);
		CarryIn  : in std_logic;
		D1 		: out std_logic_vector(7 downto 0);
		D0			: out std_logic_vector(7 downto 0)
		);
end entity;

architecture structural of Lab3Calculator is

component Calculator is
port (A, B		: in std_logic_vector(3 downto 0);
		CarryIn  : in std_logic;
		CarryOut : out std_logic;
		S			: out std_logic_vector(3 downto 0)
		);
end component;

component Decoder is
port (sin 	: in std_logic_vector(3 downto 0);
		cout 	: in std_logic;
		D1 	: out std_logic_vector(7 downto 0);
		D0 	: out std_logic_vector(7 downto 0)
		);
end component;

--Signals, "internal wires"
signal Sum 		: std_logic_vector (3 downto 0);
signal carry 	: std_logic;

begin

CALC 	: Calculator 	port map(A, B, CarryIn, carry, Sum);
DEC	: Decoder		port map(Sum, carry, D1, D0);


end structural;