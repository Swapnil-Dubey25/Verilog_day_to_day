`timescale 1ps/1ps
//`include "sipo.v"
module sipo_tb;
 reg clk,reset,load;
 wire [7:0] out_po_sequence;
 reg [1:0] input_si_sequence;

always #5 clk = ~clk;

SIPO SP (out_po_sequence,input_si_sequence,clk,load,reset);

initial begin
    clk = 0; reset = 0; load = 0; input_si_sequence = 2'b00; 
    #10
    reset =1;
    #15 load = 1'b1; input_si_sequence = 2'b01;
    #10 load = 1'b1; input_si_sequence = 2'b10;
    #10 load = 1'b1; input_si_sequence = 2'b00;
    $display("output = %o", out_po_sequence);
    end

initial begin
    $dumpfile("sipodump.vcd");
    $dumpvars();
    #100 $finish();
end
endmodule