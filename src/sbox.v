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