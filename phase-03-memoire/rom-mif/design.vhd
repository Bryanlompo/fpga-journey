library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use STD.TEXTIO.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL; 
entity ROM_MIF is 
	port (
    	CLK: in STD_LOGIC;
        addr: in STD_LOGIC_VECTOR(3 downto 0);
        data_out: out STD_LOGIC_VECTOR(7 downto 0)
        
    );
end ROM_MIF;
architecture Behavioral of ROM_MIF is 

type  ROM_TYPE is array (0 to 15) of STD_LOGIC_VECTOR(7 downto 0);

impure function load_rom (filename: string) return ROM_TYPE is 

file f: text open read_mode is filename ;
variable l: line ;
variable result : ROM_type := (others => "00000000");
variable data: STD_LOGIC_VECTOR( 7 downto 0);
variable add: integer:=0;
begin 
	while not endfile(f) and add < 16 loop
    	readline(f,l);
        read(l,data);
        result(add):=data;
        add:=add+1;
    end loop;
    return result ;
    end function;
signal ROM : ROM_type := load_rom("rom_init.txt");
 
begin
    process(CLK)
    begin
        if rising_edge(CLK) then
            data_out <= ROM(to_integer(unsigned(addr)));
        end if;
    end process;
end Behavioral;
