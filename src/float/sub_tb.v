`include "src/float/sub.v"

module tb();

wire [31:0] s;
reg [31:0] a, b;

subf sf(s, a, b);

initial begin
$monitor("%b %b %b %b\n", sf.ssign, sf.sexp, sf.smant, s);
//3.2. -1.3
a = 32'b01000000010011001100110011001101;
b = 32'b10111111101001100110011001100110;
#100;
$finish;
end

endmodule
