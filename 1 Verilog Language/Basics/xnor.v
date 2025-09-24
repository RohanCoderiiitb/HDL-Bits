module top_module( 
    input a, 
    input b, 
    output out );
    xnor gate(out, a, b);
endmodule