----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/22/2026 11:05:20 AM
-- Design Name: 
-- Module Name: ex2_wallace4 - Behavioral
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


library ieee;
use ieee.std_logic_1164.all;

entity wallace4 is
    port (
        x : in  std_logic_vector(3 downto 0);
        y : in  std_logic_vector(3 downto 0);
        p : out std_logic_vector(7 downto 0)
    );
end entity;

architecture structural of wallace4 is
    signal pp : std_logic_vector(15 downto 0);

    signal h3, kh, s4, k5     : std_logic;
    signal hs2, hc2, s3, k4   : std_logic;
    signal hs4, hc4, s5, k6   : std_logic;
    signal c1, c2, c3, c4, c5 : std_logic;

    function idx(i, j : integer) return integer is
    begin
        return i * 4 + j;
    end function;
begin
    gen_i : for i in 0 to 3 generate
        gen_j : for j in 0 to 3 generate
            pp(idx(i, j)) <= x(i) and y(j);
        end generate;
    end generate;

    l1_ha3 : entity work.full_adder
        port map (a => pp(idx(3, 0)), b => pp(idx(2, 1)), cin => '0',
                  s => h3, cout => kh);

    l1_fa4 : entity work.full_adder
        port map (a => pp(idx(1, 3)), b => pp(idx(2, 2)), cin => pp(idx(3, 1)),
                  s => s4, cout => k5);

    l2_ha2 : entity work.full_adder
        port map (a => pp(idx(0, 2)), b => pp(idx(1, 1)), cin => '0',
                  s => hs2, cout => hc2);

    l2_fa3 : entity work.full_adder
        port map (a => pp(idx(0, 3)), b => pp(idx(1, 2)), cin => h3,
                  s => s3, cout => k4);

    l2_ha4 : entity work.full_adder
        port map (a => s4, b => kh, cin => '0',
                  s => hs4, cout => hc4);

    l2_fa5 : entity work.full_adder
        port map (a => pp(idx(2, 3)), b => pp(idx(3, 2)), cin => k5,
                  s => s5, cout => k6);

    p(0) <= pp(idx(0, 0));

    cpa1 : entity work.full_adder
        port map (a => pp(idx(0, 1)), b => pp(idx(1, 0)), cin => '0',
                  s => p(1), cout => c1);

    cpa2 : entity work.full_adder
        port map (a => hs2, b => pp(idx(2, 0)), cin => c1,
                  s => p(2), cout => c2);

    cpa3 : entity work.full_adder
        port map (a => s3, b => hc2, cin => c2,
                  s => p(3), cout => c3);

    cpa4 : entity work.full_adder
        port map (a => hs4, b => k4, cin => c3,
                  s => p(4), cout => c4);

    cpa5 : entity work.full_adder
        port map (a => s5, b => hc4, cin => c4,
                  s => p(5), cout => c5);

    cpa6 : entity work.full_adder
        port map (a => pp(idx(3, 3)), b => k6, cin => c5,
                  s => p(6), cout => p(7));
end architecture;
