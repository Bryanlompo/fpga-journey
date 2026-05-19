library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity full_adder is
	port (
    	A: iN STD_LOGIC;
        B: iN STD_LOGIC;
        Cin: iN STD_LOGIC;
        SUM: out STD_LOGIC;
        Cout: out STD_LOGIC
        );
     end full_adder;
architecture Behavioral of full_adder is 
begin 
	SUM<= A xor B xor Cin;
    Cout<= (A and B) or ( Cin and(A xor B));
end Behavioral; 
    
    
