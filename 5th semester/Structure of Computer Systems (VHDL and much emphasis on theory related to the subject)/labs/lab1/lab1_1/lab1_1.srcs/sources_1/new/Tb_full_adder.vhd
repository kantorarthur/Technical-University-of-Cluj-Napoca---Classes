----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/08/2026 06:53:20 AM
-- Design Name: 
-- Module Name: Tb_full_adder - Behavioral
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
entity Tb_full_adder is
-- no ports
end Tb_full_adder;
architecture Tb of Tb_full_adder is
-- the Unit Under Test (UUT) declared as a component
component full_adder is
Port ( x : in STD_LOGIC;
y : in STD_LOGIC;
cin : in STD_LOGIC;
s : out STD_LOGIC;
cout : out STD_LOGIC);
end component;
-- signals connected to the inputs of the UUT (initialized)
signal x
: STD_LOGIC := '0';
signal y
: STD_LOGIC := '0';
signal cin : STD_LOGIC := '0';
-- signals connected to the outputs of the UUT
signal s
: STD_LOGIC;
signal cout : STD_LOGIC;
-- duration of each input combination
constant T : time := 10 ns;
begin
-- instantiate the UUT and map its ports to the internal signals
uut: full_adder port map (
x
=> x,
y
=> y,
cin => cin,
s
=> s,
cout => cout
);
-- stimuli: concurrent assignments that apply all 8 input combinations
x
<= '0', '1' after 4 * T;
y
<= '0', '1' after 2 * T, '0' after 4 * T, '1' after 6 * T;
cin <= '0', '1' after T,
'0' after 2 * T, '1' after 3 * T,
'0' after 4 * T, '1' after 5 * T, '0' after 6 * T,
'1' after 7 * T;
end Tb;