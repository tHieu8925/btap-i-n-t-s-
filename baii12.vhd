library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sequence_counter_dff is
    Port (
        clk   : in  STD_LOGIC;
        reset : in  STD_LOGIC;
        Q     : out STD_LOGIC_VECTOR(4 downto 0)
    );
end sequence_counter_dff;

architecture Behavioral of sequence_counter_dff is
    signal Q_int : STD_LOGIC_VECTOR(4 downto 0) := "00000";
begin
    Q <= Q_int;

    process(clk, reset)
    begin
        if reset = '1' then
            Q_int <= "00000";
        elsif rising_edge(clk) then
            case Q_int is
                when "00000" => Q_int <= "00001"; -- 0 -> 1
                when "00001" => Q_int <= "00011"; -- 1 -> 3
                when "00011" => Q_int <= "00101"; -- 3 -> 5
                when "00101" => Q_int <= "00111"; -- 5 -> 7
                when "00111" => Q_int <= "01001"; -- 7 -> 9
                when "01001" => Q_int <= "01011"; -- 9 -> 11
                when "01011" => Q_int <= "01101"; -- 11 -> 13
                when "01101" => Q_int <= "01111"; -- 13 -> 15
                when "01111" => Q_int <= "00000"; -- 15 -> 0
                when others => Q_int <= "00000"; -- fallback
            end case;
        end if;
    end process;
end Behavioral;
