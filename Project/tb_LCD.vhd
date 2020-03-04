library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_LCD is
end tb_LCD;

architecture behavior of tb_LCD is

   -- Component Declaration for the Unit Under Test (UUT)

   component LCD
      port (
         Clock   : in STD_LOGIC;
         Reset   : in STD_LOGIC;
         Display : in STD_LOGIC;
         -- BCD     : in STD_LOGIC_VECTOR(23 downto 0);
         Data    : out STD_LOGIC_VECTOR(3 downto 0);
         Enable  : out STD_LOGIC;
         RS      : out STD_LOGIC;
         RW      : out STD_LOGIC
      );
   end component;
   --Inputs
   signal tb_Clock   : std_logic := '0';
   signal tb_Reset   : std_logic := '0';
   signal tb_Display : std_logic := '0';
   -- signal tb_BCD     : std_logic_vector(23 downto 0);

   --Outputs
   signal tb_Data   : std_logic_vector(3 downto 0);
   signal tb_Enable : std_logic;
   signal tb_RS     : std_logic;
   signal tb_RW     : std_logic;

   -- Clock period definitions
   constant Clock_period : TIME := 10 ns;

begin

   -- Instantiate the Unit Under Test (UUT)
   uut : LCD port map(
      Clock   => tb_Clock,
      Reset   => tb_Reset,
      Display => tb_Display,
      -- BCD     => tb_BCD,
      Data    => tb_Data,
      Enable  => tb_Enable,
      RS      => tb_RS,
      RW      => tb_RW
   );

   -- Clock process definitions
   tb_Clock_process : process
   begin
      tb_Clock <= '0';
      wait for Clock_period/2;
      tb_Clock <= '1';
      wait for Clock_period/2;
   end process;
   -- Stimulus process
   stim_proc : process
   begin
      -- hold reset state for 100 ns.
      tb_Reset <= '1';
      wait for 100 ns;
      tb_Reset <= '0';

      wait for 200 us;
      tb_Display <= '1';
      wait for 100 ns;
      tb_Display <= '0';

      -- insert stimulus here 

      wait;
   end process;

end;