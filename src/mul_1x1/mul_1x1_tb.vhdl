library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mul_1x1_tb is
end mul_1x1_tb;

architecture behavioral of mul_1x1_tb is
    signal a, b : std_logic := '0';
    signal ans : std_logic;
begin
    uut: entity work.mul_1x1
    port map 
    (
        a => a,
        b => b,
        ans => ans
    );
     
    a <= not a after 5 ns;
    b <= not b after 10 ns;
    
end behavioral;
