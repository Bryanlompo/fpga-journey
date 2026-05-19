library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 entity tb_comparateur_4bits is 
 end tb_comparateur_4bits;
 architecture Behavioral of tb_comparateur_4bits is 
 	component comparateur_4bits
    port (
    	A: in STD_LOGIC_VECTOR(3 downto 0);
        B: in STD_LOGIC_VECTOR(3 downto 0);
        GT: out STD_LOGIC;
        LT: out STD_LOGIC;
        EQ: out STD_LOGIC
       	);
     end component ;
	SIGNAL A:  STD_LOGIC_VECTOR(3 downto 0):="0000";
    SIGNAL B:  STD_LOGIC_VECTOR(3 downto 0):="0000";
    SIGNAL GT: STD_LOGIC;
    SIGNAL LT: STD_LOGIC;
    SIGNAL EQ: STD_LOGIC;
begin  
	uut: comparateur_4bits port map(A=>A, B=>B, GT=>GT, LT=>LT, EQ=>EQ );
    process
    begin 
    	A<="0110"; B<="0010"; wait for 10 ns ;
		A<="0001"; B<="1000"; wait for 10 ns ;  
		A<="0101"; B<="0101"; wait for 10 ns ; 
		A<="1111"; B<="0000"; wait for 10 ns ;
        wait;
    end process;
end Behavioral; 
    
 
       	
