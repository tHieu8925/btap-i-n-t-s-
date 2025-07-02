library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter_mod6 is
    Port ( clk   : in  STD_LOGIC;
           rst   : in  STD_LOGIC;
           Q     : out STD_LOGIC_VECTOR (2 downto 0));
end counter_mod6;

architecture Behavioral of counter_mod6 is
    signal count : STD_LOGIC_VECTOR (2 downto 0) := "000";
begin

    process(clk, rst)
    begin
        if rst = '1' then
            count <= "000";
        elsif rising_edge(clk) then
            if count = "101" then  -- 5 in binary
                count <= "000";
            else
                count <= count + 1;
            end if;
        end if;
    end process;

    Q <= count;

end Behavioral;
