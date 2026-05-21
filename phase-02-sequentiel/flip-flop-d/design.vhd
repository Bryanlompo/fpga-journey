library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity flip_flop_d is 
	port (
    	D: in STD_LOGIC;
        CLK: in STD_LOGIC;
        RST : in STD_LOGIC;
        Q: out STD_LOGIC
        );
end flip_flop_d ;
architecture Behavioral of flip_flop_d is 
	begin
    process(clk)
    begin
    	if rising_edge(CLK) then 
        	if RST='1' then 
        		Q<='0';
            else 
             	Q<=D;
            end if;      
        end if ;
    end process;
end Behavioral; 
