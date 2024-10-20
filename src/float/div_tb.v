`include "src/float/div.v"

module tb();

wire [31:0] s;
reg [31:0] a, b;

divf df(s, a, b);

initial begin
$monitor("%b %b %b %b\n", df.smant, df.sexp, df.amant, df.bmant);
//6, 3
a = 32'b01000000110000000000000000000000;
b = 32'b01000000010000000000000000000000;
#100;
//6.1, 3
a = 32'b01000000110000110011001100110011;
b = 32'b01000000010000000000000000000000;
#100;
$finish;
end

endmodule