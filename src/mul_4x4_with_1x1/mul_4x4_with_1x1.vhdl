library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MitchellMultiplier is
    Port (
        A : in  STD_LOGIC_VECTOR(3 downto 0);
        B : in  STD_LOGIC_VECTOR(3 downto 0);
        P : out STD_LOGIC_VECTOR(7 downto 0)   
    );
end MitchellMultiplier;

architecture Behavioral of MitchellMultiplier is
    function log2_approx(x : STD_LOGIC_VECTOR(3 downto 0)) return INTEGER is
    begin
        for i in 3 downto 0 loop
            if i /= 0 then
                if x(i) = '1' and  x(i - 1) = '1' then
                    return i + 1;
                elsif x(i) = '1' then
                    return i;
                end if;
            end if;
        end loop;
        return 0;
    end function;

    function exp2_approx(y : INTEGER) return STD_LOGIC_VECTOR is
    begin
        if y > 7 then
            return "11111111";
        else
            return STD_LOGIC_VECTOR(to_unsigned(1, 8) sll y);
        end if;
    end function;

    signal logA, logB : INTEGER := 0;  
    signal logSum     : INTEGER := 0;  
    signal expResult  : STD_LOGIC_VECTOR(7 downto 0);
    begin
    logA <= log2_approx(A);
    logB <= log2_approx(B);

    logSum <= logA + logB;

    expResult <= exp2_approx(logSum);
    P <= expResult;
end Behavioral;
