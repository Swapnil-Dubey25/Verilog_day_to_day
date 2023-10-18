`timescale 1ps/1ps
//`include "pipo.V"
module fifo_tb;
    reg clk, reset;
    reg [31:0] sequence;
    wire [31:0] ans_sequence;
PIPO pipo1(ans_sequence,sequence,clk,reset);

always #10 clk =~clk;


initial begin
    reset = 0;
    clk  = 0;
    #20 reset =1;
    #10 sequence = 32'hFFFFFFFA;
    #20 sequence = 32'hBBAFFFFF;
    $display("output sequence = %h",ans_sequence);

end

initial begin
    $dumpfile("pipo.vcd");
    $dumpvars();
    #100 $finish();
end
endmodule