/******************************************************************
* Description
*	This is an 32-bit arithetic logic unit that can execute the next set of operations:
*		add

* This ALU is written by using behavioral description.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	16/08/2021
******************************************************************/

module ALU 
(
	input [3:0] ALU_Operation_i,
	input signed [31:0] A_i,
	input signed [31:0] B_i,
	output reg Zero_o,
	output reg [31:0] ALU_Result_o
);

localparam ADD 		= 4'b0000; 				//Instruccion ADD
localparam SUB 		= 4'b0001; 				//Instruccion SUB
localparam ORI		= 4'b0011;				//Instruccion ORI
localparam SLLI 	= 4'b0100; 				//Instruccion SLLI
localparam SRLI		= 4'b0101;				//Instruccion SRLI
localparam LUI 		= 4'b0010; 				//Instruccion LUI
	
	always @ (A_i or B_i or ALU_Operation_i)
		begin
			case (ALU_Operation_i)
			ADD: 										//Operacion add
				ALU_Result_o = A_i + B_i;
			SUB:										//Operacion sub
				ALU_Result_o = A_i - B_i;
			ORI:										//Operacion ori
				ALU_Result_o = A_i | B_i;				
			SLLI:										//Operacion slli
				ALU_Result_o = A_i << B_i[4:0];
			SRLI:										//Operacion srli
				ALU_Result_o = A_i >> B_i[4:0];					
			LUI:										//Operacion lui
				ALU_Result_o = B_i;
					
			default:
				ALU_Result_o = 0;
			endcase // case(control)
			
			Zero_o = (ALU_Result_o == 0) ? 1'b1 : 1'b0; //
			
		end // always @ (A or B or control)
endmodule // ALU