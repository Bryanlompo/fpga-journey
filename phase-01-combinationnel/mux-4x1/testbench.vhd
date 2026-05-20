library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity tb_mux_4x1 is 
end tb_mux_4x1;
architecture Behavioral of tb_mux_4x1 is 
	component mux_4x1
    	port(
    	A: in STD_LOGIC;
        B: in STD_LOGIC;
        C: in STD_LOGIC;
        D: in STD_LOGIC;
        S: in STD_LOGIC_VECTOR(1 downto 0);
        Y: out STD_LOGIC
        );
	end component ;
        signal A: STD_LOGIC:='0';
        signal B: STD_LOGIC:='0';
        signal C: STD_LOGIC:='0';
        signal D: STD_LOGIC:='0';
        signal S: STD_LOGIC_VECTOR(1 downto 0):="00";
        signal Y: STD_LOGIC;
begin 
	uut: mux_4x1 port map(
    	A=>A,
        B=>B,
        C=>C,
        D=>D,
        S=>S,
        Y=>Y
        );
	process
    begin 
    	A<='1'; B<='0';C<='1';D<='0'; S<="00"; wait for 10 ns;
        A<='1'; B<='0';C<='1';D<='0'; S<="01"; wait for 10 ns ;
        A<='1'; B<='0';C<='1';D<='0'; S<="10"; wait for 10 ns ;
        A<='1'; B<='0';C<='1';D<='0'; S<="11"; wait for 10 ns ;
        wait ;
    end process; 
end Behavioral;
        
        
