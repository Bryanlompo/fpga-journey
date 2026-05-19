library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity tb_additionneur is 
end tb_additionneur ;
architecture Behavioral of tb_additionneur is 
	component additionneur 
    	port(
        	A: in STD_LOGIC_VECTOR( 3 downto 0);
            B: in STD_LOGIC_VECTOR( 3 downto 0);
            SUM: out STD_LOGIC_VECTOR( 3 downto 0)
            );
    end component ;
    SIGNAL A: STD_LOGIC_VECTOR(3 downto 0):="0000";
    SIGNAL B: STD_LOGIC_VECTOR(3 downto 0):="0000";
    SIGNAL SUM: STD_LOGIC_VECTOR(3 downto 0);
begin
	uut: additionneur port map (A=>A, B=>B, SUM=>SUM);
    process 
    begin
      A <= "0011"; B <= "0001"; wait for 10 ns;
      A <= "0101"; B <= "0010"; wait for 10 ns;
      A <= "1000"; B <= "0111"; wait for 10 ns;
      wait;
    end process;
end Behavioral;
