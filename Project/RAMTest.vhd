library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity RAMTest is
    port (
        Clock   : in STD_LOGIC;
        R       : in STD_LOGIC;
        Trig    : in STD_LOGIC;
        DataIn  : in STD_LOGIC_VECTOR(23 downto 0);
        DataOut : out STD_LOGIC_VECTOR(23 downto 0)
    );
end RAMTest;

architecture Behavioral of RAMTest is
    attribute enum_encoding : STRING;
    -- state definitions
    type stateType is (stIdle, stCurrMem, stPrevMem, stStop);
    attribute enum_encoding of statetype : type is "00 01 11 10";
    signal presState                     : stateType;
    signal nextState                     : stateType;

    signal iStart   : STD_LOGIC                     := '0';
    signal iReset   : STD_LOGIC                     := '0';
    signal iWE      : STD_LOGIC_VECTOR(0 downto 0)  := (others => '0');
    signal iTemp    : STD_LOGIC_VECTOR(23 downto 0) := (others => '0');
    signal iAddrA   : STD_LOGIC_VECTOR(0 downto 0)  := (others => '0');
    signal iAddrB   : STD_LOGIC_VECTOR(0 downto 0)  := (others => '0');
    signal iDataIn  : STD_LOGIC_VECTOR(23 downto 0) := (others => '0');
    signal iDataOut : STD_LOGIC_VECTOR(23 downto 0) := (others => '0');

    component DPRAM24x2 is
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

begin

    U1 : DPRAM24x2 port map(
        clka  => Clock,
        wea   => iWE,
        addra => iAddrA,
        dina  => iDataIn,
        clkb  => Clock,
        addrb => iAddrB,
        doutb => iDataOut
    );

    process (Clock)
    begin
        if Clock'event and Clock = '1' then
            if iReset = '1' then
                iStart <= '0';
            else
                if R = '0' then
                    iAddrB(0) <= '0';
                    if Trig = '1' then
                        iStart <= '1';
                    end if;
                elsif R = '1' then
                    iAddrB(0) <= '1';
                end if;
            end if;
            presState <= nextState;
        end if;
    end process;

    process (presState, iStart)
    begin
        iReset <= '0';
        case presState is
            when stIdle =>
                if iStart = '1' then
                    nextState <= stCurrMem;
                    iAddrA(0) <= '0';
                    iDataIn   <= DataIn;
                else
                    nextState <= stIdle;
                end if;
            when stCurrMem =>
                nextState <= stPrevMem;
                iAddrA(0) <= '0';
                iTemp     <= iDataOut;
            when stPrevMem =>
                nextState <= stStop;
                iAddrA(0) <= '1';
                iDataIn   <= iTemp;
            when stStop =>
                nextState <= stIdle;
                iReset    <= '1';
                iAddrA(0) <= '1';
        end case;
    end process;

    DataOut <= iDataOut;
    iWE     <= "1";
end Behavioral;