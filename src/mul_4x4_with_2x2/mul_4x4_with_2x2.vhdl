library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

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

    -- partial products
    signal pp1, pp2, pp3, pp4 : std_logic_vector(3 downto 0);

    -- partial products after shift
    signal pp1_shift, pp2_shift, pp3_shift, pp4_shift : unsigned(7 downto 0);

begin
    -- Split 4-bit inputs into 2-bit segments
    -- AH = a(3-2), AL = a(1-0), BH = b(3-2), BL = b(1-0)
    -- a high is 2 msb a low is 3 lsb , similar thing for b
    
    -- AH * BH (shift left by 4)
    mul_ah_bh: mul_2x2 port map (
        a => a(3 downto 2),
        b => b(3 downto 2),
        ans => pp1
    );
    
    -- AH * BL (shift left by 2)
    mul_ah_bl: mul_2x2 port map (
        a => a(3 downto 2),
        b => b(1 downto 0),
        ans => pp2
    );
    
    -- AL * BH (shift left by 2)
    mul_al_bh: mul_2x2 port map (
        a => a(1 downto 0),
        b => b(3 downto 2),
        ans => pp3
    );
    
    -- AL * BL (no shift)
    mul_al_bl: mul_2x2 port map (
        a => a(1 downto 0),
        b => b(1 downto 0),
        ans => pp4
    );
    
    -- shift the partial products

    -- shift left by 4  (bits 7 to 4)
    pp1_shift <= unsigned(pp1) & "0000";    
    -- shift left by 2  (bits 5 to 2)
    pp2_shift <= "00" & unsigned(pp2) & "00"; 
    -- shift left by 2  (bits 5 to 2)
    pp3_shift <= "00" & unsigned(pp3) & "00"; 
    -- don't shift      (bits 3 to 0)
    pp4_shift <= "0000" & unsigned(pp4);      
    
    -- sum of all shifted partial products 
    ans <= std_logic_vector(pp1_shift + pp2_shift + pp3_shift + pp4_shift);
end structural;