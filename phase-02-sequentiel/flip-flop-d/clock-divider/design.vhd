library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity clock_div is
	port (
    	CLK: in STD_LOGIC;
    	RST: in STD_LOGIC;
        EN: in STD_LOGIC;
        S_CLK: out STD_LOGIC
        
        );
     end clock_div;
architecture Behavioral of clock_div is 
	SIGNAL sclk: STD_LOGIC;
    SIGNAL Counter: STD_LOGIC_VECTOR(2 downto 0);
    
begin
	process(CLK)
    begin
    	if rising_edge(CLK) then 
        	if RST='1' then 
            	sclk<='0';Counter<="000";
            elsif EN='1' then
            	if Counter="011" then 
                	sclk<=not sclk;
                    counter<="000";
                else Counter<= Counter+1;
                end if ;
            end if ;
        end if ;
     end process;
     S_CLK<=sclk;
end Behavioral ;

         
             
