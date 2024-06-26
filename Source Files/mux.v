module mux_5b_2to1(
    input wire [4:0] a,
    input wire [4:0] b,
    input wire sel,
    output wire [4:0] res
);

    assign res = sel ? b : a;
endmodule

module mux_32b_2to1(
    input wire [31:0] a,
    input wire [31:0] b,
    input wire sel,
    output wire [31:0] res
);

    assign res= sel ? b : a;
endmodule