`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
//
//
// Student(s) Name and Last Name: FILL IN YOUR INFO HERE!
//
//
// Module - register_file.v
// Description - Implements a register file with 32 32-Bit wide registers.
//
// 
// INPUTS:-
// ReadRegister1: 5-Bit address to select a register to be read through 32-Bit 
//                output port 'ReadRegister1'.
// ReadRegister2: 5-Bit address to select a register to be read through 32-Bit 
//                output port 'ReadRegister2'.
// WriteRegister: 5-Bit address to select a register to be written through 32-Bit
//                input port 'WriteRegister'.
// WriteData: 32-Bit write input port.
// RegWrite: 1-Bit control input signal.
//
// OUTPUTS:-
// ReadData1: 32-Bit registered output. 
// ReadData2: 32-Bit registered output. 
//
// FUNCTIONALITY:-
// 'ReadRegister1' and 'ReadRegister2' are two 5-bit addresses to read two 
// registers simultaneously. The two 32-bit data sets are available on ports 
// 'ReadData1' and 'ReadData2', respectively. 'ReadData1' and 'ReadData2' are 
// registered outputs (output of register file is written into these registers 
// at the falling edge of the clock). You can view it as if outputs of registers
// specified by ReadRegister1 and ReadRegister2 are written into output 
// registers ReadData1 and ReadData2 at the falling edge of the clock. 
//
// 'RegWrite' signal is high during the rising edge of the clock if the input 
// data is to be written into the register file. The contents of the register 
// specified by address 'WriteRegister' in the register file are modified at the 
// rising edge of the clock if 'RegWrite' signal is high. The D-flip flops in 
// the register file are positive-edge (rising-edge) triggered. (You have to use 
// this information to generate the write-clock properly.) 
//
// NOTE:-
// We will design the register file such that the contents of registers do not 
// change for a pre-specified time before the falling edge of the clock arrives 
// to allow for data multiplexing and setup time.
////////////////////////////////////////////////////////////////////////////////

module RegisterFile(ReadRegister1, ReadRegister2, WriteRegister, WriteData, RegWrite, Clk,Rst, ReadData1, ReadData2);

	input [4:0] ReadRegister1, ReadRegister2;
	output reg [31:0] ReadData1, ReadData2;
    input Clk, Rst, RegWrite;
    input [4:0] WriteRegister;
    input [31:0] WriteData;
    //output [31:0] debug_Reg8, debug_Reg16, debug_Reg17, debug_Reg18, debug_Reg19;
    
    reg [31:0] RegFile [0:31];
    reg [31:0] temp;
    
    initial begin
        ReadData1 <= {32{1'b0}};
        ReadData2 <= {32{1'b0}};
        
        temp <= {32{1'b0}};
        RegFile[0] <= {32{1'b0}};
        RegFile[1] <= {32{1'b0}};
        RegFile[2] <= {32{1'b0}};
        RegFile[3] <= {32{1'b0}};
        RegFile[4] <= {32{1'b0}};
        RegFile[5] <= {32{1'b0}};
        RegFile[6] <= {32{1'b0}};
        RegFile[7] <= {32{1'b0}};
        RegFile[8] <= {32{1'b0}};
        RegFile[9] <= {32{1'b0}};
        RegFile[10] <= {32{1'b0}};
        RegFile[11] <= {32{1'b0}};
        RegFile[12] <= {32{1'b0}};
        RegFile[13] <= {32{1'b0}};
        RegFile[14] <= {32{1'b0}};
        RegFile[15] <= {32{1'b0}};
        RegFile[16] <= {32{1'b0}};
        RegFile[17] <= {32{1'b0}};
        RegFile[18] <= {32{1'b0}};
        RegFile[19] <= {32{1'b0}};
        RegFile[20] <= {32{1'b0}};
        RegFile[21] <= {32{1'b0}};
        RegFile[22] <= {32{1'b0}};
        RegFile[23] <= {32{1'b0}};
        RegFile[24] <= {32{1'b0}};
        RegFile[25] <= {32{1'b0}};
        RegFile[26] <= {32{1'b0}};
        RegFile[27] <= {32{1'b0}};
        RegFile[28] <= {32{1'b0}};
        RegFile[29] <= {32{1'b0}};
        RegFile[30] <= {32{1'b0}};
        RegFile[31] <= {32{1'b0}};
    end
    
    always @(posedge Clk) begin
        if (RegWrite == 1) begin
            RegFile[WriteRegister] <= WriteData;
            if ((ReadRegister1 == WriteRegister) || (ReadRegister2 == WriteRegister))
            begin
                temp <= WriteData;
            end
        end
    end
     
    always @(negedge Clk) begin
        if (ReadRegister1 == WriteRegister) begin
            ReadData1 <= temp;
        end else begin
            ReadData1 <= RegFile[ReadRegister1];
        end
        
        if (ReadRegister2 == WriteRegister) begin
            ReadData2 <= temp;
        end else begin
            ReadData2 <= RegFile[ReadRegister2];
        end
    end
    
    /*assign debug_Reg8 = RegFile[8];
    assign debug_Reg16 = RegFile[16];
    assign debug_Reg17 = RegFile[17];
    assign debug_Reg18 = RegFile[18];
    assign debug_Reg19 = RegFile[19];*/

endmodule
