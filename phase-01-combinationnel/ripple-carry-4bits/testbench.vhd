library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity tb_Ripple_carry_4bits is 
end tb_Ripple_carry_4bits;
architecture Behavioral of tb_Ripple_carry_4bits is 
	component Ripple_carry_4bits 
    	port(
        	A: iN STD_LOGIC_VECTOR(3 downto 0);
        	B: iN STD_LOGIC_VECTOR(3 downto 0);
        	Cin: iN STD_LOGIC;
        	SUM: out STD_LOGIC_VECTOR(3 downto 0);
        	Cout: out STD_LOGIC
            
            );
    	end component;
    SIGNAL A: STD_LOGIC_VECTOR(3 downto 0):="0000";
    SIGNAL B:  STD_LOGIC_VECTOR(3 downto 0):="0000";
    SIGNAL Cin: STD_LOGIC:='0';
    SIGNAL SUM:  STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL Cout:  STD_LOGIC;
begin 
	uut:Ripple_carry_4bits port map ( A   => A,
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

            
