library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;
entity FIFO_8bits is 
	port (
    	CLK: in STD_LOGIC;
        RST: in STD_LOGIC;
        WE_EN: in STD_LOGIC;
        RD_EN: in STD_LOGIC;
        data_in:in STD_LOGIC_VECTOR( 7 downto 0);
        data_out: out STD_LOGIC_VECTOR(7 downto 0);
        full: out STD_LOGIC;
        empty: out STD_LOGIC
    );
    end FIFO_8bits ;
architecture Behavioral of FIFO_8bits  is 
type FIFO_type is array (0 to 7) of STD_LOGIC_VECTOR( 7 downto 0);
signal FIFO : FIFO_type;
signal read_ptr: UNSIGNED(2 downto 0):="000";
signal write_ptr: UNSIGNED(2 downto 0):="000";
signal full_int  : STD_LOGIC := '0';
signal empty_int : STD_LOGIC := '1';
begin 
	process(CLK)
    	begin 
        if rising_edge(CLK) then 
        	if RST = '1' then
                write_ptr <= "000";
                read_ptr  <= "000";
                full_int  <= '0';
                empty_int <= '1';
            end if;
        	if WE_EN='1' and full_int='0' then 
            	FIFO(to_integer(unsigned(write_ptr)))<=data_in;
                write_ptr <= write_ptr + 1; 
                if write_ptr +1 =read_ptr then 
                	full_int<='1';
                    empty_int<='0';
                end if ;
            end if ;
                    
            if RD_EN='1' and empty_int ='0' then 
            	data_out<= FIFO(to_integer(unsigned(read_ptr)));
                read_ptr<= read_ptr+1;
                if read_ptr+1=write_ptr then 
                	empty_int<='1'; 
                    full_int<='0';
                end if;
            end if ;
             
         end if ;
     end process;
     full  <= full_int;
	 empty <= empty_int;
end Behavioral ;

                
        	
        
    
    
