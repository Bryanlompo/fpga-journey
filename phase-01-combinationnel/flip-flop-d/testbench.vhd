library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity tb_flip_flop_d is 
end tb_flip_flop_d;
architecture Behavioral of tb_flip_flop_d is 
	component flip_flop_d
    	port (
        	D: in STD_LOGIC;
            CLK: in STD_LOGIC;
            RST : in STD_LOGIC;
            Q: out STD_LOGIC
            );
     end component;
     signal D: STD_LOGIC:='0';
     signal CLK: STD_LOGIC:='0';
     signal RST : STD_LOGIC:='0';
     signal Q:  STD_LOGIC;
     signal done : boolean := false;
begin 
	uut: flip_flop_d port map (
    D=>D,
    CLK=>CLK,
    RST=>RST,
    Q=>Q
    );
    
	clk_process : process
	begin
      while not done loop
          CLK <= '0'; wait for 5 ns;
          CLK <= '1'; wait for 5 ns;
      end loop;
      wait;
 	end process;
	process 
      begin 
      RST <= '1'; D <= '0'; wait for 10 ns;  
      RST <= '0'; D <= '1'; wait for 10 ns;  
      D <= '0'; wait for 10 ns;              
      D <= '1'; wait for 10 ns;              
      RST<='1'; wait for 10 ns; 
      done<= true ;
      wait;
   end process;
end Behavioral;

    
