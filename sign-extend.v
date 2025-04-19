// Módulo SignExtend
module SignExtend (
    input logic [15:0] imm,
    output logic [31:0] extended
);
    assign extended = {{16{imm[15]}}, imm};
endmodule