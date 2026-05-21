library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity SIPO_8bits is
	port(
    	CLK: in STD_LOGIC;
        RST: in STD_LOGIC;
        EN: in STD_LOGIC;
        DIR: in STD_LOGIC;  
    	Number: in STD_LOGIC;
        Output : out STD_LOGIC_VECTOR(7 downto 0)
        
    );
end SIPO_8bits;
architecture Behavioral of SIPO_8bits is 
	signal A:  STD_LOGIC_VECTOR(7 downto 0);
  	signal dirt:STD_LOGIC_VECTOR(1 downto 0);
    
begin
	dirt<= EN & DIR;
	process(CLK)
    begin
    	if rising_edge(CLK) then 
        	if RST='1' then
            	A<="00000000"; 
            elsif dirt="10" then 
            	A<=A(6 downto 0) & Number  ;
            elsif dirt="11" then  
            	A<= Number & A(7 downto 1) ;
            end if ;
        end if ;
   end process;
   Output<= A;
end Behavioral;

        
