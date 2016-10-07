--calcbehav
--TODO FIX
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CalculatorBehav is
port (A, B			: in std_logic_vector(3 downto 0);
		CarryOut 	: out std_logic;
		Sum			: out std_logic_vector(3 downto 0); -- Hex 2
		Aout, Bout 	: out std_logic_vector(3 downto 0)  --Hex 3
		);
end entity;

architecture behavioural of CalculatorBehav is
	signal aint : unsigned(3 downto 0); -- A
	signal bint : unsigned(3 downto 0); -- B

	signal T : unsigned(3 downto 0); --(T) temp total
	signal S : unsigned(3 downto 0); --(Z) sum
	signal C : std_logic; --(C) Carry
	signal Z : unsigned(3 downto 0); -- (Z) Temp
begin
process(A, B)
	begin
	
	aint <= unsigned(A);
	bint <= unsigned(B);
	
		T <= aint + bint;
		if(T > 9) then
			Z <= "1010";
			C <= '1';
		else 
			Z <= "0000";
			C <= '0';
		end if;
		S <= T - Z;
		
		CarryOut <= C;
		Sum <= std_logic_vector(S);
		
		Aout <= A;
		Bout <= B;
end process;	

end behavioural;