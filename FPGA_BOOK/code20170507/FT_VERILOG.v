module FT_VERILOG(CLK, T, Q);

    input  CLK;
    input  T;
    output Q;

    reg    Q;

    always @(posedge CLK) begin
        if (T == 1'b1) begin
        	Q <= ~Q;
        end
        else begin
        	Q <= Q;
        end
    end

endmodule
