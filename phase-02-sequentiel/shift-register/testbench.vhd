library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity tb_SIPO_8bits is
end tb_SIPO_8bits ;
architecture Behavioral of tb_SIPO_8bits is
	component SIPO_8bits
	port(
    	CLK: in STD_LOGIC;
        RST: in STD_LOGIC;
        EN: in STD_LOGIC;
        DIR: in STD_LOGIC; 
    	Number: in STD_LOGIC;
        Output : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;
	signal Output:  STD_LOGIC_VECTOR(7 downto 0);
    signal CLK:  STD_LOGIC:='0';
    signal RST:  STD_LOGIC:='0';
    signal EN:  STD_LOGIC:='0';
    signal Number:  STD_LOGIC:='0';
    signal DIR:  STD_LOGIC:='0';
    signal done : boolean := false ;
begin 
	uut: SIPO_8bits port map (
    	CLK=>CLK,
        RST=>RST,
        EN=>EN,
        DIR=>DIR,
        Number=>Number,
        Output=>Output
    );
   clk_process: process
   	begin 
    	while not done loop
        	CLK<='0'; wait for 5 ns ;
            CLK<='1'; wait for 5 ns ;
        end loop;
        wait;
    end process;
    process 
    	begin
        	 RST<='1'; wait for 10 ns ;
             RST<='0'; EN<='1';DIR<='0'; wait for 10 ns ;
             Number<='1'; wait for 10 ns;
             Number<='0'; wait for 10 ns;
             Number<='1'; wait for 10 ns;
             Number<='1'; wait for 10 ns;
             Number<='0'; wait for 10 ns;
             Number<='0'; wait for 10 ns;
             Number<='1'; wait for 10 ns;
             Number<='0'; wait for 10 ns;
             DIR<='1'; wait for 90 ns ;       
             
            done<= true ;
            wait ;
     end process;
end Behavioral ;
    
        
    
    
