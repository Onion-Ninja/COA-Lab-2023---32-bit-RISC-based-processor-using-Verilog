// module for data memory
module data_memory (
    input clk,
    input wire [9:0] address,
    input wire [31:0] write_data,
    input wire write_enable,
    input wire read_enable,
    output reg [31:0] read_data
);

    // Define the memory size (adjust as needed)
    reg [31:0] memory [1023:0]; // 1024 words of 32 bits each
    always @(posedge clk) begin
        if (write_enable) begin
            // Write data to memory at the specified address
            memory[address] <= write_data;
        end

        if (read_enable) begin
            // Read data from memory at the specified address
            read_data <= memory[address];
        end
    end
endmodule