library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity statistics_tb is
end statistics_tb;

architecture behavior of statistics_tb is
    component mul_4x4_with_2x2_opt
        port(
            a : in std_logic_vector(3 downto 0);
            b : in std_logic_vector(3 downto 0);
            ans : out std_logic_vector(7 downto 0) := (others => '0')
        );
    end component;

    signal A, B : std_logic_vector(3 downto 0) := (others => '0');
    signal P_exact, P_approx : std_logic_vector(7 downto 0);
    
    constant CLK_PERIOD : time := 10 ns;

begin
    uut: mul_4x4_with_2x2_opt port map(
        a => A,
        b => B,
        ans => P_approx
    );

    process
        file exact_file : text open write_mode is "exact_4x4.csv";
        file approx_file : text open write_mode is "approx_4x4.csv";
        variable line_exact, line_approx : line;
        variable int_A, int_B, int_P_exact : integer;
    begin
        -- CSV headers
        write(line_exact, string'("A,B,P"));
        writeline(exact_file, line_exact);
        write(line_approx, string'("A,B,P"));
        writeline(approx_file, line_approx);

        for a_val in 0 to 15 loop
            for b_val in 0 to 15 loop
                A <= std_logic_vector(to_unsigned(a_val, 4));
                B <= std_logic_vector(to_unsigned(b_val, 4));
                wait for CLK_PERIOD;
                
                -- Compute exact multiplication
                int_P_exact := a_val * b_val;
                P_exact <= std_logic_vector(to_unsigned(int_P_exact, 8));

                -- Write exact results
                write(line_exact, a_val); write(line_exact, ',');
                write(line_exact, b_val); write(line_exact, ',');
                write(line_exact, int_P_exact);
                writeline(exact_file, line_exact);

                -- Write approximate results
                write(line_approx, a_val); write(line_approx, ',');
                write(line_approx, b_val); write(line_approx, ',');
                write(line_approx, to_integer(unsigned(P_approx)));
                writeline(approx_file, line_approx);
            end loop;
        end loop;

        file_close(exact_file);
        file_close(approx_file);
        wait;
    end process;
end behavior;
