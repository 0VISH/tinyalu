module udiv(s, dz, a, b);

output [31:0] s;
output dz;
input [31:0] a, b;

assign dz = ~(|b);
assign s = a/b;

endmodule

module sdiv(s, dz, a, b);

output signed [31:0] s;
output dz;
input signed [31:0] a, b;

assign dz = ~(|b);
assign s = $signed(a)/$signed(b);

endmodule
