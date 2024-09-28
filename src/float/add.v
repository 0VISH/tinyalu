module addf(s, a, b);

output [31:0] s;
input [31:0] a, b;

assign asign = a[31];
assign bsign = b[31];
reg [7:0]  aexp; 
reg [7:0]  bexp;
reg [22:0] amant;
reg [22:0] bmant;
reg [23:0] smant;    //allowing for carry
reg [7:0]  sexp;

integer i;
always @* begin
	//extracting exponent and mantissa
	aexp = a[30:23];
	bexp = b[30:23];
	amant = a[22:0];
	bmant = b[22:0];
	sexp = aexp;

	//aligning exponents
	if (aexp < bexp) begin
		amant = amant >> (aexp-bexp);
		sexp = bexp;
	end
	else if (bexp < aexp) begin
		bmant = bmant >> (bexp-aexp);
		sexp = aexp;
	end
	
	//check sign to decide add/sub and then
	//normalize result
	if(asign == bsign) begin
		smant = amant + bmant;
		//get the msb 1 pos so that we can normalize
		i = 21;
		while(amant[i] == 0 && bmant[i] == 0) begin
			i = i - 1;
		end

		if(smant[i+1] == 1) begin
			smant = smant >> 1;
			sexp = sexp + 1;
		end;
	end
	else if(asign == 0) begin
		smant = amant - bmant;
		i = 22;
		while(smant[i] == 0) begin
			smant = smant << 1;
			i = i - 1;
		end
	end
	else begin
		smant = bmant - amant;
		while(smant[i] == 0) begin
			smant = smant << 1;
			i = i - 1;
		end
	end
	
end

endmodule
