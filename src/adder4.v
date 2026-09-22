`timescale 1ns / 1ps
//
//  Add code inside the adder4 module to implement a four-bit adder, using
//   four instances of the one-bit full adder module "fulladd".
//
//  The github tests will test the output of your code.
//  If it passes, you will see a green check mark at the top of the repository.
//

module adder4(
	      input [3:0]      a,
	      input [3:0]      b,
	      output [4:0] result);
   
// add your code here -- you must use four instances of the full adder "fulladd", defined below
	wire [4:0] carry;
	assign carry[0] = 1'b0;
	
	genvar i;
	generate
		for (i = 0; i < 4; i = i + 1) 
			fulladd fa (a[i]), b[i], carry[i], result[i], carry[i+1]);
					   endgenerate
					   assign result[4] = carry[4];
					   
   
endmodule

module fulladd(
	       input  x,
	       input  y,
	       input  cin,
	       output sum,
	       output cout);

   assign sum = x ^ y ^ cin;
   assign cout = (x & y) | (x & cin) | (y & cin);
   
endmodule

