library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity Bram_dual_port is 
	port (
     	CLK : in  STD_LOGIC;
        WE_A   : in  STD_LOGIC;
        addr_A : in  STD_LOGIC_VECTOR(3 downto 0);
        din_A  : in  STD_LOGIC_VECTOR(7 downto 0);
        dout_A : out STD_LOGIC_VECTOR(7 downto 0);

        WE_B   : in  STD_LOGIC;
        addr_B : in  STD_LOGIC_VECTOR(3 downto 0);
        din_B  : in  STD_LOGIC_VECTOR(7 downto 0);
        dout_B : out STD_LOGIC_VECTOR(7 downto 0)
     
        );
    end Bram_dual_port;
architecture Behavioral of Bram_dual_port is 
type Bram_type is array (0 to 15) of STD_LOGIC_VECTOR(7 downto 0);
shared variable  Bram : Bram_type:=(others => "00000000");

begin
   process(CLK)
begin
    if rising_edge(CLK) then
        if WE_A = '1' then
            Bram(to_integer(unsigned(addr_A))) := din_A;
        end if;
        dout_A <= Bram(to_integer(unsigned(addr_A)));
        
        if WE_B = '1' then
            Bram(to_integer(unsigned(addr_B))) := din_B;
        end if;
        dout_B <= Bram(to_integer(unsigned(addr_B)));
    end if;
end process ;
end Behavioral;
        
