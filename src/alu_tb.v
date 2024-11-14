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

/*
//unsigned-int
initial begin
    $display("instr[4:0]\ta\tb\ts\tze");
    $monitor("%b\t%d\t%d\t%d\t%b", instruction[4:0], a, b, s, ze);

    a = 32'd5;
    b = 32'd2;
    $display("5 , 2");
    instruction = 32'b00000;        //7
    #100;
    instruction = 32'b00001;        //3
    #100;
    instruction = 32'b00011;        //10
    #100;
    instruction = 32'b00111;        //2.5 => 2
    #100;
    instruction = 32'b00110;
    #100;
    instruction = 32'b00100;
    #100;
    instruction = 32'b00101;
    #100;
    $finish;
end
*/
/*
//signed-int
initial begin
    $display("instr[4:0]\ta\tb\ts\tze");
    $monitor("%b\t%d\t%d\t%d\t%b", instruction[4:0], sa, sb, ss, ze);

    a = -32'd5;
    b = -32'd2;
    $display("-5 , -2");
    instruction = 32'b10000;        //-7
    #100;
    instruction = 32'b10001;        //-3
    #100;
    instruction = 32'b10011;        //10
    #100;
    instruction = 32'b10111;        //2.5 => 2
    #100;
    instruction = 32'b10110;
    #100;
    instruction = 32'b10100;
    #100;
    instruction = 32'b10101;
    #100;
    $finish;
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
    $display("3.2 , -1.3");
    #100;
    $display("00111111111100110011001100110011");      //1.9
    instruction = 32'bx1001;
    #100;
    $display("01000000100100000000000000000000");      //4.5
    instruction = 32'bx1011;
    #100;
    $display("11000000100001010001111010111000");     //-4.16
    instruction = 32'bx1111;
    #100;
    $display("11000000000111011000100111011001");     //-2.46153
    instruction = 32'bx1110;
    #100;
    instruction = 32'bx1100;
    #100;
    instruction = 32'bx1101;
    #100;
    a = 32'b00111111000000000000000000000000;
    b = 32'b00111111000000000000000000000000;
    instruction = 32'bx1000;
    $display("0.5 , 0.5");
    #100;
    $display("00111111100000000000000000000000");      //1
    instruction = 32'bx1001;
    #100;
    $display("00000000000000000000000000000000");       //0
    instruction = 32'bx1011;
    #100;
    $display("00111110100000000000000000000000");      //0.25
    instruction = 32'bx1111;
    #100;
    $display("00111111100000000000000000000000");      //1
    instruction = 32'bx1110;
    #100;
    instruction = 32'bx1100;
    #100;
    instruction = 32'bx1101;
    #100;
    a = 32'b01000001010110000000000000000000;
    b = 32'b11000001101010000000000000000000;
    instruction = 32'bx1000;
    $display("13.5 , -21");
    #100;
    $display("11000000111100000000000000000000");       //-7.5
    instruction = 32'bx1001;
    #100;
    $display("01000010000010100000000000000000");       //34.5
    instruction = 32'bx1011;
    #100;
    $display("11000011100011011100000000000000");       //-283.5
    instruction = 32'bx1111;
    #100;
    $display("10111111001001001001001001001001");       //-0.64285
    instruction = 32'bx1110;
    #100;
    instruction = 32'bx1100;
    #100;
    instruction = 32'bx1101;
    #100;
    $finish;
end


endmodule