library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mul_2x2_tb is
end mul_2x2_tb;

architecture behavioral of mul_2x2_tb is
    signal a : std_logic_vector(1 downto 0) := "00";
    signal b : std_logic_vector(1 downto 0) := "00";
    signal ans : std_logic_vector(3 downto 0);
begin
    uut: entity work.mul_2x2
    port map 
    (
        a => a,
        b => b,
        ans => ans
    );
     
    a(0) <= not a(0) after 5 ns;
    a(1) <= not a(1) after 10 ns;
    b(0) <= not b(0) after 15 ns;
    b(1) <= not b(1) after 20 ns;
    
end behavioral;