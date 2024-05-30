/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`timescale 1ns / 1ps
`include "sea_en.v"
`include "sea_de.v"
`include "sbox.v"
module  tt_um_example( ena,clk,li, ri, ki, lio, rio );
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

   assign nli = ena ? li : 48'b0;  // If ena is high, pass li, otherwise 48'b0
   assign nri = ena ? ri : 48'b0;  // If ena is high, pass ri, otherwise 48'b0
    sea_en x0(.clk(clk), .li(li), .ri(ri), .ki(ki), .nli(nli), .nri(nri));
   
    sea_de x1(.clk(clk), .nli(nli), .nri(nri), .ki(ki), .li(lio), .ri(rio));
  

endmodule
