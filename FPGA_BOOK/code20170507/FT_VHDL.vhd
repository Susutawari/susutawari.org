library IEEE;
use IEEE.std_logic_1164.all;

entity FT_VHDL is
    
    port (
        CLK : in  std_logic;
        T   : in  std_logic;
        Q   : out std_logic);

end FT_VHDL;

architecture RTL of FT_VHDL is

    signal Q_reg : std_logic;

begin

    process (CLK)
    begin
        if (CLK'event and CLK = '1') then
            if (T ='1') then
                Q_reg <= not Q_reg;
            else
                Q_reg <= Q_reg;
            end if;
        end if;
    end process;

    Q <= Q_reg;

end RTL;
