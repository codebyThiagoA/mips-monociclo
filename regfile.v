

//THIAGO -  Módulo RegFile
module RegFile(
    input logic clk,
    input logic we3,
    input logic [4:0] ra1,
    input logic [4:0] ra2,
    input logic [4:0] wa3,
    input logic [31:0] wd3,
    output logic [31:0] rd1,
    output logic [31:0] rd2
);
    logic [31:0] rf[31:0];
    always_ff @(posedge clk) begin
        if (we3 && (wa3 != 5'd0))
            rf[wa3] <= wd3;

    end
    assign rd1 = (ra1 != 5'd0) ? rf[ra1] : 32'd0;
    assign rd2 = (ra2 != 5'd0) ? rf[ra2] : 32'd0;
endmodule
