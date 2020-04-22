library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity DPRAM is
    port (
        Clock   : in STD_LOGIC;
        R       : in STD_LOGIC;
        W       : in STD_LOGIC;
        DataIn  : in STD_LOGIC_VECTOR(23 downto 0);
        Display : out STD_LOGIC;
        DataOut : out STD_LOGIC_VECTOR(23 downto 0)
    );
end DPRAM;

architecture Behavioral of DPRAM is
    attribute enum_encoding : STRING;
    -- state definitions
    type stateType is (stIdle, stCurrMem, stPrevMem, stDisplay, stStop);
    attribute enum_encoding of statetype : type is "000 001 011 010 110";
    signal presState                     : stateType;
    signal nextState                     : stateType;

    signal iStart   : STD_LOGIC                     := '0';
    signal iW       : STD_LOGIC                     := '0';
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
                iStart    <= '0';
                presState <= stIdle;
            elsif R = '0' or iStart = '1' then
                iAddrB(0) <= '0';
                if W = '1' and iW = '0' and iStart = '0' then
                    iStart <= '1';
                end if;
                iW        <= W;
                presState <= nextState;
            elsif R = '1' then
                iAddrB(0) <= '1';
                presState <= stDisplay;
            end if;
        end if;
    end process;

    process (presState, iStart)
    begin
        iReset <= '0';
        case presState is
            when stIdle =>
                Display <= '0';
                if iStart = '1' then
                    nextState <= stCurrMem;
                    iAddrA(0) <= '0';
                    iDataIn   <= DataIn;
                    iTemp     <= iDataOut;
                else
                    nextState <= stIdle;
                end if;
            when stCurrMem =>
                nextState <= stPrevMem;
                iAddrA(0) <= '0';
            when stPrevMem =>
                nextState <= stDisplay;
                iAddrA(0) <= '1';
                iDataIn   <= iTemp;
            when stDisplay =>
                nextState <= stStop;
                Display   <= '1';
                iAddrA(0) <= '1';
            when stStop =>
                iReset <= '1';
        end case;
    end process;

    DataOut <= iDataOut;
    iWE     <= "1";
end Behavioral;