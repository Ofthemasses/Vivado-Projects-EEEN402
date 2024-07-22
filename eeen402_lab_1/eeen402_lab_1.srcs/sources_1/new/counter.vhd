----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.07.2024 13:32:05
-- Design Name: 
-- Module Name: counter - Behavioral
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

entity counter is
    Port ( clk : in STD_LOGIC;
           direction : in STD_LOGIC;
   	   switch : in STD_LOGIC_VECTOR (7 downto 0); 
           count_out : out STD_LOGIC_VECTOR (3 downto 0);
	   seg_out : out STD_LOGIC_VECTOR (6 downto 0);
	   anode : out STD_LOGIC_VECTOR (7 downto 0)
		);
end counter;

architecture Behavioral of counter is
	signal count_int : unsigned(27 downto 0) := (others => '0');
	Component ssd_decoder is
		Port (
			bin : in STD_LOGIC_VECTOR(3 downto 0);
			switch : in STD_LOGIC_VECTOR(7 downto 0);
			seg_out : out STD_LOGIC_VECTOR(6 downto 0);
			anode : out STD_LOGIC_VECTOR(7 downto 0));
	end Component;

begin
	ssd: ssd_decoder PORT MAP (
		bin => STD_LOGIC_VECTOR (count_int(27 downto 24)),
		switch => switch,
		seg_out => seg_out,
		anode => anode
	);

	process (clk)
	begin
	   if clk = '1' and clk'event then
	      if direction ='1' then
		 count_int  <= count_int + 1;
	      else
		 count_int <= count_int - 1;
	      end if;
	   end if;
	end process;

	count_out <= std_logic_vector(count_int(27 downto 24));

end Behavioral;
