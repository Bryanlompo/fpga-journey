library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity tb_stopwatch  is
end tb_stopwatch;
architecture behavioral of tb_stopwatch is
	component stopwatch 
	port (
    	CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        EN: in STD_LOGIC;
        seg_min_diz  : out STD_LOGIC_VECTOR(6 downto 0);
        seg_min_uni  : out STD_LOGIC_VECTOR(6 downto 0);
        seg_sec_diz  : out STD_LOGIC_VECTOR(6 downto 0);
        seg_sec_uni  : out STD_LOGIC_VECTOR(6 downto 0)
        );
    end component;
    signal CLK : STD_LOGIC:='0';
    signal RST : STD_LOGIC:='0';
    signal EN: STD_LOGIC:='0';
    signal seg_min_diz  : STD_LOGIC_VECTOR(6 downto 0);
    signal seg_min_uni  : STD_LOGIC_VECTOR(6 downto 0);
    signal seg_sec_diz  : STD_LOGIC_VECTOR(6 downto 0);
    signal seg_sec_uni  : STD_LOGIC_VECTOR(6 downto 0);
 	signal done : boolean := false ;
begin 
	uut: stopwatch port map (
    	CLK=>CLK,
        RST=>RST,
        EN=>EN,
        seg_min_diz=>seg_min_diz,
        seg_min_uni=>seg_min_uni,
        seg_sec_diz=>seg_sec_diz,
        seg_sec_uni=>seg_sec_uni
        
        );
     clk_process:process
     begin 
        	while not done loop
            	CLK<='0'; wait for 5 ns;
                CLK<='1'; wait for 5 ns ;
            end loop;
            wait ;
        end process;
        process
       	begin 
        RST <='1'; wait for 10 ns ;
        RST <= '0'; EN<= '1' ; wait for 1000 ns ;
        done <= true ;
        wait ;
     end process;
end Behavioral;
