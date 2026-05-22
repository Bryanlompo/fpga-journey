library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity tb_VendingMachine   is
end tb_VendingMachine;
architecture behavioral of tb_VendingMachine is
	component VendingMachine
	port (
    	CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        Coin: in STD_LOGIC_VECTOR(1 downto 0);
        PRODUCT:out STD_LOGIC
        );
    end component ; 

      signal CLK: STD_LOGIC:='0';
      signal RST :STD_LOGIC:='0';
      signal Coin:STD_LOGIC_VECTOR(1 downto 0):="00";
      signal PRODUCT:STD_LOGIC;
      signal done : boolean :=false ;
    
    
begin
	uut: VendingMachine port map (
    	CLK=>CLK,
        RST=>RST,
        Coin=>Coin,
        PRODUCT=>PRODUCT  
        );
    clk_process : process
    	begin
    	while not done loop 
        	CLK<='0'; wait for 5 ns ;
            CLK<='1'; wait for 5 ns ;
       end loop;
       wait ;
       end process;
       process 
       begin 
        	RST<='1'; wait for 10 ns ;
            RST<='0'; Coin <= "01"; wait for 10 ns;  
            Coin <= "00"; wait for 10 ns;  
            Coin <= "01"; wait for 10 ns;
            Coin <= "11"; wait for 10 ns;
            Coin <= "01"; wait for 10 ns;  
            Coin <= "00"; wait for 10 ns;
            Coin <= "01"; wait for 10 ns; 
            Coin <= "00"; wait for 10 ns;
            Coin <= "01"; wait for 10 ns;  
            Coin <= "00"; wait for 10 ns;
            done <= true ;
            wait ;
        end process;
end Behavioral;
