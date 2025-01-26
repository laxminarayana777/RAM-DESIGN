module ram(
    input  wire clk,
    input  wire we, // write enable
    input  wire [3:0] addr,
    input  wire [7:0] data_in,
    output wire [7:0] data_out
);

reg [7:0] ram [0:15];

always @(posedge clk)
 begin
    if (we)
     begin
        ram[addr] <= data_in;
    end
end

assign data_out = ram[addr];

endmodule
