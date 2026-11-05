library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity saturated_window_adder is
    Generic (
        WINDOW_SIZE : integer := 5
    );
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
        m_axis_sum_tvalid : OUT STD_LOGIC;
        m_axis_sum_tready : IN  STD_LOGIC;
        m_axis_sum_tdata  : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
end saturated_window_adder;

architecture Behavioral of saturated_window_adder is

    component saturator is
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
    end component;

    component sliding_window_adder is
        Generic (
            WINDOW_SIZE : integer := 5
        );
        Port (
            aclk              : IN  STD_LOGIC;
            aresetn           : IN  STD_LOGIC;
            s_axis_val_tvalid : IN  STD_LOGIC;
            s_axis_val_tready : OUT STD_LOGIC;
            s_axis_val_tdata  : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
            m_axis_sum_tvalid : OUT STD_LOGIC;
            m_axis_sum_tready : IN  STD_LOGIC;
            m_axis_sum_tdata  : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
        );
    end component;

    signal sat_tvalid : STD_LOGIC;
    signal sat_tready : STD_LOGIC;
    signal sat_tdata  : STD_LOGIC_VECTOR(31 downto 0);

begin

    sat_inst : saturator
        port map (
            aclk              => aclk,
            aresetn           => aresetn,
            s_axis_val_tvalid => s_axis_val_tvalid,
            s_axis_val_tready => s_axis_val_tready,
            s_axis_val_tdata  => s_axis_val_tdata,
            s_axis_max_tvalid => s_axis_max_tvalid,
            s_axis_max_tready => s_axis_max_tready,
            s_axis_max_tdata  => s_axis_max_tdata,
            s_axis_min_tvalid => s_axis_min_tvalid,
            s_axis_min_tready => s_axis_min_tready,
            s_axis_min_tdata  => s_axis_min_tdata,
            m_axis_val_tvalid => sat_tvalid,
            m_axis_val_tready => sat_tready,
            m_axis_val_tdata  => sat_tdata
        );

    swa_inst : sliding_window_adder
        generic map (WINDOW_SIZE => WINDOW_SIZE)
        port map (
            aclk              => aclk,
            aresetn           => aresetn,
            s_axis_val_tvalid => sat_tvalid,
            s_axis_val_tready => sat_tready,
            s_axis_val_tdata  => sat_tdata,
            m_axis_sum_tvalid => m_axis_sum_tvalid,
            m_axis_sum_tready => m_axis_sum_tready,
            m_axis_sum_tdata  => m_axis_sum_tdata
        );

end Behavioral;
