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

module InstructionMemory(Address, Instruction); 

    input [31:0] Address;        // Input Address 

    output reg [31:0] Instruction;    // Instruction at memory location Address
    
    wire [8:0] tempA;
    
    assign tempA = Address[10:2];
    
   //Create 2D array for memory with 128 32-bit elements here
        reg [31:0] memory [0:368];
        
        /* Please fill in the implementation here */      
        initial begin                   //need to iniitalize this for the code!!!
            //$readmemh ("C:\Users\phili.DESKTOP-7VR899U\OneDrive\Desktop\Ecole\Semester 5\369A\Project_Fall2018\Instruction_memory_2.txt", memory);
            
            memory[0] <= 32'b00110100000100100000000000000000;	  //	main:		ori	$s2, $zero, 0
            memory[1] <= 32'b00000000000000000000000000000000;    // nop
            memory[2] <= 32'b00000000000000000000000000000000;    // nop
            memory[3] <= 32'b00000000000000000000000000000000;    // nop
            memory[4] <= 32'b00000000000000000000000000000000;    // nop
            memory[5] <= 32'b00000000000000000000000000000000;    // nop
            memory[6] <= 32'b10001110010100100000000000000000;    //            lw    $s2, 0($s2)
            memory[7] <= 32'b00000000000000000000000000000000;    // nop
            memory[8] <= 32'b00000000000000000000000000000000;    // nop
            memory[9] <= 32'b00000000000000000000000000000000;    // nop
            memory[10] <= 32'b00000000000000000000000000000000;    // nop
            memory[11] <= 32'b00000000000000000000000000000000;    // nop
            memory[12] <= 32'b00110100000100110000000000000000;    //            ori    $s3, $zero, 0
            memory[13] <= 32'b00000000000000000000000000000000;    // nop
            memory[14] <= 32'b00000000000000000000000000000000;    // nop
            memory[15] <= 32'b00000000000000000000000000000000;    // nop
            memory[16] <= 32'b00000000000000000000000000000000;    // nop
            memory[17] <= 32'b00000000000000000000000000000000;    // nop
            memory[18] <= 32'b10001110011100110000000000000100;    //            lw    $s3, 4($s3)
            memory[19] <= 32'b00000000000000000000000000000000;    // nop
            memory[20] <= 32'b00000000000000000000000000000000;    // nop
            memory[21] <= 32'b00000000000000000000000000000000;    // nop
            memory[22] <= 32'b00000000000000000000000000000000;    // nop
            memory[23] <= 32'b00000000000000000000000000000000;    // nop
            memory[24] <= 32'b00000010010100111000100000100000;    //            add    $s1, $s2, $s3
            memory[25] <= 32'b00000000000000000000000000000000;    // nop
            memory[26] <= 32'b00000000000000000000000000000000;    // nop
            memory[27] <= 32'b00000000000000000000000000000000;    // nop
            memory[28] <= 32'b00000000000000000000000000000000;    // nop
            memory[29] <= 32'b00000000000000000000000000000000;    // nop
            memory[30] <= 32'b00000010001100111010000000100010;    //            sub    $s4, $s1, $s3
            memory[31] <= 32'b00000000000000000000000000000000;    // nop
            memory[32] <= 32'b00000000000000000000000000000000;    // nop
            memory[33] <= 32'b00000000000000000000000000000000;    // nop
            memory[34] <= 32'b00000000000000000000000000000000;    // nop
            memory[35] <= 32'b00000000000000000000000000000000;    // nop
            memory[36] <= 32'b00000010001101001000100000100010;    //            sub    $s1, $s1, $s4
            memory[37] <= 32'b00000000000000000000000000000000;    // nop
            memory[38] <= 32'b00000000000000000000000000000000;    // nop
            memory[39] <= 32'b00000000000000000000000000000000;    // nop
            memory[40] <= 32'b00000000000000000000000000000000;    // nop
            memory[41] <= 32'b00000000000000000000000000000000;    // nop
            memory[42] <= 32'b01110010001100111010000000000010;    //            mul    $s4, $s1, $s3
            memory[43] <= 32'b00000000000000000000000000000000;    // nop
            memory[44] <= 32'b00000000000000000000000000000000;    // nop
            memory[45] <= 32'b00000000000000000000000000000000;    // nop
            memory[46] <= 32'b00000000000000000000000000000000;    // nop
            memory[47] <= 32'b00000000000000000000000000000000;    // nop
            memory[48] <= 32'b00000010001100111010000000100010;    //            sub    $s4, $s1, $s3
            memory[49] <= 32'b00000000000000000000000000000000;    // nop
            memory[50] <= 32'b00000000000000000000000000000000;    // nop
            memory[51] <= 32'b00000000000000000000000000000000;    // nop
            memory[52] <= 32'b00000000000000000000000000000000;    // nop
            memory[53] <= 32'b00000000000000000000000000000000;    // nop
            memory[54] <= 32'b00000010010100111000100000100000;    //            add    $s1, $s2, $s3
            memory[55] <= 32'b00000000000000000000000000000000;    // nop
            memory[56] <= 32'b00000000000000000000000000000000;    // nop
            memory[57] <= 32'b00000000000000000000000000000000;    // nop
            memory[58] <= 32'b00000000000000000000000000000000;    // nop
            memory[59] <= 32'b00000000000000000000000000000000;    // nop
            memory[60] <= 32'b01110010001101001011000000000010;    //            mul    $s6, $s1, $s4
            memory[61] <= 32'b00000000000000000000000000000000;    // nop
            memory[62] <= 32'b00000000000000000000000000000000;    // nop
            memory[63] <= 32'b00000000000000000000000000000000;    // nop
            memory[64] <= 32'b00000000000000000000000000000000;    // nop
            memory[65] <= 32'b00000000000000000000000000000000;    // nop
            memory[66] <= 32'b00000010100101101000100000100010;    //            sub    $s1, $s4, $s6
            memory[67] <= 32'b00000000000000000000000000000000;    // nop
            memory[68] <= 32'b00000000000000000000000000000000;    // nop
            memory[69] <= 32'b00000000000000000000000000000000;    // nop
            memory[70] <= 32'b00000000000000000000000000000000;    // nop
            memory[71] <= 32'b00000000000000000000000000000000;    // nop
            memory[72] <= 32'b00000010010101101000100000100000;    //            add    $s1, $s2, $s6
            memory[73] <= 32'b00000000000000000000000000000000;    // nop
            memory[74] <= 32'b00000000000000000000000000000000;    // nop
            memory[75] <= 32'b00000000000000000000000000000000;    // nop
            memory[76] <= 32'b00000000000000000000000000000000;    // nop
            memory[77] <= 32'b00000000000000000000000000000000;    // nop
            memory[78] <= 32'b00110110001100011010101010101010;    //            ori    $s1, $s1, 43690
            memory[79] <= 32'b00000000000000000000000000000000;    // nop
            memory[80] <= 32'b00000000000000000000000000000000;    // nop
            memory[81] <= 32'b00000000000000000000000000000000;    // nop
            memory[82] <= 32'b00000000000000000000000000000000;    // nop
            memory[83] <= 32'b00000000000000000000000000000000;    // nop
            memory[84] <= 32'b00000000000100011000101010000000;    //            sll    $s1, $s1, 10
            memory[85] <= 32'b00000000000000000000000000000000;    // nop
            memory[86] <= 32'b00000000000000000000000000000000;    // nop
            memory[87] <= 32'b00000000000000000000000000000000;    // nop
            memory[88] <= 32'b00000000000000000000000000000000;    // nop
            memory[89] <= 32'b00000000000000000000000000000000;    // nop
            memory[90] <= 32'b00100010001101010000000000000000;    //            addi    $s5, $s1, 0
            memory[91] <= 32'b00000000000000000000000000000000;    // nop
            memory[92] <= 32'b00000000000000000000000000000000;    // nop
            memory[93] <= 32'b00000000000000000000000000000000;    // nop
            memory[94] <= 32'b00000000000000000000000000000000;    // nop
            memory[95] <= 32'b00000000000000000000000000000000;    // nop
            memory[96] <= 32'b00100010101101110000000000000000;    //            addi    $s7, $s5, 0
            memory[97] <= 32'b00000000000000000000000000000000;    // nop
            memory[98] <= 32'b00000000000000000000000000000000;    // nop
            memory[99] <= 32'b00000000000000000000000000000000;    // nop
            memory[100] <= 32'b00000000000000000000000000000000;    // nop
            memory[101] <= 32'b00000000000000000000000000000000;    // nop
            memory[102] <= 32'b00110100000100100000000000011000;    //            ori    $s2, $zero, 24
            memory[103] <= 32'b00000000000000000000000000000000;    // nop
            memory[104] <= 32'b00000000000000000000000000000000;    // nop
            memory[105] <= 32'b00000000000000000000000000000000;    // nop
            memory[106] <= 32'b00000000000000000000000000000000;    // nop
            memory[107] <= 32'b00000000000000000000000000000000;    // nop
            memory[108] <= 32'b10001110010100010000000000000000;    //            lw    $s1, 0($s2)
            memory[109] <= 32'b00000000000000000000000000000000;    // nop
            memory[110] <= 32'b00000000000000000000000000000000;    // nop
            memory[111] <= 32'b00000000000000000000000000000000;    // nop
            memory[112] <= 32'b00000000000000000000000000000000;    // nop
            memory[113] <= 32'b00000000000000000000000000000000;    // nop
            memory[114] <= 32'b00000010001101011010000000100010;    //            sub    $s4, $s1, $s5
            memory[115] <= 32'b00000000000000000000000000000000;    // nop
            memory[116] <= 32'b00000000000000000000000000000000;    // nop
            memory[117] <= 32'b00000000000000000000000000000000;    // nop
            memory[118] <= 32'b00000000000000000000000000000000;    // nop
            memory[119] <= 32'b00000000000000000000000000000000;    // nop
            memory[120] <= 32'b00000010001101111011000000100100;    //            and    $s6, $s1, $s7
            memory[121] <= 32'b00000000000000000000000000000000;    // nop
            memory[122] <= 32'b00000000000000000000000000000000;    // nop
            memory[123] <= 32'b00000000000000000000000000000000;    // nop
            memory[124] <= 32'b00000000000000000000000000000000;    // nop
            memory[125] <= 32'b00000000000000000000000000000000;    // nop
            memory[126] <= 32'b00000010001101101011100000100101;    //            or    $s7, $s1, $s6
            memory[127] <= 32'b00000000000000000000000000000000;    // nop
            memory[128] <= 32'b00000000000000000000000000000000;    // nop
            memory[129] <= 32'b00000000000000000000000000000000;    // nop
            memory[130] <= 32'b00000000000000000000000000000000;    // nop
            memory[131] <= 32'b00000000000000000000000000000000;    // nop
            memory[132] <= 32'b00000010001100111001000000100010;    //            sub    $s2, $s1, $s3
            memory[133] <= 32'b00000000000000000000000000000000;    // nop
            memory[134] <= 32'b00000000000000000000000000000000;    // nop
            memory[135] <= 32'b00000000000000000000000000000000;    // nop
            memory[136] <= 32'b00000000000000000000000000000000;    // nop
            memory[137] <= 32'b00000000000000000000000000000000;    // nop
            memory[138] <= 32'b00000010010101010100000000100100;    //            and    $t0, $s2, $s5
            memory[139] <= 32'b00000000000000000000000000000000;    // nop
            memory[140] <= 32'b00000000000000000000000000000000;    // nop
            memory[141] <= 32'b00000000000000000000000000000000;    // nop
            memory[142] <= 32'b00000000000000000000000000000000;    // nop
            memory[143] <= 32'b00000000000000000000000000000000;    // nop
            memory[144] <= 32'b00000010110100100100100000100101;    //            or    $t1, $s6, $s2
            memory[145] <= 32'b00000000000000000000000000000000;    // nop
            memory[146] <= 32'b00000000000000000000000000000000;    // nop
            memory[147] <= 32'b00000000000000000000000000000000;    // nop
            memory[148] <= 32'b00000000000000000000000000000000;    // nop
            memory[149] <= 32'b00000000000000000000000000000000;    // nop
            memory[150] <= 32'b00000010010100100101000000100000;    //            add    $t2, $s2, $s2
            memory[151] <= 32'b00000000000000000000000000000000;    // nop
            memory[152] <= 32'b00000000000000000000000000000000;    // nop
            memory[153] <= 32'b00000000000000000000000000000000;    // nop
            memory[154] <= 32'b00000000000000000000000000000000;    // nop
            memory[155] <= 32'b00000000000000000000000000000000;    // nop
            memory[156] <= 32'b00110100000100010000000000000000;    //            ori    $s1, $zero, 0
            memory[157] <= 32'b00000000000000000000000000000000;    // nop
            memory[158] <= 32'b00000000000000000000000000000000;    // nop
            memory[159] <= 32'b00000000000000000000000000000000;    // nop
            memory[160] <= 32'b00000000000000000000000000000000;    // nop
            memory[161] <= 32'b00000000000000000000000000000000;    // nop
            memory[162] <= 32'b10101110001010010000000000000100;    //            sw    $t1, 4($s1)
            memory[163] <= 32'b00000000000000000000000000000000;    // nop
            memory[164] <= 32'b00000000000000000000000000000000;    // nop
            memory[165] <= 32'b00000000000000000000000000000000;    // nop
            memory[166] <= 32'b00000000000000000000000000000000;    // nop
            memory[167] <= 32'b00000000000000000000000000000000;    // nop
            memory[168] <= 32'b10001110001010100000000000000100;    //            lw    $t2, 4($s1)
            memory[169] <= 32'b00000000000000000000000000000000;    // nop
            memory[170] <= 32'b00000000000000000000000000000000;    // nop
            memory[171] <= 32'b00000000000000000000000000000000;    // nop
            memory[172] <= 32'b00000000000000000000000000000000;    // nop
            memory[173] <= 32'b00000000000000000000000000000000;    // nop
            memory[174] <= 32'b00000010001100111001000000100010;    //            sub    $s2, $s1, $s3
            memory[175] <= 32'b00000000000000000000000000000000;    // nop
            memory[176] <= 32'b00000000000000000000000000000000;    // nop
            memory[177] <= 32'b00000000000000000000000000000000;    // nop
            memory[178] <= 32'b00000000000000000000000000000000;    // nop
            memory[179] <= 32'b00000000000000000000000000000000;    // nop
            memory[180] <= 32'b00000010010101010101100000100101;    //            or    $t3, $s2, $s5
            memory[181] <= 32'b00000000000000000000000000000000;    // nop
            memory[182] <= 32'b00000000000000000000000000000000;    // nop
            memory[183] <= 32'b00000000000000000000000000000000;    // nop
            memory[184] <= 32'b00000000000000000000000000000000;    // nop
            memory[185] <= 32'b00000000000000000000000000000000;    // nop
            memory[186] <= 32'b00000010010100100110000000100000;    //            add    $t4, $s2, $s2
            memory[187] <= 32'b00000000000000000000000000000000;    // nop
            memory[188] <= 32'b00000000000000000000000000000000;    // nop
            memory[189] <= 32'b00000000000000000000000000000000;    // nop
            memory[190] <= 32'b00000000000000000000000000000000;    // nop
            memory[191] <= 32'b00000000000000000000000000000000;    // nop
            memory[192] <= 32'b00000010010100100101000000100101;    //            or    $t2, $s2, $s2
            memory[193] <= 32'b00000000000000000000000000000000;    // nop
            memory[194] <= 32'b00000000000000000000000000000000;    // nop
            memory[195] <= 32'b00000000000000000000000000000000;    // nop
            memory[196] <= 32'b00000000000000000000000000000000;    // nop
            memory[197] <= 32'b00000000000000000000000000000000;    // nop
            memory[198] <= 32'b00000010111010101010000000100000;    //            add    $s4, $s7, $t2
            memory[199] <= 32'b00000000000000000000000000000000;    // nop
            memory[200] <= 32'b00000000000000000000000000000000;    // nop
            memory[201] <= 32'b00000000000000000000000000000000;    // nop
            memory[202] <= 32'b00000000000000000000000000000000;    // nop
            memory[203] <= 32'b00000000000000000000000000000000;    // nop
            memory[204] <= 32'b00110100000010010000000000000000;    //            ori    $t1, $zero, 0
            memory[205] <= 32'b00000000000000000000000000000000;    // nop
            memory[206] <= 32'b00000000000000000000000000000000;    // nop
            memory[207] <= 32'b00000000000000000000000000000000;    // nop
            memory[208] <= 32'b00000000000000000000000000000000;    // nop
            memory[209] <= 32'b00000000000000000000000000000000;    // nop
            memory[210] <= 32'b10001101001010000000000000000000;    //            lw    $t0, 0($t1)
            memory[211] <= 32'b00000000000000000000000000000000;    // nop
            memory[212] <= 32'b00000000000000000000000000000000;    // nop
            memory[213] <= 32'b00000000000000000000000000000000;    // nop
            memory[214] <= 32'b00000000000000000000000000000000;    // nop
            memory[215] <= 32'b00000000000000000000000000000000;    // nop
            memory[216] <= 32'b10001101001010100000000000000100;    //            lw    $t2, 4($t1)
            memory[217] <= 32'b00000000000000000000000000000000;    // nop
            memory[218] <= 32'b00000000000000000000000000000000;    // nop
            memory[219] <= 32'b00000000000000000000000000000000;    // nop
            memory[220] <= 32'b00000000000000000000000000000000;    // nop
            memory[221] <= 32'b00000000000000000000000000000000;    // nop
            memory[222] <= 32'b10101101001010100000000000000000;    //            sw    $t2, 0($t1)
            memory[223] <= 32'b00000000000000000000000000000000;    // nop
            memory[224] <= 32'b00000000000000000000000000000000;    // nop
            memory[225] <= 32'b00000000000000000000000000000000;    // nop
            memory[226] <= 32'b00000000000000000000000000000000;    // nop
            memory[227] <= 32'b00000000000000000000000000000000;    // nop
            memory[228] <= 32'b10101101001010000000000000000100;    //            sw    $t0, 4($t1)
            memory[229] <= 32'b00000000000000000000000000000000;    // nop
            memory[230] <= 32'b00000000000000000000000000000000;    // nop
            memory[231] <= 32'b00000000000000000000000000000000;    // nop
            memory[232] <= 32'b00000000000000000000000000000000;    // nop
            memory[233] <= 32'b00000000000000000000000000000000;    // nop
            memory[234] <= 32'b10001101001010000000000000000000;    //            lw    $t0, 0($t1)
            memory[235] <= 32'b00000000000000000000000000000000;    // nop
            memory[236] <= 32'b00000000000000000000000000000000;    // nop
            memory[237] <= 32'b00000000000000000000000000000000;    // nop
            memory[238] <= 32'b00000000000000000000000000000000;    // nop
            memory[239] <= 32'b00000000000000000000000000000000;    // nop
            memory[240] <= 32'b10001101001010100000000000000100;    //            lw    $t2, 4($t1)
            memory[241] <= 32'b00000000000000000000000000000000;    // nop
            memory[242] <= 32'b00000000000000000000000000000000;    // nop
            memory[243] <= 32'b00000000000000000000000000000000;    // nop
            memory[244] <= 32'b00000000000000000000000000000000;    // nop
            memory[245] <= 32'b00000000000000000000000000000000;    // nop
            memory[246] <= 32'b00110100000001000000000000011000;    //            ori    $a0, $zero, 24
            memory[247] <= 32'b00000000000000000000000000000000;    // nop
            memory[248] <= 32'b00000000000000000000000000000000;    // nop
            memory[249] <= 32'b00000000000000000000000000000000;    // nop
            memory[250] <= 32'b00000000000000000000000000000000;    // nop
            memory[251] <= 32'b00000000000000000000000000000000;    // nop
            memory[252] <= 32'b00001000000100000000000000111000;    //            j    start
            memory[253] <= 32'b00000000000000000000000000000000;    // nop
            memory[254] <= 32'b00000000000000000000000000000000;    // nop
            memory[255] <= 32'b00000000000000000000000000000000;    // nop
            memory[256] <= 32'b00000000000000000000000000000000;    // nop
            memory[257] <= 32'b00000000000000000000000000000000;    // nop
            memory[258] <= 32'b00100000000001001111111111111111;    //            addi    $a0, $zero, -1
            memory[259] <= 32'b00000000000000000000000000000000;    // nop
            memory[260] <= 32'b00000000000000000000000000000000;    // nop
            memory[261] <= 32'b00000000000000000000000000000000;    // nop
            memory[262] <= 32'b00000000000000000000000000000000;    // nop
            memory[263] <= 32'b00000000000000000000000000000000;    // nop
            memory[264] <= 32'b00100000000001001111111111111111;    //            addi    $a0, $zero, -1
            memory[265] <= 32'b00000000000000000000000000000000;    // nop
            memory[267] <= 32'b00000000000000000000000000000000;    // nop
            memory[268] <= 32'b00000000000000000000000000000000;    // nop
            memory[269] <= 32'b00000000000000000000000000000000;    // nop
            memory[270] <= 32'b00000000000000000000000000000000;    // nop
            memory[271] <= 32'b10001100100100000000000000000100;    //    start:        lw    $s0, 4($a0)
            memory[272] <= 32'b00000000000000000000000000000000;    // nop
            memory[273] <= 32'b00000000000000000000000000000000;    // nop
            memory[274] <= 32'b00000000000000000000000000000000;    // nop
            memory[275] <= 32'b00000000000000000000000000000000;    // nop
            memory[276] <= 32'b00000000000000000000000000000000;    // nop
            memory[278] <= 32'b10101100100100000000000000000000;    //            sw    $s0, 0($a0)
            memory[279] <= 32'b00000000000000000000000000000000;    // nop
            memory[280] <= 32'b00000000000000000000000000000000;    // nop
            memory[281] <= 32'b00000000000000000000000000000000;    // nop
            memory[282] <= 32'b00000000000000000000000000000000;    // nop
            memory[283] <= 32'b00000000000000000000000000000000;    // nop
            memory[284] <= 32'b00000110000000010000000000000011;    //    branch1:    bgez    $s0, branch2
            memory[285] <= 32'b00000000000000000000000000000000;    // nop
            memory[286] <= 32'b00000000000000000000000000000000;    // nop
            memory[287] <= 32'b00000000000000000000000000000000;    // nop
            memory[288] <= 32'b00000000000000000000000000000000;    // nop
            memory[289] <= 32'b00000000000000000000000000000000;    // nop
            memory[290] <= 32'b00100010000100000000000000000001;    //            addi    $s0, $s0, 1
            memory[291] <= 32'b00000000000000000000000000000000;    // nop
            memory[292] <= 32'b00000000000000000000000000000000;    // nop
            memory[293] <= 32'b00000000000000000000000000000000;    // nop
            memory[294] <= 32'b00000000000000000000000000000000;    // nop
            memory[295] <= 32'b00000000000000000000000000000000;    // nop
            memory[296] <= 32'b00000110000000011111111111111011;    //            bgez    $s0, branch1
            memory[297] <= 32'b00000000000000000000000000000000;    // nop
            memory[298] <= 32'b00000000000000000000000000000000;    // nop
            memory[299] <= 32'b00000000000000000000000000000000;    // nop
            memory[300] <= 32'b00000000000000000000000000000000;    // nop
            memory[301] <= 32'b00000000000000000000000000000000;    // nop
            memory[302] <= 32'b00001000000000000000000000111101;    //            j    error
            memory[303] <= 32'b00000000000000000000000000000000;    // nop
            memory[304] <= 32'b00000000000000000000000000000000;    // nop
            memory[305] <= 32'b00000000000000000000000000000000;    // nop
            memory[306] <= 32'b00000000000000000000000000000000;    // nop
            memory[307] <= 32'b00000000000000000000000000000000;    // nop
            memory[308] <= 32'b00100000000100001111111111111111;    //    branch2:    addi    $s0, $zero, -1
            memory[309] <= 32'b00000000000000000000000000000000;    // nop
            memory[310] <= 32'b00000000000000000000000000000000;    // nop
            memory[311] <= 32'b00000000000000000000000000000000;    // nop
            memory[312] <= 32'b00000000000000000000000000000000;    // nop
            memory[313] <= 32'b00000000000000000000000000000000;    // nop
            memory[314] <= 32'b00000110000000000000000000000011;    //            bltz    $s0, branch3
            memory[315] <= 32'b00000000000000000000000000000000;    // nop
            memory[316] <= 32'b00000000000000000000000000000000;    // nop
            memory[317] <= 32'b00000000000000000000000000000000;    // nop
            memory[318] <= 32'b00000000000000000000000000000000;    // nop
            memory[319] <= 32'b00000000000000000000000000000000;    // nop
            memory[320] <= 32'b00100000000100000000000000000001;    //            addi    $s0, $zero, 1
            memory[321] <= 32'b00000000000000000000000000000000;    // nop
            memory[322] <= 32'b00000000000000000000000000000000;    // nop
            memory[323] <= 32'b00000000000000000000000000000000;    // nop
            memory[324] <= 32'b00000000000000000000000000000000;    // nop
            memory[325] <= 32'b00000000000000000000000000000000;    // nop
            memory[326] <= 32'b00011110000000001111111111111010;    //            bgtz    $s0, branch2
            memory[327] <= 32'b00000000000000000000000000000000;    // nop
            memory[328] <= 32'b00000000000000000000000000000000;    // nop
            memory[329] <= 32'b00000000000000000000000000000000;    // nop
            memory[330] <= 32'b00000000000000000000000000000000;    // nop
            memory[331] <= 32'b00000000000000000000000000000000;    // nop
            memory[332] <= 32'b00001000000000000000000000111101;    //            j    error
            memory[333] <= 32'b00000000000000000000000000000000;    // nop
            memory[334] <= 32'b00000000000000000000000000000000;    // nop
            memory[335] <= 32'b00000000000000000000000000000000;    // nop
            memory[336] <= 32'b00000000000000000000000000000000;    // nop
            memory[337] <= 32'b00000000000000000000000000000000;    // nop
            memory[338] <= 32'b00000110000000000000000000000011;    //    branch3:    bltz    $s0, done
            memory[339] <= 32'b00000000000000000000000000000000;    // nop
            memory[340] <= 32'b00000000000000000000000000000000;    // nop
            memory[341] <= 32'b00000000000000000000000000000000;    // nop
            memory[342] <= 32'b00000000000000000000000000000000;    // nop
            memory[343] <= 32'b00000000000000000000000000000000;    // nop
            memory[344] <= 32'b00100000000100001111111111111111;    //            addi    $s0, $zero, -1
            memory[345] <= 32'b00000000000000000000000000000000;    // nop
            memory[346] <= 32'b00000000000000000000000000000000;    // nop
            memory[347] <= 32'b00000000000000000000000000000000;    // nop
            memory[348] <= 32'b00000000000000000000000000000000;    // nop
            memory[349] <= 32'b00000000000000000000000000000000;    // nop
            memory[350] <= 32'b00000110000000001111111111111011;    //            bltz    $s0, branch3
            memory[351] <= 32'b00000000000000000000000000000000;    // nop
            memory[352] <= 32'b00000000000000000000000000000000;    // nop
            memory[353] <= 32'b00000000000000000000000000000000;    // nop
            memory[354] <= 32'b00000000000000000000000000000000;    // nop
            memory[355] <= 32'b00000000000000000000000000000000;    // nop
            memory[356] <= 32'b00001000000000000000000000111101;    //            j    error
            memory[357] <= 32'b00000000000000000000000000000000;    // nop
            memory[358] <= 32'b00000000000000000000000000000000;    // nop
            memory[359] <= 32'b00000000000000000000000000000000;    // nop
            memory[360] <= 32'b00000000000000000000000000000000;    // nop
            memory[361] <= 32'b00000000000000000000000000000000;    // nop
            memory[362] <= 32'b00001000000000000000000000111100;    //    done:        j    done
            memory[363] <= 32'b00000000000000000000000000000000;    // nop
            memory[364] <= 32'b00000000000000000000000000000000;    // nop
            memory[365] <= 32'b00000000000000000000000000000000;    // nop
            memory[366] <= 32'b00000000000000000000000000000000;    // nop
            memory[367] <= 32'b00000000000000000000000000000000;    // nop
            memory[368] <= 32'b00001000000000000000000000111101;    //    error:        j    error
        end
        
        always @ * begin
            Instruction <= memory[tempA];    
        end
        
        
    endmodule
