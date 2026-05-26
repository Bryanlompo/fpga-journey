library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity tb_RAM_16x8 is 
end tb_RAM_16x8;
architecture Behavioral of tb_RAM_16x8 is 
	component RAM_16x8
	port(
    		CLK: in STD_LOGIC;
            WE: in STD_LOGIC;
            addr: in STD_LOGIC_VECTOR( 3 downto 0);
            data_in : in STD_LOGIC_VECTOR(7 downto 0);
            data_out : out STD_LOGIC_VECTOR( 7 downto 0)
            
        ); 
	end component ;
 	signal CLK: STD_LOGIC:='0';
    signal WE: STD_LOGIC:='0';
    signal addr: STD_LOGIC_VECTOR(3 downto 0):="0000";
    signal data_in: STD_LOGIC_VECTOR(7 downto 0):="00000000";
    signal data_out:STD_LOGIC_VECTOR(7 downto 0);
    signal done : boolean := false ;
begin 
	uut: RAM_16x8 port map (
    CLK=>CLK,
    WE=>WE,
    data_in=>data_in,
    data_out=>data_out,
    addr=>addr
    	);
    
    clk_process: process 
    begin 
    	while not done loop 
        	CLK<='0'; wait for 5 ns ;
            CLK<='1'; wait for 5 ns ;
            end loop;
            wait ;
         end process;
     	process
        begin 
        WE<= '1'; addr <="1010"; data_in<="00011101"; wait for 10 ns;
        WE<='0' ; addr<="0111" ; wait for 10 ns;
        WE<='0' ; addr<="1010" ; wait for 10 ns ;
        WE<='1' ; addr <="1010"; data_in <="11111111";wait for 10 ns ;
        
       WE<='0'; addr <="1010"; wait for 10 ns ;
       done <= true ;
       wait ;
     end process;
end Behavioral;
      
    
