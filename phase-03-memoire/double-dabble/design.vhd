library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

	entity DOUBLE_DABLE is 
    port (
    	CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        Start:in STD_LOGIC;
 		input: in STD_LOGIC_VECTOR( 7 downto 0);
        Resultat : out STD_LOGIC_VECTOR( 19 downto 0)
       );
    end DOUBLE_DABLE;
architecture Behavioral of DOUBLE_DABLE is
signal count : integer range 0 to 8 ;
type state_type is (IDLE, LOAD,COMPUTE, DONE );
signal state : state_type ;
begin 
	process(CLK)
    variable uni: unsigned(3 downto 0):=(others=>'0');
    variable diz: unsigned(3 downto 0):=(others=>'0');
    variable cent: unsigned(3 downto 0):=(others=>'0');
    variable source: unsigned(7 downto 0):=( others=>'0');
    variable BCD: unsigned(19 downto 0);
    begin 
    if rising_edge(CLK) then 
    	if RST='1' then 
        	source := (others=>'0');
            uni := (others=>'0');
            diz :=(others=>'0');
            cent :=(others=>'0');
            state <=IDLE ;
            count<= 0;
            
        else
        case(state) is 
        	when IDLE =>
            	if start='1' then 
                	state<= LOAD ;
                    
                 end if ;
            when LOAD => 
            	uni := (others=>'0');
            	diz :=(others=>'0');
            	cent :=(others=>'0');
                source:= unsigned(input) ;
            	count<= 0;
                state<= COMPUTE; 
            when COMPUTE =>
            	if count < 8 then 
            		if uni >= 5 then 
                		uni := uni+3;
                    end if;
                   
                    if diz >= 5 then 
                		diz := diz + 3;
                    end if;
                    if cent >= "0101" then 
                		cent := cent +3 ;
                    end if ;
                      BCD := cent & diz & uni & source;
                      BCD := BCD(18 downto 0) & '0';    
                      cent   := BCD(19 downto 16);       
                      diz    := BCD(15 downto 12);
                      uni    := BCD(11 downto 8);
                      source := BCD(7 downto 0);
                      count<= count+ 1;
                      
                elsif count = 8 then 
                    state <=DONE;
                end if ;
            when DONE =>
            	resultat<= std_logic_vector(BCD);
                if start='1' then 
                	state <=LOAD ;
                end if ;
            end case ;
         end if ;
      end if;
    end process;
end Behavioral ;

            
            	
            
