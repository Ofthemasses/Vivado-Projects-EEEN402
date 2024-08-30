----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.08.2024 17:21:14
-- Design Name: 
-- Module Name: calc_ones_function - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity calc_ones_function is
    Port ( ain : in STD_LOGIC_VECTOR (7 downto 0);
           number_of_ones : out STD_LOGIC_VECTOR (2 downto 0));
end calc_ones_function;

architecture Behavioral of calc_ones_function is
function calc_ones(signal ain : in STD_LOGIC_VECTOR)
		return std_logic_vector is
	variable number_of_ones : STD_LOGIC_VECTOR(2 downto 0);
begin	
	for i in 0 to 7 loop
		if ain(i) = '1' then
			number_of_ones := number_of_ones + 1;
		end if;
	end loop;
	return number_of_ones;
end calc_ones;

begin
process(ain) begin
	number_of_ones <= calc_ones(ain);
end process;


end Behavioral;
