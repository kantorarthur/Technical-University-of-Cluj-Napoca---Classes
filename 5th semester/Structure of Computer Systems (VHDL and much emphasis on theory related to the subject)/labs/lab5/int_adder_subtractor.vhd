library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity int_adder_subtractor is
  Port (
    aclk : IN STD_LOGIC;
    aresetn : IN STD_LOGIC;
    s_axis_a_tvalid : IN STD_LOGIC;
    s_axis_a_tready : OUT STD_LOGIC;
    s_axis_a_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axis_b_tvalid : IN STD_LOGIC;
    s_axis_b_tready : OUT STD_LOGIC;
    s_axis_b_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axis_operation_tvalid : IN STD_LOGIC;
    s_axis_operation_tready : OUT STD_LOGIC;
    s_axis_operation_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axis_result_tvalid : OUT STD_LOGIC;
    m_axis_result_tready : IN STD_LOGIC;
    m_axis_result_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
end int_adder_subtractor;

architecture Behavioral of int_adder_subtractor is

type state_type is (S_RECV, S_SEND);
signal state : state_type := S_RECV;

signal inputs_valid, inputs_ready : STD_LOGIC;
signal result : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

begin
    -- all input interfaces hold valid data
    inputs_valid <= s_axis_a_tvalid and s_axis_b_tvalid and s_axis_operation_tvalid;

    -- Rule 3: wait for all TVALIDs, so that all inputs are consumed together
    inputs_ready <= inputs_valid when state = S_RECV else '0';

    s_axis_a_tready <= inputs_ready;
    s_axis_b_tready <= inputs_ready;
    s_axis_operation_tready <= inputs_ready;

    -- Rules 1 and 2: TVALID depends only on the state
    m_axis_result_tvalid <= '1' when state = S_SEND else '0';
    m_axis_result_tdata <= result;

    process(aclk)
    begin
        if rising_edge(aclk) then
            if aresetn = '0' then
                state <= S_RECV;
            else
                case state is
                    when S_RECV =>
                        -- input handshake (TREADY = inputs_valid in this state)
                        if inputs_valid = '1' then
                            if s_axis_operation_tdata = x"00" then
                                result <= s_axis_a_tdata + s_axis_b_tdata;
                            else
                                result <= s_axis_a_tdata - s_axis_b_tdata;
                            end if;
                            state <= S_SEND;
                        end if;

                    when S_SEND =>
                        -- output handshake (TVALID = '1' in this state)
                        if m_axis_result_tready = '1' then
                            state <= S_RECV;
                        end if;
                end case;
            end if;
        end if;
    end process;

end Behavioral;
