----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.08.2024 15:58:03
-- Design Name: 
-- Module Name: waveform_generation_tb - Behavioral
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
use STD.ENV.STOP;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity waveform_generation_tb is
end waveform_generation_tb;

architecture Behavioral of waveform_generation_tb is

    -- Component declaration for the Unit Under Test (UUT)
    component waveform_generation
    Port ( A : out STD_LOGIC;
           G1 : out STD_LOGIC;
           G2 : out STD_LOGIC
    );
    end component;

    -- Signals to connect to UUT
    signal A_tb : STD_LOGIC;
    signal G1_tb : STD_LOGIC;
    signal G2_tb : STD_LOGIC;

    procedure Check_Signal_Over_Period(
    	signal sig : in STD_LOGIC;
    	signal_name : string;
    	expected_value : in STD_LOGIC;
    	start_period : time;
	end_period : time
    ) is
    begin
	    for i in start_period / 1 ns to end_period / 1 ns - 1 loop
		    if sig /= expected_value then 
			    report signal_name & " was " & std_logic'image(sig) & " at " &
			    integer'image(i) & "ns. Expected " & std_logic'image(expected_value) & 
			    " between " & integer'image(start_period / 1 ns) &"ns and " & 
			    integer'image(end_period / 1 ns) & "ns"
			    severity failure;
		    end if;
		    wait for 1 ns;
	    end loop;
    end procedure;
			    
begin

    -- Instantiate the Unit Under Test (UUT)
    uut: waveform_generation
    Port map (
        A => A_tb,
        G1 => G1_tb,
        G2 => G2_tb
    );

    test_A_process: process
    begin
	    Check_Signal_Over_Period(A_tb, "A", 'U', 0 ns, 1 ns);
	    Check_Signal_Over_Period(A_tb, "A", '0', 1 ns, 40 ns);
	    Check_Signal_Over_Period(A_tb, "A", '1', 40 ns, 100 ns);
	    Check_Signal_Over_Period(A_tb, "A", '0', 100 ns, 150 ns);
    end process;

    test_G1_process: process
    begin
	    Check_Signal_Over_Period(G1_tb, "G1", 'U', 0 ns, 1 ns);
	    Check_Signal_Over_Period(G1_tb, "G1", '0', 1 ns, 60 ns);
	    Check_Signal_Over_Period(G1_tb, "G1", '1', 60 ns, 120 ns);
	    Check_Signal_Over_Period(G1_tb, "G1", '0', 120 ns, 150 ns);
    end process;

    test_G2_process: process
    begin
	    Check_Signal_Over_Period(G2_tb, "G2", 'U', 0 ns, 1 ns);
	    Check_Signal_Over_Period(G2_tb, "G2", '1', 1 ns, 80 ns);
	    Check_Signal_Over_Period(G2_tb, "G2", '0', 80 ns, 140 ns);
	    Check_Signal_Over_Period(G2_tb, "G2", '1', 140 ns, 150 ns);
    end process;
    -- Stimulus process to run the simulation
    test_length_process: process
    begin	
        -- Wait 150 ns for the simulation to end
        wait for 150 ns;
	stop;
    end process;

end Behavioral;
