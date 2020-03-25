library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_TopLevelTest is
end tb_TopLevelTest;

architecture behavior of tb_TopLevelTest is

   -- Component Declaration for the Unit Under Test (UUT)

   component TopLevelTest
      port (
         SystemClock         : in std_logic;
         Reset               : in std_logic;
         MISO                : in std_logic;
         Previous            : in std_logic;
         ThreePointThreeVolt : out std_logic;
         Txd                 : out std_logic;
         SCLK                : out std_logic;
         CS                  : out std_logic
      );
   end component;
   --Inputs
   signal tb_SystemClock : std_logic := '0';
   signal tb_Reset       : std_logic := '0';
   signal tb_MISO        : std_logic := '0';
   signal tb_Previous    : std_logic := '0';

   --Outputs
   signal tb_ThreePointThreeVolt : std_logic;
   signal tb_Txd                 : std_logic;
   signal tb_SCLK                : std_logic;
   signal tb_CS                  : std_logic;

   -- Clock period definitions
   constant SystemClock_period : TIME := 20 ns;

   signal Test : std_logic_vector(15 downto 0) := "1100001111110000"; --1100001111110000 1001110000111111

begin

   -- Instantiate the Unit Under Test (UUT)
   uut : TopLevelTest port map(
      SystemClock         => tb_SystemClock,
      Reset               => tb_Reset,
      MISO                => tb_MISO,
      Previous            => tb_Previous,
      ThreePointThreeVolt => tb_ThreePointThreeVolt,
      Txd                 => tb_Txd,
      SCLK                => tb_SCLK,
      CS                  => tb_CS
   );

   -- Clock process definitions
   tb_SystemClock_process : process
   begin
      tb_SystemClock <= '0';
      wait for SystemClock_period/2;
      tb_SystemClock <= '1';
      wait for SystemClock_period/2;
   end process;

   process (tb_SCLK, tb_CS)
   begin
      tb_MISO <= Test(15);
      if tb_SCLK'EVENT and tb_SCLK = '0' then
         if tb_CS = '0' then
            Test <= Test(14 downto 0) & '0';
         end if;
      end if;

      if tb_CS'EVENT and tb_CS = '1' and Test /= "1100001111110000" then
         Test <= "1001110000111111";
      end if;
   end process;

   -- Stimulus process
   stim_proc : process
   begin
      wait for 40us;
      tb_Previous <= '1';
      wait for 2 * SystemClock_period;
      tb_Previous <= '0';
      wait for 40us;
      tb_Previous <= '1';
      wait for 2 * SystemClock_period;
      tb_Previous <= '0';
      wait;
   end process;

end;