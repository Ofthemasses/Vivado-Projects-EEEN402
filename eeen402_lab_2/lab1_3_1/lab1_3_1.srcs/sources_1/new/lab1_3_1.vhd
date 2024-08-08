----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.08.2024 18:34:35
-- Design Name: 
-- Module Name: lab1_3_1 - Structural
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

entity lab1_3_1 is
    Port ( x : in STD_LOGIC_VECTOR (1 downto 0);
           y : in STD_LOGIC_VECTOR (1 downto 0);
           s : in STD_LOGIC;
           m : out STD_LOGIC_VECTOR (1 downto 0));
end lab1_3_1;

architecture Structural of lab1_3_1 is
	component two_one_mp_delayed_structural
		Port (  A : in STD_LOGIC_VECTOR (1 downto 0);
			B : in STD_LOGIC_VECTOR (1 downto 0);
			C : in STD_LOGIC;
			D : out STD_LOGIC_VECTOR (1 downto 0)
		);
	end component;

begin
	U_TOMDS: two_one_mp_delayed_structural
		port map (
			A => x,
			B => y,
			C => s,
			D => m
		);

end Structural;
