library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity TestBinToBCD is
    port (
        Convert     : in STD_LOGIC;
        Reset       : in STD_LOGIC;
        SystemClock : in STD_LOGIC;
        DataIn      : in STD_LOGIC_VECTOR(3 downto 0);
        Ca          : out STD_LOGIC;
        Cb          : out STD_LOGIC;
        Cc          : out STD_LOGIC;
        Cd          : out STD_LOGIC;
        Ce          : out STD_LOGIC;
        Cf          : out STD_LOGIC;
        Cg          : out STD_LOGIC;
        An          : out STD_LOGIC_VECTOR(5 downto 0)
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

    signal Temp       : STD_LOGIC;
    signal BinaryTemp : STD_LOGIC_VECTOR(11 downto 0);
    signal BCDTemp    : STD_LOGIC_VECTOR(23 downto 0);
begin

    U1 : BinToBCD port map(
        Clock   => SystemClock,
        Reset   => Reset,
        Convert => Convert,
        Binary  => BinaryTemp,
        Done    => Temp,
        BCD     => BCDTemp
    );

    U2 : SevenSegDecoder port map(
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

    BinaryTemp <= "00000000" & DataIn;
end Behavioral;