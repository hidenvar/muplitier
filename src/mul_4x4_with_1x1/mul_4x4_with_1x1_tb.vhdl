library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mul_4x4_with_1x1_tb is
end mul_4x4_with_1x1_tb;

architecture behavioral of mul_4x4_with_1x1_tb is

    signal A, B : STD_LOGIC_VECTOR(3 downto 0);
    signal Product : STD_LOGIC_VECTOR(7 downto 0);

    component mul_4x4_with_1x1
        port (
            A : in STD_LOGIC_VECTOR(3 downto 0);
            B : in STD_LOGIC_VECTOR(3 downto 0);
            Product : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

begin

    uut: mul_4x4_with_1x1
        port map (
            A => A,
            B => B,
            Product => Product
        );

    process
    begin
        A <= "0001"; B <= "0010";
        wait for 10 ns;
        
        A <= "0001"; B <= "0011";
        wait for 10 ns; 
        
        A <= "0001"; B <= "0100";
        wait for 10 ns; 
        
        A <= "0001"; B <= "0101";
        wait for 10 ns; 
        
        A <= "0001"; B <= "0110";
        wait for 10 ns;
        
        A <= "0001"; B <= "0111";
        wait for 10 ns;
        
        A <= "0010"; B <= "0010";
        wait for 10 ns;
        
        A <= "0010"; B <= "0011";
        wait for 10 ns;
        
        A <= "0010"; B <= "0101";
        wait for 10 ns;
        
        A <= "0100"; B <= "0010";
        wait for 10 ns;
        A <= "1010"; B <= "1111";
        wait for 10 ns;
        
        A <= "1011"; B <= "1011";
        wait for 10 ns;

        A <= "1110"; B <= "1101";
        wait for 10 ns;
        wait;
    end process;

end behavioral;
