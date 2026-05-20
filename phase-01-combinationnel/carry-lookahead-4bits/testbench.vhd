library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity tb_Carry_Lookahead is
end tb_Carry_Lookahead;
architecture Behavioral of tb_Carry_Lookahead is 
	component Carry_Lookahead
    port(
    	A: in STD_LOGIC_VECTOR(3 downto 0);
        B: in STD_LOGIC_VECTOR(3 downto 0);
        Cin: in STD_LOGIC;
        SUM: out STD_LOGIC_VECTOR(3 downto 0);
        Cout: out STD_LOGIC 
        );
     end component;
     signal A:    STD_LOGIC_VECTOR(3 downto 0):="0000";
     signal B:    STD_LOGIC_VECTOR(3 downto 0):="0000";
     signal Cin:  STD_LOGIC:='0';
     signal SUM:  STD_LOGIC_VECTOR(3 downto 0);
     signal Cout: STD_LOGIC;
begin 
	uut: Carry_Lookahead port map( A   => A,
    B   => B,
    Cin => Cin,
    SUM => SUM,
    Cout => Cout);
    process
    begin 
        A<="0101"; B<="0110"; Cin<='0'; wait for 10 ns ; 
  		A<="1111"; B<="0001"; Cin<='0'; wait for 10 ns ; 
        A<="1000"; B<="1000"; Cin<='0'; wait for 10 ns ; 
        A<="0011"; B<="0011"; Cin<='1'; wait for 10 ns ; 
        wait; 
    end process; 
end Behavioral ;
    
    
