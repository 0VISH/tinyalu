`include "src/integer/mul.v"

module mul_tb();

reg [31:0] a, b;
wire [31:0] s;
wire signed [31:0] ss;
reg signed [31:0] as, bs;

umul umultiplier(s, a, b);
smul imultiplier(ss, as, bs);

initial begin
    $monitor("U: %d * %d = %d\nS: %d * %d = %d\n", a, b, s, as, bs, ss);
    a = 5;
    b = 6;
    as = 5;
    bs = 6;
    #100;
    a = 2;
    b = 8;
    as = -2;
    bs = 8;
    #100;
    a = 5;
    b = 5;
    as = -5;
    bs = -5;
    #100;
    $finish;
end

endmodule
