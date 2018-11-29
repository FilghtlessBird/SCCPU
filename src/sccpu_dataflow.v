/* 
writer:liyiming 
date: 2018/11/13
version: 0.0
module: cpu
func: 数据流实现的cpu
*/
module sccpu_dataflow (
    clock,
    resetn,
    inst,
    mem,
    pc,
    wmem,
    alu,
    data
);
    input [31:0]inst,mem;
    input clock,resetn;
    output [31:0]pc,alu,data;
    output wmem;

    wire [31:0] p4,bpc,npc,adr,ra,alua,alub,res,alu_mem;
    wire [3:0] aluc;
    wire [4:0] reg_dest,wn;
    wire [1:0] pcsource;
    wire zero,wmem,wreg,regrt,m2reg,shift,aluimm,jal,sext;
    wire [31:0] sa = {27'b0,inst[10:6]};
    wire [31:0] offset = {imm[13:0],inst[15:0],2'b00};

    clu clu0 (inst[31:26],inst[5:0],zero,wmem,wreg,regrt,m2reg,aluc,shift,aluimm,pcsource,jal,sext);

    wire e = sext & inst[15];
    wire [15:0] imm = {16{e}};
    wire [31:0] immediate = {imm,inst[15:0]};
    dff32 ip (npc,clock,resetn,pc);//inst fetch
    cla32 pcplus4 (pc,32'h4,1'b0,p4 );//pc = pc+4
    cla32 br_adr (p4,offset,1'b0,adr);//pc = pc+offest
    wire [31:0] jpc = {pc[31:28],inst[25:0],2'b00};//jumped pc = pc[31:28]+inst[25:0]+2'b00
    mux2x32 alu_b (data,immediate,aluimm,alub);//decide what is the alu_b
    mux2x32 alu_a (ra,sa,shift,alua);//decide what is the alu_a
    mux2x32 result (alu,mem,m2reg,alu_mem);//decide the result of the inst
    mux2x32 link (alu_mem,p4,jal,res);//
    mux2x5 reg_wn (inst[15:11],inst[20:16],regrt,reg_dest);//choce the reg_addr
    assign wn = reg_dest|{5{jal}};//jal : r31<-- p4;
    mux4x32 nextpc (p4,adr,ra,jpc,pcsource,npc);//decide the source of the next pc
    regfile rf (inst[25:21],inst[20:16],res,wn,wreg,clock,resetn,ra,data);
    alu al_unit (alua,alub,aluc,alu,zero);//alu
endmodule