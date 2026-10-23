module SBASE_STATE4_VERILOG(CLK, R, TRG_ONE, RDY_IN, RDY,
                            STATE1, STATE2, STATE3, STATE4,
                            POUT_ONE1, POUT_ONE2, POUT_ONE3, POUT_ONE4);

    input CLK;
    input R;
    input TRG_ONE;
    input RDY_IN;

    output RDY;
    output STATE1;
    output STATE2;
    output STATE3;
    output STATE4;
    output POUT_ONE1;
    output POUT_ONE2;
    output POUT_ONE3;
    output POUT_ONE4;

    wire   q0;
    wire   q1;
    wire   pout_one;

    SBASE_PGCB2_VERILOG
      SBASE_PGCB2_VERILOG(.CLK(CLK), 
                          .R(R), 
                          .TRG_ONE(TRG_ONE),
                          .RDY_IN(RDY_IN),
                          .FB(q0 & q1),
                          .Q0(q0),
                          .Q1(q1),
                          .POUT_ONE(pout_one),
                          .RDY(RDY));

    assign STATE1 = (~RDY & ~R) & ~q1 & ~q0;
    assign STATE2 = (~RDY & ~R) & ~q1 &  q0;
    assign STATE3 = (~RDY & ~R) &  q1 & ~q0;
    assign STATE4 = (~RDY & ~R) &  q1 &  q0;

    assign POUT_ONE1 = pout_one & STATE1;
    assign POUT_ONE2 = pout_one & STATE2;
    assign POUT_ONE3 = pout_one & STATE3;
    assign POUT_ONE4 = pout_one & STATE4;

endmodule
