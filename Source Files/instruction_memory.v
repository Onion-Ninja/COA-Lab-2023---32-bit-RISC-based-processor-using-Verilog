module instruction_memory(
    input [31:0] instrAddr,
    output [31:0] instruction
);

    reg[31:0] ins[1023:0];
    wire [9:0] reduced_address; //10 bit reduced address to access one of 1024 memory locations

 	assign reduced_address = {instrAddr[9:0]};
  	assign instruction = ins[reduced_address];

    initial begin 
        // write your instruction code here
      	
        // code for bubble sort
        ins[0]= 00101000000100000000001111101000
        ins[1]= 00101000000000010000000000000000
        ins[2]= 01000010000000000000000000000000
        ins[3]= 00101000000000010000000000000100
        ins[4]= 01000010000000000000000000000000
        ins[5]= 00101000000000010000000000001000
        ins[6]= 01000010000000000000000000000000
        ins[7]= 00101000000000010000000000001100
        ins[8]= 01000010000000000000000000000000
        ins[9]= 00101000000000010000000000010000
        ins[10]= 01000010000000000000000000000000
        ins[11]= 00101000000000010000000000010100
        ins[12]= 01000010000000000000000000000000
        ins[13]= 00101000000000010000000000011000
        ins[14]= 01000010000000000000000000000000
        ins[15]= 00101000000000010000000000011100
        ins[16]= 01000010000000000000000000000000
        ins[17]= 00101000000000010000000000100000
        ins[18]= 01000010000000000000000000000000
        ins[19]= 00101000000000010000000000100100
        ins[20]= 01000010000000000000000000000000
        ins[21]= 01010000000000010000000000000000
        ins[22]= 01010000000000100000000000000000
        ins[23]= 00110000000000000000000000010100
        ins[24]= 00101000110010010000000000000000
        ins[25]= 00101000111010000000000000000000
        ins[26]= 00000100010000100000000000000001
        ins[27]= 00110000000000000000000000011000
        ins[28]= 00001000001000110000000000001010
        ins[29]= 00111100011000000000000001000000
        ins[30]= 01010000000000100000000000000000
        ins[31]= 00000100001000010000000000000001
        ins[32]= 00110000000000000000000000000100
        ins[33]= 00001000010001000000000000001001
        ins[34]= 00111100100111111111111111101000
        ins[35]= 00100000010001010000000000000001
        ins[36]= 00100000101001010000000000000001
        ins[37]= 00000010000001010011000000000000
        ins[38]= 00000100110001110000000000000100
        ins[39]= 00101000110010000000000000000000
        ins[40]= 00101000111010010000000000000000
        ins[41]= 00000001001010000101000000000000
        ins[42]= 00110001010111111111111110111000
        ins[43]= 00000100010000100000000000000001
        ins[44]= 00110000000111111111111111010100
        ins[45]= 01010100000000000000000000000000

      	//
        /*
        code for gcd

          ins[0]= 00000100000000010000000000001010
          ins[1]= 00000100000000100000000000011001
          ins[2]= 00000000001000100001100000000001
          ins[3]= 0011010001100000000000000001000
          ins[4]= 00110000000000000000000000010100
          ins[5]= 01010000010000110000000000000000
          ins[6]= 01010000001000100000000000000000
          ins[7]= 01010000011000010000000000000000
          ins[8]= 00110000000000000000000000000100
          ins[9]= 00000000001000100010000000000001
          ins[10]= 01010000010000010000000000000000
          ins[11]= 01010000100000100000000000000000
          ins[12]= 00111100010000000000000000010000
          ins[13]= 00000000001000100010100000000001
          ins[14]= 00110100101111111111111111011100
          ins[15]= 00110000000111111111111111101000
          ins[16]= 01010100000000000000000000000000

          explained in the report
        */
    end
endmodule