library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity traffic_light_fsm  is
	port (
    	CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        VERT: out STD_LOGIC;
        JAUNE:out STD_LOGIC;
        ROUGE:out STD_LOGIC
        );
    end traffic_light_fsm; 
architecture behavioral of  traffic_light_fsm is 
	type state_type is (S_VERT, S_JAUNE, S_ROUGE);
    signal counter  : STD_LOGIC_VECTOR(3 downto 0);
    signal state : state_type ;
begin 
	process (CLK)
    begin 
    	if rising_edge(CLK) then 
        	if RST ='1' then 
            	state<=S_VERT;
            	counter<= "0000"; 
            else
            	case state is 
                	when S_VERT =>
                    	if counter ="1111" then 
                        state<= S_JAUNE;
                        	counter <="0000";
                        else counter <= counter +1;
                        end if ; 
                    when S_JAUNE =>
                    	if counter ="0101" then 
                        state<= S_ROUGE;
                        	counter <="0000";
                         else counter <= counter +1;
                         end if ; 
                    when S_ROUGE =>
                    	if counter ="1111" then 
                        state<= S_VERT;
                        	counter <="0000";
                         else counter <= counter +1;
                         end if ; 
                    when others => state<= S_VERT;
                 end case ;
             end if;
         end if ; 
    end process;
    
	VERT  <= '1' when state = S_VERT  else '0';
	JAUNE <= '1' when state = S_JAUNE else '0';
	ROUGE <= '1' when state = S_ROUGE else '0';
end Behavioral ;
    	
