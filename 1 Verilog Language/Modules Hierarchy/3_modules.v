module top_module ( input clk, input d, output q );
    wire w1, w2;
    my_dff dff1(.d(d), .clk(clk), .q(w1));
    my_dff dff2(.d(w1), .clk(clk), .q(w2));
    my_dff dff3(.d(w2), .clk(clk), .q(q));
endmodule