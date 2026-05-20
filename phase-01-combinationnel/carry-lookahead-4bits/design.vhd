library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity Carry_Lookahead is
	port(
    	A: in STD_LOGIC_VECTOR(3 downto 0);
        B: in STD_LOGIC_VECTOR(3 downto 0);
        Cin: in STD_LOGIC;
        SUM: out STD_LOGIC_VECTOR(3 downto 0);
        Cout: out STD_LOGIC 
    	);
     end Carry_Lookahead;
architecture Behavioral of Carry_Lookahead is 
	signal P:  STD_LOGIC_VECTOR(3 downto 0);
    signal G:  STD_LOGIC_VECTOR(3 downto 0);
    signal C:  STD_LOGIC_VECTOR(4 downto 0);
begin
	C(0)<=Cin;
    G(0) <= A(0) AND B(0);
    G(1) <= A(1) AND B(1);
    G(2) <= A(2) AND B(2);
    G(3) <= A(3) AND B(3);
    P(0) <= A(0) XOR B(0);
    P(1) <= A(1) XOR B(1);
    P(2) <= A(2) XOR B(2);
    P(3) <= A(3) XOR B(3);
    C(1) <= G(0) OR (P(0) AND C(0));
    C(2) <= G(1) OR (P(1) AND C(1));
    C(3) <= G(2) OR (P(2) AND C(2));
    C(4) <= G(3) OR (P(3) AND C(3));
    Cout <= C(4);
    SUM(0) <= P(0) XOR C(0);
    SUM(1) <= P(1) XOR C(1);
    SUM(2) <= P(2) XOR C(2);
    SUM(3) <= P(3) XOR C(3);
end Behavioral ;
    	
