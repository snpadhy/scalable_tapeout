/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`timescale 1ns / 1ps
`include "sea_en.v"
`include "sea_de.v"
`include "sbox.v"
module  tt_um_scalable( rst_n,ena,clk,li, ri, ki, lio, rio );
    input rst_n;
    input clk;
    input ena;
    input [47:0]  li ;
    input [47:0]  ri ;
    input [47:0]  ki ;
    output [47:0]  lio ;
    output [47:0]  rio ;


    wire [47:0] nli;
    wire [47:0] nri;
    wire [47:0] lio;
    wire [47:0] rio;

    assign nli = (rst_n == 1'b0) ? 48'b0 : (ena ? li : nli);  // Reset nli to 48'b0 when rstn is active low, otherwise pass li or keep nli unchanged
    assign nri = (rst_n == 1'b0) ? 48'b0 : (ena ? ri : nri);  // Reset nri to 48'b0 when rstn is active low, otherwise pass ri or keep nri unchanged
    sea_en x0(.clk(clk), .li(li), .ri(ri), .ki(ki), .nli(nli), .nri(nri));
   
    sea_de x1(.clk(clk), .nli(nli), .nri(nri), .ki(ki), .li(lio), .ri(rio));
  

endmodule
