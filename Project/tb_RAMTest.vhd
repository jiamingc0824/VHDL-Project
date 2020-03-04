library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_RAMTest is
end tb_RAMTest;

architecture behavior of tb_RAMTest is

   -- Component Declaration for the Unit Under Test (UUT)

   component RAMTest
      port (
         Clock   : in STD_LOGIC;
         AddrA   : in STD_LOGIC_VECTOR(0 downto 0);
         AddrB   : in STD_LOGIC_VECTOR(0 downto 0);
         DataIn  : in STD_LOGIC_VECTOR(23 downto 0);
         DataOut : out STD_LOGIC_VECTOR(23 downto 0)
      );
   end component;
   --Inputs
   signal tb_Clock  : std_logic                     := '0';
   signal tb_AddrA  : std_logic_vector(0 downto 0)  := (others => '0');
   signal tb_DataIn : std_logic_vector(23 downto 0) := (others => '0');
   signal tb_AddrB  : std_logic_vector(0 downto 0)  := (others => '0');

   --Outputs
   signal tb_DataOut : std_logic_vector(23 downto 0);

   -- Clock period definitions
   constant Clock_period : TIME := 20 ns;

begin

   -- Instantiate the Unit Under Test (UUT)
   uut : RAMTest port map(
      Clock   => tb_Clock,
      AddrA   => tb_AddrA,
      DataIn  => tb_DataIn,
      AddrB   => tb_AddrB,
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
      -- hold reset state for 100 ns.
      wait for 100 ns;
      tb_AddrA  <= "0";
      tb_DataIn <= "100101101100001110100101";
      wait for Clock_period;
      tb_AddrB <= "0";
      wait for Clock_period;
      tb_AddrA  <= "1";
      tb_DataIn <= tb_DataOut;
      wait for Clock_period;
      tb_AddrA  <= "0";
      tb_DataIn <= "011010010011110010100101";
      wait for Clock_period;
      tb_AddrB <= "1";
      wait for 10*Clock_period;
      tb_AddrB <= "0";
      wait;
   end process;

end;