module SIPO (
    out_po_sequence,input_si_sequence,clk,load,reset
);
input [1:0] input_si_sequence;
input clk,reset,load;
output reg [7:0 ] out_po_sequence;

reg [7:0] out_reg_sequence ;
 
 initial begin
    out_po_sequence = 0;    
 end

always @(posedge clk or negedge reset) begin
    if(!reset)
    out_reg_sequence <= 32'b0;
    else if (load)
    out_reg_sequence = {input_si_sequence,out_po_sequence[5:0]};
    end
initial begin
      out_po_sequence = out_reg_sequence;
end 
endmodule