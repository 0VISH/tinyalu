module addf(s, a, b);

output [31:0] s;
input [31:0] a, b;

assign asign = a[31];
assign bsign = b[31];
reg ssign;
reg [7:0]  aexp; 
reg [7:0]  bexp;
reg [23:0] amant;
reg [23:0] bmant;
reg [23:0] smant;
reg [7:0]  sexp;

integer i;
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
	
	//check sign to decide add/sub and then
	//normalize result
	if(asign == bsign) begin
		ssign = asign;
		smant = amant + bmant;
		//get the msb 1 pos so that we can normalize
		i = 23;
		while(amant[i] == 0 && bmant[i] == 0) begin
			i = i - 1;
		end

		if(smant[i+1] == 1) begin
			smant = smant >> 1;
			sexp = sexp + 1;
		end;
	end
	else if(amant > bmant) begin
		ssign = asign;
		smant = amant - bmant;
		i = 22;
		while(smant[i] == 0) begin
			smant = smant << 1;
			i = i - 1;
		end
	end
	else begin
		ssign = bsign;
		smant = bmant - amant;
		while(smant[i] == 0) begin
			smant = smant << 1;
			i = i - 1;
		end
	end
end

endmodule
