/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module compare_15 (
    input [1:0] alufn21,
    input z,
    input v,
    input n,
    output reg [15:0] out
  );
  
  
  
  always @* begin
    
    case (alufn21)
      2'h1: begin
        out[0+0-:1] = z;
      end
      2'h2: begin
        out[0+0-:1] = n ^ v;
      end
      2'h3: begin
        out[0+0-:1] = z | (n ^ v);
      end
      default: begin
        out[0+0-:1] = z;
      end
    endcase
    out[1+14-:15] = 15'h0000;
  end
endmodule
