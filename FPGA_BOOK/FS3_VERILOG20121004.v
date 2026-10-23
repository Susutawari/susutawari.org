module FS3_VERILOG(SW0, SW1, SW2, SW3, SW4, SW5, LED0, LED1, LED2, LED3);

    input SW0;
    input SW1;
    input SW2;
    input SW3;
    input SW4;
    input SW5;
    output LED0;
    output LED1;
    output LED2;
    output LED3;

    assign {LED3, LED2, LED1, LED0} = {SW2, SW1, SW0} - {SW5, SW4, SW3};

endmodule
