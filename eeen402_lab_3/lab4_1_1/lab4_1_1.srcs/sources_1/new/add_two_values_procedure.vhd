----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.08.2024 14:26:54
-- Design Name: 
-- Module Name: add_two_values_procedure - Behavioral
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

entity add_two_values_procedure is
    Port ( ain : in STD_LOGIC_VECTOR (3 downto 0);
           bin : in STD_LOGIC_VECTOR (3 downto 0);
           sum : out STD_LOGIC_VECTOR (3 downto 0);
           cout : out STD_LOGIC);
end add_two_values_procedure;

architecture Behavioral of add_two_values_procedure is

	signal total_out : STD_LOGIC_VECTOR (4 downto 0);

	procedure add_two_values (
		signal a_int : in STD_LOGIC_VECTOR (3 downto 0);
		signal b_int : in STD_LOGIC_VECTOR (3 downto 0);
		signal total_out_int : out STD_LOGIC_VECTOR (4 downto 0)
	) is
	begin
		total_out_int(4 downto 0) <= ('0' & a_int) + ('0' & b_int);
	end add_two_values;

begin
	cout <= total_out(4);
	sum <= total_out(3 downto 0);

	process (ain, bin)
	begin
		add_two_values (ain, bin, total_out);
	end process;
end Behavioral;
