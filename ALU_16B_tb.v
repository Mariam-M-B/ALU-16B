`timescale 1ns/1ps
module ALU_16B_tb( );
reg [15:0] A ;
reg [15:0] B ;
reg [3:0] ALU_FUN ;
reg CLK ;
wire [15:0] ALU_OUT ;
wire Carry_Flag ;
wire Arith_Flag ;
wire Logic_Flag ;
wire CMP_Flag ;
wire Shift_Flag ;


ALU_16B DUT(
.A(A), 
.B(B),
.ALU_FUN(ALU_FUN),
.CLK(CLK),
.ALU_OUT(ALU_OUT),
.Carry_Flag(Carry_Flag),
.Arith_Flag(Arith_Flag),
.Logic_Flag(Logic_Flag),
.CMP_Flag(CMP_Flag),
.Shift_Flag(Shift_Flag),
);

    always #5000 CLK = ~CLK;

    initial begin
        $dumpfile("ALU_16B_tb.vcd");
        $dumpvars;
        $monitor("ALU_OUT=%0d, Carry_Flag=%0d, Arith_Flag=%0d, Logic_Flag=%0d, CMP_Flag=%0d, Shift_Flag=%0d", ALU_OUT, Carry_Flag, Arith_Flag, Logic_Flag, CMP_Flag, Shift_Flag);
        CLK = 1'b0;
        A = 16'd12;
        B_= 16'd5;
        for(ALU_FUN = 4'd0; ALU_FUN < 4'd15; ALU_FUN=ALU_FUN+4'd1)
        begin
            $display("Test Case %0d", ALU_FUN);
            wait(3) @(negedge CLK);
        end
        $display("Test Case %0d", ALU_FUN);
        wait(3) @(negedge CLK);
        $stop;
    end
endmodule
 
