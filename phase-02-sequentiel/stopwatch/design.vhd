library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity stopwatch  is
	port (
    	CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        EN: in STD_LOGIC;
        seg_min_diz  : out STD_LOGIC_VECTOR(6 downto 0);
        seg_min_uni  : out STD_LOGIC_VECTOR(6 downto 0);
        seg_sec_diz  : out STD_LOGIC_VECTOR(6 downto 0);
        seg_sec_uni  : out STD_LOGIC_VECTOR(6 downto 0)
        );
    end  stopwatch ; 
architecture behavioral of  stopwatch is
	component clock_div 
    port (
    	CLK: in STD_LOGIC;
    	RST: in STD_LOGIC;
        EN: in STD_LOGIC;
        S_CLK: out STD_LOGIC
        
        );
     end component;
     
     
     component decodeur_7_segment  
		port (
    	DIGIT: in STD_LOGIC_VECTOR(3 downto 0);
    	SEG : out STD_LOGIC_VECTOR( 6 downto 0)
    	); 
	  end component;
     

    signal clk_1hz  : STD_LOGIC;
    signal sec_uni  : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal sec_diz  : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal min_uni  : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal min_diz  : STD_LOGIC_VECTOR(3 downto 0) := "0000";   
     
begin 
	div: clock_div port map (
    S_CLk => clk_1hz,
    RST=> RST,
    EN=> EN,
    CLK=>CLK
        );
      
    Dec_sec_uni : decodeur_7_segment port map (
    DIGIT => sec_uni,
    SEG => seg_sec_uni
        );
    
    Dec_sec_diz : decodeur_7_segment port map (
    DIGIT => sec_diz,
    SEG => seg_sec_diz
        );
        
     Dec_min_uni : decodeur_7_segment port map (
    DIGIT => min_uni,
    SEG => seg_min_uni
        );
        
     Dec_min_diz : decodeur_7_segment port map (
    DIGIT => min_diz,
    SEG => seg_min_diz
        );
        
        
    process(clk_1hz)
    begin 
    	if rising_edge(clk_1hz) then 
        	if RST='1' then 
            	  min_diz<="0000"; 
                  min_uni<="0000";  
                  sec_diz<="0000";   
                  sec_uni<="0000";
             elsif EN = '1' then
                if sec_uni = "1001" then           
                    sec_uni <= "0000";
                    if sec_diz = "0101" then       
                        sec_diz <= "0000";
                        if min_uni = "1001" then   
                            min_uni <= "0000";
                            if min_diz = "0101" then  
                                min_diz <= "0000";
                            else
                                min_diz <= min_diz + 1;
                            end if;
                        else
                            min_uni <= min_uni + 1;
                        end if;
                    else
                        sec_diz <= sec_diz + 1;
                    end if;
                else
                    sec_uni <= sec_uni + 1;    
                end if;
            end if;
         end if;
    end process;
end Behavioral;

          
             	
            
