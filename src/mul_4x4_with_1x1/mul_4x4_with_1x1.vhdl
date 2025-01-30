library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplier4x4 is
    Port (
        A, B      : in  STD_LOGIC_VECTOR(3 downto 0);
        Product   : out STD_LOGIC_VECTOR(7 downto 0)
    );
end Multiplier4x4;

architecture Structural of Multiplier4x4 is
    component Approx4to2Compressor
        Port (
            X1, X2, X3, X4 : in STD_LOGIC;
            Cin            : in STD_LOGIC;
            Sum, Carry     : out STD_LOGIC
        );
    end component;
    
    signal PP : STD_LOGIC_VECTOR(15 downto 0);
    
    signal sum, carry : STD_LOGIC_VECTOR(7 downto 0);
    
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

    sum(0) <= PP(0);
    carry(0) <= '0';

    sum(1) <= PP(1) xor PP(4);
    carry(1) <= PP(1) and PP(4);

    CMP2: Approx4to2Compressor port map(
        X1 => PP(2), X2 => PP(5), X3 => PP(8), X4 => '0',
        Cin => '0',
        Sum => sum(2), Carry => carry(2)
    );

    CMP3: Approx4to2Compressor port map(
        X1 => PP(3), X2 => PP(6), X3 => PP(9), X4 => PP(12),
        Cin => '0',
        Sum => sum(3), Carry => carry(3)
    );
    CMP4: Approx4to2Compressor port map(
        X1 => PP(7), X2 => PP(10), X3 => PP(13), X4 => '0',
        Cin => carry(3),  -- Carry from column 3
        Sum => sum(4), Carry => carry(4)
    );

    sum(5) <= PP(11) xor PP(14) xor carry(4);
    carry(5) <= (PP(11) and PP(14)) or (PP(11) and carry(4)) or (PP(14) and carry(4));

    sum(6) <= PP(15) xor carry(5);
    carry(6) <= PP(15) and carry(5);

    sum(7) <= carry(6);

    Product(0) <= sum(0);
    Product(1) <= sum(1); 
    Product(2) <= sum(2);
    Product(3) <= sum(3);
    Product(4) <= sum(4);
    Product(5) <= sum(5);
    Product(6) <= sum(6);
    Product(7) <= sum(7);

end Structural;
