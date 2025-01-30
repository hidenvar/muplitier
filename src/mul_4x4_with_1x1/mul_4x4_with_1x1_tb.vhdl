library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_Multiplier4x4 is
end tb_Multiplier4x4;

architecture sim of tb_Multiplier4x4 is

    signal A, B : STD_LOGIC_VECTOR(3 downto 0);
    signal Product : STD_LOGIC_VECTOR(7 downto 0);

    component Multiplier4x4
        port (
            A : in STD_LOGIC_VECTOR(3 downto 0);
            B : in STD_LOGIC_VECTOR(3 downto 0);
            Product : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

begin

    uut: Multiplier4x4
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

end sim;
