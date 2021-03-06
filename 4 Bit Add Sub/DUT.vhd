library ieee;
use ieee.std_logic_1164.all;
entity DUT is
   port(input_vector: in std_logic_vector(8 downto 0);
       	output_vector: out std_logic_vector(4 downto 0));
end entity;

architecture DutWrap of DUT is
   component Full_Adder is
     port(A3,A2,A1,A0,B3,B2,B1,B0,M: in std_logic;
         	S3,S2,S1,S0,Cout: out std_logic);
   end component;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: Full_Adder 
			port map (
					-- order of inputs Cin B A
					M  => input_vector(8),
					A3 => input_vector(0),
					A2 => input_vector(1),
					A1 => input_vector(2),
					A0 => input_vector(3),
					B3 => input_vector(4),
					B2 => input_vector(5),
					B1 => input_vector(6),
					B0 => input_vector(7),
					
					S3 => output_vector(4),
					S2 => output_vector(3),
					S1 => output_vector(2),
					S0 => output_vector(1),                -- order of outputs S Cout

					Cout => output_vector(0);

end DutWrap;