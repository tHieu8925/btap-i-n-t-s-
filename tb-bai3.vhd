library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_counter_mod6 is
    
end tb_counter_mod6;

architecture Behavioral of tb_counter_mod6 is

    
    signal clk_tb  : STD_LOGIC := '0';
    signal rst_tb  : STD_LOGIC := '1';
    signal Q_tb    : STD_LOGIC_VECTOR (2 downto 0);

    
    constant clk_period : time := 10 ns;

begin

   
    uut: entity work.counter_mod6
        port map (
            clk => clk_tb,
            rst => rst_tb,
            Q   => Q_tb
        );

    
    clk_process : process
    begin
        while true loop
            clk_tb <= '0';
            wait for clk_period / 2;
            clk_tb <= '1';
            wait for clk_period / 2;
        end loop;
    end process;

    
    stim_proc: process
    begin
        
        wait for 20 ns;
        rst_tb <= '0';

       
        wait for 200 ns;
        wait;
    end process;

end Behavioral;
