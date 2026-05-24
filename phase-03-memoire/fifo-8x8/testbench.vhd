library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity tb_FIFO_8bits  is 
end tb_FIFO_8bits ;
architecture Behavioral of tb_FIFO_8bits  is 
	component FIFO_8bits 
	port(
    	CLK: in STD_LOGIC;
        RST: in STD_LOGIC;
        WE_EN: in STD_LOGIC;
        RD_EN: in STD_LOGIC;
        data_in:in STD_LOGIC_VECTOR( 7 downto 0);
        data_out: out STD_LOGIC_VECTOR(7 downto 0);
        full: out STD_LOGIC;
        empty: out STD_LOGIC
            
        ); 
	end component ;
 	signal CLK: STD_LOGIC:='0';
    signal RST: STD_LOGIC:='0';
    signal WE_EN:STD_LOGIC:='0';
    signal RD_EN: STD_LOGIC:='0';
    signal data_in: STD_LOGIC_VECTOR( 7 downto 0):="00000000";
    signal data_out: STD_LOGIC_VECTOR(7 downto 0);
    signal full:STD_LOGIC;
    signal empty: STD_LOGIC;
    signal done : boolean := false ;
begin 
	uut: FIFO_8bits  port map (
    CLK=>CLK,
    RST=>RST,
    WE_EN=>WE_EN,
    RD_EN=>RD_EN,
    data_in=>data_in,
    data_out=>data_out,
    full=>full,
    empty=>empty
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
        RST<='1'; wait for 10 ns;
        RST<='0';
        WE_EN<= '1'; data_in <="00011101"; wait for 10 ns;
        WE_EN<='1' ; data_in <="01011010";  wait for 10 ns;
        WE_EN<='1' ; data_in <="01011011";  wait for 10 ns;
        WE_EN<='1' ; data_in <="01011110";  wait for 10 ns;
        WE_EN<='1' ; data_in <="01011010";  wait for 10 ns;
        WE_EN<='1' ; data_in <="01111111";  wait for 10 ns;
        WE_EN<='1' ; data_in <="11011010";  wait for 10 ns;
        WE_EN<='1' ; data_in <="11111111";  wait for 10 ns;
        WE_EN<='1' ; data_in <="01000000";  wait for 10 ns;
        WE_EN<='0';
        RD_EN<='1';wait for 10 ns;
        RD_EN<='1';wait for 10 ns;
        RD_EN<='1';wait for 10 ns;
        RD_EN<='1';wait for 10 ns;
        RD_EN<='1'; wait for 10 ns;
        RD_EN<='1'; wait for 10 ns;
        RD_EN<='1'; wait for 10 ns;
        RD_EN<='1'; wait for 10 ns;
        RD_EN<='1'; wait for 10 ns;
        WE_EN<='1' ; data_in <="01011010";  wait for 10 ns;
        RST<='1';wait for 10 ns;
        done <= true ;
       wait ;
     end process;
end Behavioral;
      
    
