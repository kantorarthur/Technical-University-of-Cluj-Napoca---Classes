    ----------------------------------------------------------------------------------
    -- Company: 
    -- Engineer: 
    -- 
    -- Create Date: 10/08/2026 07:59:29 AM
    -- Design Name: 
    -- Module Name: ripple_carry_adder - Behavioral
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
    
    entity ripple_carry_adder is
     Port ( x, y : in STD_LOGIC_VECTOR(3 downto 0);
            cin : in STD_LOGIC;
            s : out STD_LOGIC_VECTOR(3 downto 0);
            cout : out STD_LOGIC);
    end ripple_carry_adder;
    
    architecture Behavioral of ripple_carry_adder is
    
    component full_adder is
     Port ( x : in STD_LOGIC;
            Y : in STD_LOGIC;
            cin : in STD_LOGIC;
            s : out STD_LOGIC;
            cout : out STD_LOGIC);
    end component;
    
    signal c : STD_LOGIC_VECTOR(3 downto 0);
    
    --cin: adaugi carry la adunare daca vrei
    --s: iti zice daca a ramas carry dupa adunare
    --cout: acolo este rezultatul x + y (+ cin daca e cazul)
    --s: adaugi carry daca vrei la adunare
    --x, y: variabilele intre care se face adunarea
    
begin
    c(0) <= cin;

    adder0: full_adder port map (
        x => x(0),
        y => y(0),
        cin => c(0),
        s => s(0),
        cout => c(1)
    );

    adder1: full_adder port map (
        x => x(1),
        y => y(1),
        cin => c(1),
        s => s(1),
        cout => c(2)
    );

    adder2: full_adder port map (
        x => x(2),
        y => y(2),
        cin => c(2),
        s => s(2),
        cout => c(3)
    );

    adder3: full_adder port map (
        x => x(3),
        y => y(3),
        cin => c(3),
        s => s(3),
        cout => cout
    );
end Behavioral;