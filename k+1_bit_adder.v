module kbit_adder #(parameter k = 4)(
input [k+1 : 0] B,m,
output [k+1 : 0]Bm,
input cin,
output cout,
);
wire c1,c2,c3,c4;
full_adder0 F0 (.B(B[0]),.m(m[0]),.cin(1'b0),.Bm(Bm[0]),.cout(c1));
full_adder1 F1 (.B(B[1]),.m(m[1]),.cin(c1),.Bm(Bm[1]),.cout(c2));
full_adder1 F2 (.B(B[2]),.m(m[2]),.cin(c2),.Bm(Bm[2]),.cout(c3));
full_adder1 F3 (.B(B[3]),.m(m[3]),.cin(c3),.Bm(Bm[3]),.cout(c4));
full_adder1 F4 (.B(B[4]),.m(m[4]),.cin(c4),.Bm(Bm[4]),.cout(cout));
assign Bm[5] = cout;
endmodule

module full_Adder0 #(parameter k = 4) (
input [k:0] B,m,
output [k+1 : 0]Bm,
input cin,
output cout
);
assign Bm = B ^ m ^ cin;
assign cout = (B & m) | (m & cin) | (B & cin);
endmodule
