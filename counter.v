module count_comparator #(parameter k = 4)
  (
    input clk,
    input rst,
    input go,
    output reg [2:0]count
  );
  always @(posedge clk or posedge rst)
      begin
        if(rst)
          begin
            count <= 3'b000;
          end
        else if (go)
          begin
            if(count == 3'b100)
              begin
                 count <= 3'b000;
              end
            else
              begin
                 count <= count + 1;
              end
          end
        else 
          begin
             count  <= count;
          end
      end
endmodule
