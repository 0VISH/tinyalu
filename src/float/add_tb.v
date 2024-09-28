`include "src/float/add.v"

module tb();

wire [31:0] s;
reg [31:0] a, b;

addf af(s, a, b);

initial begin
$monitor("%b %b %b %b\n", af.smant, af.sexp, af.amant, af.bmant);
//2.3
a = 32'b01000000000100110011001100110011;
b = 32'b01000000000100110011001100110011;
#100;
$finish;
end

endmodule
