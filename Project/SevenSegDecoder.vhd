library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity SevenSegDecoder is
    port (
        Clock : in STD_LOGIC;
        BCD   : in STD_LOGIC_VECTOR(23 downto 0);
        Ca    : out STD_LOGIC;
        Cb    : out STD_LOGIC;
        Cc    : out STD_LOGIC;
        Cd    : out STD_LOGIC;
        Ce    : out STD_LOGIC;
        Cf    : out STD_LOGIC;
        Cg    : out STD_LOGIC;
        An    : out STD_LOGIC_VECTOR(5 downto 0)
    );
end SevenSegDecoder;

architecture Behavioral of SevenSegDecoder is

    signal iCount16  : std_logic_vector(15 downto 0) := (others => '0');
    signal iSeg      : STD_LOGIC_VECTOR(6 downto 0)  := (others => '0');
    signal iDigitOut : std_logic_vector(6 downto 0)  := (others => '0');
    signal Q         : STD_LOGIC_VECTOR(3 downto 0)  := (others => '0');

begin

    process (Clock)
    begin
        if Clock'event and Clock = '1' then
            iCount16 <= iCount16 + '1';
        end if;
    end process;

    --Send six digits to four 7-segment display using scan mode
    with iCount16 (15 downto 13) select
    Q <= BCD (3 downto 0) when "000", -- Connect Digit0 to the 7-segment display
        BCD (7 downto 4) when "001",      -- Connect Digit1 to the 7-segment display
        BCD (11 downto 8) when "010",     -- Connect Digit2 to the 7-segment display
        BCD (15 downto 12) when "011",    -- Connect Digit3 to the 7-segment display
        BCD (19 downto 16) when "100",    -- Connect Digit4 to the 7-segment display
        BCD (23 downto 20) when "101",    -- Connect Digit5 to the 7-segment display
        BCD (3 downto 0) when others;

    with iCount16 (15 downto 13) select
    An <= "111110" when "000", -- with AN0 low only
        "111101" when "001",       -- with AN1 low only
        "111011" when "010",       -- with AN2 low only
        "110111" when "011",       -- with AN3 low only
        "101111" when "100",       -- with AN4 low only
        "011111" when "101",       -- with AN5 low only
        "111110" when others;

    iSeg <= "0000001" when Q = "0000" else
        "1001111" when Q = "0001" else
        "0010010" when Q = "0010" else
        "0000110" when Q = "0011" else
        "1001100" when Q = "0100" else
        "0100100" when Q = "0101" else
        "0100000" when Q = "0110" else
        "0001111" when Q = "0111" else
        "0000000" when Q = "1000" else
        "0000100" when Q = "1001" else
        "0001000" when Q = "1010" else
        "1100000" when Q = "1011" else
        "0110001" when Q = "1100" else
        "1000010" when Q = "1101" else
        "0110000" when Q = "1110" else
        "0111000" when Q = "1111" else
        "1111111";

    iDigitOut <= not(iSeg);
    Ca        <= iDigitOut(6);
    Cb        <= iDigitOut(5);
    Cc        <= iDigitOut(4);
    Cd        <= iDigitOut(3);
    Ce        <= iDigitOut(2);
    Cf        <= iDigitOut(1);
    Cg        <= iDigitOut(0);
end Behavioral;