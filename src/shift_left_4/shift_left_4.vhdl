library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift_left_4 is
    Port (
        input : in std_logic_vector(3 downto 0);
        output : out std_logic_vector(7 downto 0)
    );
end shift_left_4;

architecture Behavioral of shift_left_4 is
begin
    output(7 downto 4) <= input;
    output(3 downto 0) <= (others => '0');
end Behavioral;