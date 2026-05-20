library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity Ripple_carry_4bits is
	port(
    	A: in STD_LOGIC_VECTOR(3 downto 0);
        B: in STD_LOGIC_VECTOR(3 downto 0);
        Cin: in STD_LOGIC;
        SUM: out STD_LOGIC_VECTOR(3 downto 0);
        Cout: out STD_LOGIC 
    	);
     end Ripple_carry_4bits;   
architecture Structural of Ripple_carry_4bits is 
	component full_adder 
    	port(
        	A: iN STD_LOGIC;
        	B: iN STD_LOGIC;
        	Cin: iN STD_LOGIC;
        	SUM: out STD_LOGIC;
        	Cout: out STD_LOGIC
            );
    end component;
    signal C1, C2, C3:STD_LOGIC;
    begin 
    	FA0: full_adder port map (
        	A=> A(0),
            B=> B(0),
			Cin=>Cin,
            SUM=>SUM(0),
            Cout=>C1
        );
        FA1: full_adder port map (
        	A=> A(1),
            B=> B(1),
			Cin=>C1,
            SUM=>SUM(1),
            Cout=>C2
            );
         FA2: full_adder port map (
        	A=> A(2),
            B=> B(2),
			Cin=>C2,
            SUM=>SUM(2),
            Cout=>C3
            );
         FA3: full_adder port map (
        	A=> A(3),
            B=> B(3),
			Cin=>C3,
            SUM=>SUM(3),
            Cout=>Cout
            );
end Structural;
