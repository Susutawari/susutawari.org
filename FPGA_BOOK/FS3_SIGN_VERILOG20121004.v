module FS3_SIGN_VERILOG(SW0, SW1, SW2, SW3, SW4, SW5, LED0, LED1, LED2, LED3);

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

    wire [3:0] sub;

    assign sub = {1'b0, SW2, SW1, SW0} - {1'b0, SW5, SW4, SW3};
    assign LED3 = sub[3];
    assign {LED2, LED1, LED0} = sub[3] ? (~sub[2:0] + 1'b1) : sub[2:0];

endmodule
