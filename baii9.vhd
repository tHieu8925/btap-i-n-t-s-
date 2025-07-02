library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity custom_counter_dff is
    Port (
        clk   : in  STD_LOGIC;
        reset : in  STD_LOGIC;
        Q     : out STD_LOGIC_VECTOR (2 downto 0)
    );
end custom_counter_dff;

architecture Behavioral of custom_counter_dff is
    signal Q_int : STD_LOGIC_VECTOR (2 downto 0);
    signal D     : STD_LOGIC_VECTOR (2 downto 0);
begin

    Q <= Q_int;

    process(clk, reset)
    begin
        if reset = '1' then
            Q_int <= "001";  
        elsif rising_edge(clk) then
            Q_int <= D;      
        end if;
    end process;

   
    process(Q_int)
    begin
        case Q_int is
            when "001" => D <= "010";  
            when "010" => D <= "011";  
            when "011" => D <= "101";  
            when "101" => D <= "110";  
            when "110" => D <= "001";  
            when others => D <= "001"; 
        end case;
    end process;

end Behavioral;
