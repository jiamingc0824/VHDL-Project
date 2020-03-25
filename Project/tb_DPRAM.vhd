library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_DPRAM is
end tb_DPRAM;

architecture behavior of tb_DPRAM is

   -- Component Declaration for the Unit Under Test (UUT)

   component DPRAM
      port (
         Clock   : in std_logic;
         R       : in std_logic;
         W       : in std_logic;
         DataIn  : in std_logic_vector(23 downto 0);
         Display : out std_logic;
         DataOut : out std_logic_vector(23 downto 0)
      );
   end component;
   --Inputs
   signal tb_Clock  : std_logic                     := '0';
   signal tb_R      : std_logic                     := '0';
   signal tb_W      : std_logic                     := '0';
   signal tb_DataIn : std_logic_vector(23 downto 0) := (others => '0');

   --Outputs
   signal tb_Display : std_logic;
   signal tb_DataOut : std_logic_vector(23 downto 0);

   -- Clock period definitions
   constant Clock_period : TIME := 10 ns;

begin

   -- Instantiate the Unit Under Test (UUT)
   uut : DPRAM port map(
      Clock   => tb_Clock,
      R       => tb_R,
      W       => tb_W,
      DataIn  => tb_DataIn,
      Display => tb_Display,
      DataOut => tb_DataOut
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
      tb_R      <= '0';
      tb_DataIn <= "000000000000111111111111";
      tb_W   <= '1';
      wait for 2 * Clock_period;
      tb_W <= '0';
      wait for 16 * Clock_period;
      tb_R      <= '1';
      tb_DataIn <= "111111111111000000000000";
      wait for 2 * Clock_period;
      tb_R <= '0';
      wait for 2 * Clock_period;
      tb_W <= '1';
      wait for 2 * Clock_period;
      tb_W <= '0';
      wait for 16 * Clock_period;
      tb_R <= '1';
      wait for 2 * Clock_period;
      tb_R <= '0';
      wait;
   end process;

end;