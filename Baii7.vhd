library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mod5_down_counter_tff is
    Port (
        clk   : in  STD_LOGIC;
        reset : in  STD_LOGIC;
        Q     : out STD_LOGIC_VECTOR (2 downto 0)
    );
end mod5_down_counter_tff;

architecture Behavioral of mod5_down_counter_tff is
    signal Q_int : STD_LOGIC_VECTOR(2 downto 0);
    signal T     : STD_LOGIC_VECTOR(2 downto 0);
begin

    Q <= Q_int;

    process(clk, reset)
    begin
        if reset = '1' then
            Q_int <= "100"; 
        elsif rising_edge(clk) then
            if T(0) = '1' then Q_int(0) <= not Q_int(0); end if;
            if T(1) = '1' then Q_int(1) <= not Q_int(1); end if;
            if T(2) = '1' then Q_int(2) <= not Q_int(2); end if;
        end if;
    end process;

    
    T(0) <= Q_int(2) or Q_int(1) or Q_int(0);

    
    T(1) <= (Q_int(2) and (not Q_int(1)) and Q_int(0)) or
            (Q_int(1) and (not Q_int(0)));

    
    T(2) <= ((not Q_int(2)) and Q_int(1)) or
            (Q_int(2) and (not Q_int(1)) and (not Q_int(0)));

end Behavioral;
