library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity FA3_VHDL is
    
    port (
        SW0 : in std_logic;
        SW1 : in std_logic;
        SW2 : in std_logic;
        SW3 : in std_logic;
        SW4 : in std_logic;
        SW5 : in std_logic;

        LED0 : out std_logic;
        LED1 : out std_logic;
        LED2 : out std_logic;
        LED3 : out std_logic);

end FA3_VHDL;

architecture RTL of FA3_VHDL is

    signal a : std_logic_vector(2 downto 0);
    signal b : std_logic_vector(2 downto 0);
    signal s : std_logic_vector(3 downto 0);

begin

    a <= SW2 & SW1 & SW0;
    b <= SW5 & SW4 & SW3;
    s <= ('0' & a) + ('0' & b);

    LED0 <= s(0);
    LED1 <= s(1);
    LED2 <= s(2);
    LED3 <= s(3); -- s(3) is CO
	 
end RTL;
