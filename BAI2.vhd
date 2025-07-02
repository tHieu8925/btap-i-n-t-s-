library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nor_logic is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           F : out STD_LOGIC);
end nor_logic;

architecture Behavioral of nor_logic is

    -- NOR function
    function nor2(a, b : STD_LOGIC) return STD_LOGIC is
    begin
        return not (a or b);
    end function;

    signal A_not, B_not, C_not : STD_LOGIC;
    signal AB, AC, BC : STD_LOGIC;
    signal OR1, OR2 : STD_LOGIC;

begin

    
    A_not <= nor2(A, A);
    B_not <= nor2(B, B);
    C_not <= nor2(C, C);

    
    AB <= nor2(nor2(A_not, A_not), B_not);

    
    AC <= nor2(nor2(A_not, A_not), C_not);

    
    BC <= nor2(B_not, C_not);

    
    OR1 <= nor2(AB, AC);
    OR2 <= nor2(OR1, OR1); 

  
    F <= nor2(nor2(OR2, BC), nor2(OR2, BC));

end Behavioral;
