----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/08/2026 11:32:42 AM
-- Design Name: 
-- Module Name: carry_lookahead_adder - Behavioral
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

entity carry_lookahead_adder is
Port ( x, y : in STD_LOGIC_VECTOR(3 downto 0);
       cin : in STD_LOGIC;
       s : out STD_LOGIC_VECTOR(3 downto 0);
       cout : out STD_LOGIC
       );
end carry_lookahead_adder;

architecture Behavioral of carry_lookahead_adder is

signal g : STD_LOGIC_VECTOR(3 downto 0);
signal p : STD_LOGIC_VECTOR(3 downto 0);
signal c : STD_LOGIC_VECTOR(3 downto 0);

begin

g(0) <= x(0) and y(0);
g(1) <= x(1) and y(1);
g(2) <= x(2) and y(2);
g(3) <= x(3) and y(3);

p(0) <= x(0) xor y(0);
p(1) <= x(1) xor y(1);
p(2) <= x(2) xor y(2);
p(3) <= x(3) xor y(3);

c(0) <= cin;
c(1) <= g(0) or (p(0) and cin);
c(2) <= g(1) or (p(1) and g(0)) or (p(1) and p(0) and cin);
c(3) <= g(2) or (p(2) and g(1)) or (p(2) and p(1) and g(0))
        or (p(2) and p(1) and p(0) and cin);

cout <= g(3) or (p(3) and g(2)) or (p(3) and p(2) and g(1))
        or (p(3) and p(2) and p(1) and g(0))
        or (p(3) and p(2) and p(1) and p(0) and cin);

s <= p xor c;

end Behavioral;
