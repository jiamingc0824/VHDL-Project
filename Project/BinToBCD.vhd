library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity BinToBCD is
    port (
        Clock   : in STD_LOGIC;
        Reset   : in STD_LOGIC;
        Convert : in STD_LOGIC;
        Binary  : in STD_LOGIC_VECTOR(11 downto 0);
        Done    : out STD_LOGIC;
        BCD     : out STD_LOGIC_VECTOR(23 downto 0)
    );
end BinToBCD;

-- architecture Behavioral of BinToBCD is
--     attribute enum_encoding : STRING;
--     type stateType is (stIdle, stShift, stMult, stComplete);
--     attribute enum_encoding of stateType : type is "00 01 11 10";
--     signal presState                     : stateType;
--     signal nextState                     : stateType;
--     signal iReset                        : STD_LOGIC;
--     signal iBuffer                       : STD_LOGIC;
--     signal iShift                        : STD_LOGIC;
--     signal iMult                         : STD_LOGIC;
--     signal iNoBitsProcessed              : STD_LOGIC_VECTOR(3 downto 0);
--     signal iShiftReg1                    : STD_LOGIC_VECTOR(9 downto 0);
--     signal iShiftReg2                    : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
-- begin
--     process (Clock)
--     begin
--         if Clock'Event and Clock = '1' then
--             presState <= nextState;
--             if Reset = '1' or iReset = '1' then
--                 iShiftReg2       <= (others => '0');
--                 iNoBitsProcessed <= (others => '0');
--                 presState        <= stIdle;
--             else
--                 if iBuffer = '1' then
--                     iShiftReg1 <= Binary(11 downto 2);
--                 end if;
--                 if iShift = '1' then
--                     iNoBitsProcessed <= iNoBitsProcessed + '1';
--                     iShiftReg2       <= iShiftReg2(14 downto 0) & iShiftReg1(9);
--                     iShiftReg1       <= iShiftReg1(8 downto 0) & '0';
--                 end if;
--                 if iMult = '1' then
--                     if iShiftReg2(15 downto 12) > "0100" then
--                         iShiftReg2(15 downto 12) <= iShiftReg2(15 downto 12) + "0011";
--                     end if;
--                     if iShiftReg2(11 downto 8) > "0100" then
--                         iShiftReg2(11 downto 8) <= iShiftReg2(11 downto 8) + "0011";
--                     end if;
--                     if iShiftReg2(7 downto 4) > "0100" then
--                         iShiftReg2(7 downto 4) <= iShiftReg2(7 downto 4) + "0011";
--                     end if;
--                     if iShiftReg2(3 downto 0) > "0100" then
--                         iShiftReg2(3 downto 0) <= iShiftReg2(3 downto 0) + "0011";
--                     end if;
--                 end if;
--             end if;
--         end if;
--     end process;

--     process (presState, Convert, iNoBitsProcessed)
--     begin
--         iReset  <= '0';
--         iBuffer <= '0';
--         iShift  <= '0';
--         iMult   <= '0';
--         case presState is
--             when stIdle =>
--                 if Convert = '1' then
--                     nextState <= stShift;
--                     iBuffer   <= '1';
--                 else
--                     nextState <= stIdle;
--                 end if;
--             when stShift =>
--                 iShift    <= '1';
--                 nextState <= stMult;
--             when stMult =>
--                 if iNoBitsProcessed = "1010" then
--                     nextState <= stComplete;
--                 else
--                     iMult     <= '1';
--                     nextState <= stShift;
--                 end if;
--             when stComplete =>
--                 nextState <= stIdle;
--                 BCD(23 downto 8) <= iShiftReg2;
--                 if Binary(1 downto 0) = "01" then
--                     BCD(7 downto 0) <= "00100101";
--                 elsif Binary(1 downto 0) = "10" then
--                     BCD(7 downto 0) <= "01010000";
--                 elsif Binary(1 downto 0) = "11" then
--                     BCD(7 downto 0) <= "01110101";
--                 else
--                     BCD(7 downto 0) <= "00000000";
--                 end if;
--                 iReset    <= '1';
--         end case;
--     end process;
-- end Behavioral;

architecture Behavioral of BinToBCD is
    attribute enum_encoding : STRING;
    type stateType is (stIdle, stConversion, stComplete);
    attribute enum_encoding of stateType : type is "00 01 11";
    signal presState                     : stateType;
    signal nextState                     : stateType;
    signal iReset                        : STD_LOGIC;
    signal iBuffer                       : STD_LOGIC;
    signal iShift                        : STD_LOGIC;
    signal iNoBitsProcessed              : STD_LOGIC_VECTOR(3 downto 0);
    signal iShiftReg1                    : STD_LOGIC_VECTOR(9 downto 0);
    signal iShiftReg2                    : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
begin
    process (Clock)
        variable TempReg : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    begin
        if Clock'Event and Clock = '1' then
            presState <= nextState;
            if Reset = '1' or iReset = '1' then
                iNoBitsProcessed <= (others => '0');
                presState        <= stIdle;
            else
                if iBuffer = '1' then
                    iShiftReg2 <= (others => '0');
                    iShiftReg1 <= Binary(11 downto 2);
                end if;
                if iShift = '1' then
                    iNoBitsProcessed <= iNoBitsProcessed + '1';
                    TempReg := iShiftReg2(14 downto 0) & iShiftReg1(9);
                    iShiftReg1 <= iShiftReg1(8 downto 0) & '0';
                    if iNoBitsProcessed /= "1001" then
                        if TempReg(15 downto 12) > "0100" then
                            TempReg(15 downto 12) := TempReg(15 downto 12) + "0011";
                        end if;
                        if TempReg(11 downto 8) > "0100" then
                            TempReg(11 downto 8) := TempReg(11 downto 8) + "0011";
                        end if;
                        if TempReg(7 downto 4) > "0100" then
                            TempReg(7 downto 4) := TempReg(7 downto 4) + "0011";
                        end if;
                        if TempReg(3 downto 0) > "0100" then
                            TempReg(3 downto 0) := TempReg(3 downto 0) + "0011";
                        end if;
                    end if;
                    iShiftReg2 <= TempReg;
                end if;
            end if;
        end if;
    end process;

    process (presState, Convert, iNoBitsProcessed)
    begin
        iReset  <= '0';
        iBuffer <= '0';
        iShift  <= '0';
        case presState is
            when stIdle =>
                if Convert = '1' then
                    nextState <= stConversion;
                    Done <= '0';
                    iBuffer   <= '1';
                else
                    nextState <= stIdle;
                end if;
            when stConversion =>
                if iNoBitsProcessed = "1010" then
                    nextState <= stComplete;
                else
                    iShift    <= '1';
                    nextState <= stConversion;
                end if;
            when stComplete =>
                nextState        <= stIdle;
                Done             <= '1';
                BCD(23 downto 8) <= iShiftReg2;
                if Binary(1 downto 0) = "01" then
                    BCD(7 downto 0) <= "00100101";
                elsif Binary(1 downto 0) = "10" then
                    BCD(7 downto 0) <= "01010000";
                elsif Binary(1 downto 0) = "11" then
                    BCD(7 downto 0) <= "01110101";
                else
                    BCD(7 downto 0) <= "00000000";
                end if;
                iReset <= '1';
        end case;
    end process;
end Behavioral;