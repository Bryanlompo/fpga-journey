library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_Shift_add_multiplier is
end tb_Shift_add_multiplier;

architecture Behavioral of tb_Shift_add_multiplier is
    component Shift_add_multiplier
        port (
            CLK      : in  STD_LOGIC;
            START    : in  STD_LOGIC;
            RST      : in  STD_LOGIC;
            A        : in  STD_LOGIC_VECTOR(7 downto 0);
            B        : in  STD_LOGIC_VECTOR(7 downto 0);
            Done     : out STD_LOGIC;
            Resultat : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    signal CLK      : STD_LOGIC := '0';
    signal START    : STD_LOGIC := '0';
    signal RST      : STD_LOGIC := '0';
    signal A        : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal B        : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal Done     : STD_LOGIC;
    signal Resultat : STD_LOGIC_VECTOR(15 downto 0);
    signal done_sim : boolean := false;

begin
    uut : Shift_add_multiplier port map (
        CLK      => CLK,
        START    => START,
        RST      => RST,
        A        => A,
        B        => B,
        Done     => Done,
        Resultat => Resultat
    );

    clk_process : process
    begin
        while not done_sim loop
            CLK <= '0'; wait for 5 ns;
            CLK <= '1'; wait for 5 ns;
        end loop;
        wait;
    end process;

    process
    begin
        
        RST <= '1'; wait for 10 ns;
        RST <= '0'; wait for 10 ns;

        -- Test 1 : 11 × 13 = 143
        A <= "00001011";
        B <= "00001101";
        START <= '1'; wait for 10 ns;
        START <= '0';
        wait until Done = '1';
        wait for 10 ns;

        -- Test 2 : 255 × 255 = 65025
        RST <= '1'; wait for 10 ns;
        RST <= '0'; wait for 10 ns;
        A <= "11111111";
        B <= "11111111";
        START <= '1'; wait for 10 ns;
        START <= '0';
        wait until Done = '1';
        wait for 10 ns;

        -- Test 3 : 6 × 5 = 30
        RST <= '1'; wait for 10 ns;
        RST <= '0'; wait for 10 ns;
        A <= "00000110";
        B <= "00000101";
        START <= '1'; wait for 10 ns;
        START <= '0';
        wait until Done = '1';
        wait for 20 ns;

        done_sim <= true;
        wait;
    end process;

end Behavioral;
