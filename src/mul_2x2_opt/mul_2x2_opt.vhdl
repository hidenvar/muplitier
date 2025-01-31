library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mul_2x2_opt is
  port(
    a, b : in std_logic_vector(1 downto 0);
    Product : out std_logic_vector(3 downto 0) := (others => '0')
  );
end mul_2x2_opt;

architecture behavioral of mul_2x2_opt is
  signal W0 : std_logic;
  signal PP : std_logic_vector(3 downto 0);
  begin
    
    PP(0) <= a(0) and b(0);
    PP(1) <= (a(0) and b(1)) or (a(1) and b(0));
    PP(2) <= a(1) and b(1);
    PP(3) <= '0';
    Product <= PP;
  end behavioral;
