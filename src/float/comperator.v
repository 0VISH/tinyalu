module compf(s, a, b, inst);

output reg s;
input [31:0] a, b;
input [2:0] inst;

reg g, e, l;

always @(*) begin
    g = 0;
    e = 0;
    l = 0;
    if(a[30:0] == b[30:0] && a[30:0] == 0) e = 1;   //ignoring sign, check if exp and mant = 0
    else if(a[31] == 0 && b[31] == 1) g = 1;        //check sign
    else if(a[31] == 1 && b[31] == 0) l = 1;        //check sign
    else if(a[30:23] > b[30:23]) g = 1;             //check exp(we can do this because of bias)
    else if(a[30:23] < b[30:23]) l = 1;             //check exp(we can do this because of bias)
    else if(a[22:0] > b[22:0]) g = 1;               //check mant
    else if(a[22:0] < b[22:0]) l = 1;               //check mant
    else e = 1;                                     //equal
    
    case (inst)
        3'b110: s = g;
        3'b100: s = e;
        3'b101: s = l;
    endcase
end
    
endmodule