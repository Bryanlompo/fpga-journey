library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity tb_Sequence_detector   is
end tb_Sequence_detector;
architecture behavioral of tb_Sequence_detector is
	component Sequence_detector 
    port(
    	CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        Input: in STD_LOGIC;
        Output: out STD_LOGIC
        );
    end component; 
     signal CLK: STD_LOGIC:='0';
     signal RST :STD_LOGIC:='0';
     signal Input:STD_LOGIC:='0';
     signal Output:STD_LOGIC;
     signal done : boolean :=false ;

begin 
	uut : Sequence_detector port map (
    	CLK=>CLK,
        RST=>RST,
        Input=>Input,
        Output=>Output 
        );
	clk_process: process 
    begin
    	while not done loop 
          CLK<='0'; 	wait for 5 ns ;
          CLK<='1'; 	wait for 5 ns ;
        end loop;
        wait ;
       end process;
       process 
       begin 
			RST<='1'; wait for 10 ns ;
            RST<='0'; Input <= '1'; wait for 10 ns;
            Input <= '1'; wait for 10 ns;
            Input <= '0'; wait for 10 ns;
            Input <= '1'; wait for 10 ns;
            Input <= '1'; wait for 10 ns;
            Input <= '0'; wait for 10 ns;
            Input <= '1'; wait for 10 ns;
            Input <= '1'; wait for 10 ns;
            done <= true;
            wait;
       end process;
end Behavioral ;

                 
      
