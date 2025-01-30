library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Multiplier4x4 is
    Port (
        A, B      :  in STD_LOGIC_VECTOR(3 downto 0);  -- 4-bit inputs
        Product    : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0')  -- 8-bit output
    );
end Multiplier4x4;

architecture Behavioral of Multiplier4x4 is
    begin

    process(A, B)
    variable  PP : STD_LOGIC_VECTOR(15 downto 0);
    variable sum: STD_LOGIC_VECTOR(7 downto 0);
    begin
        PP(0)  := A(0) and B(0);
        PP(1)  := A(0) and B(1);
        PP(2)  := A(0) and B(2);
        PP(3)  := A(0) and B(3);
        
        PP(4)  := A(1) and B(0);
        PP(5)  := A(1) and B(1);
        PP(6)  := A(1) and B(2);
        PP(7)  := A(1) and B(3);
        
        PP(8)  := A(2) and B(0);
        PP(9)  := A(2) and B(1);
        PP(10) := A(2) and B(2);
        PP(11) := A(2) and B(3);
        
        PP(12) := A(3) and B(0);
        PP(13) := A(3) and B(1);
        PP(14) := A(3) and B(2);
        PP(15) := A(3) and B(3);        
        
        sum := (others => '0');
        sum := sum + ("0000" & PP(3) & PP(2) & PP(1) & PP(0)); 
        sum := sum + ("000" & PP(7) & PP(6) & PP(5) & PP(4) & '0'); 
        sum := sum + ("00" & PP(11) & PP(10) & PP(9) & PP(8) & "00");
        sum := sum + ("0" & PP(15) & PP(14) & PP(13) & PP(12) & "000");
        Product <= sum;  
    end process;
end Behavioral;
