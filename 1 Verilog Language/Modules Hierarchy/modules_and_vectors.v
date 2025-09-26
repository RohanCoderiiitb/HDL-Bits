module mux4to1(
    input [7:0] in1, in2, in3, in4,
    input [1:0] sel,
    output [7:0] out
);
    wire [7:0] w1, w2;
    mux2to1 mux1(.in1(in1), .in2(in2), .sel(sel[0]), .opt(w1));
    mux2to1 mux2(.in1(in3), .in2(in4), .sel(sel[0]), .opt(w2));
    mux2to1 mux3(.in1(w1), .in2(w2), .sel(sel[1]), .opt(out));

endmodule

module mux2to1(
    input [7:0] in1, in2,
    input sel,
    output [7:0] opt
);
    always @(*) begin
        case (sel)
            1'b0: opt = in1;
            1'b1: opt = in2;
            default: opt = 8'b0;
        endcase
    end
endmodule

module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    wire [7:0] w1, w2, w3;
    my_dff8 dff1(.clk(clk), .d(d), .q(w1));
    my_dff8 dff2(.clk(clk), .d(w1), .q(w2));
    my_dff8 dff3(.clk(clk), .d(w2), .q(w3));
    mux4to1 myMux(.in1(d), .in2(w1), .in3(w2), .in4(w3), .sel(sel), .out(q));
endmodule