library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity tb_traffic_light_fsm is
end tb_traffic_light_fsm ;
architecture behavioral of  tb_traffic_light_fsm is 
	component traffic_light_fsm 
	port (
    	CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        VERT: out STD_LOGIC;
        JAUNE:out STD_LOGIC;
        ROUGE:out STD_LOGIC
        );
    end component ;
    signal CLK: STD_LOGIC:='0';
    signal RST :STD_LOGIC:='0';
    signal VERT:STD_LOGIC;
    signal JAUNE:STD_LOGIC;
    signal ROUGE:STD_LOGIC;
    signal done : boolean :=false ;
begin 	
	uut: traffic_light_fsm port map (
    CLK =>CLK,
    RST=>RST,
    VERT=>VERT,
    JAUNE=>JAUNE,
    ROUGE=>ROUGE
    );
    clk_process : process
    	begin
    	while not done loop 
        	CLK<='0'; wait for 5 ns ;
            CLK<='1'; wait for 5 ns ;
       end loop;
       wait ;
       end process;
       process 
       	begin 
        	RST<='1'; wait for 10 ns ;
            RST<='0'; wait for 800 ns;
            done <= true ;
            wait ;
        end process;
end Behavioral;
            			
    
