// Modules to sign extend 21bit offset and 16bit immediate values

module sign_extend_21bit(
    input wire [20:0] in,
    output wire [31:0] out 
);
  assign out = {{11{in[20]}}, in};
endmodule

module sign_extend_16bit(
    input wire [15:0] in,
    output wire [31:0] out
);
    assign out = {{16{in[15]}},in};
endmodule
