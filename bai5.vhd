library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mod6_down_counter is
    Port (
        clk : in  STD_LOGIC;
        rst : in  STD_LOGIC;
        Q   : out STD_LOGIC_VECTOR(2 downto 0)
    );
end mod6_down_counter;

architecture Behavioral of mod6_down_counter is
    signal count : STD_LOGIC_VECTOR(2 downto 0) := "101"; -- start from 5
begin

    process(clk, rst)
    begin
        if rst = '1' then
            count <= "101";  -- reset v? 5
        elsif rising_edge(clk) then
            if count = "000" then
                count <= "101";  -- quay l?i 5
            else
                count <= count - 1;
            end if;
        end if;
    end process;

    Q <= count;

end Behavioral;
