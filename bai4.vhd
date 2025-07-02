library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mod7_counter is
    Port (
        clk : in  STD_LOGIC;
        rst : in  STD_LOGIC;
        Q   : out STD_LOGIC_VECTOR(2 downto 0)
    );
end mod7_counter;

architecture Behavioral of mod7_counter is
    signal count : STD_LOGIC_VECTOR(2 downto 0) := "000";
begin

    process(clk, rst)
    begin
        if rst = '1' then
            count <= "000";
        elsif rising_edge(clk) then
            if count = "110" then  -- 6 in binary
                count <= "000";
            else
                count <= count + 1;
            end if;
        end if;
    end process;

    Q <= count;

end Behavioral;
