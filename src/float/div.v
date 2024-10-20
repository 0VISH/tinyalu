module divf(s, a, b);

output [31:0] s;
input [31:0] a, b;

assign asign = a[31];
assign bsign = b[31];
assign ssign = asign ^ bsign; 
reg [7:0]  aexp; 
reg [7:0]  bexp;
reg [23:0] amant;
reg [23:0] bmant;
reg [23:0] smant;
reg [7:0]  sexp;
reg [47:0] tempmant;

integer i;
always @* begin
	//extracting exponent and mantissa
	aexp = a[30:23];
	bexp = b[30:23];
	amant[22:0] = a[22:0];
	bmant[22:0] = b[22:0];

	//apending implicit 1
	amant[23] = 1;
	bmant[23] = 1;

	//sexp = ((E1-127) + (E2-127)) + 127
	sexp = aexp - bexp + 127;
	tempmant = amant / bmant;
	smant = tempmant[47:24];
end

endmodule
