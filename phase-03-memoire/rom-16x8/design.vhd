library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;
entity ROM_16x8 is 
	port (
    	CLK: in STD_LOGIC;
        addr: in STD_LOGIC_VECTOR(3 downto 0);
        data_out : out STD_LOGIC_VECTOR(7 downto 0)
    );
    end ROM_16x8;
architecture Behavioral of ROM_16x8 is
	type ROM_type is array (0 to 15) of STD_LOGIC_VECTOR( 7 downto 0);
    signal ROM :ROM_type:=(
    0=>"00000000",
    1=>"00000001",
    2=>"00000010",
    3=> "11100000",
    others => "00000000"
    ) ;
    
begin
	process(CLK)
    begin
    	if rising_edge(CLK) then 
            data_out<= ROM(to_integer(unsigned(addr)));
        end if ;
     end process;
end Behavioral;
            	
    
