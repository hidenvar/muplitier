library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mul_2x2_opt_tb is
end mul_2x2_opt_tb;


architecture behavioral of mul_2x2_opt_tb is
  signal a, b : std_logic_vector(1 downto 0);
  signal Product : std_logic_vector(3 downto 0) := (others => '0');
  begin

  UUT : entity work.mul_2x2_opt
  port map(
    a => a,
    b => b,
    Product => Product
  );

  process
    begin
    
    a <= "00"; b <= "01"; wait for 10 ns; 
    a <= "01"; b <= "10"; wait for 10 ns; 
    a <= "10"; b <= "11"; wait for 10 ns; 
    a <= "11"; b <= "11"; wait for 10 ns;
    
    wait; 
  end process;
  
end behavioral;
