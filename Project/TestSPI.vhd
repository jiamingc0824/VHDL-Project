library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity TestSPI is
    port (
        MISO                       : in STD_LOGIC;
        Reset                      : in STD_LOGIC;
        SystemClock                : in STD_LOGIC;
        SCLK                       : out STD_LOGIC;
        CS                         : out STD_LOGIC;
        Ca, Cb, Cc, Cd, Ce, Cf, Cg : out STD_LOGIC;
        ThreePointThreeVolt        : out STD_LOGIC;
        An                         : out STD_LOGIC_VECTOR(5 downto 0);
        LED                        : out STD_LOGIC_VECTOR(7 downto 0)
    );
end TestSPI;

architecture Behavioral of TestSPI is

    component SPI is
        port (
            Clock   : in STD_LOGIC;
            MISO    : in STD_LOGIC;
            Reset   : in STD_LOGIC;
            Hold    : in STD_LOGIC;
            SCLK    : out STD_LOGIC;
            CS      : out STD_LOGIC;
            Convert : out STD_LOGIC;
            Data    : out STD_LOGIC_VECTOR(11 downto 0);
            Testing : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    component BinToBCD is
        port (
            Clock   : in STD_LOGIC;
            Reset   : in STD_LOGIC;
            Convert : in STD_LOGIC;
            Binary  : in STD_LOGIC_VECTOR(11 downto 0);
            BCD     : out STD_LOGIC_VECTOR(23 downto 0)
        );
    end component;

    component SevenSegDecoder
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
    end component;

    signal iConvert   : STD_LOGIC;
    signal BinaryTemp : STD_LOGIC_VECTOR(11 downto 0);
    signal BCDTemp    : STD_LOGIC_VECTOR(23 downto 0);
    signal iTesting   : STD_LOGIC_VECTOR(15 downto 0);
begin

    U1 : SPI port map(
        Clock   => SystemClock,
        MISO    => MISO,
        Reset   => Reset,
        SCLK    => SCLK,
        CS      => CS,
        Convert => iConvert,
        Data    => BinaryTemp,
        Testing => iTesting
    );

    U2 : BinToBCD port map(
        Clock   => SystemClock,
        Reset   => Reset,
        Convert => iConvert,
        Binary  => BinaryTemp,
        BCD     => BCDTemp
    );

    U3 : SevenSegDecoder port map(
        Clock => SystemClock,
        BCD   => BCDTemp,
        Ca    => Ca,
        Cb    => Cb,
        Cc    => Cc,
        Cd    => Cd,
        Ce    => Ce,
        Cf    => Cf,
        Cg    => Cg,
        An    => An
    );

    ThreePointThreeVolt <= '1';
    LED                 <= iTesting(7 downto 0);
end Behavioral;