library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity TopLevel is
    port (
        SystemClock         : in STD_LOGIC;
        Reset               : in STD_LOGIC;
        MISO                : in STD_LOGIC;
        Previous            : in STD_LOGIC;
        ThreePointThreeVolt : out STD_LOGIC;
        Txd                 : out STD_LOGIC;
        SCLK                : out STD_LOGIC;
        CS                  : out STD_LOGIC;
        Ca                  : out STD_LOGIC;
        Cb                  : out STD_LOGIC;
        Cc                  : out STD_LOGIC;
        Cd                  : out STD_LOGIC;
        Ce                  : out STD_LOGIC;
        Cf                  : out STD_LOGIC;
        Cg                  : out STD_LOGIC;
        LCD_En              : out STD_LOGIC;
        LCD_RS              : out STD_LOGIC;
        LCD_RW              : out STD_LOGIC;
        LCD_Data            : out STD_LOGIC_VECTOR(3 downto 0);
        An                  : out STD_LOGIC_VECTOR (5 downto 0)
    );
end TopLevel;

architecture Behavioral of TopLevel is
    component SPI is
        port (
            Clock   : in STD_LOGIC;
            MISO    : in STD_LOGIC;
            Reset   : in STD_LOGIC;
            Hold    : in STD_LOGIC;
            SCLK    : out STD_LOGIC;
            CS      : out STD_LOGIC;
            Convert : out STD_LOGIC;
            Data    : out STD_LOGIC_VECTOR(11 downto 0)
        );
    end component;

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

    component DPRAM is
        port (
            Clock   : in STD_LOGIC;
            R       : in STD_LOGIC;
            W       : in STD_LOGIC;
            DataIn  : in STD_LOGIC_VECTOR(23 downto 0);
            Display : out STD_LOGIC;
            DataOut : out STD_LOGIC_VECTOR(23 downto 0)
        );
    end component;

    component LCD is
        port (
            Clock   : in STD_LOGIC;
            Reset   : in STD_LOGIC;
            Display : in STD_LOGIC;
            BCD     : in STD_LOGIC_VECTOR(23 downto 0);
            Data    : out STD_LOGIC_VECTOR(3 downto 0);
            Enable  : out STD_LOGIC;
            RS      : out STD_LOGIC;
            RW      : out STD_LOGIC
        );
    end component;

    component RS232Txd is
        port (
            Reset : in STD_LOGIC;
            Send  : in STD_LOGIC;
            Clock : in STD_LOGIC;
            BCD   : in STD_LOGIC_VECTOR(23 downto 0);
            Txd   : out STD_LOGIC
        );
    end component;

    component SevenSegDecoder
        port (
            BCD   : in STD_LOGIC_VECTOR(23 downto 0);
            Clock : in STD_LOGIC;
            An    : out STD_LOGIC_VECTOR (5 downto 0);
            Ca    : out STD_LOGIC;
            Cb    : out STD_LOGIC;
            Cc    : out STD_LOGIC;
            Cd    : out STD_LOGIC;
            Ce    : out STD_LOGIC;
            Cf    : out STD_LOGIC;
            Cg    : out STD_LOGIC
        );
    end component;

    signal iConvert     : STD_LOGIC                     := '0';
    signal iDone        : STD_LOGIC                     := '0';
    signal iDisplay     : STD_LOGIC                     := '0';
    signal iPrevious    : STD_LOGIC                     := '0';
    signal iHold        : STD_LOGIC                     := '0';
    signal iBinary      : STD_LOGIC_VECTOR(11 downto 0) := (others => '0');
    signal iBCD         : STD_LOGIC_VECTOR(23 downto 0) := (others => '0');
    signal iDataOut     : STD_LOGIC_VECTOR(23 downto 0) := (others => '0');
    signal iHoldCounter : STD_LOGIC_VECTOR(28 downto 0) := (others => '0');

begin
    Serial : SPI port map(
        Clock   => SystemClock,
        MISO    => MISO,
        Reset   => Reset,
        Hold    => iHold,
        SCLK    => SCLK,
        CS      => CS,
        Convert => iConvert,
        Data    => iBinary
    );

    B2D : BinToBCD port map(
        Clock   => SystemClock,
        Reset   => Reset,
        Convert => iConvert,
        Binary  => iBinary,
        Done    => iDone,
        BCD     => iBCD
    );

    MEM : DPRAM port map(
        Clock   => SystemClock,
        R       => iHold,
        W       => iDone,
        DataIn  => iBCD,
        Display => iDisplay,
        DataOut => iDataOut
    );

    Display : LCD port map(
        Clock   => SystemClock,
        Reset   => Reset,
        Display => iDisplay,
        BCD     => iDataOut,
        Data    => LCD_Data,
        Enable  => LCD_En,
        RS      => LCD_RS,
        RW      => LCD_RW
    );

    RTxd : Rs232Txd port map(
        Reset => Reset,
        Send  => iDisplay,
        Clock => SystemClock,
        BCD   => iDataOut,
        Txd   => Txd
    );

    SSD : SevenSegDecoder port map(
        BCD   => iDataOut,
        Clock => SystemClock,
        An    => An,
        Ca    => Ca,
        Cb    => Cb,
        Cc    => Cc,
        Cd    => Cd,
        Ce    => Ce,
        Cf    => Cf,
        Cg    => Cg
    );

    process (SystemClock)
    begin
        if SystemClock'EVENT and SystemClock = '1' then
            iPrevious <= Previous;
            if Previous = '1' and iPrevious = '0' and iHold = '0' then
                iHold <= '1';
            elsif iHoldCounter = "11111111111111111111111111111" then
                iHold        <= '0';
                iHoldCounter <= (others => '0');
            elsif iHold = '1' then
                iHold        <= '1';
                iHoldCounter <= iHoldCounter + '1';

            end if;
        end if;
    end process;
    ThreePointThreeVolt <= '1';
end Behavioral;