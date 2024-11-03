`include "src/alu.v"

module alu_tb();

reg [31:0] a, b, instruction;
wire ze;
wire [31:0] s;
ALU talu(s, ze, a, b, instruction);

reg signed [31:0] sa, sb, ss;

always @(*) begin
    sa = $signed(a);
    sb = $signed(b);
    ss = $signed(s);
end

initial begin

    $display("instr[4:0]\ta\tb\ts\tze");
    $monitor("%b\t%d(%d)\t%d(%d)\t%d(%d)\t%b", instruction[4:0], a, sa, b, sb, s, ss, ze);

    a = -32'd5;
    b = -32'd2;
    instruction = 32'b10000;
    #100;
    instruction = 32'b10001;
    #100;
    instruction = 32'b10011;
    #100;
    instruction = 32'b10111;
    #100;
    instruction = 32'b10110;
    #100;
    instruction = 32'b10100;
    #100;
    instruction = 32'b10101;
end

endmodule