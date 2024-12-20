module divf(s, ze, a, b);

output reg [31:0] s;
output ze;
input [31:0] a, b;

assign asign = a[31];
assign bsign = b[31];
assign ssign = asign ^ bsign; 
assign ze = ~(|b[30:0]);   //ignoring the sign
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

	//sexp = ((E1-127) - (E2-127)) + 127
	sexp = aexp - bexp + 127;
	//shifting amant to increase accuracy. By 23 because mant is 23 bits.
	tempmant = (amant << 23) / bmant;
	//capturing the lower bits inorder to scale it back
	smant = tempmant[24:0];
	if(smant != 0)begin
		//normalize
		i = 23;
		while(smant[i] == 0) begin
			i = i - 1;
		end
		//shift till we get 1 at msb(shifting the decimal: step 1)
		smant = smant << (23 - i);
		//reduce exponent by the same amount(shifting the decimal: step 2)
		sexp = sexp - (23 - i);
		//drop the implicit 1
		smant = smant << 1;
	end
	s = {ssign, sexp, smant[23:1]};
end

endmodule
