// Módulo control_unit
module control_unit(
    input [5:0] opcode,
    input [5:0] funct,
    output reg RegDst,
    output reg ALUSrc,
    output reg MemtoReg,
    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg Branch,
    output reg [2:0] ALUOp
);
    always @(*) begin
        RegDst = 1'b0;
        ALUSrc = 1'b0;
        MemtoReg = 1'b0;
        RegWrite = 1'b0;
        MemRead = 1'b0;
        MemWrite = 1'b0;
        Branch = 1'b0;
        ALUOp = 3'b010;
        case (opcode)
            6'b000000: begin
                RegDst = 1'b1;
                RegWrite = 1'b1;
                case (funct)
                    6'b100000: ALUOp = 3'b010; // ADD
                    6'b100010: ALUOp = 3'b110; // SUB
                    6'b100100: ALUOp = 3'b000; // AND
                    6'b100101: ALUOp = 3'b001; // OR
                    6'b101010: ALUOp = 3'b111; // SLT
                    default: ALUOp = 3'b010;
                endcase
            end
            6'b001000: begin // addi
                ALUSrc = 1'b1;
                RegWrite = 1'b1;
                ALUOp = 3'b010;
            end
            6'b100011: begin // lw
                ALUSrc = 1'b1;
                MemtoReg = 1'b1;
                RegWrite = 1'b1;
                MemRead = 1'b1;
                ALUOp = 3'b010;
            end
            6'b101011: begin // sw
                ALUSrc = 1'b1;
                MemWrite = 1'b1;
                ALUOp = 3'b010;
            end
            6'b000100: begin // beq
                Branch = 1'b1;
                ALUOp = 3'b110;
            end
            default: begin
            end
        endcase
    end
endmodule