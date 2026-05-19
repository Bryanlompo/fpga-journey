library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity mux_2x1 is 
	port(
    	A: in STD_LOGIC;
        B: in STD_LOGIC;
        S: in STD_LOGIC;
        Y: out STD_LOGIC
        );
end mux_2x1 ;
architecture Behavioral of mux_2x1 is 
begin 
	Y<= A when S='0' else B;
end Behavioral ;
