`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit.v
// Description - 32-Bit wide arithmetic logic unit (ALU).
//
// INPUTS:-
// ALUControl: N-Bit input control bits to select an ALU operation.
// A: 32-Bit input port A.
// B: 32-Bit input port B.
//
// OUTPUTS:-
// ALUResult: 32-Bit ALU result output.
// ZERO: 1-Bit output flag. 
//
// FUNCTIONALITY:-
// Design a 32-Bit ALU, so that it supports all arithmetic operations 
// needed by the MIPS instructions given in Labs5-8.docx document. 
//   The 'ALUResult' will output the corresponding result of the operation 
//   based on the 32-Bit inputs, 'A', and 'B'. 
//   The 'Zero' flag is high when 'ALUResult' is '0'. 
//   The 'ALUControl' signal should determine the function of the ALU 
//   You need to determine the bitwidth of the ALUControl signal based on the number of 
//   operations needed to support. 
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit(A, B, ALUControl, MSBALUResult, LSBALUResult, Zero);

    input [31:0] A, B;	    // inputs
	input [4:0] ALUControl; // control bits for ALU operation
	
	output reg [31:0] MSBALUResult, LSBALUResult;
    output reg Zero;        // Zero=1 if ALUResult == 0 (implemented at bottom)
	//output reg Overflow;
	
	reg [63:0] temp1;
	reg [31:0] tempB;
	
	integer i;

	initial 
	begin
        MSBALUResult = {32{1'b0}};
        LSBALUResult = {32{1'b0}};
        Zero = 0;
        //Overflow = 0;
        
        tempB = {32{1'b0}};
        temp1 = 64'h000000000000000000;
    end
	
	always @(*) 
	begin
        case (ALUControl)
            5'b00000: 
            begin // Add
                // I just followed the operations shown in the MIPS Instruction Reference
                // temp1 = (A[31] | A) + (B[31] | B);
//                if (temp1[32] != temp1[31])
//                begin
//                    Overflow = 1'b1;
//                end
//                else 
//                begin
//                    Overflow = 1'b0;
                LSBALUResult = A + B;
                MSBALUResult = {32{1'b0}};
//                end
            end
            5'b00001: 
            begin // Sub
                //temp1 = (A[31] | A) - (B[31] | B);
//                if (temp1[32] != temp1[31]) 
//                begin
//                    Overflow = 1'b1;
//                end
//                else 
//                begin
//                    Overflow = 1'b0;
                LSBALUResult = A - B;
                MSBALUResult = {32{1'b0}};
//                end
            end
            5'b00010: 
            begin // Mul
            // From the Instruction Reference, we only set the 
            // Least significant 32 bits to Rd Register
            // What's important it seems is that Hi/Lo register
            // are UNPREDICTABLE after the operation--> Use x's?
                temp1 = A * B;
                LSBALUResult = temp1[31:0];
                MSBALUResult = {32{1'b0}};
            end
            5'b00011: 
            begin // And
                LSBALUResult = A & B;
                MSBALUResult = {32{1'b0}};
            end
            5'b00100: 
            begin // Or
                LSBALUResult = A | B;
                MSBALUResult = {32{1'b0}};
            end
            5'b00101:
            begin // Slt
                if (A < B) 
                begin
                    LSBALUResult = {{32{1'b0}}, 1'b1};
                end
                else 
                begin
                    LSBALUResult = {32{1'b0}};
                end
                MSBALUResult = {32{1'b0}};
            end
            5'b00110: 
            begin // Seq
                if (A == B) begin
                    LSBALUResult = {{32{1'b0}}, 1'b1};
                end
                else begin
                    LSBALUResult = {32{1'b0}};
                end
                MSBALUResult = {32{1'b0}};
            end
            5'b00111: 
            begin // Sne
                if (A != B) 
                begin
                    LSBALUResult = {{32{1'b0}}, 1'b1};
                end
                else 
                begin
                    LSBALUResult = {32{1'b0}};
                end
                MSBALUResult = {32{1'b0}};
            end
            5'b01000: 
            begin // sll / sllv
                LSBALUResult = B << A[4:0];
                MSBALUResult = {32{1'b0}};
            end
            5'b01001: 
            begin // srl / srlv
                LSBALUResult = B >> A[4:0];
                MSBALUResult = {32{1'b0}};
            end
            5'b01010: 
            begin // rotr
               LSBALUResult = (B << (~A[4:0] + 1'b1)) | (B >> A[4:0]);
               MSBALUResult  = {32{1'b0}};
            end
            5'b01011: 
            begin // slte
                 if (A <= B) 
                 begin
                    LSBALUResult = {{32{1'b0}}, 1'b1};
                end
                else 
                begin
                    LSBALUResult = {32{1'b0}};
                end
                MSBALUResult = {32{1'b0}};
            end
            5'b01101:
            begin // sgt
                if (A > B) 
                begin
                    LSBALUResult = {{32{1'b0}}, 1'b1};
                end
                else 
                begin
                    LSBALUResult = {32{1'b0}};
                end
                MSBALUResult = {32{1'b0}};
            end
            5'b01100: 
            begin // sgte
                if (A >= B) 
                begin
                    LSBALUResult = {{31{1'b0}}, 1'b1};
                end
                else 
                begin
                    LSBALUResult = {32{1'b0}};
                end
                MSBALUResult = {32{1'b0}};
            end
            5'b01110: 
            begin // nor
                LSBALUResult = !(A | B);
                MSBALUResult = {32{1'b0}};
            end
            5'b01111: 
            begin // xor
                LSBALUResult = A ^ B;
                MSBALUResult = {32{1'b0}};
            end
            5'b10000: 
            begin // seb
                if (B[7] == 0) 
                begin
                    LSBALUResult = {{24{1'b0}}, A[7:0]};
                    MSBALUResult = {32{1'b0}};
                end
                else 
                begin
                    LSBALUResult = {{24{1'b1}}, A[7:0]};
                    MSBALUResult = {32{1'b1}};
                end
            end
            // seh and seb use ReadData2, which is Rt
            5'b10001: 
            begin // seh
                if (B[15] == 0) 
                begin
                    LSBALUResult = {{16{1'b0}}, A[15:0]};
                    MSBALUResult = {32{1'b0}};
                end
                else 
                begin
                    LSBALUResult = {{16{1'b1}}, A[15:0]};
                    MSBALUResult = {32{1'b1}};
                end
            end
            5'b10010: 
            begin // sra
                LSBALUResult =  $signed(B) >>> A;
                MSBALUResult = {32{1'b0}};
            end
            
            /*5'b10011: begin // madd
                
            end
            5'b10100: begin // msub
                
            end*/ 
            
            // Realized madd and msub dont need their own ALU ops. Can reassign these to CLO/CLZ later. Didnt want to change the
            // 5 bit address of the following instructions since I'd have to do that in controller too.
            
            // Don't need to have seeparate ALUOp for andi since ALUSrc from Controlelr sets the input
            /*5'b10101: begin // andi
                LSBALUResult = A & tempB;
            end
            5'b10110: begin // ori
                tempB = {16'b0000000000000000, B[15:0]};
                LSBALUResult <= A | tempB;
            end
            5'b10111: begin // xori
                tempB = {16'b0000000000000000, B[15:0]};
                LSBALUResult <= (A & !tempB) | (!A & tempB);
            end*/
            5'b11000: 
            begin // sltu
                if (({32{1'b0}} | A) < ({32{1'b0}} |B))
                begin
                    LSBALUResult = {{31{1'b0}},1'b1};
                end
                else 
                begin
                    LSBALUResult = {32{1'b0}};
                end
                MSBALUResult = {32{1'b0}};
            end
            5'b11001: 
            begin // addu
                LSBALUResult = A + B;
                MSBALUResult = {32{1'b0}};
            end
            5'b11100:
            begin //movz and movn
                LSBALUResult = A;
                MSBALUResult = {32{1'b0}};
            end
        endcase
        
        // Check if ALUResult is 0
        temp1 = {MSBALUResult, LSBALUResult};
        if (temp1 == {64{1'b0}}) 
        begin
            Zero = 1;
        end
        else 
        begin
            Zero = 0;
        end
    end
    
endmodule

