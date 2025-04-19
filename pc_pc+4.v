`timescale 1ns/1ps

// Módulo pc_register
module pc_register (
    input wire clk,
    input wire rst,
    input wire enable,
    input wire [31:0] pc_next,
    output reg [31:0] pc
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            pc <= 32'b0;
        else if (enable)
            pc <= pc_next;
    end
endmodule

// Módulo pc_adder
module pc_adder (
    input wire [31:0] pc,
    output wire [31:0] pc_next
);
    assign pc_next = pc + 32'd4;
endmodule