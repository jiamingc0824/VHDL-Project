library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.all;

entity LCD is
    port (
        Clock   : in STD_LOGIC;
        Reset   : in STD_LOGIC;
        Display : in STD_LOGIC;
        -- BCD     : in STD_LOGIC_VECTOR(23 downto 0);
        Data   : out STD_LOGIC_VECTOR(3 downto 0);
        Enable : out STD_LOGIC;
        RS     : out STD_LOGIC;
        RW     : out STD_LOGIC;
        LED    : out STD_LOGIC_VECTOR(7 downto 0)
    );
end LCD;

architecture Behavioral of LCD is
    attribute enum_encoding : STRING;
    --State Definitions
    type stateLCD is (stInit1, stInit2, stFunc, stEntry, stDisplay, stClear, stReady, stWrite, stResetAddr, stComplete);
    attribute enum_encoding of stateLCD : type is "0000 0001 0011 0010 0110 0111 0101 0100 1100 1101";
    signal presState                    : stateLCD;
    signal nextState                    : stateLCD;

    type stateTransmit is (stIdle, stReady, stEnable, stWait, stComplete);
    attribute enum_encoding of stateTransmit : type is "000 001 011 010 110";
    signal transmitState                     : stateTransmit;

    --Initialization and Display Configuration Flag
    signal isInit   : STD_LOGIC := '0';
    signal isConfig : STD_LOGIC := '0';

    --Flag
    signal isInitStg1    : STD_LOGIC := '0';
    signal isInitStg2    : STD_LOGIC := '0';
    signal isFunc        : STD_LOGIC := '0';
    signal isEntry       : STD_LOGIC := '0';
    signal isDisplay     : STD_LOGIC := '0';
    signal isClear       : STD_LOGIC := '0';
    signal isTransmit    : STD_LOGIC := '0';
    signal isResetAddr   : STD_LOGIC := '0';
    signal isAllTransmit : STD_LOGIC := '0';

    signal iCounter       : STD_LOGIC_VECTOR(20 downto 0) := (others => '0');
    signal iCharSent      : STD_LOGIC_VECTOR(3 downto 0)  := (others => '0');
    signal iData          : STD_LOGIC_VECTOR(7 downto 0)  := (others => '0');
    signal iReset         : STD_LOGIC                     := '0';
    signal iDisplay       : STD_LOGIC                     := '0';
    signal iDisplayEnable : STD_LOGIC                     := '0';
    signal iStage         : STD_LOGIC                     := '0';
    signal iTransmit      : STD_LOGIC                     := '0';

    signal BCD : STD_LOGIC_VECTOR(23 downto 0) := x"111175";

    constant ResetAddr : STD_LOGIC_VECTOR(7 downto 0) := x"02";

    --Initialization Sequence
    type InitMemory is array (0 to 1) of STD_LOGIC_VECTOR(7 downto 0);
    constant InitSeq : InitMemory := (
    "00110011", --Init Stage 1
    "00110010"  --Init Stage 2
    );

    --Display Config Sequence
    type ConfigMemory is array (0 to 3) of STD_LOGIC_VECTOR(7 downto 0);
    constant DispConfig : ConfigMemory := (
    "00101000", --Function Set
    "00000110", --Entry Mode
    "00001100", --Display and Cursor Setting
    "00000001"  --Clear Display
    );

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
    "11011111", --degree
    "01000011", --C
    "00100000", --PlaceHolder
    "00100000"  --PlaceHolder
    );
