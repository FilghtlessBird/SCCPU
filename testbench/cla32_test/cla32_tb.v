`timescale 1ns/100ps
`include "../../src/cla32.v"
module test_tb;

   reg [31:0]A,B;
   reg ci;
   wire co;
   wire [31:0]s;
   cla32 cla32(A, B,ci,s,co);

   initial begin
      $dumpfile("cla32_test.vcd");
      $dumpvars;
   end
   initial begin
       ci = 1'b0;
       #0 A = 1;B = 1;
       #5 A = 2;B = 2;
       #10 A = 'h4;B = 'h4;
       #20 $finish;
   end

endmodule