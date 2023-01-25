`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:24:10 01/24/2023 
// Design Name: 
// Module Name:    SecondPart 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module SecondPart(
    input [7:0] inp,
    output reg [7:0] out);

reg [5:0] X1, X2, X_MSB;
reg [7:0] F1, F2;
reg [1:0] X_LSB;
integer index;

reg [7:0] LUT_Table [0:255];
reg [7:0] LUT64Slut [0:63];

initial begin
	$readmemb("LUT_Table.mem", LUT_Table);	
	for(index = 0; index<64; index = index+1)
		LUT64Slut[index] <= LUT_Table[index<<2];	
end

always @ (*) begin
		// * * * * * * (X_MSB)| * * (X_LSB)  [8-bits in total].
		X_MSB <= inp[7:2];
		X_LSB <= inp[1:0];
		
		// we need two point in this method and X2 is X1's next cell.
		X1 <= X_MSB;
		X2 <= X_MSB + 1;
		
		// then we get F1, F2 from the 64 sluts LUT table base on X(s).
		F1 <= LUT64Slut[X1];
		F2 <= LUT64Slut[X2];
		
		// then we calculate with the formula.
		out <= F1 + (((F2 - F1) * X_LSB) >> 2); 
	end
endmodule