begin

    LED(3 downto 0) <= iCharSent;
    LED(7 downto 4) <= (others => '0');
    -- with nextState select LED(3 downto 0) <=
    --     "0001" when stInit1,
    --     "0010" when stInit2,
    --     "0011" when stFunc,
    --     "0100" when stEntry,
    --     "0101" when stDisplay,
    --     "0110" when stClear,
    --     "0111" when stReady,
    --     "1000" when stWrite,
    --     "1001" when stResetAddr,
    --     "1010" when stComplete,
    --     "0000" when others;

    -- LED(6 downto 4) <= "001" when transmitState = stIdle else
    -- "010" when transmitState = stReady else
    -- "011" when transmitState = stEnable else
    -- "100" when transmitState = stWait else
    -- "101" when transmitState = stComplete else
    -- "000";
    -- LED <= iData;

    RW <= '0';

    CharSeq(5)(7 downto 0) <= "00100000" when BCD(23 downto 20) = "0000" else
    "0011" & BCD(23 downto 20);
    CharSeq(6)(7 downto 0) <= "00100000" when BCD(19 downto 16) = "0000" else
    "0011" & BCD(19 downto 16);
    CharSeq(7)(7 downto 0) <= "00100000" when BCD(15 downto 12) = "0000" else
    "0011" & BCD(15 downto 12);
    CharSeq(8)(7 downto 0) <= "00100000" when BCD(11 downto 8) = "0000" else
    "0011" & BCD(11 downto 8);
    CharSeq(10)(7 downto 0) <= "00100000" when BCD(7 downto 4) = "0000" else
    "0011" & BCD(7 downto 4);
    CharSeq(11)(7 downto 0) <= "00100000" when BCD(3 downto 0) = "0000" else
    "0011" & BCD(3 downto 0);

    process (Clock)
    begin
        if Clock'EVENT and Clock = '1' then
            if Reset = '1' or iReset = '1' then
                if isInit = '0' then
                    presState <= stInit1;
                elsif isConfig = '0' then
                    presState <= stFunc;
                else
                    presState      <= stReady;
                    iDisplayEnable <= '0';
                end if;
            else
                iDisplay  <= Display;
                presState <= nextState;
            end if;
            if Display = '1' and iDisplay = '0' and iDisplayEnable = '0' then
                iDisplayEnable <= '1';
            end if;
        end if;
    end process;

    Main_State_Machine : process (presState, isInitStg1, isInitStg2, isFunc, isEntry, isDisplay, isClear, isTransmit, isResetAddr, isAllTransmit, iDisplayEnable)
    begin
        -- iTransmit <= '0';
        iReset <= '0';
        case presState is
            when stInit1 =>
                if isInitStg1 = '1' then
                    nextState <= stInit2;
                else
                    nextState <= stInit1;
                    iData     <= InitSeq(0);
                    -- iTransmit <= '1';
                end if;
            when stInit2 =>
                if isInitStg2 = '1' then
                    isInit    <= '1';
                    nextState <= stFunc;
                else
                    nextState <= stInit2;
                    iData     <= InitSeq(1);
                    -- iTransmit <= '1';
                end if;
            when stFunc =>
                if isFunc = '1' then
                    nextState <= stEntry;
                else
                    nextState <= stFunc;
                    iData     <= DispConfig(0);
                    -- iTransmit <= '1';
                end if;
            when stEntry =>
                if isEntry = '1' then
                    nextState <= stDisplay;
                else
                    nextState <= stEntry;
                    iData     <= DispConfig(1);
                    -- iTransmit <= '1';
                end if;
            when stDisplay =>
                if isDisplay = '1' then
                    nextState <= stClear;
                else
                    nextState <= stDisplay;
                    iData     <= DispConfig(2);
                    -- iTransmit <= '1';
                end if;
            when stClear =>
                if isClear = '1' then
                    isConfig  <= '1';
                    nextState <= stReady;
                else
                    nextState <= stClear;
                    iData     <= DispConfig(3);
                    -- iTransmit <= '1';
                end if;
            when stReady =>
                if iDisplayEnable = '1' then
                    nextState <= stWrite;
                else
                    nextState <= stReady;
                end if;
            when stWrite =>
                if isTransmit = '1' then
                    nextState <= stWrite;
                    iData     <= CharSeq(to_integer(unsigned(iCharSent)));
                    iCharSent <= iCharSent + '1';
                    -- iTransmit <= '1';
                elsif isAllTransmit = '1' then
                    nextState <= stResetAddr;
                    iCharSent <= (others => '0');
                else
                    nextState <= stWrite;
                    iData     <= CharSeq(to_integer(unsigned(iCharSent)));
                    iCharSent <= iCharSent + '1';
                    -- iTransmit <= '1';
                end if;
            when stResetAddr =>
                if isResetAddr = '1' then
                    nextState <= stComplete;
                else
                    nextState <= stResetAddr;
                    iData     <= ResetAddr;
                    -- iTransmit <= '1';
                end if;
            when stComplete =>
                iReset    <= '1';
                nextState <= stReady;
        end case;
    end process;

    transmit : process (Clock)
    begin
        if Clock'EVENT and Clock = '1' then
            if Reset = '1' then
                Enable        <= '0';
                RS            <= '0';
                Data          <= (others => '0');
                iStage        <= '0';
                iCounter      <= (others => '0');
                transmitState <= stIdle;
            else
                case transmitState is
                    when stIdle =>
                        case presState is
                            when stInit1 | stInit2 | stFunc | stEntry | stDisplay | stClear | stWrite | stResetAddr =>
                                isTransmit    <= '0';
                                isAllTransmit <= '0';
                                isResetAddr   <= '0';
                                transmitState <= stReady;
                            when others =>
                                transmitState <= stIdle;
                        end case;

                        -- if iTransmit = '1' then
                        --     transmitState <= stReady;
                        --     isTransmit    <= '0';
                        --     isAllTransmit <= '0';
                        --     isResetAddr   <= '0';
                        -- else
                        --     transmitState <= stIdle;
                        -- end if;
                    when stReady =>
                        Enable <= '0';
                        if iStage = '0' then
                            Data <= iData(7 downto 4);
                        else
                            Data <= iData(3 downto 0);
                        end if;
                        case presState is
                            when stInit1 =>
                                RS <= '0';
                                if iStage = '0' and iCounter = "10110111000110110000" then --750000 Cycle 10110111000110110000
                                    iCounter      <= (others => '0');
                                    transmitState <= stEnable;
                                elsif iStage = '1' and iCounter = "00110010000011001000" then --205000 Cycle 00110010000011001000
                                    iCounter      <= (others => '0');
                                    transmitState <= stEnable;
                                else
                                    iCounter      <= iCounter + '1';
                                    transmitState <= stReady;
                                end if;
                            when stInit2 =>
                                RS <= '0';
                                if iStage = '0' and iCounter = "00000001001110001000" then --5000 Cycle
                                    iCounter      <= (others => '0');
                                    transmitState <= stEnable;
                                elsif iStage = '1' and iCounter = "00000000011111010000" then --2000 Cycle
                                    iCounter      <= (others => '0');
                                    transmitState <= stEnable;
                                else
                                    iCounter      <= iCounter + '1';
                                    transmitState <= stReady;
                                end if;
                            when stFunc | stEntry | stDisplay | stClear | stResetAddr =>
                                RS <= '0';
                                if iCounter = "00000000000000000010" then --2 cycle
                                    iCounter      <= (others => '0');
                                    transmitState <= stEnable;
                                else
                                    iCounter      <= iCounter + '1';
                                    transmitState <= stReady;
                                end if;
                            when others =>
                                RS <= '1';
                                if iCounter = "00000000000000000010" then --2 cycle
                                    iCounter      <= (others => '0');
                                    transmitState <= stEnable;
                                else
                                    iCounter      <= iCounter + '1';
                                    transmitState <= stReady;
                                end if;
                        end case;
                    when stEnable =>
                        Enable <= '1';
                        if iCounter = "00000000000000001100" then --12 Cycle
                            iCounter      <= (others => '0');
                            transmitState <= stWait;
                        else
                            iCounter      <= iCounter + '1';
                            transmitState <= stEnable;
                        end if;
                    when stWait =>
                        Enable <= '0';
                        case presState is
                            when stClear | stResetAddr =>
                                if iCounter = "00010100000001010000" then --82000 Cycle 00010100000001010000
                                    iCounter <= (others => '0');
                                    if iStage = '1' then
                                        transmitState <= stComplete;
                                    else
                                        transmitState <= stReady;
                                        iStage        <= '1';
                                    end if;
                                else
                                    iCounter      <= iCounter + '1';
                                    transmitState <= stWait;
                                end if;
                            when others =>
                                if iStage = '0' and iCounter = "00000000000000110010" then --50 Cycle
                                    iCounter      <= (others => '0');
                                    transmitState <= stReady;
                                    iStage        <= '1';
                                elsif iStage = '1' and iCounter = "00000000011111010000" then --2000 Cycle
                                    iCounter      <= (others => '0');
                                    transmitState <= stComplete;
                                else
                                    iCounter      <= iCounter + '1';
                                    transmitState <= stWait;
                                end if;
                        end case;

                    when stComplete =>
                        Enable        <= '0';
                        RS            <= '0';
                        Data          <= (others => '0');
                        iStage        <= '0';
                        iCounter      <= (others => '0');
                        transmitState <= stIdle;
                        case presState is
                            when stInit1 =>
                                isInitStg1 <= '1';
                            when stInit2 =>
                                isInitStg2 <= '1';
                            when stFunc =>
                                isFunc <= '1';
                            when stEntry =>
                                isEntry <= '1';
                            when stDisplay =>
                                isDisplay <= '1';
                            when stClear =>
                                isClear <= '1';
                            when stWrite =>
                                if iCharSent = "1101" then
                                    isAllTransmit <= '1';
                                else
                                    isTransmit <= '1';
                                end if;
                            when stResetAddr =>
                                isResetAddr <= '1';
                            when others =>
                        end case;
                end case;
            end if;
        end if;
    end process;
end Behavioral;