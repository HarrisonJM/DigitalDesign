library ieee;
use ieee.std_logic_1164.all;

entity BCD7SEGPART2 is
port(
inputs : in std_logic_vector(3 downto 0) ; -- inputs A,B,C,D
display : out std_logic_vector(6 downto 0) -- outputs D0,D1,D2,D3,D4,D5,D6
);
end;

ARCHITECTURE Behavioural OF BCD7SEGPART2 IS
BEGIN
	PROCESS(inputs)
		begin
			case inputs is
				when "0000" => display <= "0000001";
				when "0001" => display <= "1001111";
				when "0010" => display <= "0010010";
				when "0011" => display <= "0000110";
				when "0100" => display <= "1001100";
				when "0101" => display <= "0100100";
				when "0110" => display <= "0100000";
				when "0111" => display <= "0001111";
				when "1000" => display <= "0000000";
				when "1001" => display <= "0001100";				
				when others => display <= "0000000";
			end case;
	end process;
end Behavioural;