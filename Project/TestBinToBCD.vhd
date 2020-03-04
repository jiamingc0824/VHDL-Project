library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity TestBinToBCD is
    port (
        Convert                    : in STD_LOGIC;
        Reset                      : in STD_LOGIC;
        SystemClock                : in STD_LOGIC;
        DataIn                     : in STD_LOGIC_VECTOR(3 downto 0);
        An                         : out STD_LOGIC_VECTOR (5 downto 0);
        Ca, Cb, Cc, Cd, Ce, Cf, Cg : out STD_LOGIC
    );
end TestBinToBCD;

architecture Behavioral of TestBinToBCD is

    component BinToBCD is
        port (
            Clock   : in STD_LOGIC;
            Reset   : in STD_LOGIC;
            Convert : in STD_LOGIC;
            Binary  : in STD_LOGIC_VECTOR(11 downto 0);
            Done    : out STD_LOGIC;
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

    signal iDigitOut3, iDigitOut2, iDigitOut1, iDigitOut0 : STD_LOGIC_VECTOR (6 downto 0);
    signal iDataOut1                                      : STD_LOGIC_VECTOR (7 downto 0);
    signal iDataOut2                                      : STD_LOGIC_VECTOR (7 downto 0);
    signal BinaryTemp                                     : STD_LOGIC_VECTOR (11 downto 0);
    signal BCDTemp                                        : STD_LOGIC_VECTOR(23 downto 0);
    signal Temp                                           : STD_LOGIC;

begin
    BinaryTemp <= "00000000" & DataIn;
    iDataOut1  <= BCDTemp(7 downto 0);
    iDataOut2  <= BCDTemp(15 downto 8);

    U1 : BinToBCD port map(
        Clock   => SystemClock,
        Reset   => Reset,
        Convert => Convert,
        Binary  => BinaryTemp,
        Done    => Temp,
        BCD     => BCDTemp
    );
    U2 : D4to7Decoder port map(
        Q   => iDataOut1(3 downto 0),
        Seg => iDigitOut0
    );
    U3 : D4to7Decoder port map(
        Q   => iDataOut1(7 downto 4),
        Seg => iDigitOut1
    );
    U4 : D4to7Decoder port map(
        Q   => iDataOut2(3 downto 0),
        Seg => iDigitOut2
    );
    U5 : D4to7Decoder port map(
        Q   => iDataOut2(7 downto 4),
        Seg => iDigitOut3
    );
    U9 : Scan4Digit port map(
        Digit5 => (others => '0'),
        Digit4 => (others => '0'),
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