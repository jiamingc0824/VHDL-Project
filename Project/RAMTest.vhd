library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity RAMTest is
    port(
        Clock : in STD_LOGIC;
        AddrA : in STD_LOGIC_VECTOR(0 downto 0);
        AddrB : in STD_LOGIC_VECTOR(0 downto 0);
        DataIn : in STD_LOGIC_VECTOR(23 downto 0);
        DataOut : out STD_LOGIC_VECTOR(23 downto 0)
    );
end RAMTest;

architecture Behavioral of RAMTest is
    signal iWE : STD_LOGIC_VECTOR(0 downto 0);
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

begin
    U1 : DPRAM24x2 port map(
        clka  => Clock,
        wea   => iWE,
        addra => AddrA,
        dina  => DataIn,
        clkb  => Clock,
        addrb => AddrB,
        doutb => DataOut
    );
    iWE <= "1";
end Behavioral;