// Módulo DataMemory
module DataMemory #(
    parameter ADDR_WIDTH = 8,
    parameter DATA_WIDTH = 32
)(
    input  wire                     clk,
    input  wire                     memRead,
    input  wire                     memWrite,
    input  wire [ADDR_WIDTH-1:0]    addr,
    input  wire [DATA_WIDTH-1:0]    writeData,
    output reg  [DATA_WIDTH-1:0]    readData
);
    reg [DATA_WIDTH-1:0] RAM [0:(1 << ADDR_WIDTH)-1];
    always @(posedge clk) begin
        if (memWrite) begin
            RAM[addr] <= writeData;
        end
        if (memRead) begin
            readData <= RAM[addr];
        end
    end
endmodule