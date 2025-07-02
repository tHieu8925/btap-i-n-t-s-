library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sequence_counter_jk is
    Port (
        clk   : in STD_LOGIC;
        reset : in STD_LOGIC;
        Q     : out STD_LOGIC_VECTOR(2 downto 0)
    );
end sequence_counter_jk;

architecture Behavioral of sequence_counter_jk is
    signal Q_int : STD_LOGIC_VECTOR(2 downto 0) := "000";
    signal J, K  : STD_LOGIC_VECTOR(2 downto 0);
begin
    Q <= Q_int;

    
    J(2) <= (not Q_int(1) and Q_int(0)) or ((not Q_int(2)) and Q_int(1) and (not Q_int(0)));
    K(2) <= Q_int(2) and (Q_int(1) or Q_int(0));

    J(1) <= Q_int(0) or ((not Q_int(2)) and (not Q_int(1)));
    K(1) <= (Q_int(2) and Q_int(0)) or (Q_int(1) and (not Q_int(0)));

    J(0) <= ((not Q_int(2)) and (not Q_int(1))) or (not Q_int(0));
    K(0) <= Q_int(2) or (Q_int(1) and Q_int(0));

    process(clk, reset)
    begin
        if reset = '1' then
            Q_int <= "000";
        elsif rising_edge(clk) then
           
            if J(0) = '1' and K(0) = '1' then
                Q_int(0) <= not Q_int(0);
            elsif J(0) = '1' then
                Q_int(0) <= '1';
            elsif K(0) = '1' then
                Q_int(0) <= '0';
            end if;

            if J(1) = '1' and K(1) = '1' then
                Q_int(1) <= not Q_int(1);
            elsif J(1) = '1' then
                Q_int(1) <= '1';
            elsif K(1) = '1' then
                Q_int(1) <= '0';
            end if;

            if J(2) = '1' and K(2) = '1' then
                Q_int(2) <= not Q_int(2);
            elsif J(2) = '1' then
                Q_int(2) <= '1';
            elsif K(2) = '1' then
                Q_int(2) <= '0';
            end if;
        end if;
    end process;

end Behavioral;
