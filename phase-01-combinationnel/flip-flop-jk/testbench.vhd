library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity tb_flip_flop_jk is 
end tb_flip_flop_jk;
architecture Behavioral of tb_flip_flop_jk is 
	component flip_flop_jk
      port(
          J: in STD_LOGIC;
          K: in STD_LOGIC;
          CLK: in STD_LOGIC;
          RST: in STD_LOGIC;
          Q: out STD_LOGIC 
          );
      end component;

	  SIGNAL J : STD_LOGIC:='0';
      SIGNAL K : STD_LOGIC:='0';
      SIGNAL CLK : STD_LOGIC:='0';
      SIGNAL RST : STD_LOGIC:='0';
      SIGNAL Q : STD_LOGIC;
      SIGNAL done: boolean:= false;
begin 
	uut: flip_flop_jk port map (
    	J=>J,
        K=>k,
        CLK=>CLK,
        RST=>RST,
        Q=>Q
        );
        clk_process: process
        begin
        	while not done loop
        		CLK<='0'; wait for 5 ns ;
                CLK<='1'; wait for 5 ns ;
            end loop;
            wait;
        end process;
        process
        	begin 
              RST<='1';  wait for 10 ns ;               
              RST<='0';J<='0'; K<='0';  wait for 10 ns ; 
              J<='0'; K<='1';  wait for 10 ns ;
              J<='1'; K<='0' ;  wait for 10 ns ;
              J<='1'; K<='1';  wait for 10 ns ;
              done <= true;
			wait ;
        end process;
end Behavioral ;
