module compf(s, a, b, inst);

output reg s;
input [31:0] a, b;
input [2:0] inst;

reg g, e, l;

always @(*) begin
    g = 0;
    e = 0;
    l = 0;
    if(a[31:0] == b[31:0] && a[31:0] == 0) e = 0;
    else if(a[32] == 0 && b[32] == 1) g = 1;
    else if(a[32] == 1 && b[32] == 0) l = 1;
    else if(a[30:23] > b[30:23]) g = 1;
    else if(a[30:23] < b[30:23]) l = 1;
    else if(a[22:0] > b[22:0]) g = 1;
    else if(a[22:0] < b[22:0]) l = 1;
    else e = 1;
    
    case (inst)
        3'b110: s = g;
        3'b100: s = e;
        3'b101: s = l;
    endcase
end
    
endmodule