library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity testbai1 is

end testbai1;

architecture Behavioral of testbai1 is
component bai1 is
port(
     a : in std_logic;
     b : in std_logic;
     c : in std_logic;
     f : out std_logic );
     
     end component;
     signal a,b,c : std_logic :='0';
     signal f : std_logic;
     
begin
     vote: bai1 port map(a=>a,b=>b,c=>c,f=>f);
     test:process
     
begin
     a<='0';b<='0';c<='0';
     wait for 10ns;
     a<='0';b<='0';c<='1';
     wait for 10ns;
     a<='0';b<='1';c<='0';
     wait for 10ns;
     a<='0';b<='1';c<='1';
     wait for 10ns;
     a<='1';b<='0';c<='0';
     wait for 10ns;
     a<='1';b<='0';c<='1';
     wait for 10ns;
     a<='1';b<='1';c<='0';
     wait for 10ns;
     a<='1';b<='1';C<='1';
     wait for 10ns;
     wait;
     end process;
     

end Behavioral;