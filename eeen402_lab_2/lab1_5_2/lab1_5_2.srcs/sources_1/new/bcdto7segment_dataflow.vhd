----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.08.2024 16:32:43
-- Design Name: 
-- Module Name: bcdto7segment_dataflow - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bcdto7segment_dataflow is
    Port ( x : in STD_LOGIC_VECTOR (3 downto 0);
           an : out STD_LOGIC_VECTOR (7 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0));
end bcdto7segment_dataflow;

architecture Behavioral of bcdto7segment_dataflow is
begin
	an <= "11111110";

	-- Top segment 0 2 3 5 6 7 8 9 A C E F
	-- OFF 1 4 b d
	--     0001 0100 1011 1101
	seg(0) <= (not x(3) and not x(2) and not x(1) and x(0)) or  	-- 1
                  (not x(3) and x(2) and not x(1) and not x(0)) or    	-- 4
                  (x(3) and not x(2) and x(1) and x(0)) or        	-- b
                  (x(3) and x(2) and not x(1) and x(0));         	-- d

	-- Top-right segment 0 1 2 3 4 7 8 9 A d
	-- OFF 5 6 b C E F
	--     0101 0110 1011 1100 1110 1111
	seg(1) <= (not x(3) and x(2) and not x(1) and x(0)) or    	-- 5
                  (not x(3) and x(2) and x(1) and not x(0)) or    	-- 6
                  (x(3) and not x(2) and x(1) and x(0)) or        	-- B (b)
                  (x(3) and x(2) and not x(1) and not x(0)) or 		-- C (C)
                  (x(3) and x(2) and x(1) and not x(0)) or     		-- E (E)
                  (x(3) and x(2) and x(1) and x(0));              	-- F (F)

	-- Bottom-right segment 0 1 3 4 5 6 7 8 9 A b d
	-- OFF 2 C E F
	--     0010 1100 1110 1111	
	seg(2) <= (not x(3) and not x(2) and x(1) and not x(0)) or  	-- 2
                  (x(3) and x(2) and not x(1) and not x(0)) or     	-- C (C)
                  (x(3) and x(2) and x(1) and not x(0)) or     		-- E (E)
                  (x(3) and x(2) and x(1) and x(0));              	-- F (F)

	-- Bottom segment 0 2 3 5 6 8 b C d E
	-- OFF 1 4 7 9 A F
	--     0001 0100 0111 1001 1010 1111
	seg(3) <= (not x(3) and not x(2) and not x(1) and x(0)) or  	-- 1
                  (not x(3) and x(2) and not x(1) and not x(0)) or    	-- 4
                  (not x(3) and x(2) and x(1) and x(0)) or              -- 7
                  (x(3) and not x(2) and x(1) and not x(0)) or    	-- A (A)
                  (x(3) and x(2) and x(1) and x(0));             	-- F (F)

	-- Bottom-left segment 0 2 6 8 A b C d E F
	-- OFF 1 3 4 5 7 9
	--     0001 0011 0100 0101 0111 1001
	seg(4) <= (not x(3) and not x(2) and not x(1) and x(0)) or  	-- 1
		  (not x(3) and not x(2) and x(1) and x(0)) or         	-- 3
		  (not x(3) and x(2) and not x(1) and not x(0)) or    	-- 4
		  (not x(3) and x(2) and not x(1) and x(0)) or    	-- 5
		  (not x(3) and x(2) and x(1) and x(0)) or             	-- 7
		  (x(3) and not x(2) and not x(1) and x(0));     	-- 9

	-- Top-left segment 0 4 5 6 8 9 A b C E F
	-- OFF 1 2 3 7 d
	--     0001 0010 0011 0111 1101
	seg(5) <= (not x(3) and not x(2) and not x(1) and x(0)) or  	-- 1
		  (not x(3) and not x(2) and x(1) and not x(0)) or  	-- 2
		  (not x(3) and not x(2) and x(1) and x(0)) or         -- 3
		  (not x(3) and x(2) and x(1) and x(0)) or             -- 7
		  (x(3) and x(2) and not x(1) and x(0));          	-- d

	-- Middle 2 3 4 5 6 8 9 A b d E F
	-- OFF 0 1 7 C
	--     0000 0001 0111 1100
	seg(6) <= (not x(3) and not x(2) and not x(1) and not x(0)) or 	-- 0
		  (not x(3) and not x(2) and not x(1) and x(0)) or   	-- 1 
		  (not x(3) and x(2) and x(1) and x(0)) or              -- 7
		  (x(3) and x(2) and not x(1) and not x(0));		-- C (C)

end Behavioral;
