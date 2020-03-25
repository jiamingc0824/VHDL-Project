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

    component DPRAM24x2
        port (
            clka  : in STD_LOGIC;
            wea   : in STD_LOGIC_VECTOR(0 downto 0);
            addra : in STD_LOGIC_VECTOR(0 downto 0);
            dina  : in STD_LOGIC_VECTOR(23 downto 0);
            clkb  : in STD_LOGIC;
            addrb : in STD_LOGIC_VECTOR(0 downto 0);
            doutb : out STD_LOGIC_VECTOR(23 downto 0)
        );
    end component;

    component LCD is
        port (
            Clock   : in STD_LOGIC;
            Reset   : in STD_LOGIC;
            Display : in STD_LOGIC;
            -- BCD     : in STD_LOGIC_VECTOR(23 downto 0);
            Data   : out STD_LOGIC_VECTOR(3 downto 0);
            Enable : out STD_LOGIC;
            RS     : out STD_LOGIC;
            RW     : out STD_LOGIC
        );
    end component;

    component RS232Txd is
        port (
            Reset : in STD_LOGIC;
            Send  : in STD_LOGIC;
            Clock : in STD_LOGIC;
            BCD   : in STD_LOGIC_VECTOR(23 downto 0);
            Txd   : out STD_LOGIC);
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

    signal BinaryTemp                                                             : STD_LOGIC_VECTOR (11 downto 0);
    signal BCDTemp                                                                : STD_LOGIC_VECTOR (23 downto 0);
    signal iWE                                                                    : STD_LOGIC_VECTOR(0 downto 0);

    --Fix this
    signal iDone    : STD_LOGIC;
    signal iConvert : STD_LOGIC;
    signal iAddrA   : STD_LOGIC_VECTOR(0 downto 0);
    signal iAddrB   : STD_LOGIC_VECTOR(0 downto 0);
    signal iDataIn  : STD_LOGIC_VECTOR(23 downto 0);
    signal iDataOut : STD_LOGIC_VECTOR(23 downto 0);

begin
    ThreePointThreeVolt <= '1';
    iWE                 <= "1";

    Serial : SPI port map(
        Clock   => SystemClock,
        MISO    => MISO,
        Reset   => Reset,
        SCLK    => SCLK,
        CS      => CS,
        Convert => iConvert,
        Data    => BinaryTemp
    );

    B2D : BinToBCD port map(
        Clock   => SystemClock,
        Reset   => Reset,
        Convert => iConvert,
        Binary  => BinaryTemp,
        Done    => iDone,
        BCD     => BCDTemp
    );

    RAM24x2 : DPRAM24x2 port map(
        clka  => SystemClock,
        wea   => iWE,
        addra => iAddrA,
        dina  => iDataIn,
        clkb  => SystemClock,
        addrb => iAddrB,
        doutb => iDataOut
    );

    Display : LCD port map(
        Clock   => SystemClock,
        Reset   => Reset,
        Display => iDone,
        -- BCD     => BCDTemp,
        Data   => LCD_Data,
        Enable => LCD_En,
        RS     => LCD_RS,
        RW     => LCD_RW
    );

    RTxd : Rs232Txd port map(
        Reset => Reset,
        Send  => iDone,
        Clock => SystemClock,
        BCD   => BCDTemp,
        Txd   => Txd
    );

    SSD : SevenSegDecoder port map(
        BCD   => BCDTemp,
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

end Behavioral;