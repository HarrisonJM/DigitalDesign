library ieee;
use ieee.std_logic_1164.all;

--TODO: TIDY UP BY STORING CONSTANTS IN ARRAYS AND THEN LOOP THROUGH

entity Decoder is
port(
	sin 	: in std_logic_vector(3 downto 0);
	cout 	: in std_logic;
	D1 	: out std_logic_vector(7 downto 0);
	D0 	: out std_logic_vector(7 downto 0)
);

	constant ONE	: std_logic_vector(7 downto 0) := "10011110";
	constant TWO	: std_logic_vector(7 downto 0) := "00100100";
	constant THREE	: std_logic_vector(7 downto 0) := "00001100";
	constant FOUR	: std_logic_vector(7 downto 0) := "10011000";
	constant FIVE	: std_logic_vector(7 downto 0) := "01001000";
	constant SIX	: std_logic_vector(7 downto 0) := "01000000";
	constant SEVEN	: std_logic_vector(7 downto 0) := "00011110";
	constant EIGHT	: std_logic_vector(7 downto 0) := "00000000";
	constant NINE	: std_logic_vector(7 downto 0) := "00011000";
	constant ZERO	: std_logic_vector(7 downto 0) := "00000010";
	constant E		: std_logic_vector(7 downto 0) := "01100000";
end;

architecture behavioural of Decoder is
	begin
		process(cout, sin)
			begin
			case cout is
				when '0' => 
						case sin is
								when "0000" => 
									D0 <= ZERO;
									D1 <= ZERO;
								when "0001" => 
									D0 <= ONE;
									D1 <= ZERO;
								when "0010" => 
									D0 <= TWO;
									D1 <= ZERO;
								when "0011" => 
									D0 <= THREE;
									D1 <= ZERO;
								when "0100" => 
									D0 <= FOUR;
									D1 <= ZERO;
								when "0101" => 
									D0 <= FIVE;
									D1 <= ZERO;
								when "0110" => 
									D0 <= SIX;
									D1 <= ZERO;
								when "0111" => 
									D0 <= SEVEN;
									D1 <= ZERO;
								when "1000" => 
									D0 <= EIGHT;
									D1 <= ZERO;
								when "1001" => -- 9
									D0 <= NINE;
									D1 <= ZERO;
								when "1010" => -- 10
									D0 <= ZERO;
									D1 <= ONE;
								when "1011" => -- 11
									D0 <= ONE;
									D1 <= ONE;
								when "1100" =>  -- 12
									D0 <= TWO;
									D1 <= ONE;
								when "1101" => -- 13
									D0 <= THREE;
									D1 <= ONE;
								when "1110" => -- 14
									D0 <= FOUR;
									D1 <= ONE;										
								when "1111" => -- 15
									D0 <= FIVE;
									D1 <= ONE;
								when others => --ERROR
									D0 <= E;
									D1 <= E;
						end case;
				when '1' =>
						case sin is
								when "0000" => -- cout is 16
									D0 <= SIX;
									D1 <= ONE;
								when "0001" => 
									D0 <= SEVEN;
									D1 <= ONE;
								when "0010" => 
									D0 <= EIGHT;
									D1 <= ONE;
								when "0011" => 
									D0 <= NINE;
									D1 <= ONE;
								when "0100" => 
									D0 <= ZERO;
									D1 <= TWO;
								when "0101" => 
									D0 <= ONE;
									D1 <= TWO;
								when "0110" => 
									D0 <= TWO;
									D1 <= TWO;
								when "0111" => 
									D0 <= THREE;
									D1 <= TWO;
								when "1000" => 
									D0 <= FOUR;
									D1 <= TWO;
								when "1001" => -- 25
									D0 <= FIVE;
									D1 <= TWO;
								when "1010" => -- 26
									D0 <= SIX;
									D1 <= TWO;
								when "1011" => -- 27
									D0 <= SEVEN;
									D1 <= TWO;
								when "1100" =>  -- 28
									D0 <= EIGHT;
									D1 <= TWO;
								when "1101" => -- 29
									D0 <= NINE;
									D1 <= TWO;
								when "1110" => -- 30
									D0 <= ZERO;
									D1 <= THREE;										
								when "1111" => -- 31
									D0 <= ONE;
									D1 <= THREE;
								when others => --ERROR
									D0 <= E;
									D1 <= E;
						end case;
				when others =>
							D0 <= E;
							D1 <= E;
			end case;
		end process;
end behavioural;