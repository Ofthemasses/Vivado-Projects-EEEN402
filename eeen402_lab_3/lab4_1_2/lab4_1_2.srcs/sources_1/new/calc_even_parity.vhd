----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.08.2024 17:08:26
-- Design Name: 
-- Module Name: calc_even_parity_procedure - Behavioral
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

entity calc_even_parity_procedure is
    Port ( ain : in STD_LOGIC_VECTOR (7 downto 0);
           parity : out STD_LOGIC);
end calc_even_parity_procedure;

architecture Behavioral of calc_even_parity_procedure is

	procedure calc_even_parity (
		signal ain_int : in STD_LOGIC_VECTOR (7 downto 0);
		signal parity_int : out STD_LOGIC
	) is
		variable parity_bit : STD_LOGIC;
	begin
		parity_bit := '0';

		for i in 0 to 7 loop
			parity_bit := parity_bit xor ain_int(i);
		end loop;

		parity_int <=  parity_bit;
	end calc_even_parity;

begin

	process (ain)
	begin
		calc_even_parity(ain, parity);
	end process;
end Behavioral;
