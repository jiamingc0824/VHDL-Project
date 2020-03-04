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
        An                         : out STD_LOGIC_VECTOR (5 downto 0);
        Ca, Cb, Cc, Cd, Ce, Cf, Cg : out STD_LOGIC;
        ThreePointThreeVolt        : out STD_LOGIC;
        LED                        : out STD_LOGIC_VECTOR(7 downto 0)
    );
end TestSPI;

architecture Behavioral of TestSPI is

    component SPI is
        port (
            Clock   : in STD_LOGIC;
            MISO    : in STD_LOGIC;
            Reset   : in STD_LOGIC;
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

    component D4to7Decoder
        port (
            Q   : in STD_LOGIC_VECTOR (3 downto 0);
            Seg : out STD_LOGIC_VECTOR (6 downto 0));
    end component;

    component Scan4Digit
        port (
            digit0 : in STD_LOGIC_VECTOR (6 downto 0);
            digit1 : in STD_LOGIC_VECTOR (6 downto 0);
            digit2 : in STD_LOGIC_VECTOR (6 downto 0);
            digit3 : in STD_LOGIC_VECTOR (6 downto 0);
            digit4 : in STD_LOGIC_VECTOR (6 downto 0);
            digit5 : in STD_LOGIC_VECTOR (6 downto 0);
            clock  : in STD_LOGIC;
            an     : out STD_LOGIC_VECTOR (5 downto 0);
            ca     : out STD_LOGIC;
            cb     : out STD_LOGIC;
            cc     : out STD_LOGIC;
            cd     : out STD_LOGIC;
            ce     : out STD_LOGIC;
            cf     : out STD_LOGIC;
            cg     : out STD_LOGIC);
    end component;

    signal iDigitOut5, iDigitOut4, iDigitOut3, iDigitOut2, iDigitOut1, iDigitOut0 : STD_LOGIC_VECTOR (6 downto 0);
    signal iDataOut1                                                              : STD_LOGIC_VECTOR (7 downto 0);
    signal iDataOut2                                                              : STD_LOGIC_VECTOR (7 downto 0);
    signal iDataOut3                                                              : STD_LOGIC_VECTOR (7 downto 0);
    signal BinaryTemp                                                             : STD_LOGIC_VECTOR (11 downto 0);
    signal BCDTemp                                                                : STD_LOGIC_VECTOR (23 downto 0);
    signal iConvert                                                               : STD_LOGIC;

    signal iTesting : STD_LOGIC_VECTOR(15 downto 0);
begin
    iDataOut1           <= BCDTemp(7 downto 0);
    iDataOut2           <= BCDTemp(15 downto 8);
    iDataOut3           <= BCDTemp(23 downto 16);
    ThreePointThreeVolt <= '1';
    LED <= iTesting(7 downto 0);

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

    U3 : D4to7Decoder port map(
        Q   => iDataOut1(3 downto 0),
        Seg => iDigitOut0
    );

    U4 : D4to7Decoder port map(
        Q   => iDataOut1(7 downto 4),
        Seg => iDigitOut1
    );

    U5 : D4to7Decoder port map(
        Q   => iDataOut2(3 downto 0),
        Seg => iDigitOut2
    );

    U6 : D4to7Decoder port map(
        Q   => iDataOut2(7 downto 4),
        Seg => iDigitOut3
    );

    U7 : D4to7Decoder port map(
        Q   => iDataOut3(3 downto 0),
        Seg => iDigitOut4
    );

    U8 : D4to7Decoder port map(
        Q   => iDataOut3(7 downto 4),
        Seg => iDigitOut5
    );
    
    U9 : Scan4Digit port map(
        Digit5 => iDigitOut5,
        Digit4 => iDigitOut4,
        Digit3 => iDigitOut3,
        Digit2 => iDigitOut2,
        Digit1 => iDigitOut1,
        Digit0 => iDigitOut0,
        Clock  => SystemClock,
        An     => An,
        Ca     => Ca,
        Cb     => Cb,
        Cc     => Cc,
        Cd     => Cd,
        Ce     => Ce,
        Cf     => Cf,
        Cg     => Cg
    );
end Behavioral;