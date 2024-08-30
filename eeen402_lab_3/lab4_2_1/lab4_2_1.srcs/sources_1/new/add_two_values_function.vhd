----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.08.2024 15:20:28
-- Design Name: 
-- Module Name: add_two_values_function - Behavioral
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

entity add_two_values_function is
    Port ( ain : in STD_LOGIC_VECTOR (3 downto 0);
           bin : in STD_LOGIC_VECTOR (3 downto 0);
           sum : out STD_LOGIC_VECTOR (4 downto 0));
end add_two_values_function;

architecture Behavioral of add_two_values_function is
function add_two_values(signal a,b : in STD_LOGIC_VECTOR)
			return std_logic_vector is
	variable sum : STD_LOGIC_VECTOR(4 downto 0);
begin
	sum := std_logic_vector('0' & ain) + std_logic_vector('0' & bin);
	return sum;
end add_two_values;

begin
	process(ain,bin) begin
		sum <= add_two_values(ain, bin);
	end process;

end Behavioral;
