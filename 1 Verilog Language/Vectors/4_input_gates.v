module top_module( 
    input [3:0] in,
    output out_and,
    output out_or,
    output out_xor
);
    and a(out_and, in[0], in[1], in[2], in[3]);
    or o(out_or, in[0], in[1], in[2], in[3]);
    xor x(out_xor, in[0], in[1], in[2], in[3]);
endmodule