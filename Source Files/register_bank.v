module register_bank(
    input wire [4:0] read_reg1,
    input wire [4:0] read_reg2,
    input wire [4:0] write_reg,
    input wire [31:0] write_data,
    input wire write_enable,
    input wire clk,
    input wire rst,
    output wire [31:0] read_data_1,
    output wire [31:0] read_data_2
    );
    
    // 32 bit register file with 16 general purpose registers
    reg signed [31:0] Register [16:0];
    // SP is denoted by 10000, i.e the 16th register is SP 
    // reg signed [31:0] r1, r2;
    
    assign read_data_1 = Register [read_reg1];
    assign read_data_2 = Register [read_reg2];
    
    always@(posedge clk) begin
        Register[0]=32'd0;
        
        if(rst) begin
        // Ideally all the values should be set to 0
        // for testbench we will set the value to some initial random values
        // as we do not have a load mechanism right now to load register values from memmory as the memory has not been initialized
            Register[0]= 32'd0;
            Register[1]= 32'd5;
            Register[2]= 32'd23;
            Register[3]= 32'd0;
            Register[4]= 32'd0;
            Register[5]= 32'd0;
            Register[6]= 32'd0;
            Register[7]= 32'd0;
            Register[8]= 32'd0;
            Register[9]= 32'd0;
            Register[10]= 32'd0;
            Register[11]= 32'd0;
            Register[12]= 32'd0;
            Register[13]= 32'd0;
            Register[14]= 32'd0;
            Register[15]= 32'd0;
            Register[16]= 32'd0;
        // set all the register values to 0
        end
        
        else if (write_enable) begin
            Register[write_reg] = write_data;
        end
    end
endmodule