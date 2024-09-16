module umul(s, a, b);

output [31:0] s;
input [31:0] a, b;

assign s = a * b;

endmodule

module smul(s, a, b);

output signed [31:0] s;
input signed [31:0] a, b;

assign s = $signed(a) * $signed(b);

endmodule
