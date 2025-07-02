library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_custom_sequence_counter_jk is
end tb_custom_sequence_counter_jk;

architecture behavior of tb_custom_sequence_counter_jk is

    component custom_sequence_counter_jk
        Port (
            clk   : in  STD_LOGIC;
            reset : in  STD_LOGIC;
            Q     : out STD_LOGIC_VECTOR (2 downto 0)
        );
    end component;

    signal clk_tb   : STD_LOGIC := '0';
    signal reset_tb : STD_LOGIC := '0';
    signal Q_tb     : STD_LOGIC_VECTOR (2 downto 0);

    constant CLK_PERIOD : time := 10 ns;

begin
    uut: custom_sequence_counter_jk
        port map (
            clk   => clk_tb,
            reset => reset_tb,
            Q     => Q_tb
        );

    clk_process : process
    begin
        while now < 150 ns loop
            clk_tb <= '0';
            wait for CLK_PERIOD/2;
            clk_tb <= '1';
            wait for CLK_PERIOD/2;
        end loop;
        wait;
    end process;

    stim_proc : process
    begin
        reset_tb <= '1';
        wait for 15 ns;
        reset_tb <= '0';
        wait;
    end process;

end behavior;
