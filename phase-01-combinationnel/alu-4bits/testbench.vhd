library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity tb_ALU_4bits is
end tb_ALU_4bits;
architecture Behavioral of tb_ALU_4bits is 
	component ALU_4bits 
    	port (
    		A: in STD_LOGIC_VECTOR( 3 downto 0);
            B: in STD_LOGIC_VECTOR( 3 downto 0);
            OP: in STD_LOGIC_VECTOR( 2 downto 0);
            Y: out STD_LOGIC_VECTOR( 3 downto 0);
            ZERO : out STD_LOGIC
        );
     end component; 
     signal A: STD_LOGIC_VECTOR( 3 downto 0):="0000";
     signal B: STD_LOGIC_VECTOR( 3 downto 0):="0000";
     signal OP:STD_LOGIC_VECTOR( 2 downto 0):="000";
     signal Y: STD_LOGIC_VECTOR( 3 downto 0);
     signal ZERO :  STD_LOGIC;
begin 
	uut: ALU_4bits port map (
    	A=>A,
        B=>B,
        OP=>OP,
        Y=>Y,
        ZERO=>ZERO
        );
	process 
    begin 
    OP<="000"; A<="0101"; B<="0011"; wait for 10 ns ;
    OP<="001"; A<="0101"; B<="0101"; wait for 10 ns ; 
    OP<="010"; A<="1100"; B<="1010"; wait for 10 ns ; 
    OP<="011"; A<="1100"; B<="1010"; wait for 10 ns ; 
    OP<="100"; A<="1100"; B<="1010"; wait for 10 ns ; 
    OP<="101"; A<="0101"; B<="0000"; wait for 10 ns ; 
    OP<="110"; A<="0101"; B<="0000"; wait for 10 ns ; 
    OP<="111"; A<="0101"; B<="0000"; wait for 10 ns ;
    wait ;
    end process;
end Behavioral;
