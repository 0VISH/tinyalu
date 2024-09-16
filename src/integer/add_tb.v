`include "src/integer/add.v"

module test();

reg [31:0] a, b;
wire [31:0] sum;
wire c;

add adder(sum, c, a, b);

initial begin
    $monitor("%d + %d = %d(%d)", a, b, sum, c);
    a = 32'd5;
    b = 32'd5;
    #100;
    a = 32'd12;
    b = 32'd3;
    #100;
    $finish;
end

endmodule
