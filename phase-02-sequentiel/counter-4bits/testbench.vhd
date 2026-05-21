library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity tb_Counter_4bits is 
end tb_Counter_4bits;
architecture Behavioral of tb_Counter_4bits is 
	component Counter_4bits
        port (
            CLK: in STD_LOGIC;
            RST: in STD_LOGIC;
            EN: in STD_LOGIC;
            UP_DOWN: in STD_LOGIC;
            Count: out STD_LOGIC_VECTOR(3 downto 0)
            );
         end component;
		SIGNAL CLK: STD_LOGIC:='0';
        SIGNAL RST: STD_LOGIC:='0';
        SIGNAL EN: STD_LOGIC:='0';
        SIGNAL UP_DOWN: STD_LOGIC:='0';
        SIGNAL Count: STD_LOGIC_VECTOR(3 downto 0);
        SIGNAL done : boolean:= false;
begin 
	uut: Counter_4bits port map (
    	CLK=>CLK,
        RST=>RST,
        EN=>EN,
        UP_DOWN=>UP_DOWN,
        Count=>Count
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
                RST<='1';wait for 10 ns ; 
                RST<='0'; EN<='1'; UP_DOWN<='0'; wait for 200 ns ;  
                UP_DOWN<='1';wait for 200 ns ;
                EN<='0'; wait for 20 ns ;
                done <= true ;
                wait ;
        end process;
end Behavioral ;

