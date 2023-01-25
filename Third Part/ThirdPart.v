`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:04:30 01/24/2023 
// Design Name: 
// Module Name:    ThirdPart 
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
module ThirdPart(
    input [7:0] inp,
    output reg [7:0] out);


integer index;

reg [7:0] LUT_Table [0:255];
reg [7:0] LUT64Sluts [0:63];

reg [1:0] X_LSB;
reg [5:0] X_MSB, X1, X2, X3;
reg [7:0] F1, F2, F3;

initial begin
	$readmemb("LUT_Table.mem", LUT_Table); // getting our full 256 sluts LUT table
	for(index = 0; index<64; index = index+1)
		LUT64Sluts[index] <= LUT_Table[index<<2]; // we choose every 4 (256/64=4) slut so we'll have 64 sluts
end

always @(*) begin
	/* we will implement the formula we determined on paper. */
	
	// so as we saw we need three point in this method.
	// * * * * * * (X_MSB)| * * (X_LSB)  [8-bits in total].
	
	X_MSB <= inp[7:2]; // X_MSB
	X_LSB <= inp[1:0]; // X_LSB
	X1 <= X_MSB - 1;
	X2 <= X_MSB;
	X3 <= X_MSB + 1;
	
	// then we get F1, F2, F3 from the 64 sluts LUT table base on X(s).
	F1 <= LUT64Sluts[X1];
	F2 <= LUT64Sluts[X2];
	F3 <= LUT64Sluts[X3];
	
	// then we calculate with the formula.
	out <= F2 + ((X_LSB * (F2 - F1)) >> 3) + ((X_LSB * X_LSB * (F1 - (F2 << 1) + F3)) >> 5);
	
end
	
endmodule
