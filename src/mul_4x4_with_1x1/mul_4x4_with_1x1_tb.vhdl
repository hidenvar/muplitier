library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MitchellMultiplier_TB is
end MitchellMultiplier_TB;

architecture Sim of MitchellMultiplier_TB is
    signal A, B : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal P    : STD_LOGIC_VECTOR(7 downto 0);
begin
    UUT: entity work.MitchellMultiplier
        Port Map (A => A, B => B, P => P);

    process
    begin
        A <= "0011"; B <= "0011";
        wait for 10 ns;
        assert P = "00010000" report "Test 1 failed" severity error;

        A <= "0101"; B <= "0111";
        wait for 10 ns;
        assert P = "00100000" report "Test 2 failed" severity error;

        A <= "1111"; B <= "1111";
        wait for 10 ns;
        assert P = "11111111" report "Test 3 failed" severity error;

        A <= "0000"; B <= "0000";
        wait for 10 ns;
        assert P = "00000001" report "Test 4 failed" severity error;

        A <= "0001"; B <= "0001";
        wait for 10 ns;
        assert P = "00000001" report "Test 5 failed" severity error;
        
        A <= "1100"; B <= "1011";
        wait for 10 ns;
        assert P = "10000000" report "Test 6 failed" severity error;

        wait;
    end process;
end Sim;
