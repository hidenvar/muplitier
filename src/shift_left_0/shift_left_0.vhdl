library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift_left_0 is
    Port (
        input : in std_logic_vector(3 downto 0);
        output : out std_logic_vector(7 downto 0)
    );
end shift_left_0;

architecture Behavioral of shift_left_0 is
begin
    output(3 downto 0) <= input;
    output(7 downto 4) <= (others => '0');
end Behavioral;