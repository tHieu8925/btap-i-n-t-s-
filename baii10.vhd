library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity custom_sequence_counter_jk is
    Port (
        clk   : in  STD_LOGIC;
        reset : in  STD_LOGIC;
        Q     : out STD_LOGIC_VECTOR (2 downto 0)
    );
end custom_sequence_counter_jk;

architecture Behavioral of custom_sequence_counter_jk is
    signal Q_int : STD_LOGIC_VECTOR(2 downto 0);
begin
    Q <= Q_int;

    process(clk, reset)
    begin
        if reset = '1' then
            Q_int <= "000"; 
        elsif rising_edge(clk) then
            case Q_int is
                when "000" => Q_int <= "001"; 
                when "001" => Q_int <= "011"; 
                when "011" => Q_int <= "100"; 
                when "100" => Q_int <= "111"; 
                when "111" => Q_int <= "001"; 
                when "101" => Q_int <= "000"; 
                when others => Q_int <= "101"; 
            end case;
        end if;
    end process;
end Behavioral;
