module subf(s, a, b);

output reg [31:0] s;
input [31:0] a, b;

assign asign = a[31];
assign bsign = ~b[31];
reg ssign;
reg [7:0]  aexp; 
reg [7:0]  bexp;
reg [23:0] amant;
reg [23:0] bmant;
reg [24:0] smant;
reg [7:0]  sexp;

integer i;
reg d;
always @* begin
	//extracting exponent and mantissa
	aexp = a[30:23];
	bexp = b[30:23];
	amant[22:0] = a[22:0];
	bmant[22:0] = b[22:0];
	sexp = aexp;

	//apending implicit 1
	amant[23] = 1;
	bmant[23] = 1;
	//aligning exponents
	if (aexp < bexp) begin
		amant = amant >> (bexp-aexp);
		sexp = bexp;
	end
	else if (bexp < aexp) begin
		bmant = bmant >> (aexp-bexp);
		sexp = aexp;
	end
	
	//check sign to decide add/sub
	if(asign == bsign) begin
		ssign = asign;
		smant = amant + bmant;
	end
	else if(amant > bmant) begin
		ssign = asign;
		smant = amant - bmant;
	end
	else if(bmant > amant) begin
		ssign = bsign;
		smant = bmant - amant;
	end
	else begin
		//same number but different signs. Therefore, the answer is
		smant = 0;
		ssign = 0;
		sexp  = 0;
	end
	//normalizing
	if(smant[24] == 1) begin
		/*
			the part before decimal can be: 1, 10, 11
			if 10,11 then the answer is not normalized.
			we increment the exponent by 1, and shift left,
			considering the msb 1 in 10,11 as implicit 1.
		*/
		sexp = sexp + 1;
	end else begin
		//remove leading 0
		i = 23;
		while(smant[i] == 0) begin
			i = i - 1;
		end
		//shift till we get 1 at msb(shifting the decimal)
		smant = smant << (23 - i);
		//drop the implicit 1
		smant = smant << 1;
	end
	s = {ssign, sexp, smant[23:1]};  //consider only 23 bits
end;

endmodule