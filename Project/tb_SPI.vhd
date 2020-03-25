library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_SPI is
end tb_SPI;

architecture behavior of tb_SPI is

   -- Component Declaration for the Unit Under Test (UUT)

   component SPI
      port (
         Clock   : in std_logic;
         MISO    : in std_logic;
         Reset   : in std_logic;
         Hold    : in std_logic;
         SCLK    : out std_logic;
         CS      : out std_logic;
         Convert : out STD_LOGIC;
         Data    : out std_logic_vector(11 downto 0)
      );
   end component;
   --Inputs
   signal tb_Clock : std_logic := '0';
   signal tb_MISO  : std_logic := '0';
   signal tb_Reset : std_logic := '0';
   signal tb_Hold  : std_logic := '0';

   --Outputs
   signal tb_SCLK    : std_logic;
   signal tb_CS      : std_logic;
   signal tb_Convert : std_logic;
   signal tb_Data    : std_logic_vector(11 downto 0);

   -- Clock period definitions
   constant Clock_period : TIME := 20 ns;

   signal Test : std_logic_vector(15 downto 0) := "1100001111110000"; --1100001111110000 1001110000111111

begin

   -- Instantiate the Unit Under Test (UUT)
   uut : SPI port map(
      Clock   => tb_Clock,
      MISO    => tb_MISO,
      Reset   => tb_Reset,
      Hold    => tb_Hold,
      SCLK    => tb_SCLK,
      CS      => tb_CS,
      Convert => tb_Convert,
      Data    => tb_Data
   );

   -- Clock process definitions
   tb_Clock_process : process
   begin
      tb_Clock <= '0';
      wait for Clock_period/2;
      tb_Clock <= '1';
      wait for Clock_period/2;
   end process;

   process (tb_SCLK, tb_CS)
   begin
      tb_MISO <= Test(15);
      if tb_SCLK'EVENT and tb_SCLK = '0' then
         if tb_CS = '0' then
            Test <= Test(14 downto 0) & '0';
         end if;
      end if;

      if tb_CS'EVENT and tb_CS = '1' then
         Test <= "1001110000111111";
      end if;
   end process;

   -- Stimulus process
   stim_proc : process
   begin
      -- hold reset state for 100 ns.
      tb_Reset <= '1';
      wait for 100 ns;
      tb_Reset <= '0';
      -- insert stimulus here

      wait;
   end process;

end;