module Mont_mux #(parameter k = 4)
  (
    input [k:0]A,
    input [k:0]m,
    input [k+1 : 0]Bm,
    input w1,
    input ai,
    output reg [k+1 :0] Z
  );
  wire [1:0]S;
  selector #(.k(4)) S1 (.ai(ai),.B(B),.w1(w1),.S(S));
  always @(*)
    begin
      Z = {k+1{1'b1}};
      case(S)
        2'b00 : Z = 1'b0;
        2'b01 : Z = m;
        2'b10 : Z = B;
        2'b11 : Z = Bm;
        default : Z = 1'b0;
      endcase
    end
endmodule
