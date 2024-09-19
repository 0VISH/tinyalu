`include "src/integer/div.v"

module test();

reg [31:0] a, b;
wire [31:0] s;
wire signed [31:0] ss;
wire dz, sdz;
reg signed [31:0] as, bs;

udiv udivider(s, dz, a, b);
sdiv sdivider(ss, sdz, as, bs);

initial begin
    $monitor("U: %d / %d = %d,%d\nS: %d / %d = %d,%d\n", a, b , s, dz, as, bs, ss, sdz);
    a = 5;
    b = 0;
    as = 5;
    bs = 5;
    #100;
    a = 11;
    b = 5;
    as = -10;
    bs = 5;
    #100;
end

endmodule
