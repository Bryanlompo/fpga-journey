library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 entity comparateur_4bits is 
 	port (
    	A: in STD_LOGIC_VECTOR(3 downto 0);
        B: in STD_LOGIC_VECTOR(3 downto 0);
        GT: out STD_LOGIC;
        LT: out STD_LOGIC;
        EQ: out STD_LOGIC
       	);
end comparateur_4bits;
architecture Behavioral of comparateur_4bits is 
begin
	GT<='1' when A > B else '0';
    LT<='1' when A < B else '0';
    EQ<='1' when A = B else '0';
    
end Behavioral; 
