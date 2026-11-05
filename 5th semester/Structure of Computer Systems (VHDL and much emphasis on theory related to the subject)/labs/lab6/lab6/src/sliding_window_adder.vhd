library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sliding_window_adder is
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
end sliding_window_adder;

architecture Behavioral of sliding_window_adder is

    type window_t is array (0 to WINDOW_SIZE - 2) of signed(31 downto 0);
    signal window : window_t := (others => (others => '0'));

    signal sum_reg   : signed(31 downto 0) := (others => '0');
    signal out_valid : STD_LOGIC := '0';
    signal can_load  : STD_LOGIC;
    signal fire      : STD_LOGIC;

begin

    assert WINDOW_SIZE >= 2
        report "sliding_window_adder: WINDOW_SIZE must be at least 2"
        severity failure;

    can_load <= (not out_valid) or m_axis_sum_tready;
    fire     <= s_axis_val_tvalid and can_load;

    s_axis_val_tready <= can_load;

    process (aclk)
        variable acc : signed(31 downto 0);
    begin
        if rising_edge(aclk) then
            if aresetn = '0' then
                window    <= (others => (others => '0'));
                sum_reg   <= (others => '0');
                out_valid <= '0';
            else
                if fire = '1' then
                    acc := signed(s_axis_val_tdata);
                    for i in 0 to WINDOW_SIZE - 2 loop
                        acc := acc + window(i);
                    end loop;
                    sum_reg <= acc;

                    window(0) <= signed(s_axis_val_tdata);
                    for i in 1 to WINDOW_SIZE - 2 loop
                        window(i) <= window(i - 1);
                    end loop;

                    out_valid <= '1';
                elsif m_axis_sum_tready = '1' then
                    out_valid <= '0';
                end if;
            end if;
        end if;
    end process;

    m_axis_sum_tvalid <= out_valid;
    m_axis_sum_tdata  <= std_logic_vector(sum_reg);

end Behavioral;
