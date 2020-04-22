library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.all;

entity RS232Txd is
    port (
        Reset : in STD_LOGIC;
        Send  : in STD_LOGIC;
        Clock : in STD_LOGIC;
        BCD   : in STD_LOGIC_VECTOR(23 downto 0);
        Txd   : out STD_LOGIC
    );
end RS232Txd;

architecture Behavioral of RS232Txd is
    attribute enum_encoding : STRING;
    -- state definitions
    type stateType is (stIdle, stBuffer, stData, stWordComplete, stStop);
    attribute enum_encoding of stateType : type is "000 001 011 010 110";
    signal presState                     : stateType;
    signal nextState                     : stateType;
    signal iSend                         : STD_LOGIC                     := '0';
    signal iReset                        : STD_LOGIC                     := '0';
    signal iTransmitReset                : STD_LOGIC                     := '0';
    signal iRSClockEnable                : STD_LOGIC                     := '0';
    signal iEnableTxdBuffer              : STD_LOGIC                     := '0';
    signal iEnableShift                  : STD_LOGIC                     := '0';
    signal iRSClock                      : STD_LOGIC                     := '0';
    signal iTxdBuffer                    : STD_LOGIC_VECTOR(7 downto 0)  := (others => '0');
    signal iRSClkDiv                     : STD_LOGIC_VECTOR(12 downto 0) := (others => '0');
    signal iNoBitsSent                   : STD_LOGIC_VECTOR(3 downto 0)  := (others => '0');
    signal iNoCharSent                   : STD_LOGIC_VECTOR(4 downto 0)  := (others => '0');
    signal iBCD                          : STD_LOGIC_VECTOR(23 downto 0) := x"123475"; --For Debug Purpose

    --Display Character Sequence
    type CharMemory is array (0 to 15) of STD_LOGIC_VECTOR(7 downto 0);
    signal CharSeq : CharMemory := (
    "01010100", --T
    "01100101", --e
    "01101101", --m
    "01110000", --p
    "00111010", --:
    "00110000", --Digit 1
    "00110000", --Digit 2
    "00110000", --Digit 3
    "00110000", --Digit 4
    "00101110", --.
    "00110000", --Digit 5
    "00110000", --Digit 6
    "10100111", --degree  --Putty may not be able to display this character because its part of extended ascii
    "01000011", --C
    "00001010", --/n
    "00001101"  --/r
    );
begin
    process (Clock)
    begin
        if Clock'event and Clock = '1' then
            if Reset = '1' or iReset = '1' then
                iRSClockEnable <= '0';
                iRSClkDiv      <= "0010111010100"; --0010111010100 Actual Timing
            else
                iSend <= Send;
            end if;
            if Send = '1' and iSend = '0' and iRSClockEnable = '0' then
                iRSClockEnable <= '1';
            end if;
            if iRSClockEnable = '1' then
                if iRSClkDiv = "1101000101011" then --1101000101011 Actual timing
                    iRSClkDiv <= "0010111010100";       --0010111010100 Actual timing
                else
                    iRSClkDiv <= iRSClkDiv + '1';
                end if;
            end if;
        end if;
    end process;
    iRSClock <= iRSClkDiv(12);

    process (iRSClockEnable, iRSClock)
    begin
        if iRSClockEnable = '0' then
            iNoBitsSent <= (others => '0');
            iNoCharSent <= (others => '0');
            presState   <= stIdle;
            Txd         <= '1';
        elsif iRSClock'event and iRSClock = '1' then
            presState <= nextState;
            if iEnableTxdBuffer = '1' then
                iTxdBuffer <= CharSeq(to_integer(unsigned(iNoCharSent(3 downto 0))));
                Txd        <= '0';
            end if;
            if iEnableShift = '1' then
                iNoBitsSent <= iNoBitsSent + '1';
                Txd         <= iTxdBuffer(0);
                iTxdBuffer  <= '0' & iTxdBuffer(7 downto 1);
            end if;
            if iTransmitReset = '1' then
                iNoBitsSent <= (others => '0');
                iNoCharSent <= iNoCharSent + '1';
                Txd         <= '1';
            end if;
        end if;
    end process;

    process (presState, iRSClockEnable, iNoBitsSent)
    begin
        iReset           <= '0';
        iEnableShift     <= '0';
        iEnableTxdBuffer <= '0';
        iTransmitReset   <= '0';

        case presState is
            when stIdle =>
                if iRSClockEnable = '1' then
                    nextState <= stBuffer;
                else
                    nextState <= stIdle;
                end if;
            when stBuffer =>
                iEnableTxdBuffer <= '1';
                nextState        <= stData;
            when stData =>
                if iNoBitsSent = "1000" then
                    nextState      <= stWordComplete;
                    iTransmitReset <= '1';
                else
                    iEnableShift <= '1';
                    nextState    <= stData;
                end if;
            when stWordComplete =>
                if iNoCharSent > "01111" then
                    nextState <= stStop;
                else
                    nextState <= stIdle;
                end if;
            when stStop =>
                nextState <= stIdle;
                iReset    <= '1';
        end case;
    end process;

    CharSeq(5)(7 downto 0) <= x"20" when BCD(23 downto 20) = x"0" else
    x"3" & BCD(23 downto 20);
    CharSeq(6)(7 downto 0) <= x"20" when BCD(23 downto 16) = x"00" else
    x"3" & BCD(19 downto 16);
    CharSeq(7)(7 downto 0) <= x"20" when BCD(23 downto 12) = x"000" else
    x"3" & BCD(15 downto 12);
    CharSeq(8)(7 downto 0)  <= x"3" & BCD(11 downto 8);
    CharSeq(10)(7 downto 0) <= x"3" & BCD(7 downto 4);
    CharSeq(11)(7 downto 0) <= x"3" & BCD(3 downto 0);

end Behavioral;