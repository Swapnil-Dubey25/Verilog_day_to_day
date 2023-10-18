module PIPO (
    ans_sequence,sequence,clk,reset
);
    input [31:0] sequence;
    input clk;
    input reset;
    output reg [31:0] ans_sequence;

    always @(reset) begin
        if(!reset)
        begin
         ans_sequence = 32'b0;   
        end
    end
        always @(posedge clk) begin
            ans_sequence [31:0] <= sequence[31:0];
        end
    
endmodule