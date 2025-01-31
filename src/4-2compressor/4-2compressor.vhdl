library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity compressor4_2 is
    Port (
        X1, X2, X3, X4 : in STD_LOGIC; 
        Sum, Carry     : out STD_LOGIC   
    );
end compressor4_2;

architecture Behavioral of compressor4_2 is
    signal W1, W2, W3, W4, W5, W6 : STD_LOGIC;
begin
    W1 <= X1 AND X2;
    W2 <= X1 OR X2;
    W3 <= X3 AND X4;
    W4 <= X3 OR X4;
    W5 <= W1 OR W3;
    W6 <= W2 AND W4;

    Carry <= W5 OR W6;
    Sum <= W5 XOR W2 XOR W4;
end Behavioral;

