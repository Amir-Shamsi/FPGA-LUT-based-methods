`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:38:45 01/24/2023
// Design Name:   SecondPart
// Module Name:   C:/HDL-Projects/FPGA/SecondPart_TEST.v
// Project Name:  FPGA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SecondPart
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SecondPart_TEST;

	// Inputs
	reg [7:0] inp;

	// Outputs
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	SecondPart uut (
		.inp(inp), 
		.out(out)
	);
	
	reg [7:0] rand_mem [0:19]; // 20 random input
	
	initial $readmemb("Random_Entries.mem", rand_mem);
	reg [5:0] index = 0;
	
	always #50 begin 
		inp <= rand_mem[index];
		index <= index + 1;
		$display("%b", out);
	end
	
	initial begin
		// Initialize Inputs
		inp = 0;

		// Wait 100 ns for global reset to finish
		#1500 $finish;
        
		// Add stimulus here

	end
	
endmodule

