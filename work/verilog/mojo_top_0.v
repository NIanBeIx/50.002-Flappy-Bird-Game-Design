/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input buttonReset,
    input buttonUser,
    output reg [7:0] row,
    output reg [7:0] c_red,
    output reg [7:0] c_blue,
    output reg [7:0] c_green,
    output reg [7:0] c_redb,
    output reg [7:0] rowb,
    output reg redbug
  );
  
  
  
  reg rst;
  
  reg gameOverSig;
  
  reg restartSig;
  
  wire [8-1:0] M_display_c_red;
  wire [8-1:0] M_display_c_blue;
  wire [8-1:0] M_display_c_green;
  wire [8-1:0] M_display_row;
  reg [64-1:0] M_display_red;
  reg [64-1:0] M_display_blue;
  reg [64-1:0] M_display_green;
  display_1 display (
    .clk(clk),
    .rst(rst),
    .red(M_display_red),
    .blue(M_display_blue),
    .green(M_display_green),
    .c_red(M_display_c_red),
    .c_blue(M_display_c_blue),
    .c_green(M_display_c_green),
    .row(M_display_row)
  );
  
  wire [8-1:0] M_displayb_c_red;
  wire [8-1:0] M_displayb_c_blue;
  wire [8-1:0] M_displayb_c_green;
  wire [8-1:0] M_displayb_row;
  reg [64-1:0] M_displayb_red;
  reg [64-1:0] M_displayb_blue;
  reg [64-1:0] M_displayb_green;
  display_1 displayb (
    .clk(clk),
    .rst(rst),
    .red(M_displayb_red),
    .blue(M_displayb_blue),
    .green(M_displayb_green),
    .c_red(M_displayb_c_red),
    .c_blue(M_displayb_c_blue),
    .c_green(M_displayb_c_green),
    .row(M_displayb_row)
  );
  
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
  
  wire [1-1:0] M_checking_out;
  reg [1-1:0] M_checking_clk;
  reg [1-1:0] M_checking_rst;
  reg [8-1:0] M_checking_inb;
  reg [8-1:0] M_checking_inp;
  checkOut_4 checking (
    .clk(M_checking_clk),
    .rst(M_checking_rst),
    .inb(M_checking_inb),
    .inp(M_checking_inp),
    .out(M_checking_out)
  );
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_5 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_edge_detector_out;
  reg [1-1:0] M_edge_detector_in;
  edge_detector_6 edge_detector (
    .clk(clk),
    .in(M_edge_detector_in),
    .out(M_edge_detector_out)
  );
  localparam START_playingmode = 1'd0;
  localparam GAMEOVER_playingmode = 1'd1;
  
  reg M_playingmode_d, M_playingmode_q = START_playingmode;
  wire [1-1:0] M_ctr_value;
  counter_7 ctr (
    .clk(clk),
    .rst(rst),
    .value(M_ctr_value)
  );
  reg [0:0] M_second_clk_d, M_second_clk_q = 1'h0;
  reg [31:0] M_halfSecond_d, M_halfSecond_q = 1'h0;
  
  wire [1-1:0] M_slow_rst_out;
  reg [1-1:0] M_slow_rst_in;
  edge_detector_6 slow_rst (
    .clk(M_second_clk_q),
    .in(M_slow_rst_in),
    .out(M_slow_rst_out)
  );
  
  wire [1-1:0] M_displayedPattern_out;
  wire [64-1:0] M_displayedPattern_outred;
  wire [64-1:0] M_displayedPattern_outblue;
  wire [64-1:0] M_displayedPattern_outgreen;
  reg [1-1:0] M_displayedPattern_button;
  pattern_9 displayedPattern (
    .clk(clk),
    .rst(rst),
    .rst2(M_slow_rst_out),
    .clk2(M_second_clk_q),
    .button(M_displayedPattern_button),
    .out(M_displayedPattern_out),
    .outred(M_displayedPattern_outred),
    .outblue(M_displayedPattern_outblue),
    .outgreen(M_displayedPattern_outgreen)
  );
  
  wire [1-1:0] M_displayedPatternSecond_out;
  wire [64-1:0] M_displayedPatternSecond_outred;
  wire [64-1:0] M_displayedPatternSecond_outblue;
  wire [64-1:0] M_displayedPatternSecond_outgreen;
  reg [1-1:0] M_displayedPatternSecond_button;
  patternScreenSecond_10 displayedPatternSecond (
    .clk(clk),
    .rst(rst),
    .rst2(M_slow_rst_out),
    .clk2(M_second_clk_q),
    .button(M_displayedPatternSecond_button),
    .out(M_displayedPatternSecond_out),
    .outred(M_displayedPatternSecond_outred),
    .outblue(M_displayedPatternSecond_outblue),
    .outgreen(M_displayedPatternSecond_outgreen)
  );
  
  always @* begin
    M_playingmode_d = M_playingmode_q;
    M_halfSecond_d = M_halfSecond_q;
    M_second_clk_d = M_second_clk_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    M_alu_b = 1'h0;
    M_alu_a = 1'h0;
    M_alu_alufn = 1'h0;
    row = 8'h00;
    c_red = 8'h00;
    c_green = 8'h00;
    c_blue = 8'h00;
    rowb = 8'h00;
    c_redb = 8'h00;
    gameOverSig = 1'h0;
    restartSig = 1'h0;
    M_checking_rst = M_slow_rst_out;
    M_checking_clk = M_second_clk_q;
    M_checking_inb = 1'h1;
    M_checking_inp = 1'h0;
    M_display_red = M_displayedPattern_outred;
    M_display_blue = M_displayedPattern_outblue;
    M_display_green = M_displayedPattern_outgreen;
    M_displayb_red = M_displayedPatternSecond_outred;
    M_displayb_blue = M_displayedPatternSecond_outblue;
    M_displayb_green = M_displayedPatternSecond_outgreen;
    M_slow_rst_in = buttonReset;
    M_edge_detector_in = M_ctr_value;
    M_displayedPattern_button = buttonUser;
    M_displayedPatternSecond_button = buttonUser;
    redbug = 1'h1;
    
    case (M_playingmode_q)
      START_playingmode: begin
        M_display_red = M_displayedPattern_outred;
        M_display_blue = M_displayedPattern_outblue;
        M_display_green = M_displayedPattern_outgreen;
        M_displayb_red = M_displayedPatternSecond_outred;
        M_displayb_blue = M_displayedPatternSecond_outblue;
        M_displayb_green = M_displayedPatternSecond_outgreen;
        M_checking_rst = M_slow_rst_out;
        M_checking_clk = M_second_clk_q;
        M_checking_inp = M_displayedPattern_outblue[40+7-:8];
        M_checking_inb = M_displayedPattern_outred[40+7-:8];
        gameOverSig = M_checking_out;
        row = M_display_row;
        c_red = M_display_c_red;
        c_blue = M_display_c_blue;
        c_green = M_display_c_green;
        rowb = M_displayb_row;
        c_redb = M_displayb_c_blue;
        if (gameOverSig == 1'h1) begin
          M_playingmode_d = GAMEOVER_playingmode;
          gameOverSig = 1'h0;
        end
      end
      GAMEOVER_playingmode: begin
        if (buttonReset == 1'h1) begin
          restartSig = 1'h1;
        end
        led = 8'hff;
        row = 8'hff;
        c_red = 8'h00;
        c_green = 8'h00;
        c_blue = 8'h00;
        rowb = 8'hff;
        c_redb = 8'h00;
        if (restartSig == 1'h1) begin
          M_playingmode_d = START_playingmode;
          restartSig = 1'h0;
          gameOverSig = 1'h0;
        end
      end
    endcase
    led = 8'h00;
    M_halfSecond_d = M_halfSecond_q + 1'h1;
    if (M_halfSecond_q == 24'he4e1c0) begin
      M_halfSecond_d = 1'h0;
      M_second_clk_d = ~M_second_clk_q;
    end
  end
  
  always @(posedge clk) begin
    M_playingmode_q <= M_playingmode_d;
    
    if (rst == 1'b1) begin
      M_second_clk_q <= 1'h0;
      M_halfSecond_q <= 1'h0;
    end else begin
      M_second_clk_q <= M_second_clk_d;
      M_halfSecond_q <= M_halfSecond_d;
    end
  end
  
endmodule
