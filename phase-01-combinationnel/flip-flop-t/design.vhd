library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity flip_flop_T is 
	port (
    	T : in STD_LOGIC;
        Q : out STD_LOGIC;
        CLK:in STD_LOGIC;
        RST:in STD_LOGIC
        );
	end flip_flop_T;
architecture Behavioral of flip_flop_T is
	SIGNAL Qint: STD_LOGIC;
begin 
	process(CLK)
    	begin 
        if rising_edge(CLK) then
        	if RST = '1' then 
            	Qint<='0';
            elsif T= '1' then
            	Qint <=  not Qint;
            else Qint <= Qint ;
            end if ;
        end if ;
    end process;
    Q<= Qint ;
end Behavioral;        
   
        	
