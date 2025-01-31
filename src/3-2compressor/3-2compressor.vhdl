library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Compressor3_2 is
  port (
    a, b, c  : in std_logic;
    sum   : out std_logic;
    carry : out std_logic
  );
end Compressor3_2;

architecture Behavioral of Compressor3_2 is
  signal W0 : std_logic;
  begin
    W0 <= a or c;
    sum <= W0 xor b;
    carry <= W0 and b;
    
  end behavioral;
