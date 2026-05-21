library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity tb_clock_div is
end tb_clock_div;
architecture Behavioral of tb_clock_div is 
	component clock_div
	port (
    	CLK: in STD_LOGIC;
    	RST: in STD_LOGIC;
        EN: in STD_LOGIC;
        S_CLK: out STD_LOGIC
        
        );
     end component ;

	SIGNAL CLK: STD_LOGIC:='0';
    SIGNAL RST: STD_LOGIC:='0';
    SIGNAL EN: STD_LOGIC:='0';
    SIGNAL S_CLK: STD_LOGIC;
    SIGNAL done : boolean := false ;
begin 
	uut : clock_div port map (
    	CLK=>CLK,
        RST=>RST,
        EN=>EN,
        S_CLK=>S_CLK
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
        RST<='1'; wait for 10 ns ;
        RST<='0'; EN<='1'; wait for 800 ns ;
        done<= true ;
        wait ;
     end process;
end Behavioral ;
       
