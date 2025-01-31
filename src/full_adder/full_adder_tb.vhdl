library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_tb is
end full_adder_tb;

architecture behavioral of full_adder_tb is
    signal a, b, cin : std_logic := '0';
    signal sum, cout : std_logic;
begin
    uut: entity work.full_adder
    port map (
        a => a,
        b => b,
        cin => cin,
        sum => sum,
        cout => cout
    );

    a <= not a after 5 ns;
    b <= not b after 10 ns;
    cin <= not cin after 20 ns;
end behavioral;