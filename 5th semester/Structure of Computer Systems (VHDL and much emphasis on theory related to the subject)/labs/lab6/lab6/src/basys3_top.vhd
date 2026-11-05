library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity basys3_top is
    Port ( clk : in STD_LOGIC;
           btn : in STD_LOGIC_VECTOR (4 downto 0);
           sw  : in STD_LOGIC_VECTOR (15 downto 0);
           led : out STD_LOGIC_VECTOR (15 downto 0);
           an  : out STD_LOGIC_VECTOR (3 downto 0);
           cat : out STD_LOGIC_VECTOR (6 downto 0));
end basys3_top;

architecture Behavioral of basys3_top is

    component saturated_window_adder is
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
    end component;

    component debouncer is
        Port ( clk : in  std_logic;
               btn : in  std_logic;
               en  : out std_logic );
    end component;

    component display_7seg is
        Port ( digit0 : in  STD_LOGIC_VECTOR (3 downto 0);
               digit1 : in  STD_LOGIC_VECTOR (3 downto 0);
               digit2 : in  STD_LOGIC_VECTOR (3 downto 0);
               digit3 : in  STD_LOGIC_VECTOR (3 downto 0);
               clk    : in  STD_LOGIC;
               cat    : out STD_LOGIC_VECTOR (6 downto 0);
               an     : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    constant WINDOW_SIZE : integer := 5;
    constant VAL     : STD_LOGIC_VECTOR(31 downto 0) := x"00000014";
    constant MIN_VAL : STD_LOGIC_VECTOR(31 downto 0) := x"FFFFFFF6";
    constant MAX_VAL : STD_LOGIC_VECTOR(31 downto 0) := x"0000000A";

    signal send    : STD_LOGIC;
    signal rst     : STD_LOGIC;
    signal aresetn : STD_LOGIC;
    signal sum     : STD_LOGIC_VECTOR(31 downto 0);

    signal val_tready_dummy : STD_LOGIC;
    signal max_tready_dummy : STD_LOGIC;
    signal min_tready_dummy : STD_LOGIC;
    signal sum_tvalid_dummy : STD_LOGIC;

    attribute dont_touch : string;
    attribute dont_touch of dut_inst : label is "true";

begin

    send_btn : debouncer
        port map ( clk => clk, btn => btn(0), en => send );

    rst_btn : debouncer
        port map ( clk => clk, btn => btn(1), en => rst );

    aresetn <= not rst;

    dut_inst : saturated_window_adder
        generic map (WINDOW_SIZE => WINDOW_SIZE)
        port map (
            aclk              => clk,
            aresetn           => aresetn,
            s_axis_val_tvalid => send,
            s_axis_val_tready => val_tready_dummy,
            s_axis_val_tdata  => VAL,
            s_axis_max_tvalid => send,
            s_axis_max_tready => max_tready_dummy,
            s_axis_max_tdata  => MAX_VAL,
            s_axis_min_tvalid => send,
            s_axis_min_tready => min_tready_dummy,
            s_axis_min_tdata  => MIN_VAL,
            m_axis_sum_tvalid => sum_tvalid_dummy,
            m_axis_sum_tready => '1',
            m_axis_sum_tdata  => sum
        );

    display : display_7seg
        port map (
            digit0 => sum(3 downto 0),
            digit1 => sum(7 downto 4),
            digit2 => sum(11 downto 8),
            digit3 => sum(15 downto 12),
            clk    => clk,
            cat    => cat,
            an     => an
        );

    led <= sum(31 downto 16);

end Behavioral;
