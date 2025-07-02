library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_mod6_down_counter is
end tb_mod6_down_counter;

architecture Behavioral of tb_mod6_down_counter is

    signal clk_tb : STD_LOGIC := '0';
    signal rst_tb : STD_LOGIC := '1';
    signal Q_tb   : STD_LOGIC_VECTOR(2 downto 0);

    constant clk_period : time := 10 ns;

begin

    -- G?i thi?t k? chính (DUT)
    uut: entity work.mod6_down_counter
        port map (
            clk => clk_tb,
            rst => rst_tb,
            Q   => Q_tb
        );

    -- T?o xung clock
    clk_process : process
    begin
        while true loop
            clk_tb <= '0';
            wait for clk_period / 2;
            clk_tb <= '1';
            wait for clk_period / 2;
        end loop;
    end process;

    -- T?o reset và mô ph?ng ho?t ??ng
    stim_proc: process
    begin
        wait for 20 ns;
        rst_tb <= '0';

        wait for 200 ns;
        wait;
    end process;

end Behavioral;
