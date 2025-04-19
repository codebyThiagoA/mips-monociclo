`timescale 1ns/1ps

module tb_MIPS_Monocycle;

    logic clk, rst;

    MIPS_Monocycle dut (
        .clk(clk),
        .rst(rst)
    );

    // Clock
    always #5 clk = ~clk;

    initial begin
        $dumpfile("mips.vcd");
        $dumpvars;
        $monitor("Time=%0t PC=%h Instr=%h s0=%d s1=%d t0=%d  alu_result=%h mem[10]=%h alu_op=%b reg_dst=%b alu_src=%b mem_to_reg=%b reg_write=%b mem_read=%b mem_write=%b branch=%b reg_data1=%h reg_data2=%h sign_ext_imm=%h",
                 $time, dut.pc, dut.instruction,
                 dut.regfile.rf[16], dut.regfile.rf[17], dut.regfile.rf[8], dut.regfile.rf[9],
                 dut.alu_result, dut.data_mem.RAM[10],
                 dut.alu_op, dut.reg_dst, dut.alu_src, dut.mem_to_reg, dut.reg_write, dut.mem_read, dut.mem_write, dut.branch,
                 dut.reg_data1, dut.reg_data2, dut.sign_ext_imm);

        clk = 0;
        rst = 1;
        #10;
        rst = 0;

        // Rodar por 5 instruções (50 ns para garantir)
        #50;
        $finish;
    end
endmodule
