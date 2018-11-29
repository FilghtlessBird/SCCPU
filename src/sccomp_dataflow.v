/* 
writer:liyiming 
date: 2018/11/14
version: 0.0
module: sccomp_dataflow
func: simple soc
*/
module sccomp_dataflow(    
    clock,
    resetn,
    mem_clk,
    inst,
    pc,
    aluout,
    memout
);
    input clock,resetn,mem_clk;
    output [31:0] inst,pc,aluout,memout;
    wire [31:0] data;
    wire wmem;
    sccpu_dataflow s (clock,resetn,inst,memout,pc,wmem,aluout,data);
    scinstmem imem (pc,inst);
    scdatamem dmem (clock,memout,data,aluout,wmem,mem_clk,mem_clk);
endmodule