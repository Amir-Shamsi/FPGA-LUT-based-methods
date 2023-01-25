`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:43:39 01/24/2023 
// Design Name: 
// Module Name:    FirstPart 
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
module FirstPart(
    input [7:0] inp,
    output reg [7:0] out);
	 
	reg [7:0] LUT_Table [0:255];
	initial $readmemb("LUT_Table.mem", LUT_Table);
	
	// we just return the related result from LUT table.
	always @ (*) out <= LUT_Table[inp];
endmodule
