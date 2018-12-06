/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module checkOut_4 (
    input clk,
    input rst,
    input [7:0] inb,
    input [7:0] inp,
    output reg out
  );
  
  
  
  reg [15:0] s;
  
  wire [16-1:0] M_alu_out;
  wire [1-1:0] M_alu_overflow;
  reg [16-1:0] M_alu_a;
  reg [16-1:0] M_alu_b;
  reg [6-1:0] M_alu_alufn;
  alu_3 alu (
    .a(M_alu_a),
    .b(M_alu_b),
    .alufn(M_alu_alufn),
    .out(M_alu_out),
    .overflow(M_alu_overflow)
  );
  
  always @* begin
    out = 1'h0;
    s = inb & inp;
    if (s != 16'h0000) begin
      out = 1'h1;
    end
    M_alu_a = inb;
    M_alu_b = 8'h00;
    M_alu_alufn = 17'h1adbb;
    if (M_alu_out) begin
      out = 1'h1;
    end
  end
endmodule