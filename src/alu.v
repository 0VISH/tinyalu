`include "src/integer/add.v"
`include "src/integer/sub.v"
`include "src/integer/mul.v"
`include "src/integer/div.v"
`include "src/integer/comperator.v"

module ALU(s, ze, a, b, instruction);

output reg ze;
output reg [31:0] s;
input  [31:0] a, b, instruction;

wire [2:0] op = instruction[2:0];
wire isFloat = instruction[3];
wire isSigned = instruction[4];

wire [31:0] addUOut, addSOut;
uadd addUInt(addUOut, a, b);
sadd addSInt(addSOut, a, b);

wire [31:0] subUOut, subSOut;
usub subUInt(subUOut, a, b);
ssub subSInt(subSOut, a, b);

wire [31:0] mulUOut, mulSOut;
umul mulUInt(mulUOut, a, b);
smul mulSInt(mulSOut, a, b);

wire [31:0] divUOut, divSOut;
wire zeOut;
udiv divUInt(divUOut, zeOut, a, b);
sdiv divSInt(divSOut, zeOut, a, b);

wire compUOut, compSOut;
ucomp compUInt(compUOut, a, b, op);
scomp compSInt(compSOut, a, b, op);

always @(*) begin
    ze = 0;
    if(isFloat == 0 && isSigned == 0)begin
        case (op)
            3'b000: s = addUOut;
            3'b001: s = subUOut;
            3'b011: s = mulUOut;
            3'b111: begin
                s = divUOut;
                ze=zeOut;
            end
            3'b110: s = compUOut;
            3'b100: s = compUOut;
            3'b101: s = compUOut;
        endcase
    end else if(isFloat == 0) begin
        case (op)
            3'b000: s = addSOut;
            3'b001: s = subSOut;
            3'b011: s = mulSOut;
            3'b111: begin
                s = divSOut;
                ze=zeOut;
            end
            3'b110: s = compSOut;
            3'b100: s = compSOut;
            3'b101: s = compSOut;
        endcase
    end
end

endmodule