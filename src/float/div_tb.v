`include "src/float/div.v"

module tb();

wire [31:0] s;
reg [31:0] a, b;

divf df(s, a, b);

initial begin
$monitor("%b %b\n", df.sexp, df.smant);
//-3, 15.5
a = 32'b11000000010000000000000000000000;
b = 32'b01000001011110000000000000000000;
#100;
$finish;
end

endmodule