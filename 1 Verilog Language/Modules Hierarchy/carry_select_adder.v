module mux2to1(
    input [15:0] a,
    input [15:0] b,
    input sel,
    output [15:0] o
);
    always @(*) begin
        case (sel)
            1'b0: o = a;
            1'b1: o = b;
        endcase
    end
endmodule

module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] wire1, wire2, wire3, wire4;
    wire cout1, cout2, cout3;
    add16 a1(.a(a[15:0]), .b(b[15:0]), .cin(0), .sum(wire1), .cout(cout1));
    add16 a2(.a(a[31:16]), .b(b[31:16]), .cin(0), .sum(wire2), .cout(cout2));
    add16 a3(.a(a[31:16]), .b(b[31:16]), .cin(1), .sum(wire3), .cout(cout3));
    mux2to1 m1(.a(wire2), .b(wire3), .sel(cout1), .o(wire4));
    assign sum = {wire4, wire1};
endmodule