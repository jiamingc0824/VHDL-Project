library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_RAMTest is
end tb_RAMTest;

architecture behavior of tb_RAMTest is

   -- Component Declaration for the Unit Under Test (UUT)

   component RAMTest
      port (
         Clock   : in STD_LOGIC;
         R       : in STD_LOGIC;
         Trig    : in STD_LOGIC;
         DataIn  : in STD_LOGIC_VECTOR(23 downto 0);
         DataOut : out STD_LOGIC_VECTOR(23 downto 0)
      );
   end component;
   --Inputs
   signal tb_Clock  : std_logic                     := '0';
   signal tb_DataIn : std_logic_vector(23 downto 0) := (others => '0');
   signal tb_R      : std_logic                     := '0';
   signal tb_Trig   : std_logic                     := '0';

   --Outputs
   signal tb_DataOut : std_logic_vector(23 downto 0);

   -- Clock period definitions
   constant Clock_period : TIME := 20 ns;

begin

   -- Instantiate the Unit Under Test (UUT)
   uut : RAMTest port map(
      Clock   => tb_Clock,
      DataIn  => tb_DataIn,
      R       => tb_R,
      Trig    => tb_Trig,
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
      tb_Trig   <= '1';
      wait for 2 * Clock_period;
      tb_Trig <= '0';
      wait for 16 * Clock_period;
      tb_R      <= '1';
      tb_DataIn <= "111111111111000000000000";
      wait for 2 * Clock_period;
      tb_R <= '0';
      wait for 2 * Clock_period;
      tb_Trig <= '1';
      wait for 2 * Clock_period;
      tb_Trig <= '0';
      wait for 16 * Clock_period;
      tb_R <= '1';
      wait for 2 * Clock_period;
      tb_R <= '0';
      wait;
   end process;

end;