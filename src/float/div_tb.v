`include "src/float/div.v"

module tb();

wire [31:0] s;
reg [31:0] a, b;

divf df(s, a, b);

initial begin
$monitor("%b %b %b\n", df.tempmant, df.amant, df.bmant);
//1, 5
a = 32'b00111111100000000000000000000000;
b = 32'b01000000101000000000000000000000;
#100;
a = 32'b01000000000100110011001100110011;
b = 32'b11000000000100110011001100110011;
#100;
$finish;
end

endmodule