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

//int
/*
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
*/
//float
initial begin
    $display("instr[4:0]\ta\tb\ts\tze");
    $monitor("%b\t%b\t%b\t%b\t%b", instruction[4:0], a, b, s, ze);

    //3.2, -1.3
    a = 32'b01000000010011001100110011001101;
    b = 32'b10111111101001100110011001100110;
    instruction = 32'bx1000;
    #100;
    $display("00111111111100110011001100110011");
    instruction = 32'bx1001;
    #100;
    $display("01000000100100000000000000000000");
    instruction = 32'bx1011;
    #100;
    $display("11000000100001010001111010111000");
    instruction = 32'bx1111;
    #100;
    $display("11000000000111011000100111011001");
    instruction = 32'bx1110;
    #100;
    instruction = 32'bx1100;
    #100;
    instruction = 32'bx1101;
end

endmodule