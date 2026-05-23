library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity RAM_16x8 is 
	port(
    		CLK: in STD_LOGIC;
            WE: in STD_LOGIC;
            addr: in STD_LOGIC_VECTOR( 3 downto 0);
            data_in : in STD_LOGIC_VECTOR(7 downto 0);
            data_out : out STD_LOGIC_VECTOR( 7 downto 0)       
        ); 
     end RAM_16x8;
architecture Behavioral of RAM_16x8 is 
    type ram_type is array (0 to 15) of STD_LOGIC_VECTOR(7 downto 0);
	signal ram : ram_type:= (others => "00000000");
begin 
	process(CLK)
    begin 
    	if rising_edge(CLK) then 
        	if WE='1' then
        		ram(to_integer(unsigned(addr)))<= data_in;
            else data_out <= ram(to_integer(unsigned(addr)));
            end if ;
        end if ;
    end process;
end Behavioral ;

