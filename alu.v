// Módulo ALU
module ALU (
    input logic [31:0] a,
    input logic [31:0] b,
    input logic [2:0] alu_control,
    output logic [31:0] result,
    output logic zero
);
    always_comb begin
        case(alu_control)
            3'b010: result = a + b;
            3'b110: result = a - b;
            3'b000: result = a & b;
            3'b001: result = a | b;
            3'b111: result = (a < b) ? 32'd1 : 32'd0;
            default: result = 32'd0;
        endcase
        zero = (result == 32'd0) ? 1'b1 : 1'b0;
    end
endmodule