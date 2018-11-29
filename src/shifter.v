/* 
writer:liyiming 
date: 2018/11/14
version: 0.0
module: shift
func: shift operation
*/
module shifter(
    d,
    sa,
    right,
    arith,
    sh
);
    input [31:0]d;
    input [4:0]sa;
    input right,arith;
    output [31:0]sh;
    reg [31:0] sh;
    always @(*) begin
        if(!right)begin
            sh = d << sa;
        end else if (!arith) begin
            sh = d >> sa;
        end else begin
            sh = $signed(d)>>>sa;
        end
    end
endmodule