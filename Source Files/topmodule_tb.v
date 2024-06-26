module topmodule_tb();

  reg clk;
  reg rst;

  // Instantiate the topmodule
  topmodule uut (
    .clk(clk),
    .rst(rst)
  );

  // Clock generation
  always begin
    #5 clk = ~clk; 
  end

  // Reset assertion
  initial begin
    rst = 1;
    #20 rst = 0; // Release reset after 20 time units
    #100 $finish; // Finish simulation after 100 time units
  end

endmodule

