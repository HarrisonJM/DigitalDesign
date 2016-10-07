--calcbehav
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all

entity CalculatorBehav is
port (A, B		: in std_logic_vector(3 downto 0);
		CarryIn  : in std_logic;
		CarryOut : out std_logic;
		S			: out std_logic_vector(3 downto 0));
end entity;

architecture behavioural of CalculatorBehav is

variable aint : integer; -- A
variable bint : integer; -- B

variable total : integer; --(T)
variable sum : integer; --(Z)
variable carry : integer; --(C)

process(A, B, CarryIn)
	begin
		if(total > 9) then
			
		
end process;
	

end behavioural;