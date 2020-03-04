library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity SPI is
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
end SPI;

architecture Behavioral of SPI is
    attribute enum_encoding : STRING;
    -- state definitions

    type stateType is (stIdle, stTransmission, stStop);
    attribute enum_encoding of statetype : type is "00 01 11";
    signal presState                     : stateType;
    signal nextState                     : stateType;
    signal iReset                        : STD_LOGIC;
    signal iClockDiv                     : STD_LOGIC_VECTOR(24 downto 0) := (others => '0');
    signal iSCLK                         : STD_LOGIC;
    signal iSCLKDiv                      : STD_LOGIC_VECTOR(3 downto 0)  := (others => '0');
    signal iBuffer                       : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal iNoBitReceived                : STD_LOGIC_VECTOR(4 downto 0)  := (others => '0');
begin
    process (Clock)
    begin
        if Clock'event and Clock = '1' then
            if Reset = '1' or iReset = '1' then
                iClockDiv <= (others => '0');
                iSCLKDiv  <= (others => '0');
                -- iClockDiv(24)          <= '0';
                -- iClockDiv(23 downto 5) <= (others => '1');
                -- iClockDiv(4 downto 0)  <= (others => '0');
            else
                iClockDiv <= iClockDiv + '1';
                if iClockDiv(24) = '1' then
                    if iSCLKDiv = "1110" then
                        iSCLKDiv <= "0001";
                    else
                        iSCLKDiv <= iSCLKDiv + '1';
                    end if;
                end if;
            end if;
        end if;
    end process;
    process (iClockDiv(24), iSCLK)
    begin
        if iClockDiv(24) = '0' then
            iNoBitReceived <= (others => '0');
            presState      <= stIdle;
        elsif iSCLK'event and iSCLK = '0' then
            presState      <= nextState;
            iNoBitReceived <= iNoBitReceived + '1';
            iBuffer <= iBuffer(14 downto 0) & MISO;
        end if;
        -- if iSCLK'EVENT and iSCLK = '1' then
            -- if iNoBitReceived /= "0000" then
            --     iBuffer <= iBuffer(14 downto 0) & MISO;
            -- end if;
        -- end if;
    end process;

    process (presState, iClockDiv(24), iNoBitReceived)
    begin
        iReset <= '0';
        case presState is
            when stIdle =>
                if iClockDiv(24) = '1' then
                    nextState <= stTransmission;
                else
                    nextState <= stIdle;
                end if;
            when stTransmission =>
                if iNoBitReceived = "10000" then
                    Convert   <= '1';
                    Data      <= iBuffer (14 downto 3);
                    Testing   <= iBuffer;
                    nextState <= stStop;
                else
                    nextState <= stTransmission;
                end if;
            when stStop =>
                Convert   <= '0';
                nextState <= stIdle;
                iReset    <= '1';
        end case;
    end process;
    CS <= not iClockDiv(24);
    iSCLK      <= iSCLKDiv(3);
    SCLK       <= iSCLK;

end Behavioral;