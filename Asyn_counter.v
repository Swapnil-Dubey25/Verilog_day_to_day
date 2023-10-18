//defination of module for J-K FLIP FLOP.
module j_k (
    q,qbar,j,k,reset,clk
);
input j,k,reset,clk;
output reg q,qbar;

initial begin
     qbar = ~q;
end

always @(posedge clk or negedge reset) begin
    if (!reset) begin
    q<=0;
    end
    else begin
    qbar<=1;
    case({j,k})
        2'b00: q<=q;
        2'b10: q<=1;
        2'b01: q<=0;
        2'b11: q<=~q;
    endcase
    end
end
endmodule

module updown_selector (
    input up,q,qbar,
    output nxt_clk);

assign nxt_clk = up?q:qbar;
    
endmodule

module asn_counter #(parameter SIZE=4)(
    input clk,reset,j,k,
    input up,
    output [3:0] q,qbar
);
wire [3:0] nxt_clk;
genvar g;
j_k jk0(q[0],qbar[0],j,k,reset,clk);
generate
    for (g = 1; g<SIZE ; g=g+1) begin
        updown_selector up1(up,q[g-1],qbar[g-1],nxt_clk[g-1]);
        j_k jk(q[g],qbar[g],j,k,reset,nxt_clk[g-1]);
    end
endgenerate
endmodule