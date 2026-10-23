library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity FS3_SIGN_VHDL is
    
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

end FS3_SIGN_VHDL;

architecture RTL of FS3_SIGN_VHDL is

        signal a : std_logic_vector(2 downto 0);
        signal b : std_logic_vector(2 downto 0);
        signal d : std_logic_vector(2 downto 0);
        signal sub : std_logic_vector(3 downto 0);

begin

    a <= SW2 & SW1 & SW0;
    b <= SW5 & SW4 & SW3;
    sub <= ('0' & a) - ('0' & b);
    d <= not sub(2 downto 0) + '1' when sub(3) = '1' else
	 sub(2 downto 0);

    LED0 <= d(0);
    LED1 <= d(1);
    LED2 <= d(2);
    LED3 <= sub(3); -- sub(3) is BO
	 
end RTL;
