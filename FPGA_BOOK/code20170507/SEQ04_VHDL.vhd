library IEEE;
use IEEE.std_logic_1164.all;

entity SEQ04_VHDL is
    
    port (
        CLK  : in  std_logic;
        PSW0 : in  std_logic;
        LED0 : out std_logic;
        LED1 : out std_logic;
        LED2 : out std_logic;
        LED3 : out std_logic);

end SEQ04_VHDL;

architecture RTL of SEQ04_VHDL is

    component SBASE_STATE4_VHDL
        port (
            CLK       : in  std_logic;
            R         : in  std_logic;
            TRG_ONE   : in  std_logic;
            RDY_IN    : in  std_logic;
            RDY       : out std_logic;
            STATE1    : out std_logic;
            STATE2    : out std_logic;
            STATE3    : out std_logic;
            STATE4    : out std_logic;
            POUT_ONE1 : out std_logic;
            POUT_ONE2 : out std_logic;
            POUT_ONE3 : out std_logic;
            POUT_ONE4 : out std_logic);
    end component;

    component SBASE_TIMER_CB24RM_VHDL
        port (
            CLK      : in  std_logic;
            R        : in  std_logic;
            TRG_ONE  : in  std_logic;
            MODE     : in  std_logic;
            POUT     : out std_logic;
            POUT_ONE : out std_logic);
    end component;

    signal rdy_in : std_logic;
    signal pout : std_logic;
    signal pout_one : std_logic_vector(4 downto 1);
    signal trg_one : std_logic;

begin

    SBASE_STATE4_VHDL_inst :
        SBASE_STATE4_VHDL port map (
            CLK       => CLK,
            R         => '0',
            TRG_ONE   => PSW0,
            RDY_IN    => rdy_in,
            RDY       => open,
            STATE1    => LED0,
            STATE2    => LED1,
            STATE3    => LED2,
            STATE4    => LED3,
            POUT_ONE1 => pout_one(1),
            POUT_ONE2 => pout_one(2),
            POUT_ONE3 => pout_one(3),
            POUT_ONE4 => pout_one(4));

    SBASE_TIMER_CB24RM_VHDL_inst :
        SBASE_TIMER_CB24RM_VHDL port map (
            CLK      => CLK,
            R        => '0',
            TRG_ONE  => trg_one,
            MODE     => '0',
            POUT     => pout,
            POUT_ONE => open);

    rdy_in <= not pout;
    trg_one <= pout_one(1) or pout_one(2) or pout_one(3) or pout_one(4);

end RTL;
