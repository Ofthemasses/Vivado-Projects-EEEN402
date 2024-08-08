----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.08.2024 18:52:28
-- Design Name: 
-- Module Name: two-one-mp-delayed-structural - two-one-mp-delayed-struct
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

entity two_one_mp_delayed_structural is
    Port ( A : in STD_LOGIC_VECTOR (1 downto 0);
           B : in STD_LOGIC_VECTOR (1 downto 0);
           C : in STD_LOGIC;
           D : out STD_LOGIC_VECTOR (1 downto 0));
end two_one_mp_delayed_structural;

architecture Behavioural of two_one_mp_delayed_structural is

begin
	D <= (A and not (C & C)) or (B and (C & C));
end Behavioural;
