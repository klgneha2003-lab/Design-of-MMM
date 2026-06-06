module shiftbit #(parameter k = 4)(
  input clk,
  input [k+2 : 0]tempR,
  output [k+1 : 0] updatedR
);
  assign updatedR = tempR >> 1;
endmodule
