library ieee;
use ieee.std_logic_1164.all;

entity n_bit_add_sub_tb is
end entity n_bit_add_sub_tb;

architecture n_bit_add_sub_tb_arch of n_bit_add_sub_tb is
    component n_bit_add_sub
        generic(
            n: integer := 8
        );
        port(
            a, b: in std_logic_vector(n-1 downto 0);
            sel: in std_logic;
            sum: out std_logic_vector(n-1 downto 0);
            cout: out std_logic
        );
    end component n_bit_add_sub;
    signal a, b, sum: std_logic_vector(7 downto 0);
    signal sel: std_logic;
    signal cout: std_logic;

begin
    UUT: n_bit_add_sub generic map(8) port map(a, b, sel, sum, cout);

    process
    begin
        a <= x"0F";
        b <= x"0F";
        sel <= '0';
        wait for 10 ns;
        a <= x"0F";
        b <= x"0F";
        sel <= '1';
        wait for 10 ns;
        a <= x"FF";
        b <= x"FF";
        sel <= '0';
        wait for 10 ns;
        a <= x"FF";
        b <= x"32";
        sel <= '1';
        wait for 10 ns;
        wait;
    end process;
end architecture n_bit_add_sub_tb_arch;
