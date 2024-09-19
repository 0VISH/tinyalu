module ucomperator(grt, ls, eq, a, b);

output grt, ls, eq;
input [31:0] a, b;

assign grt = a > b;
assign ls = a < b;
assign eq = a == b;

endmodule

module scomperator(grt, ls, eq, a, b);

output grt, ls, eq;
input signed [31:0] a, b;

assign grt = $signed(a) > $signed(b);
assign ls = $signed(a) < $signed(b);
assign eq = $signed(a) == $signed(b);

endmodule

