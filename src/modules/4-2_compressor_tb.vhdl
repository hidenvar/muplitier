library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_Approx4to2Compressor is
end tb_Approx4to2Compressor;

architecture Behavioral of tb_Approx4to2Compressor is
    -- Component Declaration for the Unit Under Test (UUT)
    component Approx4to2Compressor
        Port (
            X1, X2, X3, X4 : in STD_LOGIC;
            Sum, Carry     : out STD_LOGIC
        );
    end component;

    -- Signals to connect to UUT
    signal X1, X2, X3, X4 : STD_LOGIC;
    signal Sum, Carry      : STD_LOGIC;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: Approx4to2Compressor
        Port Map (
            X1 => X1,
            X2 => X2,
            X3 => X3,
            X4 => X4,
            Sum => Sum,
            Carry => Carry
        );

    -- Test Procedure
    stimulus: process
    begin
        -- Hardcoded test cases
        -- Test Case 1
        X1 <= '0'; X2 <= '0'; X3 <= '0'; X4 <= '0';
        wait for 10 ns; -- Wait for output stabilization
        report "Inputs: 0 0 0 0 | Outputs: Sum = " & std_logic'image(Sum) & ", Carry = " & std_logic'image(Carry);

        -- Test Case 2
        X1 <= '0'; X2 <= '0'; X3 <= '0'; X4 <= '1';
        wait for 10 ns;
        report "Inputs: 0 0 0 1 | Outputs: Sum = " & std_logic'image(Sum) & ", Carry = " & std_logic'image(Carry);

        -- Test Case 3
        X1 <= '0'; X2 <= '0'; X3 <= '1'; X4 <= '1';
        wait for 10 ns;
        report "Inputs: 0 0 1 1 | Outputs: Sum = " & std_logic'image(Sum) & ", Carry = " & std_logic'image(Carry);

        -- Test Case 4
        X1 <= '0'; X2 <= '1'; X3 <= '1'; X4 <= '1';
        wait for 10 ns;
        report "Inputs: 0 1 1 1 | Outputs: Sum = " & std_logic'image(Sum) & ", Carry = " & std_logic'image(Carry);
        
        -- Test Case 5
        X1 <= '1'; X2 <= '1'; X3 <= '1'; X4 <= '1';
        wait for 10 ns;
        report "Inputs: 1 1 1 1 | Outputs: Sum = " & std_logic'image(Sum) & ", Carry = " & std_logic'image(Carry);
        
        -- Add more test cases as needed here...

        wait;  -- Wait indefinitely to finish the simulation
    end process;

end Behavioral;
