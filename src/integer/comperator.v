module ucomp(s, a, b, inst);

output reg s;
input [31:0] a, b;
input [2:0] inst;

always @(*) begin
    case (inst)
        3'b110: s = a > b;
        3'b100: s = a == b;
        3'b101: s = a < b;
    endcase
end

endmodule

module scomp(s, a, b, inst);

output reg s;
input signed [31:0] a, b;
input signed [2:0] inst;

always @(*) begin
    case (inst)
        3'b110: s = $signed(a) > $signed(b);
        3'b100: s = $signed(a) == $signed(b);
        3'b101: s = $signed(a) < $signed(b);
    endcase
end

endmodule