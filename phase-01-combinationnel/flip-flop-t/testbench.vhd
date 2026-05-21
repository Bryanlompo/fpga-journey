library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity tb_flip_flop_T is 
end tb_flip_flop_T;
architecture Behavioral of tb_flip_flop_T is
	component flip_flop_T
          port (
          T : in STD_LOGIC;
          Q : out STD_LOGIC;
          CLK:in STD_LOGIC;
          RST:in STD_LOGIC
          );
	end component ;
	SIGNAL T: STD_LOGIC:='0';
    SIGNAL Q: STD_LOGIC;
    SIGNAL CLK: STD_LOGIC:='0';
    SIGNAL RST: STD_LOGIC:='0'; 
    SIGNAL done : boolean := false;
  
begin 
	uut: flip_flop_T port map (
    	T=>T,
        Q=>Q,
        CLK=>CLK,
        RST=>RST
        );
		clk_process: process
        begin 
        	while not done loop
            	CLK<='0'; wait for 5 ns;
                CLK<='1'; wait for 5 ns ;
            end loop;
            wait ;
        end process;
        process
       	 begin 
      RST <= '1'; T <= '0'; wait for 10 ns;  
      RST <= '0'; T <= '1'; wait for 10 ns;  
      T <= '0'; wait for 10 ns;              
      T <= '1'; wait for 10 ns;              
      RST<='1'; wait for 10 ns; 
      done<= true ;
      wait;
   end process;
end Behavioral;
        
        
