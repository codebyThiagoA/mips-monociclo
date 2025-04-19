/ Módulo Mux2to1_32
module Mux2to1_32 (
    input logic [31:0] in0,
    input logic [31:0] in1,
    input logic sel,
    output logic [31:0] out
);
    assign out = sel ? in1 : in0;
endmodule

// Módulo Mux2to1_5
module Mux2to1_5 (
    input logic [4:0] in0,
    input logic [4:0] in1,
    input logic sel,
    output logic [4:0] out
);
    assign out = sel ? in1 : in0;
endmodule
