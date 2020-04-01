library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity TopLevelTest is
    port (
        SystemClock         : in STD_LOGIC;
        Reset               : in STD_LOGIC;
        MISO                : in STD_LOGIC;
        Previous            : in STD_LOGIC;
        ThreePointThreeVolt : out STD_LOGIC;
        Txd                 : out STD_LOGIC;
        SCLK                : out STD_LOGIC;
        CS                  : out STD_LOGIC
    );
end TopLevelTest;

architecture Behavioral of TopLevelTest is
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

    component RS232Txd is
        port (
            Reset : in STD_LOGIC;
            Send  : in STD_LOGIC;
            Clock : in STD_LOGIC;
            BCD   : in STD_LOGIC_VECTOR(23 downto 0);
            Txd   : out STD_LOGIC
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
    signal iHoldCounter : STD_LOGIC_VECTOR(29 downto 0) := (others => '0');

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

    RTxd : Rs232Txd port map(
        Reset => Reset,
        Send  => iDisplay,
        Clock => SystemClock,
        BCD   => iDataOut,
        Txd   => Txd
    );

    process (SystemClock)
    begin
        if SystemClock'EVENT and SystemClock = '1' then
            iPrevious <= Previous;
            if Previous = '1' and iPrevious = '0' and iHold = '0' then
                iHold <= '1';
            elsif iHoldCounter = "111111111111111111111111111111" then --"111111111111111111111111111111" -> Actual timing "000000000000000000000001111111" -> Demo Timing
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