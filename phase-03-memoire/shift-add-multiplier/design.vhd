library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity Shift_add_multiplier is 
	port (
     	CLK : in  STD_LOGIC;
        START : in STD_LOGIC;
        RST : in STD_LOGIC;
        A  : in  STD_LOGIC_VECTOR(7 downto 0);
        B : in  STD_LOGIC_VECTOR(7 downto 0);
        Done : out STD_LOGIC ;
        Resultat : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end Shift_add_multiplier;
architecture Behavioral of Shift_add_multiplier is 
signal A_shift : STD_LOGIC_VECTOR( 15 downto 0):=(others =>'0');
signal B_shift: STD_LOGIC_VECTOR(7 downto 0):=(others =>'0') ;
signal P : STD_LOGIC_VECTOR(15 downto 0):=(others =>'0');
signal count : integer range 0 to 8 := 0;
begin
	process(CLK) 
    begin 
    	if rising_edge(CLK) then
            	if RST ='1' then 
                	P <= (others =>'0'); count<= 0;
                    A_shift<=(others =>'0');
                    B_shift<=(others =>'0');
                 end if;
                 
                 if START='1' then 
                 	A_shift<="00000000" & A;
                    B_shift<=B;
                    P<= (others =>'0');
                    count<= 0;
					done <='0';
                  elsif count < 8 then 
                        if B_shift(0) ='1' then 
                            P <= std_logic_vector(unsigned(P) + unsigned(A_shift));
                        end if ;
                         A_shift <= A_shift(14 downto 0) & '0';
                         B_shift<='0' & B_shift(7 downto 1);
                         count <= count +1 ;
                            
                  elsif count= 8 then
                       done <= '1';
                       Resultat<= P;
                  end if;
                        
         end if;  
              
    end process;
end Behavioral;

                
            	
            
