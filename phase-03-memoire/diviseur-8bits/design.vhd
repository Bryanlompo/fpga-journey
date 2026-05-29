library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

	entity diviseur_8bits is 
    port (
    	CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        Start : in STD_LOGIC;
    	Dividende : in STD_LOGIC_VECTOR(7 downto 0);
        Diviseur : in STD_LOGIC_VECTOR(7 downto 0) ;
        Resultat : out STD_LOGIC_VECTOR( 7 downto 0)
       
        );
 	end diviseur_8bits ;

architecture Behavioral of diviseur_8bits is 

	signal accumulateur : STD_LOGIC_VECTOR(8 downto 0):=(others =>'0');
    signal quotient : STD_LOGIC_VECTOR( 7 downto 0):=(others =>'0');
    signal A : STD_LOGIC_VECTOR( 7 downto 0):=(others =>'0');
    signal B : STD_LOGIC_VECTOR( 7 downto 0):=(others =>'0');
    signal count : integer range 0 to 8 :=0;
    type state_type is (IDLE, LOAD, COMPUTE, DONE);
	signal state : state_type;
    
begin 
	process(CLK) 
    variable v_acc : unsigned(8 downto 0);
	variable v_diff : unsigned(8 downto 0);

    	begin
        	if rising_edge(CLK) then 
            	 if RST='1' then 
                 	quotient <=(others =>'0');
                    accumulateur <=(others =>'0');
                    count <= 0;
                    state<=IDLE;
                else 
                 case(state) is 
                 when IDLE =>
                 	if Start = '1' then 
                    	state<= LOAD ;
                    end if ;
                    
                 when LOAD =>
                 		count<= 0;
                 		A<= dividende; B<= diviseur;
                 		accumulateur <= (others =>'0');
                        state <= COMPUTE ;
                
                 when COMPUTE =>
     					v_acc := unsigned( accumulateur(7 downto 0) & A(7));
						v_diff := v_acc - unsigned('0' & B);
                    	A<= A(6 downto 0) & '0';
                 	if count < 8 then 
                    	if v_diff(8) ='1' then 
                        	quotient <= quotient(6 downto 0) & '0';
                            accumulateur<= std_logic_vector( v_acc);
                         else 
                         	quotient<= quotient(6 downto 0) & '1';
                            accumulateur<= std_logic_vector(v_diff);
                        end if;
                        count <= count +1 ;
                  	elsif count =8 then
                 		state<= DONE ;
                    	
                   end if;
                when DONE =>
                Resultat<=quotient ;
                if Start ='1' then 
                	state<= LOAD;
             	end if ;
            end case ;
        end if ;
        end if;
    end process;
end Behavioral ;
                            
                    
