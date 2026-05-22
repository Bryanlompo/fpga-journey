library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity Sequence_detector   is
	port (
    	CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        Input: in STD_LOGIC;
        Output: out STD_LOGIC
        );
    end Sequence_detector; 
architecture behavioral of  Sequence_detector is
	type state_type is (S0, S1, S2, S3);
    signal state : state_type;
    signal flag : STD_LOGIC ;
    begin 
    process(CLK)
    begin 
    	if rising_edge(CLK) then 
        	if RST='1' then 
            	
                flag <='0';
            else
            	flag <='0';
                
            	case(state) is 
                	when S0 =>
                    	if Input ='1' then
                        	State<=S1;
                       
                        else
                        	state<=S0;
                           
                         end if ;	 
                    when S1 =>
                    	if Input='0' then 
                        	state<=S2;
                            
                        else 
                        	state<=S1;
                         end if ;    
                    when S2 =>
                    	if Input='1' then 
                        	state<=S3;
                        else 
                        	state<=S0;
                         end if ;
                    when S3 =>
                    	if Input='1' then 
                        	flag<= '1'  ; 
                            state <= S1;
                        else state<=S2;
                        end if ;
                    end case ;
               end if ;
          end if ;
      end process;
      Output<= flag;
end Behavioral ;
