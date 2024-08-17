module ALU_16B(
input wire [15:0] A ,
input wire [15:0] B ,
input wire  [3:0] ALU_FUN ,
input wire  CLK ,
output reg [15:0] ALU_OUT ,
output reg  Carry_Flag ,
output reg  Arith_Flag ,
output reg  Logic_Flag ,
output reg  CMP_Flag ,
output reg  Shift_Flag
);

	always @(posedge CLK)
			begin
				Case(ALU_FUN)
					4'd0 : {Carry_Flag, ALU_OUT } <= (A + B) ;
					4'd1 : {Carry_Flag, ALU_OUT } <= (A - B) ;
					4'd2 : ALU_OUT <= A * B ;
					4'd3 : ALU_OUT <= A / B ;
					4'd4 : ALU_OUT <= (A & B)  ;
					4'd5 : ALU_OUT <= (A | B  ;
					4'd6 : ALU_OUT <= ~(A & B) ;
					4'd7 : ALU_OUT <= ~(A | B) ;
					4'd8 : ALU_OUT <= (A ^ B) ;
					4'd9 : ALU_OUT <= ~(A ^ B) ;
					4'd10 : ALU_OUT <=(A == B)? 16'd1 :16'd0 ;
					4'd11 : ALU_OUT <=(A > B)? 16'd2 :16'd0 ;
					4'd12 : ALU_OUT <=(A < B)? 16'd3 :16'd0 ;
					4'd13 : ALU_OUT <= (A >> 1) ;
					4'd14 : ALU_OUT <= (A << 1) ;
					default: ALU_OUT <= 16'd0 ;
				endcase
			end
	assign Arith_Flag = ~( ALU_FUN[3] | ALU_FUN[2] );
	assign Logic_Flag =  ~( Arith_Flag| CMP_Flag | Shift_Flag );
	assign CMP_Flag = (~Shift_Flag & (ALU_FUN[2] ^ ALU_FUN[1]) & ALU_FUN[3]);
	assign Shift_Flag = ( ALU_FUN[3] & ALU_FUN[2] & (ALU_FUN[1] | ALU_FUN[0]));
endmodule

