library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Decoder is
port(
	A, B	: in std_logic_vector(3 downto 0);
	sin 	: in std_logic_vector(3 downto 0);
	cout 	: in std_logic;
	D3		: out std_logic_vector(7 downto 0); -- A -- Hex 3
	D2		: out std_logic_vector(7 downto 0); -- B -- Hex 2
	D1 	: out std_logic_vector(7 downto 0); -- carry -- Hex 1
	D0 	: out std_logic_vector(7 downto 0)  -- number -- hex 0
);

	constant ONE	: std_logic_vector(7 downto 0) := "10011111";
	constant TWO	: std_logic_vector(7 downto 0) := "00100101";
	constant THREE	: std_logic_vector(7 downto 0) := "00001101";
	constant FOUR	: std_logic_vector(7 downto 0) := "10011001";
	constant FIVE	: std_logic_vector(7 downto 0) := "01001001";
	constant SIX	: std_logic_vector(7 downto 0) := "01000001";
	constant SEVEN	: std_logic_vector(7 downto 0) := "00011111";
	constant EIGHT	: std_logic_vector(7 downto 0) := "00000001";
	constant NINE	: std_logic_vector(7 downto 0) := "00011001";
	constant ZERO	: std_logic_vector(7 downto 0) := "00000011";
	constant E		: std_logic_vector(7 downto 0) := "01100001";
end;

architecture behavioural of Decoder is
	begin
	
-- THE TOTAL AND CARRY
		PROCESS(sin)
			begin
				case sin is
					when "0000" => D0 <= ZERO;
					when "0001" => D0 <= ONE;
					when "0010" => D0 <= TWO;
					when "0011" => D0 <= THREE;
					when "0100" => D0 <= FOUR;
					when "0101" => D0 <= FIVE;
					when "0110" => D0 <= SIX;
					when "0111" => D0 <= SEVEN;
					when "1000" => D0 <= EIGHT;
					when "1001" => D0 <= NINE;		
					when others => D0 <= EIGHT;
				end case;
		end PROCESS;
		
		PROCESS(cout)
			begin
				case cout is
					when '1' => D1 <= ONE;
					when '0' => D1 <= ZERO;
					when others => D1 <= E;
				end case;
		end PROCESS;
						
-- HEX3 AND HEX 2, THE 'SUM'	
PROCESS(B)
		begin
			case B is
				when "0000" => D2 <= ZERO;
				when "0001" => D2 <= ONE;
				when "0010" => D2 <= TWO;
				when "0011" => D2 <= THREE;
				when "0100" => D2 <= FOUR;
				when "0101" => D2 <= FIVE;
				when "0110" => D2 <= SIX;
				when "0111" => D2 <= SEVEN;
				when "1000" => D2 <= EIGHT;
				when "1001" => D2 <= NINE;		
				when others => D2 <= EIGHT;
			end case;
	end PROCESS;
	
		PROCESS(A)
		begin
			case A is
				when "0000" => D3 <= ZERO;
				when "0001" => D3 <= ONE;
				when "0010" => D3 <= TWO;
				when "0011" => D3 <= THREE;
				when "0100" => D3 <= FOUR;
				when "0101" => D3 <= FIVE;
				when "0110" => D3 <= SIX;
				when "0111" => D3 <= SEVEN;
				when "1000" => D3 <= EIGHT;
				when "1001" => D3 <= NINE;		
				when others => D3 <= EIGHT;
			end case;
	end PROCESS;
	
	
end behavioural;