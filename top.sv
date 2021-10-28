module top (
	    input logic  clk,
	    input logic  rst,
	    input logic  A,
	    input logic  B,
	    input logic  C,
	    input logic  D,
	    input logic  E,
	    input logic  F,
	    input logic  G,
	    input logic  H,
	    output logic out);

   figure1_3 uufv
     (
      .clk(clk),
      .rst(rst),
      .A(A),
      .B(B),
      .C(C),
      .D(D),
      .E(E),
      .F(F),
      .G(G),
      .H(H),
      .out(out));

   property p1:
     @(posedge clk) ~A ##0 ~B ##0 ~C ##0 ~E ##0 ~F ##0 ~D |=> out;
   endproperty; // p1

   property p2:
     @(posedge clk) A ##0 ~B ##0 ~C ##0 E ##0 ~F ##0 ~D |=> out;
   endproperty; // p2
   
   property p3:
     @(posedge clk) ~A ##0 B ##0 ~C ##0 ~E ##0 F ##0 ~D |=> out;
   endproperty; // p3
   
   property p4:
     @(posedge clk) A ##0 B ##0 ~C ##0 E ##0 F ##0 ~D |=> out;
   endproperty; // p4
   
   property p5:
     @(posedge clk) ~A ##0 ~B ##0 C ##0 ~G ##0 ~H ##0 ~D |=> out;
   endproperty; // p5
   
   property p6:
     @(posedge clk) A ##0 ~B ##0 C ##0 G ##0 ~H ##0 ~D |=> out;
   endproperty; // p6
   
   property p7:
     @(posedge clk) ~A ##0 B ##0 C ##0 ~G ##0 H ##0 ~D |=> out;
   endproperty; // p7
   
   property p8:
     @(posedge clk) A ##0 B ##0 C ##0 G ##0 H ##0 ~D |=> out;
   endproperty; // p8

   property p9:
     @(posedge clk) D |=> out;
   endproperty; // p9

   assert property (p1);
   assert property (p2);
   assert property (p3);
   assert property (p4);
   assert property (p5);
   assert property (p6);
   assert property (p7);
   assert property (p8);
   assert property (p9);
   
   
endmodule; // top
      
