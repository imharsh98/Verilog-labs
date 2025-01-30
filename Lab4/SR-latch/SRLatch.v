//Implement SR latch in gate level modelling and verify using test bench.
module SRLatch(s,r,q,qbar);

	input s,r;
	//output reg q;
	inout q,qbar;
	
	nor n1(q,qbar,r);
	nor n2(qbar,q,s);
	
endmodule

/* module sr_latch(input s,r, output q,qbar);
nor n1(q,s,qbar);
nor n2(qbar,r,q);
endmodule */