library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity tb_Bram_dual_port is 
end tb_Bram_dual_port ;
architecture Behavioral of tb_Bram_dual_port is 
component Bram_dual_port 
	port (
		CLK  : in  STD_LOGIC;
        WE_A   : in  STD_LOGIC;
        addr_A : in  STD_LOGIC_VECTOR(3 downto 0);
        din_A  : in  STD_LOGIC_VECTOR(7 downto 0);
        dout_A : out STD_LOGIC_VECTOR(7 downto 0);

        WE_B   : in  STD_LOGIC;
        addr_B : in  STD_LOGIC_VECTOR(3 downto 0);
        din_B  : in  STD_LOGIC_VECTOR(7 downto 0);
        dout_B : out STD_LOGIC_VECTOR(7 downto 0)
     
        );
    end component;
	signal CLK: STD_LOGIC:='0';
    signal WE_A: STD_LOGIC:='0';
    signal addr_A: STD_LOGIC_VECTOR(3 downto 0):="0000";
    signal din_A: STD_LOGIC_VECTOR(7 downto 0):="00000000";
    signal dout_A:STD_LOGIC_VECTOR(7 downto 0);
    
    signal WE_B: STD_LOGIC:='0';
    signal addr_B: STD_LOGIC_VECTOR(3 downto 0):="0000";
    signal din_B: STD_LOGIC_VECTOR(7 downto 0):="00000000";
    signal dout_B:STD_LOGIC_VECTOR(7 downto 0);
    signal done : boolean := false ;
begin 
	uut: Bram_dual_port port map (
    CLK=>CLK,
    WE_A=>WE_A,
    din_A=>din_A,
    dout_A=>dout_A,
    addr_A=>addr_A,
    
    WE_B=>WE_B,
    din_B=>din_B,
    dout_B=>dout_B,
    addr_B=>addr_B
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
        WE_A<= '1'; WE_B<= '1'; addr_A <="1010"; din_A<="00011101"; addr_B<="0111" ; din_B<="11111111";wait for 10 ns;
        
        WE_A<='1' ;WE_B<='1'; addr_A<="0101" ; din_A<="11100111"; addr_B<="0101" ; din_B<="01100111";wait for 10 ns;
        
        WE_A<='0' ;WE_B<='0' ; wait for 10 ns ;
        WE_A<='0' ;wait for 10 ns ;
        WE_A<='0' ;wait for 20 ns ;
       done <= true ;
       wait ;
     end process;
end Behavioral;
