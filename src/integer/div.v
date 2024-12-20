module udiv(s, dz, a, b);

output [31:0] s;
output dz;
input [31:0] a, b;

assign dz = ~(|b[30:0]);
assign s = a/b;

endmodule

module sdiv(s, ze, a, b);

output signed [31:0] s;
output ze;
input signed [31:0] a, b;

assign ze = ~(|b[30:0]);
assign s = $signed(a)/$signed(b);

endmodule
