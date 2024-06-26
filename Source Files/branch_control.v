// The jump control block for determining if a jump is valid or not depending on flags from the ALU
module branch_control (
    input [5:0] opcode,
    input sign,
    input carry,
    input zero,
    output reg conditional_flag
);
    
    always @(*) begin
        case (opcode)
            6'b001100 : begin           // BR unconditional branch
                conditional_flag = 1;
            end

            6'b001111 : begin           // BZ branch on 
                if (!sign && zero)
                    conditional_flag = 1;
                else 
                    conditional_flag = 0;
            end

            6'b001101 : begin           // BMI branch if Reg value is negative
                if (sign && carry )
                    conditional_flag = 1;
                else 
                    conditional_flag = 0;
            end

            6'b001010 : begin           // BPL branch on R val positive
                if (!sign && !carry) 
                    conditional_flag = 1;
                else 
                    conditional_flag = 0;
                end
           
            default : conditional_flag = 0;
            
        endcase
    end

endmodule