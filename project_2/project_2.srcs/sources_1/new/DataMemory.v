`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - data_memory.v
// Description - 32-Bit wide data memory.
//
// INPUTS:-
// Address: 32-Bit address input port.
// WriteData: 32-Bit input port.
// Clk: 1-Bit Input clock signal.
// MemWrite: 1-Bit control signal for memory write.
// MemRead: 1-Bit control signal for memory read.
//
// OUTPUTS:-
// ReadData: 32-Bit registered output port.
//
// FUNCTIONALITY:-
// Design the above memory similar to the 'RegisterFile' model in the previous 
// assignment.  Create a 1K memory, for which we need 10 bits.  In order to 
// implement byte addressing, we will use bits Address[11:2] to index the 
// memory location. The 'WriteData' value is written into the address 
// corresponding to Address[11:2] in the positive clock edge if 'MemWrite' 
// signal is 1. 'ReadData' is the value of memory location Address[11:2] if 
// 'MemRead' is 1, otherwise, it is 0x00000000. The reading of memory is not 
// clocked.
//
// you need to declare a 2d array. in this case we need an array of 1024 (1K)  
// 32-bit elements for the memory.   
// for example,  to declare an array of 256 32-bit elements, declaration is: reg[31:0] memory[0:255]
// if i continue with the same declaration, we need 8 bits to index to one of 256 elements. 
// however , address port for the data memory is 32 bits. from those 32 bits, least significant 2 
// bits help us index to one of the 4 bytes within a single word. therefore we only need bits [9-2] 
// of the "Address" input to index any of the 256 words. 
////////////////////////////////////////////////////////////////////////////////

module DataMemory(Address, WriteData, Clk, MemWrite, MemRead, ReadData); 

    input [31:0] Address; 	// Input Address 
    input [31:0] WriteData; // Data that needs to be written into the address 
    input Clk;
    input MemWrite; 		// Control signal for memory write 
    input MemRead; 			// Control signal for memory read 

    output reg[31:0] ReadData; // Contents of memory location at Address

    /* Please fill in the implementation here */
    reg [31:0] memory [0:1023];
    
    // Note: Initial blocks execute only once at time zero, so all
    // registers must be initialized in this block
    // TODO: Check if the above statement is correct
    initial begin
        ReadData <= 32'h00000000;
    
        memory[0] = 32'h00000000;
        memory[1] = 32'h00000000;
        memory[2] = 32'h00000000;
        memory[3] = 32'h00000000;
        memory[4] = 32'h00000000;
        memory[5] = 32'h00000000;
        memory[6] = 32'h00000000;
        memory[7] = 32'h00000000;
        memory[8] = 32'h00000000;
        memory[9] = 32'h00000000;
        memory[10] = 32'h00000000;
        memory[11] = 32'h00000000;
        memory[12] = 32'h00000000;
        memory[13] = 32'h00000000;
        memory[14] = 32'h00000000;
        memory[15] = 32'h00000000;
        memory[16] = 32'h00000000;
        memory[17] = 32'h00000000;
        memory[18] = 32'h00000000;
        memory[19] = 32'h00000000;
        memory[20] = 32'h00000000;
        memory[21] = 32'h00000000;
        memory[22] = 32'h00000000;
        memory[23] = 32'h00000000;
        memory[24] = 32'h00000000;
        memory[25] = 32'h00000000;
        memory[26] = 32'h00000000;
        memory[27] = 32'h00000000;
        memory[28] = 32'h00000000;
        memory[29] = 32'h00000000;
        memory[30] = 32'h00000000;
        memory[31] = 32'h00000000;
        memory[32] = 32'h00000000;
        
    end
    
	always @(posedge Clk) begin
        if (MemWrite == 1'b1) begin
            memory[Address[11:2]] <= WriteData;
        end
    end    
    
    always @(*) begin
        if (MemRead == 1'b1) begin
            ReadData <= memory[Address[11:2]];
        end
        else
            ReadData <= 32'h0;    
        end    

endmodule
