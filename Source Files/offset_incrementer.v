module offset_incrementer(
    input [31:0] pc,
    input [31:0] offset,
    output [31:0] res
);
    assign res = pc + offset;
endmodule