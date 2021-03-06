library ieee;
use ieee.std_logic_1164.all;
entity DUT is
   port(input_vector: in std_logic_vector(15 downto 0);
       	output_vector: out std_logic_vector(8 downto 0));
end entity;

architecture DutWrap of DUT is
   component adder_8bit is
     port(A0,A1,A2,A3,A4,A5,A6,A7,B0,B1,B2,B3,B4,B5,B6,B7: in std_logic;
         	S0,S1,S2,S3,S4,S5,S6,S7,C: out std_logic);
   end component;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: Adder_8bit 
			port map (
					-- order of inputs Cin B A 
					A7 => input_vector(15),
					A6   => input_vector(14),
					A5   => input_vector(13),
					A4   => input_vector(12),
					A3   => input_vector(11),
					A2   => input_vector(10),
					A1   => input_vector(9),
					A0   => input_vector(8),
					B7   => input_vector(7),
					B6   => input_vector(6),
					B5   => input_vector(5),
					B4   => input_vector(4),
					B3   => input_vector(3),
					B2   => input_vector(2),
					B1   => input_vector(1),
					B0   => input_vector(0),
                                        -- order of outputs S Cout
					S7 => output_vector(7),
					S6 => output_vector(6),
					S5 => output_vector(5),
					S4 => output_vector(4),
					S3 => output_vector(3),
					S2 => output_vector(2),
					S1 => output_vector(1),
					S0 => output_vector(0),
					C => output_vector(8)
					);

end DutWrap;

