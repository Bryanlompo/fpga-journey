library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity tb_debouncer is
end tb_debouncer;
architecture Behavioral of tb_debouncer is 
	component debouncer
	port (
   		CLK: in STD_LOGIC;
    	RST: in STD_LOGIC;
        input: in STD_LOGIC;
        Output: out STD_LOGIC
        );
     end component;
     signal CLK: STD_LOGIC:='0';
     signal RST: STD_LOGIC:='0';
     signal input: STD_LOGIC:='0';
     signal Output: STD_LOGIC;
     signal done : boolean := false;
begin 
	uut : debouncer port map (
    	CLK=>CLK,
        RST=>RST,
        input=>input,
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
        -- rebond doit etre ignore 
        RST<='0'; input<='1'; wait for 10 ns ;
        input<='1';wait for 10 ns ;
        input<='1';wait for 10 ns ;
        input<='1';wait for 10 ns ;
        input<='0';wait for 10 ns ;
        input<='0';wait for 10 ns ;
        input<='1';wait for 10 ns ;
        input<='0';wait for 10 ns ;
        input<='0';wait for 10 ns ;
        --rebon doit etre accepte 
        input<='1';wait for 90 ns ;
        done <= true ;
        wait;
    end process;
end Behavioral ;
        
