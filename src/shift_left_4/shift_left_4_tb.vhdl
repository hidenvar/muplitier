library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift_left_4_tb is
end shift_left_4_tb;

architecture behavioral of shift_left_4_tb is
    signal input : std_logic_vector(3 downto 0) := "0000";
    signal output : std_logic_vector(7 downto 0);
begin
    uut: entity work.shift_left_4
    port map (
        input => input,
        output => output
    );

    input(0) <= not input(0) after 5 ns;
    input(1) <= not input(1) after 10 ns;
    input(2) <= not input(2) after 15 ns;
    input(3) <= not input(3) after 20 ns;
end behavioral;