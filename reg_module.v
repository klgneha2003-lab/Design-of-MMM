module reg_module #(parameter k = 4) (
  input clk,
  input rst,
  input Cntrl,
  input sel,
  input r1,
  input [k+1 : 0]Z,
  output w1,
  output [k +1 : 0]P
);
  wire sel;
  wire [k+2 : 0] tempR;
  wire [k+1 : 0] updatedR;
  wire [k+1 : 0] ztemp;
  wire [k+1 :0] accumulateW, updatedW;
  regz #(.k(4)) rz (.d(Z),.clk(clk),.rst(rst),.q(ztemp));
  k1bit_adder #(.k(4)) K0 (.ztemp(ztemp),.updatedW(updatedW),.tempR(tempR) );
  shiftbit s1 (.clk(clk),.tempR(tempR),.updatedR(updatedR));
  mux2x1 #(.k(4)) m1 (.y(accumulateW),.sel(sel),.a(5'd0),.b(updatedR));
  Wreg #(.k(4)) r2 (.d(accumulateW),.r1(r1),.clk(clk),.rst(rst),.w1(w1),.q(updatedW));
  assign P = Cntrl ? updatedW : 'bz;
endmodule
