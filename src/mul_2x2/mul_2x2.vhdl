library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mul_2x2 is
    Port (
        a : in std_logic_vector(1 downto 0);
        b : in std_logic_vector(1 downto 0);
        ans : out std_logic_vector(3 downto 0)
    );
end mul_2x2;

architecture behavioral of mul_2x2 is
    signal a0b0, a1b0, a0b1, a1b1: std_logic;
    signal s1, c1, s2, c2: std_logic;
begin
    a0b0 <= a(0) and b(0);
    a1b0 <= a(1) and b(0);
    a0b1 <= a(0) and b(1);
    a1b1 <= a(1) and b(1);
    
    s1 <= a1b0 xor a0b1;
    c1 <= a1b0 and a0b1;
    
    s2 <= a1b1 xor c1;
    c2 <= a1b1 and c1;
    
    ans(0) <= a0b0;
    ans(1) <= s1;
    ans(2) <= s2;
    ans(3) <= c2;
end behavioral;
