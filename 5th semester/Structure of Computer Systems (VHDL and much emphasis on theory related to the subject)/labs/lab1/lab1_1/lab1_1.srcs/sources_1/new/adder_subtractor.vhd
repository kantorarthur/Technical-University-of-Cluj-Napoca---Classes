----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/08/2026 11:50:53 AM
-- Design Name: 
-- Module Name: adder_subtractor - Behavioral
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

entity adder_subtractor is
Port ( op : in STD_LOGIC;
       x, y : in STD_LOGIC_VECTOR(3 downto 0);
       s : out STD_LOGIC_VECTOR(3 downto 0)
 );
end adder_subtractor;

architecture Behavioral of adder_subtractor is

component full_adder is
     Port ( x : in STD_LOGIC;
            Y : in STD_LOGIC;
            cin : in STD_LOGIC;
            s : out STD_LOGIC;
            cout : out STD_LOGIC);
    end component;

signal c : std_logic_vector(4 downto 0);
signal inversed_y : std_logic_vector(3 downto 0);

begin
    
    inversed_y(0) <= y(0) xor op;
    inversed_y(1) <= y(1) xor op;
    inversed_y(2) <= y(2) xor op;
    inversed_y(3) <= y(3) xor op;

  adder0: full_adder port map (
        x => x(0),
        y => inversed_y(0),
        cin => op,
        s => s(0),
        cout => c(1)
    );

    adder1: full_adder port map (
        x => x(1),
        y => inversed_y(1),
        cin => c(1),
        s => s(1),
        cout => c(2)
    );

    adder2: full_adder port map (
        x => x(2),
        y => inversed_y(2),
        cin => c(2),
        s => s(2),
        cout => c(3)
    );

    adder3: full_adder port map (
        x => x(3),
        y => inversed_y(3),
        cin => c(3),
        s => s(3),
        cout => c(4)
    );



end Behavioral;
