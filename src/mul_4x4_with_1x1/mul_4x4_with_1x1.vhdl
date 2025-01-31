library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplier4x4 is
    Port (
        A, B      : in  std_logic_vector(3 downto 0);
        Product   : out std_logic_vector(7 downto 0)
    );
end Multiplier4x4;

architecture Structural of Multiplier4x4 is

    component adder_8bit
        port (
            a, b : in std_logic_vector(7 downto 0);
            sum  : out std_logic_vector(7 downto 0);
            cout : out std_logic
    );
    end component;

    signal PP : std_logic_vector(15 downto 0);
    signal PP0,PP1,PP2,PP3 : std_logic_vector(7 downto 0) := (others => '0');
    signal sum0, sum1, sum2, sum3  : std_logic_vector(7 downto 0);
    
begin
    -- Generate Partial Products
    PP(0) <= A(0) and B(0);
    PP(1) <= A(0) and B(1);
    PP(2) <= A(0) and B(2);
    PP(3) <= A(0) and B(3);
    
    PP(4) <= A(1) and B(0);
    PP(5) <= A(1) and B(1);
    PP(6) <= A(1) and B(2);
    PP(7) <= A(1) and B(3);
    
    PP(8) <= A(2) and B(0);
    PP(9) <= A(2) and B(1);
    PP(10) <= A(2) and B(2);
    PP(11) <= A(2) and B(3);
    
    PP(12) <= A(3) and B(0);
    PP(13) <= A(3) and B(1);
    PP(14) <= A(3) and B(2);
    PP(15) <= A(3) and B(3);

    PP0(3 downto 0) <= (PP(3) & PP(2) & pp(1) & PP(0));
    
    PP1(4 downto 1) <= (PP(7) & PP(6) & pp(5) & PP(4));

    PP2(5 downto 2) <= (PP(11) & PP(10) & pp(9) & PP(8));

    PP3(6 downto 3) <= (PP(15) & PP(14) & pp(13) & PP(12));

    FA0 : adder_8bit port map(PP0, PP1, sum0, open);
    FA1 : adder_8bit port map(sum0, PP2, sum1, open);
    FA3 : adder_8bit port map(sum1, PP3, sum2, open);

    Product <= sum2;
    
end Structural;
