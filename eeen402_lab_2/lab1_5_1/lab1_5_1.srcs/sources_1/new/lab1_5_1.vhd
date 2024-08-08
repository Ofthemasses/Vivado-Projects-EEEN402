----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.08.2024 14:46:18
-- Design Name: 
-- Module Name: lab1_5_1 - Behavioral
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

entity lab1_5_1 is
    Port ( u : in STD_LOGIC_VECTOR (1 downto 0);
           y : in STD_LOGIC_VECTOR (1 downto 0);
           w : in STD_LOGIC_VECTOR (1 downto 0);
           s0 : in STD_LOGIC;
           s1 : in STD_LOGIC;
           m : out STD_LOGIC_VECTOR (1 downto 0));
end lab1_5_1;

architecture Behavioral of lab1_5_1 is
	signal result : STD_LOGIC_VECTOR(1 downto 0);
	component two_one_mp_delayed_structural
		Port ( A : in STD_LOGIC_VECTOR (1 downto 0);
		       B : in STD_LOGIC_VECTOR (1 downto 0);
		       C : in STD_LOGIC;
		       D : out STD_LOGIC_VECTOR (1 downto 0)
	       );
	end component;
begin

	U_TOMDS: two_one_mp_delayed_structural
		port map (
			A => u,
			B => y,
			C => s0,
			D => result
		);
	
	process (result, w, s1)
	begin
		if (s1='0') then
			m <= w;
		else
			m <= result;
		end if;
	end process;
end Behavioral;
