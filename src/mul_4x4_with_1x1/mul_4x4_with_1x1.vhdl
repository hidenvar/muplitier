library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mul_4x4_with_1x1 is
    Port (
        A, B      : in  std_logic_vector(3 downto 0);
        Product   : out std_logic_vector(7 downto 0)
    );
end mul_4x4_with_1x1;

architecture Structural of mul_4x4_with_1x1 is
    component mul_1x1
        port (
            a, b : in std_logic;
            ans  : out std_logic
        );
    end component;
    
    component adder_8bit
        port (
            a, b : in std_logic_vector(7 downto 0);
            sum  : out std_logic_vector(7 downto 0);
            cout : out std_logic
    );
    end component;

    signal PP : std_logic_vector(15 downto 0);
    signal APP, BPP, CPP, DPP : std_logic_vector(7 downto 0) := (others => '0');
    signal sum0, sum1 : std_logic_vector(7 downto 0);
    
begin
    -- Generate Partial Products
    PP0:  mul_1x1 port map (A(0), B(0), PP(0));
    PP1:  mul_1x1 port map (A(0), B(1), PP(1));
    PP2:  mul_1x1 port map (A(0), B(2), PP(2));
    PP3:  mul_1x1 port map (A(0), B(3), PP(3));
    
    PP4:  mul_1x1 port map (A(1), B(0), PP(4));
    PP5:  mul_1x1 port map (A(1), B(1), PP(5));
    PP6:  mul_1x1 port map (A(1), B(2), PP(6));
    PP7:  mul_1x1 port map (A(1), B(3), PP(7));

    PP8:  mul_1x1 port map (A(2), B(0), PP(8));
    PP9:  mul_1x1 port map (A(2), B(1), PP(9));
    PP10: mul_1x1 port map (A(2), B(2), PP(10));
    PP11:  mul_1x1 port map (A(2), B(3), PP(11));

    PP12: mul_1x1 port map (A(3), B(0), PP(12));
    PP13: mul_1x1 port map (A(3), B(1), PP(13));
    PP14: mul_1x1 port map (A(3), B(2), PP(14));
    PP15: mul_1x1 port map (A(3), B(3), PP(15));

    APP(3 downto 0) <= (PP(3) & PP(2) & pp(1) & PP(0));
    
    BPP(4 downto 1) <= (PP(7) & PP(6) & pp(5) & PP(4));

    CPP(5 downto 2) <= (PP(11) & PP(10) & pp(9) & PP(8));

    DPP(6 downto 3) <= (PP(15) & PP(14) & pp(13) & PP(12));

    FA0 : adder_8bit port map(APP, BPP, sum0, open);
    FA1 : adder_8bit port map(sum0, CPP, sum1, open);
    FA3 : adder_8bit port map(sum1, DPP, Product, open);
    
end Structural;
