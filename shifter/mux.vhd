library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
package MUX_2x1 is
  component mux is
   port (I1,I0,S: in std_logic; Y: out std_logic);
  end component mux;
end package MUX_2x1;  

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
entity mux  is
  port (I1,I0,S: in std_logic; Y: out std_logic);
end entity mux;
architecture Struct of mux is
  signal b1,c1,c2: std_logic;
begin

  n1: INVERTER port map (A=> S, Y=> b1);

  a1: AND_2 port map (A => I0, B => b1, Y => c1);
  a2: AND_2  port map (A => I1, B => S, Y => c2);

  O1: OR_2 port map (A =>c1 , B => c2, Y => Y);
end Struct;