// Module to decode a 32 bit instructionuction
module instruction_decoder(
    input wire [31:0] instruction,
    output wire [5:0] opcode,
    output wire [20:0] offset,
    output wire [10:0] extended_opcode,
    output wire [4:0] R1,
    output wire [4:0] R2,
    output wire [4:0] R3,
    output wire [15:0] imm
);
    assign opcode ={instruction[31:26]};
    assign offset ={instruction[20:0]};
    assign extended_opcode ={instruction[10:0]};
    assign R1 ={instruction[25:21]};
    assign R2 ={instruction[20:16]};
    assign R3 ={instruction[15:11]};
    assign imm ={instruction[15:0]};

endmodule
