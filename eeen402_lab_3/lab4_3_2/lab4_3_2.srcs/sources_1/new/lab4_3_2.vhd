----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.08.2024 15:14:55
-- Design Name: 
-- Module Name: waveform_generation - Behavioral
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

entity waveform_generation is
    Port ( A : out STD_LOGIC;
           G1 : out STD_LOGIC;
           G2 : out STD_LOGIC
   	);
end waveform_generation;

architecture Behavioral of waveform_generation is

begin

process
begin
	A <= '0';
	G1 <= '0';
	G2 <= '1';
	A <= transport '1' after 40 ns;
	A <= transport '0' after 100 ns;
	G1 <= transport '1' after 60 ns;
	G1 <= transport '0' after 120 ns;
	G2 <= transport '0' after 80 ns;
	G2 <= transport '1' after 140 ns;
	wait;
end process;

end Behavioral;
