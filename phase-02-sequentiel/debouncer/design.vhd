library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity debouncer is
	port (
    	CLK: in STD_LOGIC;
    	RST: in STD_LOGIC;
        input: in STD_LOGIC;
        Output: out STD_LOGIC
        
        );
     end debouncer;
architecture Behavioral of debouncer is 
	signal counter : STD_LOGIC_VECTOR(2 downto 0);
    signal outt: STD_LOGIC;
begin
	process(CLK)
     begin
    	if rising_edge(CLK) then 
        	if RST='1' then 
            	outt<='0';counter<="000";
             elsif input=  outt then
             	counter<="000";
             else 
             	counter <= counter +1;
                if counter= "111" then
                	outt<= input;
                    counter<="000";
                 end if ;
             end if ;
         end if ;
     end process;
     Output<=outt;
end Behavioral;
