module regz #(parameter k = 4)(
  input clk,
  input rst,
  input [k+1 : 0]d,
  output reg [k+1 : 0]q
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
endmodule
