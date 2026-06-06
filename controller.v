module controller #(parameter k = 4)(
  input clk,
  input rst,
  input go,
  input [k:0]A,
  input [k:0]m,
  output reg ai,
  output reg r1,
  output reg sel,
  output reg Cntrl,
  output reg W
);
  wire [2:0] count;
  count_comparator #(.k(4)) C1 (.clk(clk),.rst(rst),.count(count),.go(go));
  parameter a = 2'd0;
  parameter b = 2'd1;
  parameter c = 2'd2;
  reg [k:0] pstate;
  reg [k:0] nstate = a;
  always @(posedge clk)
    begin
      if(rst == 1)
        begin
          pstate <= a;
        end
      else
        begin
          pstate <= nstate;
        end
    end
  always @(posedge clk)
    begin
      case(pstate)
        a : begin
             if(go == 0)
               begin
                 nstate <= a;
               end
             else
               begin
                 nstate <= b;
               end
            end
        b : begin
                if(count < k)
                  begin
                     nstate <= b;
                  end
                else if (count == k)
                  begin
                     nstate <= c;     
                  end
                 else 
                   begin
                     nstate <= a;
                   end
            end 
        c : begin
              if(count == k)
                begin
                  nstate <= c;
                end
               else 
                 begin
                   nstate <= a;
                 end
            end
        default : nstate <= a;
      endcase
    end
  always @(A or count or pstate or k)
    begin
      case(nstate)
        a : begin
              ai <= 0;
              r1 <= 0;
              Cntrl <= 0;
              sel <= 1;
            end
        b : begin
              ai <= A[count];
              r1 <= 1;
              Cntrl <= 0;
              sel <= 0;
            end
        c : begin
               ai <= A[count];
               r1 <= 1;
               Cntrl <= 1;
               sel <= 0;
            end
        default : begin
                   ai <= 0;
                   r1 <= 0;
                   Cntrl <= 0;
                   sel <= 1;
                  end
      endcase
    end
endmodule
