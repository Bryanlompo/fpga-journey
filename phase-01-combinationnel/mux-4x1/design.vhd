library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity mux_4x1 is 
	port(
    	A: in STD_LOGIC;
        B: in STD_LOGIC;
        C: in STD_LOGIC;
        D: in STD_LOGIC;
        S: in STD_LOGIC_VECTOR(1 downto 0);
        Y: out STD_LOGIC
        );
end mux_4x1 ;
architecture structural of mux_4x1 is 
	component mux_2x1
    	port(
    	A: in STD_LOGIC;
        B: in STD_LOGIC;
        S: in STD_LOGIC;
        Y: out STD_LOGIC
        );
	end component ;
    signal W0: STD_LOGIC;
    signal W1: STD_LOGIC;
    begin 
    	MUX0: mux_2x1 port map (
        	A=>A,
            B=>B,
            Y=>W0,
            S=>S(0)
    		);
    	MUX1: mux_2x1 port map (
        	A=>C,
            B=>D,
            Y=>W1,
            S=>S(0)
    		);
        MUX2: mux_2x1 port map (
        	A=>W0,
            B=>W1,
            Y=>Y,
            S=>S(1)
    		);
end structural;
