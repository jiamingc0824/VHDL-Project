library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_RS232Txd is
end tb_RS232Txd;

architecture behavior of tb_RS232Txd is

   -- Component Declaration for the Unit Under Test (UUT)

   component RS232Txd
      port (
         Reset : in std_logic;
         Send  : in std_logic;
         Clock : in std_logic;
         BCD   : in std_logic_vector(23 downto 0);
         Txd   : out std_logic
      );
   end component;
   --Inputs
   signal tb_Reset : std_logic                     := '0';
   signal tb_Send  : std_logic                     := '0';
   signal tb_Clock : std_logic                     := '0';
   signal tb_BCD   : std_logic_vector(23 downto 0) := (others => '0');

   --Outputs
   signal tb_Txd : std_logic;

   -- Clock period definitions
   constant Clock_period : TIME := 20 ns;

begin

   -- Instantiate the Unit Under Test (UUT)
   uut : RS232Txd port map(
      Reset => tb_Reset,
      Send  => tb_Send,
      Clock => tb_Clock,
      BCD   => tb_BCD,
      Txd   => tb_Txd
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
      tb_BCD <= x"002375";
      tb_Send  <= '1';
      wait for 40 ns;
      tb_Send <= '0';

      -- insert stimulus here 

      wait;
   end process;

end;