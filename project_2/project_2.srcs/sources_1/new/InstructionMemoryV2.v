`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Last Edits: Nirmal Kumbhare, Ali Akoglu
// 
// Module - InstructionMemory.v
// Description - 32-Bit wide instruction memory.
//
// INPUT:-
// Address: 32-Bit address input port.
//
// OUTPUT:-
// Instruction: 32-Bit output port.
//
// FUNCTIONALITY:-
// Similar to the DataMemory, this module should also be byte-addressed
// (i.e., ignore bits 0 and 1 of 'Address'). All of the instructions will be 
// hard-coded into the instruction memory, so there is no need to write to the 
// InstructionMemory.  The contents of the InstructionMemory is the machine 
// language program to be run on your processor.
//
//
//we will store the machine code for a C function later. for now initialize 
//each entry to be its index * 4 (memory[i] = i * 4;)
//all you need to do is give an address as input and read the contents of the 
//address on your output port. 
// 
//Using a 32bit address you will index into the memory, output the contents of that specific 
//address. for data memory we are using 1K word of storage space. for the instruction memory 
//you may assume smaller size for practical purpose. you can use 128 words as the size and 
//hardcode the values.  in this case you need 7 bits to index into the memory. 
//
//be careful with the least two significant bits of the 32bit address. those help us index 
//into one of the 4 bytes in a word. therefore you will need to use bit [8-2] of the input address. 


////////////////////////////////////////////////////////////////////////////////

module InstructionMemoryV2(Address, Instruction); 

    input [31:0] Address;        // Input Address 

    output reg [31:0] Instruction;    // Instruction at memory location Address
    
    wire [8:0] tempA;
    
    assign tempA = Address[10:2];
    
   //Create 2D array for memory with 128 32-bit elements here
        reg [31:0] memory [0:368];
        
        /* Please fill in the implementation here */      
        initial begin                   //need to iniitalize this for the code!!!
//            $readmemh ("C:/Users/phili.DESKTOP-7VR899U/OneDrive/Desktop/Ecole/Semester 5/369A/Project_Fall2018/Instruction_memory.txt", memory);
        
        memory[0] <= 32'b00110100000100100000000000000000;	//	main:		ori	$s2, $zero, 0
        memory[1] <= 32'b10001110010100100000000000000000;	//			lw	$s2, 0($s2)
        memory[2] <= 32'b00110100000100110000000000000000;	//			ori	$s3, $zero, 0
        memory[3] <= 32'b10001110011100110000000000000100;	//			lw	$s3, 4($s3)
        memory[4] <= 32'b00000010010100111000100000100000;	//			add	$s1, $s2, $s3
        memory[5] <= 32'b00000010001100111010000000100010;	//			sub	$s4, $s1, $s3
        memory[6] <= 32'b00000010001101001000100000100010;	//			sub	$s1, $s1, $s4
        memory[7] <= 32'b01110010001100111010000000000010;	//			mul	$s4, $s1, $s3
        memory[8] <= 32'b00000010001100111010000000100010;	//			sub	$s4, $s1, $s3
        memory[9] <= 32'b00000010010100111000100000100000;	//			add	$s1, $s2, $s3
        memory[10] <= 32'b01110010001101001011000000000010;	//			mul	$s6, $s1, $s4
        memory[11] <= 32'b00000010100101101000100000100010;	//			sub	$s1, $s4, $s6
        memory[12] <= 32'b00000010010101101000100000100000;	//			add	$s1, $s2, $s6
        memory[13] <= 32'b00110110001100011010101010101010;	//			ori	$s1, $s1, 43690
        memory[14] <= 32'b00000000000100011000101010000000;	//			sll	$s1, $s1, 10
        memory[15] <= 32'b00100010001101010000000000000000;	//			addi	$s5, $s1, 0
        memory[16] <= 32'b00100010101101110000000000000000;	//			addi	$s7, $s5, 0
        memory[17] <= 32'b00110100000100100000000000011000;	//			ori	$s2, $zero, 24
        memory[18] <= 32'b10001110010100010000000000000000;	//			lw	$s1, 0($s2)
        memory[19] <= 32'b00000010001101011010000000100010;	//			sub	$s4, $s1, $s5
        memory[20] <= 32'b00000010001101111011000000100100;	//			and	$s6, $s1, $s7
        memory[21] <= 32'b00000010001101101011100000100101;	//			or	$s7, $s1, $s6
        memory[22] <= 32'b00000010001100111001000000100010;	//			sub	$s2, $s1, $s3
        memory[23] <= 32'b00000010010101010100000000100100;	//			and	$t0, $s2, $s5
        memory[24] <= 32'b00000010110100100100100000100101;	//			or	$t1, $s6, $s2
        memory[25] <= 32'b00000010010100100101000000100000;	//			add	$t2, $s2, $s2
        memory[26] <= 32'b00110100000100010000000000000000;	//			ori	$s1, $zero, 0
        memory[27] <= 32'b10101110001010010000000000000100;	//			sw	$t1, 4($s1)
        memory[28] <= 32'b10001110001010100000000000000100;	//			lw	$t2, 4($s1)
        memory[29] <= 32'b00000010001100111001000000100010;	//			sub	$s2, $s1, $s3
        memory[30] <= 32'b00000010010101010101100000100101;	//			or	$t3, $s2, $s5
        memory[31] <= 32'b00000010010100100110000000100000;	//			add	$t4, $s2, $s2
        memory[32] <= 32'b00000010010100100101000000100101;	//			or	$t2, $s2, $s2
        memory[33] <= 32'b00000010111010101010000000100000;	//			add	$s4, $s7, $t2
        memory[34] <= 32'b00110100000010010000000000000000;	//			ori	$t1, $zero, 0
        memory[35] <= 32'b10001101001010000000000000000000;	//			lw	$t0, 0($t1)
        memory[36] <= 32'b10001101001010100000000000000100;	//			lw	$t2, 4($t1)
        memory[37] <= 32'b10101101001010100000000000000000;	//			sw	$t2, 0($t1)
        memory[38] <= 32'b10101101001010000000000000000100;	//			sw	$t0, 4($t1)
        memory[39] <= 32'b10001101001010000000000000000000;	//			lw	$t0, 0($t1)
        memory[40] <= 32'b10001101001010100000000000000100;	//			lw	$t2, 4($t1)
        memory[41] <= 32'b00110100000001000000000000011000;	//			ori	$a0, $zero, 24
        memory[42] <= 32'b00001000000100000000000000111000;	//			j	start
        memory[43] <= 32'b00100000000001001111111111111111;	//			addi	$a0, $zero, -1
        memory[44] <= 32'b00100000000001001111111111111111;	//			addi	$a0, $zero, -1
        memory[45] <= 32'b10001100100100000000000000000100;	//	start:		lw	$s0, 4($a0)
        memory[46] <= 32'b10101100100100000000000000000000;	//			sw	$s0, 0($a0)
        memory[47] <= 32'b00000110000000010000000000000011;	//	branch1:	bgez	$s0, branch2
        memory[48] <= 32'b00100010000100000000000000000001;	//			addi	$s0, $s0, 1
        memory[49] <= 32'b00000110000000011111111111111101;	//			bgez	$s0, branch1
        memory[50] <= 32'b00001000000000000000000000111101;	//			j	error
        memory[51] <= 32'b00100000000100001111111111111111;	//	branch2:	addi	$s0, $zero, -1
        memory[52] <= 32'b00000110000000000000000000000011;	//			bltz	$s0, branch3
        memory[53] <= 32'b00100000000100000000000000000001;	//			addi	$s0, $zero, 1
        memory[54] <= 32'b00011110000000001111111111111100;	//			bgtz	$s0, branch2
        memory[55] <= 32'b00001000000000000000000000111101;	//			j	error
        memory[56] <= 32'b00000110000000000000000000000011;	//	branch3:	bltz	$s0, done
        memory[57] <= 32'b00100000000100001111111111111111;	//			addi	$s0, $zero, -1
        memory[58] <= 32'b00000110000000001111111111111101;	//			bltz	$s0, branch3
        memory[59] <= 32'b00001000000000000000000000111101;	//			j	error
        memory[60] <= 32'b00001000000000000000000000111100;	//	done:		j	done
        memory[61] <= 32'b00001000000000000000000000111101;	//	error:		j	error
        
        end
        
        always @ * begin
            Instruction <= memory[tempA];    
        end
        
        
    endmodule
