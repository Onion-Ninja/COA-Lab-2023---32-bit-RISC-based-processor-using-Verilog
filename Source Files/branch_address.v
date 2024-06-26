module branch_address(
    input wire [31:0] pc,
    input wire [31:0] offset,
    output wire [31:0] branch_location
);
    assign branch_location = pc + offset;
endmodule 
