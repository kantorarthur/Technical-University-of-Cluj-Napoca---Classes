library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity saturator is
    Port (
        aclk              : IN  STD_LOGIC;
        aresetn           : IN  STD_LOGIC;
        s_axis_val_tvalid : IN  STD_LOGIC;
        s_axis_val_tready : OUT STD_LOGIC;
        s_axis_val_tdata  : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
        s_axis_max_tvalid : IN  STD_LOGIC;
        s_axis_max_tready : OUT STD_LOGIC;
        s_axis_max_tdata  : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
        s_axis_min_tvalid : IN  STD_LOGIC;
        s_axis_min_tready : OUT STD_LOGIC;
        s_axis_min_tdata  : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
        m_axis_val_tvalid : OUT STD_LOGIC;
        m_axis_val_tready : IN  STD_LOGIC;
        m_axis_val_tdata  : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
end saturator;

architecture Behavioral of saturator is

    signal out_valid : STD_LOGIC := '0';
    signal out_data  : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal all_valid : STD_LOGIC;
    signal can_load  : STD_LOGIC;
    signal fire      : STD_LOGIC;
    signal sat_value : STD_LOGIC_VECTOR(31 downto 0);

begin

    can_load  <= (not out_valid) or m_axis_val_tready;
    all_valid <= s_axis_val_tvalid and s_axis_max_tvalid and s_axis_min_tvalid;
    fire      <= all_valid and can_load;

    s_axis_val_tready <= fire;
    s_axis_max_tready <= fire;
    s_axis_min_tready <= fire;

    sat_value <= s_axis_max_tdata when signed(s_axis_val_tdata) > signed(s_axis_max_tdata) else
                 s_axis_min_tdata when signed(s_axis_val_tdata) < signed(s_axis_min_tdata) else
                 s_axis_val_tdata;

    process (aclk)
    begin
        if rising_edge(aclk) then
            if aresetn = '0' then
                out_valid <= '0';
                out_data  <= (others => '0');
            else
                if fire = '1' then
                    out_data  <= sat_value;
                    out_valid <= '1';
                elsif m_axis_val_tready = '1' then
                    out_valid <= '0';
                end if;
            end if;
        end if;
    end process;

    m_axis_val_tvalid <= out_valid;
    m_axis_val_tdata  <= out_data;

end Behavioral;
