module Wreg #(parameter k = 4) (
  input clk,
  input rst,
  input r1,
  input [k+1 : 0]d,
  output reg [k+1 : 0]q,
  output reg w1
);
  always @(posedge clk)
    begin
      if(rst)
        begin
          q <= 0;
        end
      else
        begin
          q <= d;
        end
    end
  always @(posedge clk)
    begin
      if(!r1)
        begin
          w1 <= q[1];
        end
      else
        begin
          w1 <= 0;
        end
    end
endmodule
