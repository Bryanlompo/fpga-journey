library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity tb_decodeur_7_segment is 
end entity; 
architecture Behavioral of tb_decodeur_7_segment is 
	component decodeur_7_segment 
    	port(
        	DIGIT: in STD_LOGIC_VECTOR(3 downto 0);
            SEG: out STD_LOGIC_VECTOR(6 downto 0)
        );
    end component ;
    SIGNAL DIGIT: STD_LOGIC_VECTOR(3 downto 0):="0000";
    SIGNAL SEG: STD_LOGIC_VECTOR(6 downto 0);
begin 
	uut: decodeur_7_segment port map (DIGIT => DIGIT, SEG=>SEG);
    process 
    begin 
          DIGIT <= "0000"; wait for 10 ns; -- teste le 0 
          DIGIT <= "0011"; wait for 10 ns; -- teste le 3
          DIGIT <= "0101"; wait for 10 ns; -- teste le 5
          DIGIT <= "1000"; wait for 10 ns; -- teste le 8
          wait;
    end process;
end Behavioral;
