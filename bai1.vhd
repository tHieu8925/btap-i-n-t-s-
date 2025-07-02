library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bai1 is
  Port ( 
        a : in std_logic;
        b : in std_logic;
        c : in std_logic;
        f : out std_logic);
         
end bai1;

architecture Behavioral of bai1 is
    signal nand_a, nand_bc, nand_notbnotc, nand_abc : std_logic;
    
begin
    nand_a <= a nand a;
    nand_bc <= b nand c;
    nand_notbnotc <= (b nand b)nand(c nand c);
    nand_abc <= nand_a nand nand_notbnotc;
    f <= nand_abc nand nand_bc;


end Behavioral;