`timescale 1ns / 1ps

module Controller(opcode, RegDst, RegWrite, MemRead,MemWrite,
    MemtoReg, ALUSrc, ShamtCtrl, Jump, Branch, SignZero, ByteCtrl,
    ALUOp);
    
    input [5:0] opcode;
    
    output reg RegDst, RegWrite;
    output reg MemRead, MemWrite, MemtoReg;
    output reg ALUSrc, ShamtCtrl;
    output reg Jump, Branch, SignZero; // SignZero = 0 to sign extend, 1 to zero extend
    // ByteControl = 00 means Least significant 32-bit word of Rt is stored/loaded, 01 means LS 16-bit,
    // 10 means LS 8-bit, 11 is used specifically for load operation, the lui instruction
    // A 4 to 1 mux before Data Memory and before the WB Data 2 to 1 Mux will use this flag
    // There shouldn't be a problem with using 11 for lui since sw will have that set if the operation is store
    // ByteControl is x otherwise if not store or load operation since MemToReg Ctrl is there
    output reg [1:0] ByteCtrl;
    output reg [2:0] ALUOp;
    
    always @(*) 
    begin    
        case(opcode)
           6'b000000 : // Multiple instructions
           begin
               RegDst = 1'b1;
               RegWrite = 1'b1;
               MemRead = 1'b0;
               MemWrite = 1'b0;
               MemtoReg = 1'b1;
               ALUSrc = 1'b0;
               ShamtCtrl = 1'b0;
               Jump = 1'b0;
               Branch = 1'b0;
               SignZero = 1'b0;
               ByteCtrl = 2'bxx;
               ALUOp = 3'b000;
            end
            6'b101011 : 
            begin // sw
                RegDst = 1'bx;
                RegWrite = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b1;
                MemtoReg = 1'bx;
                ALUSrc = 1'b1;
                ShamtCtrl = 1'b0;
                Jump = 1'b0;
                Branch = 1'b0;
                SignZero = 1'b0;
                ByteCtrl = 2'b00;
                ALUOp = 3'b010;
            end
            6'b101001 : 
            begin // sh
               RegDst = 1'bx;
               RegWrite = 1'b0;
               MemRead = 1'b0;
               MemWrite = 1'b1;
               MemtoReg = 1'bx;
               ALUSrc = 1'b1;
               ShamtCtrl = 1'b0;
               Jump = 1'b0;
               Branch = 1'b0;
               SignZero = 1'b0;
               ByteCtrl = 2'b01;
               ALUOp = 3'b010;
            end
            6'b101000 : 
            begin // sb
               RegDst = 1'bx;
               RegWrite = 1'b0;
               MemRead = 1'b0;
               MemWrite = 1'b1;
               MemtoReg = 1'bx;
               ALUSrc = 1'b1;
               ShamtCtrl = 1'b0;
               Jump = 1'b0;
               Branch = 1'b0;
               SignZero = 1'b0;
               ByteCtrl = 2'b10;
               ALUOp = 3'b010;
            end
            6'b100011 : 
            begin // lw
               RegDst = 1'b0;
               RegWrite = 1'b1;
               MemRead = 1'b1;
               MemWrite = 1'b0;
               MemtoReg = 1'b0;
               ALUSrc = 1'b1;
               ShamtCtrl = 1'b0;
               Jump = 1'b0;
               Branch = 1'b0;
               SignZero = 1'b0;
               ByteCtrl = 2'b00;
               ALUOp = 3'b010;
            end
            6'b100001 : 
            begin // lh
               RegDst = 1'b0;
               RegWrite = 1'b1;
               MemRead = 1'b1;
               MemWrite = 1'b0;
               MemtoReg = 1'b0;
               ALUSrc = 1'b1;
               ShamtCtrl = 1'b0;
               Jump = 1'b0;
               Branch = 1'b0;
               SignZero = 1'b0;
               ByteCtrl = 2'b01;
               ALUOp = 3'b010;    
            end
            6'b100000 : 
            begin // lb 
               RegDst = 1'b0;
               RegWrite = 1'b1;
               MemRead = 1'b1;
               MemWrite = 1'b0;
               MemtoReg = 1'b0;
               ALUSrc = 1'b1;
               ShamtCtrl = 1'b0;  
               Jump = 1'b0;
               Branch = 1'b0;
               SignZero = 1'b0;
               ByteCtrl = 2'b10;
               ALUOp = 3'b010;
            end
            6'b001111 : 
            begin // lui 
               RegDst = 1'b0;
               RegWrite = 1'b1;
               MemRead = 1'b0;
               MemWrite = 1'b0;
               MemtoReg = 1'b0;
               ALUSrc = 1'bx;
               ShamtCtrl = 1'bx;
               Jump = 1'b0;
               Branch = 1'b0;
               SignZero = 1'b0;
               ByteCtrl = 2'b11;
               ALUOp = 3'b010; 
            end
            6'b011111 : 
            begin // seb, seh
               RegDst = 1'b1;
               RegWrite = 1'b1;
               MemRead = 1'b0;
               MemWrite = 1'b0;
               MemtoReg = 1'b1;
               ALUSrc = 1'b0;
               ShamtCtrl = 1'bx;
               Jump = 1'b0;
               Branch = 1'b0;
               SignZero = 1'bx;
               ByteCtrl = 2'bxx;
               ALUOp = 3'b111;
            end
            6'b011100 : begin // mul
                RegDst = 1'b1;
                RegWrite = 1'b1;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                MemtoReg = 1'b1;
                ALUSrc = 1'b0;
                ShamtCtrl = 1'b0;
                Jump = 1'b0;
                Branch = 1'b0;
                SignZero = 1'bx;
                ByteCtrl = 2'bxx;
                ALUOp = 3'b001;
            end 
            6'b001110 : begin // xori
                RegDst = 1'b0;
                RegWrite = 1'b1;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                MemtoReg = 1'b1;
                ALUSrc = 1'b1;
                ShamtCtrl = 1'b0;
                Jump = 1'b0;
                Branch = 1'b0;
                SignZero = 1'b1; // zero extend
                ByteCtrl = 2'bxx;
                ALUOp = 3'b110;
            end
            6'b001101 : begin // ori
                RegDst = 1'b0;
                RegWrite = 1'b1;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                MemtoReg = 1'b1;
                ALUSrc = 1'b1;
                ShamtCtrl = 1'b0;
                Jump = 1'b0;
                Branch = 1'b0;
                SignZero = 1'b1;
                ByteCtrl = 2'bxx;
                ALUOp = 3'b101; 
            end
            6'b001100 : begin // andi
               RegDst = 1'b0;
               RegWrite = 1'b1;
               MemRead = 1'b0;
               MemWrite = 1'b0;
               MemtoReg = 1'b1;
               ALUSrc = 1'b1;
               ShamtCtrl = 1'b0;
               Jump = 1'b0;
               Branch = 1'b0;
               SignZero = 1'b1;
               ByteCtrl = 2'bxx;
               ALUOp <= 3'b100; 
            end
            6'b001011 : begin // sltiu
                RegDst = 1'b0;
                RegWrite = 1'b1;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                MemtoReg = 1'b1;
                ALUSrc = 1'b1;
                ShamtCtrl = 1'b0;
                Jump = 1'b0;
                Branch = 1'b0;
                SignZero = 1'b0;
                ByteCtrl = 2'bxx;
                ALUOp = 3'b110; 
            end
            6'b001010 : begin // slti
                RegDst = 1'b0;
                RegWrite = 1'b1;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                MemtoReg = 1'b1;
                ALUSrc = 1'b1;
                ShamtCtrl = 1'b0;
                Jump = 1'b0;
                Branch = 1'b0;
                SignZero = 1'b0;
                ByteCtrl = 2'bxx;
                ALUOp = 3'b101;
            end
            6'b001001 : begin // addiu
                RegDst = 1'b0;
                RegWrite = 1'b1;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                MemtoReg = 1'b1;
                ALUSrc = 1'b1;
                ShamtCtrl = 1'b1;
                Jump = 1'b0;
                Branch = 1'b0;
                SignZero = 1'b0;
                ByteCtrl = 2'bxx;
                ALUOp = 3'b011;
            end
            6'b001000 : begin // addi
                RegDst = 1'b0;
                RegWrite = 1'b1;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                MemtoReg = 1'b1;
                ALUSrc = 1'b1;
                ShamtCtrl = 1'b1;
                ByteCtrl = 2'bxx;
                Jump = 1'b0;
                Branch = 1'b0;
                SignZero = 1'b0;
                ALUOp = 3'b010;
            end
            6'b000111 : begin // bgtz   
                RegDst = 1'bx;
                RegWrite = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                MemtoReg = 1'bx;
                ALUSrc = 1'bx;
                ShamtCtrl = 1'bx;
                Jump = 1'b0;
                Branch = 1'b1;
                SignZero = 1'bx;
                ByteCtrl = 2'bxx;
                ALUOp = 3'b100; 
            end
            6'b000110 : begin // blez
                RegDst = 1'bx;
                RegWrite = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                MemtoReg = 1'bx;
                ALUSrc = 1'bx;
                ShamtCtrl = 1'bx;
                Jump = 1'b0;
                Branch = 1'b1;
                SignZero = 1'bx;
                ByteCtrl = 2'bxx;
                ALUOp = 3'b011; 
            end
            6'b000101 : begin // bne
                RegDst = 1'bx;
                RegWrite = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                MemtoReg = 1'bx;
                ALUSrc = 1'bx;
                ShamtCtrl = 1'bx;
                Jump = 1'b0;
                Branch = 1'b1;
                SignZero = 1'bx;
                ByteCtrl = 2'bxx;
                ALUOp = 3'b010; 
            end
            6'b000100 : begin // beq   
                RegDst = 1'bx;
                RegWrite = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                MemtoReg = 1'bx;
                ALUSrc = 1'bx;
                ShamtCtrl = 1'bx;
                Jump = 1'b0;
                Branch = 1'b1;
                SignZero = 1'bx;
                ByteCtrl = 2'bxx;
                ALUOp = 3'b001; 
            end
            6'b000001 : begin // bgez, bltz
                RegDst = 1'bx;
                RegWrite = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                MemtoReg = 1'bx;
                ALUSrc = 1'bx; 
                ShamtCtrl = 1'bx;
                Jump = 1'b0;
                Branch = 1'b1;
                SignZero = 1'bx;
                ByteCtrl = 2'bxx;
                ALUOp = 3'b111;  
            end
            6'b000010 : begin // j   
                RegDst = 1'bx;
                RegWrite = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                MemtoReg = 1'bx;
                ALUSrc = 1'bx;
                ShamtCtrl = 1'bx;
                Jump = 1'b1;
                Branch = 1'b0;
                SignZero = 1'bx;
                ByteCtrl = 2'bxx;
                ALUOp = 3'b000;
            end
            default: 
            begin
                RegDst = 1'b0;
                RegWrite = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                MemtoReg = 1'b0;
                ALUSrc = 1'b0; 
                ShamtCtrl = 1'b0;
                Jump = 1'b0;
                Branch = 1'b0;
                SignZero = 1'b0;
                ByteCtrl = 2'b00;
                ALUOp = 3'b000;  
            end
        endcase
        /*if (opcode == 6'b011100) begin
            if (func == 6'b100001) begin // clo -- change
                RegDst <= 1;
                RegWrite <= 1;
                ALUOp <= 5'b01011;
            end //change
            else if (func == 6'b100000) begin // clz -- change
                RegDst <= 1;
                RegWrite <= 1;
                ALUOp <= 5'b01100;
            end //change
        end*/
    end            
endmodule
