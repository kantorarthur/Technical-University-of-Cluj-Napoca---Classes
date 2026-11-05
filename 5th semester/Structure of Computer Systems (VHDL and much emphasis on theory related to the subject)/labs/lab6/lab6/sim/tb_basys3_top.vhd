library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_basys3_top is
end tb_basys3_top;

architecture sim of tb_basys3_top is

    signal clk : std_logic := '0';
    signal btn : std_logic_vector(4 downto 0) := (others => '0');
    signal sw  : std_logic_vector(15 downto 0) := (others => '0');
    signal led : std_logic_vector(15 downto 0);
    signal an  : std_logic_vector(3 downto 0);
    signal cat : std_logic_vector(6 downto 0);
    signal finished : boolean := false;

    constant T : time := 10 ns;
    constant HOLD : time := 200000 * T;

    function seg2hex(c : std_logic_vector(6 downto 0)) return integer is
    begin
        case c is
            when "1000000" => return 0;  when "1111001" => return 1;
            when "0100100" => return 2;  when "0110000" => return 3;
            when "0011001" => return 4;  when "0010010" => return 5;
            when "0000010" => return 6;  when "1111000" => return 7;
            when "0000000" => return 8;  when "0010000" => return 9;
            when "0001000" => return 10; when "0000011" => return 11;
            when "1000110" => return 12; when "0100001" => return 13;
            when "0000110" => return 14; when "0001110" => return 15;
            when others    => return -1;
        end case;
    end function;

begin

    clk <= not clk after T / 2 when not finished else '0';

    uut : entity work.basys3_top
        port map (clk => clk, btn => btn, sw => sw, led => led, an => an, cat => cat);

    stim : process
        variable errors : integer := 0;

        procedure press(b : integer) is
        begin
            btn(b) <= '1'; wait for HOLD;
            btn(b) <= '0'; wait for HOLD;
        end procedure;

        procedure read_display(value : out integer) is
            variable d : integer;
            variable v : integer := 0;
        begin
            for i in 0 to 3 loop
                case i is
                    when 0 => wait until an = "1110";
                    when 1 => wait until an = "1101";
                    when 2 => wait until an = "1011";
                    when others => wait until an = "0111";
                end case;
                wait for T;
                d := seg2hex(cat);
                v := v + d * (16 ** i);
            end loop;
            value := v;
        end procedure;

        procedure check(msg : string; exp : integer) is
            variable got : integer;
        begin
            read_display(got);
            if got /= exp or led /= x"0000" then
                errors := errors + 1;
                report msg & ": display " & integer'image(got) & ", expected " &
                       integer'image(exp) severity error;
            else
                report msg & ": display = " & integer'image(got) & " (OK)" severity note;
            end if;
        end procedure;

    begin
        press(1);
        check("after reset", 0);
        press(0);
        check("1 press  (10)", 10);
        press(0); press(0);
        check("3 presses (30)", 30);
        press(0); press(0);
        check("5 presses (50)", 50);
        press(0); press(0);
        check("7 presses (window full, still 50)", 50);
        press(1);
        check("after reset", 0);
        press(0);
        check("1 press after reset (10)", 10);
        report "tb_basys3_top finished with " & integer'image(errors) & " errors" severity note;
        finished <= true;
        wait;
    end process;

end sim;
