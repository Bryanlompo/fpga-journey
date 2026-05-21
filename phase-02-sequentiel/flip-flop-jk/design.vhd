library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity flip_flop_jk is 
	port(
    	J: in STD_LOGIC;
        K: in STD_LOGIC;
        CLK: in STD_LOGIC;
        RST: in STD_LOGIC;
        Q: out STD_LOGIC 
        );
	end flip_flop_jk;        
architecture Behavioral of flip_flop_jk is 
	SIGNAL Qint : STD_LOGIC;
    signal JK : STD_LOGIC_VECTOR(1 downto 0);
begin 
	JK<= J & K;
	process(CLK)
    	begin 
            if rising_edge(CLK) then 
            	if RST='1' then 
                	Qint <='0';
            	else
                	case JK is 
                	  when "00" => Qint <= Qint;
                      when "01" => Qint <= '0';
                      when "10" => Qint <= '1';
                      when "11" => Qint <= not Qint;
                      when others => Qint <= Qint;
                 	end Case ;
                 end if ;
             end if ;
      end process;
     Q<= Qint;
end Behavioral;
    
                
