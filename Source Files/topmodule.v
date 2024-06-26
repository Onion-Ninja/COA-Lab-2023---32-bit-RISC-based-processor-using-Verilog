module topmodule (
    input clk,
    input rst
);
    wire [5:0] opcode;
    wire [10:0] extended_opcode;
    wire RegDest;
    wire RegWrite;
    wire MemRead;
    wire MemWrite;
    wire MemToReg;
    wire ALUsrc;
    wire [3:0] ALUop;
    wire Branch;

    // Instantiate the control unit
    control_unit CU (
        .opcode(opcode),
        .extended_opcode(extended_opcode),
        .RegDest(RegDest),
        .RegWrite(RegWrite),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .MemToReg(MemToReg),
        .ALUsrc(ALUsrc),
        .ALUop(ALUop),
        .Branch(Branch)
    );

    // Instantiate the datapath unit
    datapath DP (
        .opcode(opcode),
        .extended_opcode(extended_opcode),
        .RegDest(RegDest),
        .RegWrite(RegWrite),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .MemToReg(MemToReg),
        .ALUsrc(ALUsrc),
        .ALUop(ALUop),
        .Branch(Branch),
        .clk(clk),
        .rst(rst)
    );
endmodule