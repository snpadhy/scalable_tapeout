/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module  tt_um_example( li, ri, ki, lio, rio );
    input [47:0]  li ;
    input [47:0]  ri ;
    input [47:0]  ki ;
    output [47:0]  lio ;
    output [47:0]  rio ;


    wire [47:0] nli;
    wire [47:0] nri;
    wire [47:0] lio;
    wire [47:0] rio;


    
   sea_en x0(.li(li), .ri(ri), .ki(ki), .nli(nli), .nri(nri));
   
   sea_de x1(.nli(nli), .nri(nri), .ki(ki), .li(lio), .ri(rio));
    

endmodule
module  sea_en ( li, ri, ki, nli, nri );
    
    input [47:0]  li ;
    input [47:0]  ri ;
    input [47:0]  ki ;
    output [47:0]  nli ;
    output [47:0]  nri ;


    wire [47:0] r;
    wire [47:0] xo;
    wire [47:0] ro;
    wire [47:0] s;
    wire [47:0] m;
    wire [47:0] nr;
    wire [47:0] nli;
    wire [47:0] nri;


    
   assign {r[47:0]}={li[7:0],li[47:8]};
   
   assign {m[47:0]}=(ri[47:0] ^ ki[47:0]);
   
   sbox x0(.a(m[2:0]), .b(s[2:0]));
   
   sbox x1(.a(m[5:3]), .b(s[5:3]));
   
   sbox x2(.a(m[8:6]), .b(s[8:6]));
   
   sbox x3(.a(m[11:9]), .b(s[11:9]));
   
   sbox x4(.a(m[14:12]), .b(s[14:12]));
   
   sbox x5(.a(m[17:15]), .b(s[17:15]));
   
   sbox x6(.a(m[20:18]), .b(s[20:18]));
   
   sbox x7(.a(m[23:21]), .b(s[23:21]));
   
   sbox x8(.a(m[26:24]), .b(s[26:24]));
   
   sbox x9(.a(m[29:27]), .b(s[29:27]));
   
   sbox x10(.a(m[32:30]), .b(s[32:30]));
   
   sbox x11(.a(m[35:33]), .b(s[35:33]));
   
   sbox x12(.a(m[38:36]), .b(s[38:36]));
   
   sbox x13(.a(m[41:39]), .b(s[41:39]));
   
   sbox x14(.a(m[44:42]), .b(s[44:42]));
   
   sbox x15(.a(m[47:45]), .b(s[47:45]));
   
   assign {ro[47:0]}={s[46:0],s[47]};
   
   assign {xo[47:0]}=(ro[47:0] ^ r[47:0]);
   
   assign {nri[47:0]}=xo[47:0];
   
   assign {nli[47:0]}=ri[47:0];
    

endmodule
module  sbox ( a, b );
    
    input [2:0]  a ;
    output [2:0]  b ;


    reg [2:0] b;


    
       
   always @ (a ) // begin 
           case (a)
               3'b000 : 
                       b <= 3'b000;
               3'b001 : 
                       b <= 3'b101;
               3'b010 : 
                       b <= 3'b110;
               3'b011 : 
                       b <= 3'b111;
               3'b100 : 
                       b <= 3'b100;
               3'b101 : 
                       b <= 3'b011;
               3'b110 : 
                       b <= 3'b001;
               default : 
                       b <= 3'b010;
           endcase
   // end always 
    

endmodule
module  sea_de (nli, nri, ki, li, ri );
    input [47:0]  nli ;
    input [47:0]  nri ;
    input [47:0]  ki ;
    output [47:0]  li ;
    output [47:0]  ri ;


    wire [47:0] xo;
    wire [47:0] ro;
    wire [47:0] s;
    wire [47:0] m;
    wire [47:0] nr;
    wire [47:0] li;
    wire [47:0] ri;


    
   assign {m[47:0]}=(nli[47:0] ^ ki);
   
   sbox x0(.a(m[2:0]), .b(s[2:0]));
   
   sbox x1(.a(m[5:3]), .b(s[5:3]));
   
   sbox x2(.a(m[8:6]), .b(s[8:6]));
   
   sbox x3(.a(m[11:9]), .b(s[11:9]));
   
   sbox x4(.a(m[14:12]), .b(s[14:12]));
   
   sbox x5(.a(m[17:15]), .b(s[17:15]));
   
   sbox x6(.a(m[20:18]), .b(s[20:18]));
   
   sbox x7(.a(m[23:21]), .b(s[23:21]));
   
   sbox x8(.a(m[26:24]), .b(s[26:24]));
   
   sbox x9(.a(m[29:27]), .b(s[29:27]));
   
   sbox x10(.a(m[32:30]), .b(s[32:30]));
   
   sbox x11(.a(m[35:33]), .b(s[35:33]));
   
   sbox x12(.a(m[38:36]), .b(s[38:36]));
   
   sbox x13(.a(m[41:39]), .b(s[41:39]));
   
   sbox x14(.a(m[44:42]), .b(s[44:42]));
   
   sbox x15(.a(m[47:45]), .b(s[47:45]));
   
   assign {ro[47:0]}={s[46:0],s[47]};
   
   assign {xo[47:0]}=(ro[47:0] ^ nri[47:0]);
   
   assign {nr[47:0]}={xo[39:0],xo[47:40]};
   
   assign {li[47:0]}=nr[47:0];
   
   assign {ri[47:0]}=nli[47:0];
    

endmodule
