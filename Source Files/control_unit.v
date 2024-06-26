module control_unit(
    input wire [5:0] opcode,
    input wire [10:0] extended_opcode,
    output reg RegDest,
    output reg RegWrite,
    output reg Branch,
    output reg MemRead,
    output reg MemWrite,
    output reg MemToReg,
    output reg ALUsrc,
    output reg [3:0] ALUop
);
  always @(opcode or extended_opcode) begin
        case (opcode)
            6'b000000 : begin //ALU functions
                case (extended_opcode)
                    11'b00000000000 : begin        // add
                        RegDest = 1'b1;
                        RegWrite = 1'b1;
                        MemRead = 1'b0;
                        MemWrite = 1'b0;
                        MemToReg = 2'b0;
                        ALUsrc = 1'b0;
                        ALUop = 4'b0000;
                        Branch= 1'b0;    
                    end 
                    11'b00000000001 : begin        // subtract
                        RegDest = 1'b1;
                        RegWrite = 1'b1;
                        MemRead = 1'b0;
                        MemWrite = 1'b0;
                        MemToReg = 1'b0;
                        ALUsrc = 1'b0;
                        ALUop = 4'b0001; //sub
                        Branch = 1'b0;
                        
                    end
                    // AND
                    11'b00000000010: begin           
                        RegDest = 1'b1;
                        RegWrite = 1'b1;
                        MemRead = 1'b0;
                        MemWrite = 1'b0;
                        MemToReg = 1'b0;
                        ALUsrc = 1'b0;
                        ALUop = 4'b0010;
                        Branch = 1'b0;
                    end
                    //OR
                     11'b00000000011: begin           
                        RegDest = 1'b1;
                        RegWrite = 1'b1;
                        MemRead = 1'b0;
                        MemWrite = 1'b0;
                        MemToReg = 1'b0;
                        ALUsrc = 1'b0;
                        ALUop = 4'b0011;
                        Branch = 1'b0;
                    end
                    //XOR
                    11'b00000000100: begin           
                        RegDest = 1'b1;
                        RegWrite = 1'b1;
                        MemRead = 1'b0;
                        MemWrite = 1'b0;
                        MemToReg = 1'b0;
                        ALUsrc = 1'b0;
                        ALUop = 4'b0100;
                        Branch = 1'b0;
                    end
                    //NOT
                    11'b00000000101: begin           
                        RegDest = 1'b1;
                        RegWrite = 1'b1;
                        MemRead = 1'b0;
                        MemWrite = 1'b0;
                        MemToReg = 1'b0;
                        ALUsrc = 1'b0;
                        ALUop = 4'b0101;
                        Branch = 1'b0;
                    end
                    //SLA
                    11'b00000000110: begin           
                        RegDest = 1'b1;
                        RegWrite = 1'b1;
                        MemRead = 1'b0;
                        MemWrite = 1'b0;
                        MemToReg = 1'b0;
                        ALUsrc = 1'b0;
                        ALUop = 4'b0110;
                        Branch = 1'b0;
                    end
                    //SRA
                    11'b00000000111: begin           
                        RegDest = 1'b1;
                        RegWrite = 1'b1;
                        MemRead = 1'b0;
                        MemWrite = 1'b0;
                        MemToReg = 1'b0;
                        ALUsrc = 1'b0;
                        ALUop = 4'b0111;
                        Branch = 1'b0;
                    end
                    //SRL
                    11'b00000001000: begin           
                        RegDest = 1'b1;
                        RegWrite = 1'b1;
                        MemRead = 1'b0;
                        MemWrite = 1'b0;
                        MemToReg = 1'b0;
                        ALUsrc = 1'b0;
                        ALUop = 4'b1000;
                        Branch = 1'b0;
                    end
                endcase
            end


            6'b000001 : begin        // addi
                        RegDest = 1'b0;
                        RegWrite = 1'b1;
                        MemRead = 1'b0;
                        MemWrite = 1'b0;
                        MemToReg = 2'b0;
                        ALUsrc = 1'b1;
                        ALUop = 4'b0000;
                        Branch= 1'b0;    
                    end 
            6'b000010 : begin        // SUBI
                        RegDest = 1'b0;
                        RegWrite = 1'b1;
                        MemRead = 1'b0;
                        MemWrite = 1'b0;
                        MemToReg = 1'b0;
                        ALUsrc = 1'b1;
                        ALUop = 4'b0001; //sub
                        Branch = 1'b0;
                        
                    end
                    // ANDI
            6'b000011: begin           
                        RegDest = 1'b0;
                        RegWrite = 1'b1;
                        MemRead = 1'b0;
                        MemWrite = 1'b0;
                        MemToReg = 1'b0;
                        ALUsrc = 1'b1;
                        ALUop = 4'b0010;
                        Branch = 1'b0;
                    end
                    //ORI
            6'b000100: begin           
                        RegDest = 1'b0;
                        RegWrite = 1'b1;
                        MemRead = 1'b0;
                        MemWrite = 1'b0;
                        MemToReg = 1'b0;
                        ALUsrc = 1'b1;
                        ALUop = 4'b0011;
                        Branch = 1'b0;
                    end
                    //XORI
            6'b000101: begin           
                        RegDest = 1'b0;
                        RegWrite = 1'b1;
                        MemRead = 1'b0;
                        MemWrite = 1'b0;
                        MemToReg = 1'b0;
                        ALUsrc = 1'b1;
                        ALUop = 4'b0100;
                        Branch = 1'b0;
                    end
                    //NOTI
            6'b000110: begin           
                        RegDest = 1'b0;
                        RegWrite = 1'b1;
                        MemRead = 1'b0;
                        MemWrite = 1'b0;
                        MemToReg = 1'b0;
                        ALUsrc = 1'b1;
                        ALUop = 4'b0101;
                        Branch = 1'b0;
                    end
                    //SLAI
            6'b000111: begin           
                        RegDest = 1'b0;
                        RegWrite = 1'b1;
                        MemRead = 1'b0;
                        MemWrite = 1'b0;
                        MemToReg = 1'b0;
                        ALUsrc = 1'b1;
                        ALUop = 4'b0110;
                        Branch = 1'b0;
                    end
                    //SRAI
            6'b001000: begin           
                        RegDest = 1'b0;
                        RegWrite = 1'b1;
                        MemRead = 1'b0;
                        MemWrite = 1'b0;
                        MemToReg = 1'b0;
                        ALUsrc = 1'b1;
                        ALUop = 4'b0111;
                        Branch = 1'b0;
                    end
                    //SRLI
            6'b001001: begin           
                        RegDest = 1'b0;
                        RegWrite = 1'b1;
                        MemRead = 1'b0;
                        MemWrite = 1'b0;
                        MemToReg = 1'b0;
                        ALUsrc = 1'b1;
                        ALUop = 4'b1000;
                        Branch = 1'b0;
                    end

