library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mul_4x4_with_2x2_opt_tb is
end mul_4x4_with_2x2_opt_tb;

architecture behavioral of mul_4x4_with_2x2_opt_tb is
    signal a : std_logic_vector(3 downto 0) := "0000";
    signal b : std_logic_vector(3 downto 0) := "0000";
    signal ans : std_logic_vector(7 downto 0);
begin
    uut: entity work.mul_4x4_with_2x2_opt
    port map (
        a => a,
        b => b,
        ans => ans
    );
    
    a(0) <= not a(0) after 5 ns;
    a(1) <= not a(1) after 10 ns;
    a(2) <= not a(2) after 15 ns;
    a(3) <= not a(3) after 20 ns;
    
    b(0) <= not b(0) after 25 ns;
    b(1) <= not b(1) after 30 ns;
    b(2) <= not b(2) after 35 ns;
    b(3) <= not b(3) after 40 ns;    

end behavioral;
