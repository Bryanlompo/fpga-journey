library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity tb_diviseur_8bits  is
end tb_diviseur_8bits;
architecture behavioral of tb_diviseur_8bits is
	component Diviseur_8bits
	port (
    	CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        Start : in STD_LOGIC;
    	Dividende : in STD_LOGIC_VECTOR(7 downto 0);
        Diviseur : in STD_LOGIC_VECTOR(7 downto 0) ;
        Resultat : out STD_LOGIC_VECTOR( 7 downto 0)
       
        );
    end component ; 

      signal CLK: STD_LOGIC:='0';
      signal RST :STD_LOGIC:='0';
      signal Start : STD_LOGIC:='0';
      signal Dividende:STD_LOGIC_VECTOR(7 downto 0):=(others=>'0');
      signal Diviseur:STD_LOGIC_VECTOR(7 downto 0):=(others=>'0');
      signal Resultat:STD_LOGIC_VECTOR(7 downto 0);
      signal done_clk : boolean :=false ;
    
    
begin
	uut: diviseur_8bits port map (
    	CLK=>CLK,
        RST=>RST,
        Start=> Start,
        Dividende=>Dividende,
        Diviseur=>Diviseur,
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
            RST<='0';Start<='1'; Diviseur <= "00000101";Dividende<="00100101" ;wait for 130 ns;  		Start<='0';
            done_clk <= true ;
            wait ;
        end process;
end Behavioral;
