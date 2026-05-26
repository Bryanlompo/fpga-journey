library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity Bram_single_port is 
	port (
    	CLK: in STD_LOGIC;
        data_in: in STD_LOGIC_VECTOR(7 downto 0);
        addr: in STD_LOGIC_VECTOR(3 downto 0);
        WE: in STD_LOGIC;
        data_out: out STD_LOGIC_VECTOR(7 downto 0)
     
        );
    end Bram_single_port;
architecture Behavioral of Bram_single_port is 
type Bram_type is array (0 to 15) of STD_LOGIC_VECTOR(7 downto 0);
signal Bram : Bram_type;

begin
	process(CLK)
    begin
    if rising_edge(CLK) then 
    	if WE ='1' then 
        	Bram(to_integer(unsigned(addr))) <= data_in;
            
        end if ;
        data_out <=Bram(to_integer(unsigned(addr)));
    end if;
	end process;
end Behavioral;
        
