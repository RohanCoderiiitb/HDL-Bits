module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n);
    wire w1, w2, w3;
    and a1(w1, a, b);
    and a2(w2, c, d);
    or(w3, w1, w2);
    assign out = w3;
    not n1(out_n, w3);
endmodule