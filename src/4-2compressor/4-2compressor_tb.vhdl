library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity compressor4_2_tb is
end compressor4_2_tb;

architecture Behavioral of compressor4_2_tb is
    component compressor4_2_tb
        Port (
            X1, X2, X3, X4 : in STD_LOGIC;
            Sum, Carry     : out STD_LOGIC
        );
    end component;

    signal X1, X2, X3, X4 : STD_LOGIC;
    signal Sum, Carry      : STD_LOGIC;

begin
    uut: entity work.Compressor4_2
        Port Map (
            X1 => X1,
            X2 => X2,
            X3 => X3,
            X4 => X4,
            Sum => Sum,
            Carry => Carry
        );

    stimulus: process
    begin
        X1 <= '0'; X2 <= '0'; X3 <= '0'; X4 <= '0';
        wait for 10 ns;

        X1 <= '0'; X2 <= '0'; X3 <= '0'; X4 <= '1';
        wait for 10 ns;

        X1 <= '0'; X2 <= '0'; X3 <= '1'; X4 <= '1';
        wait for 10 ns;

        X1 <= '0'; X2 <= '1'; X3 <= '1'; X4 <= '1';
        wait for 10 ns;
        
        X1 <= '1'; X2 <= '1'; X3 <= '1'; X4 <= '1';
        wait for 10 ns;
        wait;

    end process;

end Behavioral;

