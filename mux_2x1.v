module mux2x1 #(parameter k = 4)(
  input sel,
  input [k+1 : 0]a,
  input [k+1 :0]b,
  output [k+1 :0]y
);
  assign y = sel ? a : b;
endmodule
