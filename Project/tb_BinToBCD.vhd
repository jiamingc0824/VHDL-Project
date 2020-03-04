library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_BinToBCD is
end tb_BinToBCD;

architecture behavior of tb_BinToBCD is

   -- Component Declaration for the Unit Under Test (UUT)

   component BinToBCD
      port (
         Clock   : in STD_LOGIC;
         Reset   : in STD_LOGIC;
         Convert : in STD_LOGIC;
         Binary  : in STD_LOGIC_VECTOR(11 downto 0);
         BCD     : out STD_LOGIC_VECTOR(23 downto 0)
      );
   end component;
   --Inputs
   signal tb_Clock   : std_logic                     := '0';
   signal tb_Reset   : std_logic                     := '0';
   signal tb_Convert : std_logic                     := '0';
   signal tb_Binary  : std_logic_vector(11 downto 0) := (others => '0');

   --Outputs
   signal tb_BCD : std_logic_vector(23 downto 0);

   -- Clock period definitions
   constant Clock_period : TIME := 20 ns;

begin

   -- Instantiate the Unit Under Test (UUT)
   uut : BinToBCD port map(
      Clock   => tb_Clock,
      Reset   => tb_Reset,
      Convert => tb_Convert,
      Binary  => tb_Binary,
      BCD     => tb_BCD
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
      wait for 100 ns;
      tb_Reset <= '1';
      wait for Clock_period * 10;
      tb_Reset <= '0';
      -- insert stimulus here 
      tb_Binary <= "111111111111"; -- 1023.75
      tb_Convert <= '1';
      wait for Clock_period * 4;
      tb_Convert <= '0';
      wait for Clock_period * 20;
      tb_Binary <= "110111100011"; -- 888.75
      tb_Convert <= '1';
      wait for Clock_period * 4;
      tb_Convert <= '0';

      wait;
   end process;

end;