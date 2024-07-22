----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.07.2024 13:44:02
-- Design Name: 
-- Module Name: counter_tb - Behavioral
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

entity counter_tb is
--  Port ( );
end counter_tb;

architecture Behavioral of counter_tb is
	Component Counter
		Port (
		clk : in STD_LOGIC;
		direction : in STD_LOGIC;
		count_out : out STD_LOGIC_VECTOR (3 downto 0));
	end Component;
	signal clock : STD_LOGIC := '0';
	signal dir : STD_LOGIC := '0';
	signal count : STD_LOGIC_VECTOR (3 downto 0) := "0000";
	constant clk_period : time := 10 ns;
begin

	uut : counter PORT MAP (
		clk => clock,
		direction => dir,
		count_out => count
	);


	process
	begin
		dir <= '1';
		wait for 200 ns;
		dir <= '0';
		wait for 200 ns;
	end process;

	clock <= not clock after clk_period/2;
end Behavioral;
