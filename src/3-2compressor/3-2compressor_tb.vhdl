library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Compressor3_2_tb is
end Compressor3_2_tb;


architecture behavioral of Compressor3_2_tb is
    signal A, B, C, sum, carry : std_logic;
    begin
    uut : entity work.Compressor3_2
    port map(
      a => a,
      b => b,
      c => c,
      sum => sum,
      carry => carry
    );

  process
    begin
      A <= '0'; B <= '0'; C <= '0'; wait for 10 ns;  -- 000
      A <= '0'; B <= '0'; C <= '1'; wait for 10 ns;  -- 001
      A <= '0'; B <= '1'; C <= '0'; wait for 10 ns;  -- 010
      A <= '0'; B <= '1'; C <= '1'; wait for 10 ns;  -- 011
      A <= '1'; B <= '0'; C <= '0'; wait for 10 ns;  -- 100
      A <= '1'; B <= '0'; C <= '1'; wait for 10 ns;  -- 101
      A <= '1'; B <= '1'; C <= '0'; wait for 10 ns;  -- 110
      A <= '1'; B <= '1'; C <= '1'; wait for 10 ns;  -- 111
    wait;
  end process;
  
  end behavioral;
  
