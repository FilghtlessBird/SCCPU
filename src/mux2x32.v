/* 
writer:liyiming 
date: 2018/11/13
version: 0.0
module: mux
func: 32位2选1多路器
*/
module mux2x32(
    a0,
    a1,
    s,
    y
);
    input [31:0]a0,a1;
    input s;
    output [31:0]y;
    assign y = s? a1 : a0;
endmodule