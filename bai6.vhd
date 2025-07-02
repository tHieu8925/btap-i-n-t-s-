library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mod7_down_counter is
    Port (
        clk : in  STD_LOGIC;
        rst : in  STD_LOGIC;
        Q   : out STD_LOGIC_VECTOR(2 downto 0)
    );
end mod7_down_counter;

architecture Behavioral of mod7_down_counter is
    signal count : STD_LOGIC_VECTOR(2 downto 0) := "110";  
begin

    process(clk, rst)
    begin
        if rst = '1' then
            count <= "110"; 
        elsif rising_edge(clk) then
            if count = "000" then
                count <= "110";  
            else
                count <= count - 1;
            end if;
        end if;
    end process;

    Q <= count;

end Behavioral;
