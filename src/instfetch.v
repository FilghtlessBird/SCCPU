/* 
writer:liyiming 
date: 2018/11/13
version: 0.0
module: instfetch
func: fetch
*/
module pc(
    pc_i,
    pc_o,
    clk
)
    input [31:0] pc_i;
    input clk;
    output pc_o;
    always @(posedg clk) begin
        pc_o<=pc_i;
    end
endmodule