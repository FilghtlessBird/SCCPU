/* 
writer:liyiming 
date: 2018/11/13
version: 0.0
module: dff
func: 带有异步触发的D触发器
*/
module dff32(
    d,
    clk,
    rst,
    q
);
    input [31:0]d;
    input clk,rst;
    output [31:0]q;
    reg [31:0]q;
    always @(posedge clk, posedge rst) begin
        if(rst == 0) q<=0;
        else q<=d;
    end
endmodule