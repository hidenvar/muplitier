library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mul_4x4_with_2x2_opt is
    Port (
        a : in std_logic_vector(3 downto 0);
        b : in std_logic_vector(3 downto 0);
        ans : out std_logic_vector(7 downto 0) := (others => '0')
    );
end mul_4x4_with_2x2_opt;

architecture structural of mul_4x4_with_2x2_opt is
    component mul_2x2_opt
        Port (
            a : in std_logic_vector(1 downto 0);
            b : in std_logic_vector(1 downto 0);
            Product : out std_logic_vector(3 downto 0)
        );
    end component;

    component compressor3_2
        port (
            a, b, c : in std_logic;
            sum : out std_logic;
            carry : out std_logic
        );
    end component;

    component compressor4_2
        port (
            X1, X2, X3, X4 : in STD_LOGIC; 
            Sum, Carry     : out STD_LOGIC   
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
    signal C,S : std_logic_vector(7 downto 0) := (others => '0');

begin
    -- calculate partial products using 2x2 multipliers
    mul_ah_bh: mul_2x2_opt port map (a(3 downto 2), b(3 downto 2), pp1);
    mul_ah_bl: mul_2x2_opt port map (a(3 downto 2), b(1 downto 0), pp2);
    mul_al_bh: mul_2x2_opt port map (a(1 downto 0), b(3 downto 2), pp3);
    mul_al_bl: mul_2x2_opt port map (a(1 downto 0), b(1 downto 0), pp4);

    -- shift partial products 
    shift_pp1: shift_left_4 port map (pp1, pp1_shift);
    shift_pp2: shift_left_2 port map (pp2, pp2_shift);
    shift_pp3: shift_left_2 port map (pp3, pp3_shift);
    shift_pp4: shift_left_0 port map (pp4, pp4_shift);
    S(0) <= pp4_shift(0);
    S(1) <= pp4_shift(1) xor pp3_shift(1);
    S2: compressor3_2 port map (pp4_shift(2), pp3_shift(2), pp2_shift(2), S(2), C(3));
    S3: compressor4_2 port map (pp4_shift(3), pp3_shift(3), pp2_shift(3), pp1_shift(3), S(3), C(4));
    S4: compressor3_2 port map (pp3_shift(4), pp2_shift(4), pp1_shift(4), S(4), C(5));
    S(5) <= pp2_shift(5) xor pp1_shift(5);
    S(6) <= pp1_shift(6);
    
    C(0) <= '0';
    C(1) <= '0';
    C(2) <= pp4_shift(1) and pp3_shift(1);
    C(6) <= pp2_shift(5) and pp1_shift(5);
    C(7) <= '0';
     
    

    -- Sum shifted partial products
    adder1: adder_8bit port map (S, C, ans, open);
    -- adder2: adder_8bit port map (sum1, pp3_shift, sum2, open);
    -- adder3: adder_8bit port map (sum2, pp4_shift, ans, open);
    -- ans <= pp3_shift;

    -- ans(0) <= pp4_shift(0);
    -- ans(1) <= pp4_shift(1) or pp3_shift(1);
    -- ans(2) <= AS0; 
end structural;

