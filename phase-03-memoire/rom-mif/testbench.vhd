library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use STD.TEXTIO.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;
entity tb_ROM_MIF is 
end  tb_ROM_MIF ;
architecture Behavioral of tb_ROM_MIF is
component ROM_MIF 
	port (
    	CLK: in STD_LOGIC;
        addr: in STD_LOGIC_VECTOR(3 downto 0);
        data_out : out STD_LOGIC_VECTOR(7 downto 0)
    );
    end component;
	signal CLK: STD_LOGIC:='0';
    signal addr : STD_LOGIC_VECTOR( 3 downto 0):="0000";
    signal data_out: STD_LOGIC_VECTOR( 7 downto 0);
    signal done : boolean := false ;
begin 
	uut: ROM_MIF port map (
    	CLK=> CLK,
        addr=> addr,
        data_out => data_out 
    );
    clk_process: process 
    begin
    	while not done loop
        	CLK<='1'; wait for 5 ns ;
            CLK<='0'; wait for 5 ns ;
        end loop ;
        wait ;
    end process;
    process 
    begin 
    	addr<="0000"; wait for 10 ns ;
        addr<="0001"; wait for 10 ns ;
        addr<="1111"; wait for 10 ns ;
    	done <= true ;
        wait ;
    end process;
end Behavioral ;
