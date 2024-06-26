module ALU(
  input signed [31:0] arg1, 
  input signed[31:0] arg2, 
  input [3:0] control_signal, 
  input clk, input rst,
  output reg signed [31:0] result,
  output reg carry, //flags to denote carry, sign and zero (to be clear the carry bit is negative even if there is no underflow in the case of negative no, this wont affect the design of branch control)
  output reg sign,
  output reg zero
  );

// Whenever there's a change in any of the values
  wire [31:0] outputs [10:0];
  reg carry_out;
  reg carry_in;
  wire [31:0] SP_plus4; 

    ADD add_(arg1, arg2, outputs[0], carry_out);
    SUB sub_(arg1, arg2, outputs[1], carry_in);
    AND and_(arg1, arg2, outputs[2]);
    OR  or_(arg1, arg2, outputs[3]);
    XOR xor_(arg1, arg2, outputs[4]);
    NOT not_(arg1, outputs[5]);
    SLA sla_(arg1, arg2, outputs[6]);
    SRA sra_(arg1, arg2, outputs[7]);
    SRL srl_(arg1, arg2, outputs[8]);

    assign outputs[9]=arg1+4;
    assign outputs[10]=arg1;
    
  always @(posedge clk) begin
    if(rst) begin
      result=32'd0;
      carry=0;
      sign=0;
      zero=1;
    end
   
    else begin
       result = outputs[control_signal];
       sign = result[31];

       zero = (result == 0);
       carry = (control_signal == 0) ? carry_out : (control_signal == 1) ? carry_in : 0;
    end
   
  end

endmodule

module ADD(
    input wire signed [31:0] arg1,
    input wire signed [31:0] arg2,
    output signed [31:0] res,
    output wire carry_out
);
wire [32:0] temp_res;
assign temp_res=arg1+arg2;
assign carry_out=temp_res[32];
assign res = {temp_res[31:0]};
 
endmodule


module SUB(
    input wire signed [31:0] arg1,
    input wire signed[31:0] arg2,
    output signed [31:0] res,
    output wire carry_in
);
wire [32:0] temp_res;
assign temp_res = arg1-arg2;
assign carry_in = temp_res[32];
assign res = {temp_res[31:0]};

endmodule

module AND(
    input wire signed [31:0] arg1,
    input wire signed[31:0] arg2,
    output signed [31:0] res
);
assign res=arg1&arg2;
 
endmodule


module OR(
    input wire signed [31:0] arg1,
    input wire signed[31:0] arg2,
    output signed [31:0] res
);
assign res=arg1|arg2;
 
endmodule


module XOR(
    input wire signed[31:0] arg1,
    input wire signed[31:0] arg2,
    output signed [31:0] res
);
assign res=arg1^arg2;
endmodule


module NOT(
    input wire signed[31:0] arg1,
    output signed [31:0] res
);
assign res=~arg1;

endmodule


module SRA(
    input wire signed[31:0] arg1,
    input wire signed[31:0] arg2,
    output signed [31:0] res
);
assign res=arg1 >>> arg2[0];

endmodule


module SLA(
    input wire signed [31:0] arg1,
    input wire signed[31:0] arg2,
    output signed [31:0] res
);
assign res=arg1<<arg2[0];

endmodule


module SRL(
    input wire signed[31:0] arg1,
    input wire signed[31:0] arg2,
    output signed [31:0] res
);
assign res=arg1>>arg2[0];

endmodule