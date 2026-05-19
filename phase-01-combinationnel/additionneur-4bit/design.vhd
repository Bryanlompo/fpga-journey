library IEEE;
use IEEE.STD_LOGIC_1164.All;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity additionneur is 
	port(
    	A: in STD_LOGIC_VECTOR (3 downto 0);
    	B: in STD_LOGIC_VECTOR (3 downto 0);
    	SUM:out STD_LOGIC_VECTOR(3 downto 0)
    );
end additionneur; 
architecture Behavioral of additionneur is 
begin
	SUM<= A+B;
end Behavioral;
