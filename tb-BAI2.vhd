library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_nor_logic_function is
end tb_nor_logic_function;

architecture behavior of tb_nor_logic_function is

    component nor_logic_function
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            C : in  STD_LOGIC;
            F : out STD_LOGIC
        );
    end component;
    signal A_tb, B_tb, C_tb : STD_LOGIC := '0';
    signal F_tb             : STD_LOGIC;

begin

 
    uut: nor_logic_function
        port map (
            A => A_tb,
            B => B_tb,
            C => C_tb,
            F => F_tb
        );

   
    stim_proc: process
    begin
        for i in 0 to 7 loop
            A_tb <= std_logic'val((i / 4) mod 2);
            B_tb <= std_logic'val((i / 2) mod 2);
            C_tb <= std_logic'val(i mod 2);
            wait for 10 ns;
        end loop;
        wait;
    end process;

end behavior;
