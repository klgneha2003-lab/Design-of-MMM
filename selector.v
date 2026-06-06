module selector #(parameter k = 4)(
  input [k:0] B,
  input wire ai,
  input wire w1,
  output reg [1:0]S
);
  wire S0;
  wire S1;
  wire b0;
  assign b0 = B[0];
  assign S0 = (w1 ^ (ai & b0));
  assign S1 = ai;
  always @(S1 or S0)
    begin
      S = {S1,S0};
    end
endmodule
