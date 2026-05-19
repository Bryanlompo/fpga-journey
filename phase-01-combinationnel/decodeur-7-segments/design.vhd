library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity decodeur_7_segment is 
	port (
    	DIGIT: in STD_LOGIC_VECTOR(3 downto 0);
    	SEG : out STD_LOGIC_VECTOR( 6 downto 0)
    ); 
end decodeur_7_segment;
architecture Behavioral of decodeur_7_segment is 
begin
	process(DIGIT)
    begin 
      case DIGIT is 
          when "0000" => SEG <= "1111110"; --chiffre 0
          when "0001" => SEG <= "0110000"; --chiffre 1
          when "0010" => SEG <= "1101101"; --chiffre 2 
          when "0011" => SEG <= "1111001"; --chiffre 3 
          when "0100" => SEG <= "0110011"; --chiffre 4 
          when "0101" => SEG <= "1011011"; --chiffre 5  
          when "0110" => SEG <= "1011111"; --chiffre 6 
          when "0111" => SEG <= "1110000"; --chiffre 7 
          when "1000" => SEG <= "1111111"; --chiffre 8 
          when "1001" => SEG <= "1111011"; --chiffre 9 
          when others => SEG <= "0000000"; --eteint 
     	end case ;
     end process;
end Behavioral ;
