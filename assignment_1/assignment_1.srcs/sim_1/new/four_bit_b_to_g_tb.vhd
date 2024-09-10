----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.09.2024 16:45:08
-- Design Name: 
-- Module Name: four_bit_b_to_g_tb - Behavioral
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

entity four_bit_b_to_g_tb is
end four_bit_b_to_g_tb;

architecture Behavioral of four_bit_b_to_g_tb is
	component bit_b_to_g
		Generic (
			BIT_WIDTH : integer := 4
		);
		Port ( b_in : in STD_LOGIC_VECTOR(3 downto 0);
			g_out : out STD_LOGIC_VECTOR(3 downto 0)
	);
	end component;
	signal binary_in : STD_LOGIC_VECTOR(3 downto 0);
	signal gray_out : STD_LOGIC_VECTOR(3 downto 0);

begin
	uut: bit_b_to_g
		Generic map (
			BIT_WIDTH => 4
		)
		Port map  (
			b_in => binary_in,
			g_out => gray_out
		);

	process begin
		binary_in <= "1010";
		wait for 10 ns;
		assert gray_out = "1111" report "Test case 1 failed" severity error;

		binary_in <= "1111";
		wait for 10 ns;
		assert gray_out = "1000" report "Test case 2 failed" severity error;

		binary_in <= "0110";
		wait for 10 ns;
		assert gray_out = "0101" report "Test case 3 failed" severity error;

	end process;

end Behavioral;
