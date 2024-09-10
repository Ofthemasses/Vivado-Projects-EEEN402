----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.09.2024 16:19:55
-- Design Name: 
-- Module Name: bit_b_to_g - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bit_b_to_g is
    Generic (
	BIT_WIDTH : integer := 4
    );
    Port ( b_in : in STD_LOGIC_VECTOR (BIT_WIDTH-1 downto 0);
           g_out : out STD_LOGIC_VECTOR (BIT_WIDTH-1 downto 0));
end bit_b_to_g;

architecture Behavioral of bit_b_to_g is
	-- Any bit-width length procedure
	procedure binary_to_gray (
		signal binary_in : in STD_LOGIC_VECTOR;
		signal gray_out : out STD_LOGIC_VECTOR
	) is
	begin
		assert binary_in'length = gray_out'length
		report "Input and Output bit widths must match"
		severity failure;

		gray_out <= binary_in xor std_logic_vector(unsigned(binary_in) srl 1);
	end procedure binary_to_gray;

begin
	process(b_in)
	begin
		binary_to_gray(b_in, g_out);
	end process;


end Behavioral;

