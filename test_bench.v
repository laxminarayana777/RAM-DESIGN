module test_bench;

reg clk;
reg we;
reg [3:0] addr;
reg [7:0] data_in;
wire [7:0] data_out;

ram DUT (
    .clk(clk),
    .we(we),
    .addr(addr),
    .data_in(data_in),
    .data_out(data_out)
);

initial begin
    clk = 0;
    we = 0;
    addr = 0;
    data_in = 0;
end

always #5 clk = ~clk;

initial begin
    // Write data to RAM
    #10 we = 1;
    addr = 4'd1;
    data_in = 8'd10;
    #10 addr = 4'd2;
    data_in = 8'd20;
    #10 addr = 4'd3;
    data_in = 8'd30;
    #10 we = 0;
    
    // Read data from RAM
    #10 addr = 4'd1;
    #10 $display("Data at address 1: %d", data_out);
    #10 addr = 4'd2;
    #10 $display("Data at address 2: %d", data_out);
    #10 addr = 4'd3;
    #10 $display("Data at address 3: %d", data_out);
    
    #100 $finish;
end

endmodule
