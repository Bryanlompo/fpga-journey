library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity tb_DOUBLE_DABLE is
end tb_DOUBLE_DABLE;
architecture Behavioral of tb_DOUBLE_DABLE is
	component DOUBLE_DABLE
	port (
		CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        Start:in STD_LOGIC;
 		input: in STD_LOGIC_VECTOR( 7 downto 0);
        Resultat : out STD_LOGIC_VECTOR( 19 downto 0)
       
        );
    end component ; 

      signal CLK: STD_LOGIC:='0';
      signal RST :STD_LOGIC:='0';
      signal Start : STD_LOGIC:='0';
      signal input:STD_LOGIC_VECTOR(7 downto 0):=(others=>'0');
      signal Resultat:STD_LOGIC_VECTOR(19 downto 0);
      signal done_clk : boolean :=false ;
    
    
begin
	uut: DOUBLE_DABLE port map (
    	CLK=>CLK,
        RST=>RST,
        Start=> Start,
        input=>input,
        Resultat=>Resultat
        );
    clk_process : process
    	begin
    	while not done_clk loop 
        	CLK<='0'; wait for 5 ns ;
            CLK<='1'; wait for 5 ns ;
       end loop;
       wait ;
       end process;
       process 
       begin 
        	RST<='1'; wait for 10 ns ;
            RST<='0';Start<='1'; input <= "11110101";wait for 130 ns;  		
            Start<='1'; input <= "00000000";wait for 130 ns;  
            Start<='1'; input <= "00001001";wait for 130 ns;  
            Start<='1'; input <= "01100011";wait for 130 ns;  
            Start<='1'; input <= "10010101";wait for 130 ns;  
            Start<='1'; input <= "11111111";wait for 130 ns;  
            wait for 100 ns ;
            Start<='0';wait for 10 ns ;
            done_clk <= true ;
            wait ;
        end process;
end Behavioral;
