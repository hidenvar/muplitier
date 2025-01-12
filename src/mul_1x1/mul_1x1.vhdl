library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mul_1x1 is
    Port (
        a : in std_logic;
        b : in std_logic;
        ans : out std_logic
    );
end mul_1x1;

architecture behavioral of mul_1x1 is
begin
    ans <= a and b;
end behavioral;
