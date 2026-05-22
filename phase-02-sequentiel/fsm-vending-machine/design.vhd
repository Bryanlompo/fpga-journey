library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity VendingMachine   is
	port (
    	CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        Coin: in STD_LOGIC_VECTOR(1 downto 0);
        PRODUCT:out STD_LOGIC
        );
    end VendingMachine; 
architecture behavioral of  VendingMachine is
	type state_type is (ETAT0, ETAT5, ETAT10, ETAT15);
    signal state : state_type;
    signal giving :STD_LOGIC ;
begin 
	process (CLK)
    begin 
    	if rising_edge(CLK) then 
        	if RST ='1' then 
            	state<=ETAT0;-- 0 cent
                giving<='0';
            else giving <='0';
            	case(state) is 
                	when ETAT0=> -- 0 cent
                    	if coin ="00" then 
                        	state<= state;
                        elsif coin="01" then 
                        	state<=ETAT5;
                        elsif coin="10" then 
                        	state<=ETAT10;
                        else 
                        	state<= state ;
                        end if ;
                        
                    when ETAT5 => -- 5 cents
                    	if coin ="00" then 
                        	state<= state;
                        elsif coin="01" then 
                        	state<=ETAT10;
                        elsif coin="10" then 
                        	state<=ETAT15;
                        else 
                        	state<= state ;
                        end if ;    

                    when ETAT10=> -- 10 cents
                    	if coin ="00" then 
                        	state<= state;
                        elsif coin="01" then 
                            state<=ETAT15;
                            
                        elsif coin="10" then 
                        	state<=ETAT15;
                         else 
                        	state<= state ;
  						 end if ; 
                         
                     when ETAT15=> -- 15 cents ou plus 
                            giving<= '1';
                            state<=ETAT0;      
                     end case ;
                end if ;
            end if ;      
        end process;
        PRODUCT<= giving;
end Behavioral;
                       
