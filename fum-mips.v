`timescale 1ns/1ps

module MIPS_Monocycle (
    input logic clk,
    input logic rst
);
    logic [31:0] pc, pc_next;
    logic [31:0] instruction;
    logic [4:0] rs, rt, rd, wa3;
    logic [15:0] imm16;
    logic [31:0] reg_data1, reg_data2, write_data;
    logic [31:0] sign_ext_imm;
    logic [31:0] alu_input_b, alu_result, mem_data;
    logic [2:0] alu_op;
    logic reg_dst, alu_src, mem_to_reg, reg_write, mem_read, mem_write, branch;
    logic zero;

    // PC e Incremento
    pc_register pc_reg (
        .clk(clk), .rst(rst), .enable(1'b1), .pc_next(pc_next), .pc(pc)
    );
    pc_adder pc_add (
        .pc(pc), .pc_next(pc_next)
    );

    // Memória de Instruções
    InstructionMemory instr_mem (
        .address(pc), .instruction(instruction)
    );

    // Decodificação da Instrução
    assign rs = instruction[25:21];
    assign rt = instruction[20:16];
    assign rd = instruction[15:11];
    assign imm16 = instruction[15:0];

    // Unidade de Controle
    control_unit ctrl (
        .opcode(instruction[31:26]),
        .funct(instruction[5:0]),
        .RegDst(reg_dst),
        .ALUSrc(alu_src),
        .MemtoReg(mem_to_reg),
        .RegWrite(reg_write),
        .MemRead(mem_read),
        .MemWrite(mem_write),
        .Branch(branch),
        .ALUOp(alu_op)
    );

    // Banco de Registradores
    Mux2to1_5 reg_dst_mux (
        .in0(rt), .in1(rd), .sel(reg_dst), .out(wa3)
    );
    RegFile regfile (
        .clk(clk), .we3(reg_write),
        .ra1(rs), .ra2(rt), .wa3(wa3),
        .wd3(write_data), .rd1(reg_data1), .rd2(reg_data2)
    );

    // Extensão de Sinal
    SignExtend se (
        .imm(imm16), .extended(sign_ext_imm)
    );

    // MUX para ALU
    Mux2to1_32 alu_mux (
        .in0(reg_data2), .in1(sign_ext_imm),
        .sel(alu_src), .out(alu_input_b)
    );

    // ALU
    ALU alu (
        .a(reg_data1), .b(alu_input_b), .alu_control(alu_op),
        .result(alu_result), .zero(zero)
    );

    // Memória de Dados
    DataMemory data_mem (
        .clk(clk), .memRead(mem_read), .memWrite(mem_write),
        .addr(alu_result[7:0]), .writeData(reg_data2),
        .readData(mem_data)
    );

    // MUX de Write-Back
    Mux2to1_32 wb_mux (
        .in0(alu_result), .in1(mem_data), .sel(mem_to_reg),
        .out(write_data)
    );
endmodule