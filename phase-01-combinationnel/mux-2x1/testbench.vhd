library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity tb_mux_2x1 is 
end tb_mux_2x1;
architecture Behavioral of tb_mux_2x1 is  
	component mux_2x1 
    	port (
        	A: in STD_LOGIC;
            B: in STD_LOGIC;
            S: in STD_LOGIC;
            Y: out STD_LOGIC
            );
      end component ;
    SIGNAL A :STD_LOGIC:='0';
    SIGNAL B :STD_LOGIC:='0';
    SIGNAL S :STD_LOGIC:='0';
	SIGNAL Y :STD_LOGIC;

begin 
	uut: mux_2x1 port map (A=>A, B=>B, S=>S, Y=>Y);
    process
    begin 
    	S<= '0';  A<= '0';  B<= '0'; wait for 10 ns;
        S<= '0';  A<= '1';  B<= '0'; wait for 10 ns;
    	S<= '1';  A<= '0';  B<= '0'; wait for 10 ns;
    	S<= '1';  A<= '0';  B<= '1'; wait for 10 ns;
        wait;
    end process ;
end Behavioral;  
