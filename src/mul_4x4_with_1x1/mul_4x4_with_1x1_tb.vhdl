library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL; -- Needed for arithmetic operations
use IEEE.STD_LOGIC_UNSIGNED.ALL; -- Needed for unsigned operations

entity tb_Multiplier4x4 is
end tb_Multiplier4x4;

architecture sim of tb_Multiplier4x4 is

    -- Testbench variables
    signal A, B : STD_LOGIC_VECTOR(3 downto 0);
    signal Product : STD_LOGIC_VECTOR(7 downto 0); -- Modify as necessary

    -- Component declaration
    component Multiplier4x4
        port (
            A : in STD_LOGIC_VECTOR(3 downto 0);
            B : in STD_LOGIC_VECTOR(3 downto 0);
            Product : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

begin

    -- Instantiate the multiplier
    uut: Multiplier4x4
        port map (
            A => A,
            B => B,
            Product => Product
        );

    -- Test Process
    process
    begin
        -- Test cases
        A <= "0001"; B <= "0010"; -- Test 1
        wait for 10 ns; -- Wait for a stable output

        A <= "0011"; B <= "0011"; -- Test 2
        wait for 10 ns; 

        A <= "0100"; B <= "0101"; -- Test 3
        wait for 10 ns; 

        A <= "1111"; B <= "1111"; -- Test 4
        wait for 10 ns; 

        -- Add more test cases as needed...

        wait; -- Wait indefinitely to observe the results
    end process;

end sim;
