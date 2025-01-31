library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder_8bit_tb is
end adder_8bit_tb;

architecture behavioral of adder_8bit_tb is
    signal a, b : std_logic_vector(7 downto 0) := (others => '0');
    signal sum : std_logic_vector(7 downto 0);
    signal cout : std_logic;
begin
    uut: entity work.adder_8bit
    port map (
        a => a,
        b => b,
        sum => sum,
        cout => cout
    );

    -- Toggle each bit of 'a' and 'b' at different intervals
    a(0) <= not a(0) after 5 ns;
    a(1) <= not a(1) after 10 ns;
    a(2) <= not a(2) after 15 ns;
    a(3) <= not a(3) after 20 ns;
    a(4) <= not a(4) after 25 ns;
    a(5) <= not a(5) after 30 ns;
    a(6) <= not a(6) after 35 ns;
    a(7) <= not a(7) after 40 ns;

    b(0) <= not b(0) after 45 ns;
    b(1) <= not b(1) after 50 ns;
    b(2) <= not b(2) after 55 ns;
    b(3) <= not b(3) after 60 ns;
    b(4) <= not b(4) after 65 ns;
    b(5) <= not b(5) after 70 ns;
    b(6) <= not b(6) after 75 ns;
    b(7) <= not b(7) after 80 ns;
end behavioral;