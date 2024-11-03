module fullAdder(s, cout, a, b, c);

output s, cout;
input a,b,c;

assign s = a ^ b ^ c;
assign cout = a&b | c&(a^b);

endmodule

module uadd(s, a, b);

output [31:0] s;
output c;
input [31:0] a, b;
wire [31:0] carry;

fullAdder fa0(s[0], carry[0], a[0], b[0], 1'd0);

genvar i;
generate
    for(i=1; i<32; i=i+1) begin
        fullAdder fa(s[i], carry[i], a[i], b[i], carry[i-1]);
    end
endgenerate

endmodule

module sadd(s, a, b);

output signed [31:0] s;
input signed [31:0] a, b;

assign s = $signed(a) + $signed(b);

endmodule