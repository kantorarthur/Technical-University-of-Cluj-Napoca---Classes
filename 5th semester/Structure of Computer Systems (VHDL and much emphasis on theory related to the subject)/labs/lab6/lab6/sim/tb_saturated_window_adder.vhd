library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

entity tb_saturated_window_adder is
    Generic ( WINDOW_SIZE : integer := 5; N_SAMPLES : integer := 2000 );
end tb_saturated_window_adder;

architecture sim of tb_saturated_window_adder is

    signal aclk, aresetn : std_logic := '0';
    signal val_v, max_v, min_v : std_logic := '0';
    signal val_r, max_r, min_r : std_logic;
    signal val_d, max_d, min_d : std_logic_vector(31 downto 0) := (others => '0');
    signal sum_v : std_logic;
    signal sum_r : std_logic := '0';
    signal sum_d : std_logic_vector(31 downto 0);

    constant T : time := 10 ns;
    type int_arr is array (natural range <>) of signed(31 downto 0);
    signal expected : int_arr(0 to N_SAMPLES - 1);
    signal done_in, done_out : boolean := false;

begin

    aclk <= not aclk after T / 2 when not (done_in and done_out) else '0';

    dut : entity work.saturated_window_adder
        generic map (WINDOW_SIZE => WINDOW_SIZE)
        port map (aclk, aresetn,
                  val_v, val_r, val_d, max_v, max_r, max_d, min_v, min_r, min_d,
                  sum_v, sum_r, sum_d);

    producer : process
        variable s1, s2 : positive := 7;
        variable r : real;
        variable v, lo, hi, sat : integer;
        type hist_t is array (0 to WINDOW_SIZE - 1) of signed(31 downto 0);
        variable hist : hist_t := (others => (others => '0'));
        variable acc : signed(31 downto 0);
        impure function rnd(a, b : integer) return integer is
        begin
            uniform(s1, s2, r);
            return a + integer(floor(r * real(b - a + 1)));
        end function;
    begin
        aresetn <= '0';
        wait for 5 * T;
        wait until rising_edge(aclk);
        aresetn <= '1';
        for k in 0 to N_SAMPLES - 1 loop
            v  := rnd(-1000, 1000);
            lo := rnd(-500, 0);
            hi := rnd(0, 500);
            if v > hi then sat := hi; elsif v < lo then sat := lo; else sat := v; end if;
            for i in WINDOW_SIZE - 1 downto 1 loop hist(i) := hist(i - 1); end loop;
            hist(0) := to_signed(sat, 32);
            acc := (others => '0');
            for i in 0 to WINDOW_SIZE - 1 loop acc := acc + hist(i); end loop;
            expected(k) <= acc;
            while rnd(0, 3) = 0 loop wait until rising_edge(aclk); end loop;
            val_d <= std_logic_vector(to_signed(v, 32));
            min_d <= std_logic_vector(to_signed(lo, 32));
            max_d <= std_logic_vector(to_signed(hi, 32));
            val_v <= '1'; max_v <= '1'; min_v <= '1';
            loop
                wait until rising_edge(aclk);
                exit when val_r = '1';
            end loop;
            val_v <= '0'; max_v <= '0'; min_v <= '0';
        end loop;
        done_in <= true;
        wait;
    end process;

    consumer : process
        variable s1, s2 : positive := 3;
        variable r : real;
        variable cnt : integer := 0;
        variable errors : integer := 0;
    begin
        while cnt < N_SAMPLES loop
            uniform(s1, s2, r);
            if r < 0.6 then sum_r <= '1'; else sum_r <= '0'; end if;
            wait until rising_edge(aclk);
            if sum_v = '1' and sum_r = '1' then
                if signed(sum_d) /= expected(cnt) then
                    errors := errors + 1;
                    report "MISMATCH at sample " & integer'image(cnt) &
                           ": got " & integer'image(to_integer(signed(sum_d))) &
                           " expected " & integer'image(to_integer(expected(cnt)))
                        severity error;
                end if;
                cnt := cnt + 1;
            end if;
        end loop;
        report "WINDOW_SIZE=" & integer'image(WINDOW_SIZE) & ": " &
               integer'image(N_SAMPLES) & " samples, " &
               integer'image(errors) & " errors" severity note;
        done_out <= true;
        wait;
    end process;

end sim;
