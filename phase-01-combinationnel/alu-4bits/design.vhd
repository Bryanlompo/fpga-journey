library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity ALU_4bits is
	port(
    	A: in STD_LOGIC_VECTOR( 3 downto 0);
        B: in STD_LOGIC_VECTOR( 3 downto 0);
        OP: in STD_LOGIC_VECTOR( 2 downto 0);
        Y: out STD_LOGIC_VECTOR( 3 downto 0);
        ZERO : out STD_LOGIC
    );
end ALU_4bits;

        
architecture Behavioral of ALU_4bits is 
	signal Result:STD_LOGIC_VECTOR(3 downto 0);
begin
	process(A,B,OP)
    begin 
    	case OP is
        	when "000" =>Result<= A + B; --add
            when "001" =>Result<= A - B; --sub
            when "010" =>Result<= A and B; --and 
            when "011" =>Result<= A or B; --or 
            when "100" =>Result<= A xor B;--xor
            when "101" =>Result<= not A; --not 
            when "110" =>Result<= A(2 downto 0) & '0'; --shl
            when "111" =>Result<= '0'& A(3 downto 1); --shr
            when others =>Result<= "0000";
        end case ;
     end process ;
     Y<= Result;
     ZERO <= '1' when Result = "0000" else '0'; --FLAG ZERO 	
end behavioral; 
            