///LOAD and STORE ops

//LD/LDSP 
            6'b001010 : begin
                        RegDest = 1'b0;
                        RegWrite = 1'b1;
                        MemRead = 1'b1;
                        MemWrite = 1'b0;
                        MemToReg = 1'b1;
                        ALUsrc = 1'b1;
                        ALUop = 4'b0000;
                        Branch = 1'b0;        
            end

//ST/STSP   
            6'b001011 : begin
                        RegDest = 1'b0;
                        RegWrite = 1'b0;
                        MemRead = 1'b0;
                        MemWrite = 1'b1;
                        MemToReg = 1'b0;
                        ALUsrc = 1'b1;
                        ALUop = 4'b0000;
                        Branch = 1'b0;
            end


//Branch instructions:

//BR
            6'b001100 : begin
                        RegDest = 1'b0;
                        RegWrite = 1'b0;
                        MemRead = 1'b0;
                        MemWrite = 1'b0;
                        MemToReg = 1'b0;
                        ALUsrc = 1'b1;
                        ALUop = 4'b0000;
                        Branch = 1'b1;
            end

//BMI       
            6'b001101 : begin
                        RegDest = 1'b0;
                        RegWrite = 1'b0;
                        MemRead = 1'b0;
                        MemWrite = 1'b1;
                        MemToReg = 1'b0;
                        ALUsrc = 1'b1;
                        ALUop = 4'b0000;
                        Branch = 1'b0;
            end

//BPL
            6'b001110 : begin
                        RegDest = 1'b0;
                        RegWrite = 1'b0;
                        MemRead = 1'b0;
                        MemWrite = 1'b1;
                        MemToReg = 1'b0;
                        ALUsrc = 1'b1;
                        ALUop = 4'b0000;
                        Branch = 1'b0;
            end

//BZ
            6'b001111 : begin
                        RegDest = 1'b0;
                        RegWrite = 1'b0;
                        MemRead = 1'b0;
                        MemWrite = 1'b1;
                        MemToReg = 1'b0;
                        ALUsrc = 1'b1;
                        ALUop = 4'b0000;
                        Branch = 1'b0;
            end

//PUSH           
            6'b010000 : begin
                        RegDest = 1'b0;
                        RegWrite = 1'b1;
                        MemRead = 1'b0;
                        MemWrite = 1'b0;
                        MemToReg = 1'b0;
                        ALUsrc = 1'b0;
                        ALUop = 4'b1001;
                        Branch = 1'b0;
            end

//POP
            6'b010001 : begin
                        RegDest = 1'b0;
                        RegWrite = 1'b1;
                        MemRead = 1'b0;
                        MemWrite = 1'b0;
                        MemToReg = 1'b0;
                        ALUsrc = 1'b0;
                        ALUop = 4'b0001;
                        Branch = 1'b0;
            end

//CALL
            6'b010010 : begin
                        RegDest = 1'b0;
                        RegWrite = 1'b0;
                        MemRead = 1'b0;
                        MemWrite = 1'b0;
                        MemToReg = 1'b0;
                        ALUsrc = 1'b0;
                        ALUop = 4'b0000;
                        Branch = 1'b0;
            end

//RET
            6'b010011 : begin
                        RegDest = 1'b0;
                        RegWrite = 1'b0;
                        MemRead = 1'b0;
                        MemWrite = 1'b0;
                        MemToReg = 1'b0;
                        ALUsrc = 1'b0;
                        ALUop = 4'b0000;
                        Branch = 1'b0;
            end

//MOVE
            6'b010011: begin
                        RegDest = 1'b0;
                        RegWrite = 1'b1;
                        MemRead = 1'b0;
                        MemWrite = 1'b0;
                        MemToReg = 1'b0;
                        ALUsrc = 1'b0;
                        ALUop = 4'b1010;
                        Branch = 1'b0;
            end
        endcase
    end
endmodule