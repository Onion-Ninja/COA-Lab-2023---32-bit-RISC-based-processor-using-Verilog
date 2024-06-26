// The datapath module
module datapath (
    input RegDest,
    input RegWrite,
    input MemRead,
    input MemWrite,
    input MemToReg,
    input ALUsrc,
    input [3:0] ALUop,
    input Branch,
    input clk,
    input rst,
    output [5:0] opcode,
    output [10:0] extended_opcode
);

    wire enable;
    wire carry, zero, sign, conditional_flag, and_result;
    wire [31:0] nextInstrAddr, instruction, writeData, readData1, instrAddr, result, nextPC, readData2, SE1out, SE2out, b, dataMemReadData, offset_incrementer_output ;
  	wire [20:0] branch_offset;
    wire [15:0] imm;
    wire [4:0] R1, R2, R3, writeReg;
    wire [31:0] offset;

    
    assign enable = MemRead | MemWrite;         // Enable signal for the data memory module
    assign offset = nextInstrAddr >>> 2'b10;    // Read address for the instruction memory module
    
    // Instantiating a DFF to store the carry flag value
    // dff DFF (
    //     .clk(clk),
    //     .rst(rst),
    //     .d(carry),
    //     .q(lastCarry)
    // );
    
    // Instantiating the program counter module
    // It loads the value of the next_instruction
    program_counter PC (
        .nextInstrAddr(nextInstrAddr),
        .clk(clk),
        .rst(rst),
        .instrAddr(instrAddr)
    );

    // Instantiating the instruction memory module
    // load the instruction from the instruction memory module
    instruction_memory instructionMemory (
        .instrAddr(instrAddr),
        .instruction(instruction)
    );

    // Once the instruction is received decode the instruction 
    // Instantiating the instruction decoder module
    instruction_decoder instructionDecoder (
        .instruction(instruction),
        .opcode(opcode),
        .extended_opcode(extended_opcode),
        .offset(branch_offset),
        .R1(R1),
        .R2(R2),
        .R3(R3),
        .imm(imm)
    );

    // Mux to select the register to which data is to be written
    mux_5b_2to1 MUX1 (
        .a(R2),
        .b(R3),
        .sel(RegDest),
        .res(writeReg)
    );

    // Instantiating the register file module
  register_bank registerBank (
      	.read_reg1(R1),
    	.read_reg2(R2),
        .write_enable(RegWrite),
  		.write_reg(writeReg),
  		.write_data(writeData),
        .clk(clk),
        .rst(rst),
        .read_data_1(readData1),
        .read_data_2(readData2)
    );

    // Instantiating the sign extend module
    sign_extend_21bit SE1 (
        .in(branch_offset),
        .out(SE1out)
    );

    // Sign extend 16bit value to 21bit
    sign_extend_16bit SE2(
        .in(imm),
        .out(SE2out)
    );

    // Mux to choose the second input of the ALU 
    mux_32b_2to1 MUX2 (
        .a(readData2),
        .b(SE2out),
        .sel(ALUsrc), 
        .res(b)
    );

    // Instantiating the ALU module
    ALU ALU1 (
        .arg1(readData1),
        .arg2(b),
        .control_signal(ALUop),
        .clk(clk),
        .rst(rst),
        .carry(carry),
        .zero(zero), 
        .sign(sign),
        .result(result)
    );

    // Instantiating the jump control module
    branch_control BC (
        .opcode(opcode),
        .sign(sign),
        .carry(carry),
        .zero(zero),
        .conditional_flag(conditional_flag)
    );

    // Instantiating the PC incrementer module
    pc_incrementer PCInc (
        .pc(instrAddr),
        .pc_next(nextPC)
    );

    offset_incrementer offsetInc(
        .pc(instrAddr),
        .offset(SE1out),
        .res(offset_incrementer_output)
    );

    and_gate andGate(
        .a(Branch),
        .b(conditional_flag),
        .c(and_result)
    );

    mux_32b_2to1 PCsel(
        .a(nextPC),
        .b(offset_incrementer_output),
        .sel(and_result),
        .res(nextInstrAddr)

    );
    // Instantiating the data memory module
   data_memory dataMemory (
        .clk(clk),
     	.read_enable(MemRead),
        .write_enable(MemWrite),
        .address(result[9:0] >>> 2'b10), //memory is byte addressable
        .write_data(readData2),
        .read_data(dataMemReadData)
    );

    // Mux to select the data to be written to the data memory
    mux_32b_2to1 MUX3 (
        .a(result),
        .b(dataMemReadData),
        .sel(MemToReg),
        .res(writeData)
    );

endmodule
