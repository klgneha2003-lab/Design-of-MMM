module multiplier_top_module #(parameter k = 4)
  (
    input clk,
    input rst,
    input go,
    input [k:0]A,
    input [k:0] B,
    input [k:0]m,
    output [k+1:0]p
  );
  wire cntrl;
  wire [k+1 : 0]z;
  wire r1;
  wire w1;
  wire ai;
  wire [k+1 :0]Bm;
  wire sel;
  controller #(.k(4)) c2(
    .clk(clk),
    .rst(rst),
    .go(go),
    .A(A),
    .m(m),
    .ai(ai),
    .r1(r1),
    .sel(sel),
    .Cntrl(Cntrl)
  );
  kbit_adder #(.k(4)) k1 (.B(B), .m(m), .Bm(Bm));
  Mont_mux #(.k(4)) M1 (.A(A),.B(B),.m(m),.ai(ai),.w1(w1),.Bm(Bm),.Z(Z));
  reg_module #(.k(4)) R1(.clk(clk),.rst(rst),.Cntrl(Cntrl),.sel(sel),.r1(r1),.Z(Z),.w1(w1),.P(P));
endmodule
