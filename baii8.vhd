library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mod4_custom_counter is
    Port (
        clk   : in  STD_LOGIC;
        reset : in  STD_LOGIC;
        Q     : out STD_LOGIC_VECTOR (2 downto 0)
    );
end mod4_custom_counter;

architecture Behavioral of mod4_custom_counter is
    signal Q_int : STD_LOGIC_VECTOR(2 downto 0);
begin
    Q <= Q_int;

    process(clk, reset)
    begin
        if reset = '1' then
            Q_int <= "000";
        elsif rising_edge(clk) then
           
            Q_int(1) <= not Q_int(1);
            if Q_int(1) = '1' then
                Q_int(2) <= not Q_int(2);
            end if;
        end if;
    end process;
end Behavioral;
