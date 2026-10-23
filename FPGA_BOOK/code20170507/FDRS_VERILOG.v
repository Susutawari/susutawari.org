module FDRS_VERILOG(CLK, R, S, D, Q);

    input  CLK;
    input  R;
    input  S;
    input  D;
    output Q;

    reg    Q;

    always @(posedge CLK) begin
        if (R == 1'b1) begin
            Q <= 1'b0;
        end
        else if (S == 1'b1) begin
            Q <= 1'b1;
        end
        else begin
            Q <= D;
        end
    end

endmodule
