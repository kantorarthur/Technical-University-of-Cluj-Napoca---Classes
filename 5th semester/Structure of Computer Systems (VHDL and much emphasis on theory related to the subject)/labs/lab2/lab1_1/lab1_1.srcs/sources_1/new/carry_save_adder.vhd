----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/22/2026 08:34:45 AM
-- Design Name: 
-- Module Name: carry_save_adder - Behavioral
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

entity carry_save_adder is
    Port ( x, y, z : in  STD_LOGIC_VECTOR(3 downto 0);
           s       : out STD_LOGIC_VECTOR(5 downto 0)
         );
end carry_save_adder;

architecture Behavioral of carry_save_adder is

component full_adder is
    Port ( x    : in  STD_LOGIC;
           y    : in  STD_LOGIC;
           cin  : in  STD_LOGIC;
           s    : out STD_LOGIC;
           cout : out STD_LOGIC);
end component;

component ripple_carry_adder is
    Port ( x, y : in  STD_LOGIC_VECTOR(3 downto 0);
           cin  : in  STD_LOGIC;
           s    : out STD_LOGIC_VECTOR(3 downto 0);
           cout : out STD_LOGIC);
end component;

signal s1   : STD_LOGIC_VECTOR(3 downto 0);  
signal c1   : STD_LOGIC_VECTOR(3 downto 0);  
signal a, b : STD_LOGIC_VECTOR(3 downto 0);  
signal sum2 : STD_LOGIC_VECTOR(3 downto 0);
signal cout2: STD_LOGIC;

begin

    fa0: full_adder port map (x => x(0), y => y(0), cin => z(0), s => s1(0), cout => c1(0));
    fa1: full_adder port map (x => x(1), y => y(1), cin => z(1), s => s1(1), cout => c1(1));
    fa2: full_adder port map (x => x(2), y => y(2), cin => z(2), s => s1(2), cout => c1(2));
    fa3: full_adder port map (x => x(3), y => y(3), cin => z(3), s => s1(3), cout => c1(3));

    a <= '0' & s1(3 downto 1);  
    b <= c1;                     

    rca: ripple_carry_adder port map (
        x    => a,
        y    => b,
        cin  => '0',
        s    => sum2,
        cout => cout2
    );

    s <= cout2 & sum2 & s1(0);

end Behavioral;
