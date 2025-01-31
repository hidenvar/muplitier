library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder_8bit is
    Port (
        a, b : in std_logic_vector(7 downto 0);
        sum : out std_logic_vector(7 downto 0);
        cout : out std_logic
    );
end adder_8bit;

architecture structural of adder_8bit is
    component full_adder
        Port (
            a, b, cin : in std_logic;
            sum, cout : out std_logic
        );
    end component;
    
    signal carry : std_logic_vector(8 downto 0);
begin
    carry(0) <= '0';
    
    gen_adder: for i in 0 to 7 generate
        fa: full_adder port map(
            a => a(i),
            b => b(i),
            cin => carry(i),
            sum => sum(i),
            cout => carry(i+1)
        );
    end generate;
    
    cout <= carry(8);
end structural;