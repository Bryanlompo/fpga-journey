library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity tb_full_adder is
end tb_full_adder;
architecture Behavioral of tb_full_adder is
	component full_adder 
    port(
    	A: iN STD_LOGIC;
        B: iN STD_LOGIC;
        Cin: iN STD_LOGIC;
        SUM: out STD_LOGIC;
        COUT: out STD_LOGIC 
        );
    end component;
	SIGNAL A: STD_LOGIC:='0';
    SIGNAL B: STD_LOGIC:='0';
    SIGNAL Cin: STD_LOGIC:='0';
    SIGNAL SUM: STD_LOGIC;
    SIGNAL Cout: STD_LOGIC;
begin 
	uut: full_adder port map( A=>A,B=>B, Cin=>Cin, SUM=>SUM, Cout=>cout);
	process
    begin
        A<='0'; B<='0'; Cin<='0'; wait for 10 ns; 
    	A<='0'; B<='0'; Cin<='1'; wait for 10 ns; 
    	A<='0'; B<='1'; Cin<='0'; wait for 10 ns; 
    	A<='0'; B<='1'; Cin<='1'; wait for 10 ns;
    	A<='1'; B<='0'; Cin<='0'; wait for 10 ns; 
    	A<='1'; B<='0'; Cin<='1'; wait for 10 ns;
    	A<='1'; B<='1'; Cin<='0'; wait for 10 ns; 
    	A<='1'; B<='1'; Cin<='1'; wait for 10 ns;
        wait;
    end process;
end Behavioral;
