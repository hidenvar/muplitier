library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mul_4x4_with_2x2 is
    Port (
        a : in std_logic_vector(3 downto 0);
        b : in std_logic_vector(3 downto 0);
        ans : out std_logic_vector(7 downto 0)
    );
end mul_4x4_with_2x2;

architecture structural of mul_4x4_with_2x2 is
    component mul_2x2
        Port (
            a : in std_logic_vector(1 downto 0);
            b : in std_logic_vector(1 downto 0);
            ans : out std_logic_vector(3 downto 0)
        );
    end component;

    component adder_8bit
        Port (
            a, b : in std_logic_vector(7 downto 0);
            sum : out std_logic_vector(7 downto 0);
            cout : out std_logic
        );
    end component;

    component shift_left_4
        Port (
            input : in std_logic_vector(3 downto 0);
            output : out std_logic_vector(7 downto 0)
        );
    end component;

    component shift_left_2
        Port (
            input : in std_logic_vector(3 downto 0);
            output : out std_logic_vector(7 downto 0)
        );
    end component;

    component shift_left_0
        Port (
            input : in std_logic_vector(3 downto 0);
            output : out std_logic_vector(7 downto 0)
        );
    end component;

    signal pp1, pp2, pp3, pp4 : std_logic_vector(3 downto 0);
    signal pp1_shift, pp2_shift, pp3_shift, pp4_shift : std_logic_vector(7 downto 0);
    signal sum1, sum2 : std_logic_vector(7 downto 0);

begin
    -- calculate partial products using 2x2 multipliers
    mul_ah_bh: mul_2x2 port map (a(3 downto 2), b(3 downto 2), pp1);
    mul_ah_bl: mul_2x2 port map (a(3 downto 2), b(1 downto 0), pp2);
    mul_al_bh: mul_2x2 port map (a(1 downto 0), b(3 downto 2), pp3);
    mul_al_bl: mul_2x2 port map (a(1 downto 0), b(1 downto 0), pp4);

    -- shift partial products 
    shift_pp1: shift_left_4 port map (pp1, pp1_shift);
    shift_pp2: shift_left_2 port map (pp2, pp2_shift);
    shift_pp3: shift_left_2 port map (pp3, pp3_shift);
    shift_pp4: shift_left_0 port map (pp4, pp4_shift);

    -- Sum shifted partial products
    adder1: adder_8bit port map (pp1_shift, pp2_shift, sum1, open);
    adder2: adder_8bit port map (sum1, pp3_shift, sum2, open);
    adder3: adder_8bit port map (sum2, pp4_shift, ans, open);
end structural;
