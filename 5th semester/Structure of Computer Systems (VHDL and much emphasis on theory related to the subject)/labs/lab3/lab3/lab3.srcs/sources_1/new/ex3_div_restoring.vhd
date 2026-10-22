----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/22/2026 11:06:37 AM
-- Design Name: 
-- Module Name: ex3_div_restoring - Behavioral
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
use ieee.numeric_std.all;

entity div_restoring is
    port (
        clk       : in  std_logic;
        rst       : in  std_logic;
        start     : in  std_logic;
        x         : in  std_logic_vector(3 downto 0);
        y         : in  std_logic_vector(3 downto 0);
        quotient  : out std_logic_vector(3 downto 0);
        remainder : out std_logic_vector(3 downto 0);
        done      : out std_logic
    );
end entity;

architecture rtl of div_restoring is
    type state_t is (IDLE, WORK, FIN);
    signal state  : state_t := IDLE;

    signal A      : unsigned(4 downto 0) := (others => '0');
    signal B      : unsigned(3 downto 0) := (others => '0');
    signal Q      : unsigned(3 downto 0) := (others => '0');
    signal N      : unsigned(2 downto 0) := (others => '0');
    signal done_r : std_logic := '0';

    signal a_sh   : unsigned(4 downto 0);
    signal diff   : unsigned(4 downto 0);
begin
    a_sh <= A(3 downto 0) & Q(3);
    diff <= a_sh - resize(B, 5);

    process (clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                state  <= IDLE;
                A      <= (others => '0');
                B      <= (others => '0');
                Q      <= (others => '0');
                N      <= (others => '0');
                done_r <= '0';
            else
                case state is
                    when IDLE =>
                        if start = '1' then
                            A      <= (others => '0');
                            B      <= unsigned(y);
                            Q      <= unsigned(x);
                            N      <= to_unsigned(4, 3);
                            done_r <= '0';
                            state  <= WORK;
                        end if;

                    when WORK =>
                        if diff(4) = '1' then
                            A <= a_sh;
                            Q <= Q(2 downto 0) & '0';
                        else
                            A <= diff;
                            Q <= Q(2 downto 0) & '1';
                        end if;
                        N <= N - 1;
                        if N = 1 then
                            state <= FIN;
                        end if;

                    when FIN =>
                        done_r <= '1';
                        state  <= IDLE;
                end case;
            end if;
        end if;
    end process;

    quotient  <= std_logic_vector(Q);
    remainder <= std_logic_vector(A(3 downto 0));
    done      <= done_r;
end architecture;
