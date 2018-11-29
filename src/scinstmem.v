/* 
writer:liyiming 
date: 2018/11/14
version: 0.0
module: inst mem
func: storage the inst mem
*/
module scinstmem(
    a,
    inst
);
    input [31:0] a;
    output [31:0] inst;
    wire [31:0] rom [0:31];
    assign rom[5'h00] = 32'h3c010000;
    assign rom[5'h01] = 32'h34240050;
    assign rom[5'h02] = 32'h20050004;
    assign rom[5'h03] = 32'h0c000018;
    assign rom[5'h04] = 32'hac820000;
    assign rom[5'h05] = 32'h8c890000;
    assign rom[5'h06] = 32'h01244022;
    assign rom[5'h07] = 32'h20050003;
    assign rom[5'h08] = 32'h20a5ffff;
    assign rom[5'h09] = 32'h34a8ffff;
    assign rom[5'h0A] = 32'h39085555;
    assign rom[5'h0B] = 32'h2009ffff;
    assign rom[5'h0C] = 32'h312affff;
    assign rom[5'h0D] = 32'h01493025;
    assign rom[5'h0E] = 32'h01494026;
    assign rom[5'h0F] = 32'h01463824;
    assign rom[5'h10] = 32'h10a00001;
    assign rom[5'h11] = 32'h08000008;
    assign rom[5'h12] = 32'h2005ffff;
    assign rom[5'h13] = 32'h000543c0;
    assign rom[5'h14] = 32'h00084400;
    assign rom[5'h15] = 32'h00084403;
    assign rom[5'h16] = 32'h000843c2;
    assign rom[5'h17] = 32'h08000017;
    assign rom[5'h18] = 32'h00004020;
    assign rom[5'h19] = 32'h8c890000;
    assign rom[5'h1A] = 32'h20840004;
    assign rom[5'h1B] = 32'h01094020;
    assign rom[5'h1C] = 32'h20a5ffff;
    assign rom[5'h1D] = 32'h14a0fffb;
    assign rom[5'h1E] = 32'h00081000;
    assign rom[5'h1F] = 32'h03e00008;
    assign inst = rom[a[6:2]];
endmodule
