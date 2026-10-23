library IEEE;
use IEEE.std_logic_1164.all;

library UNISIM;
use UNISIM.vcomponents.all;

entity DFF_VHDL is
    
    port (
        SW0   : in  std_logic;
        SW1   : in  std_logic;
        LED0 : out std_logic);

end DFF_VHDL;

architecture RTL of DFF_VHDL is

    signal led0_reg : std_logic;
	 signal clk : std_logic;

begin

	 IBUFG0 : IBUFG
	 port map (
	  O => clk,
	  I => SW1
	 );

    process (clk)
    begin
        if (clk'event and clk = '1') then
            led0_reg <= SW0;
        end if;
    end process;

    LED0 <= led0_reg;
    
end RTL;
