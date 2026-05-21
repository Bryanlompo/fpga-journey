library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity Counter_4bits is 
	port (
    	CLK: in STD_LOGIC;
    	RST: in STD_LOGIC;
        EN: in STD_LOGIC;
        UP_DOWN: in STD_LOGIC;
        Count: out STD_LOGIC_VECTOR(3 downto 0)
        );
     end Counter_4bits;
 architecture Behavioral of Counter_4bits is 
 	SIGNAL count_in: STD_LOGIC_VECTOR(3 downto 0);
begin 
	process(CLK)
    	begin
        	if rising_edge(CLK) then 
            	if RST='1' then 
                	Count_in<="0000";
                elsif EN='1' then
                
            		case UP_DOWN is 
                      when '0' =>Count_in<=Count_in +1;
                      when '1' =>Count_in<=Count_in -1;
                      when others =>count_in<= Count_in;
                   end case ;
                end if ;
            end if ;
     end process;
     Count<=Count_in;
     
end Behavioral;
