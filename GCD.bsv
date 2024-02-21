interface GCD;
  method Action start (Bit#(32) a,
                       Bit#(32) b); 
  method ActionValue#(Bit#(32)) getResult;
  method Bool busy;
  method Bool ready;
endinterface

module mkGCD (GCD);
    Reg#(Bit#(32)) x <- mkReg(0);
    Reg#(Bit#(32)) y <- mkReg(0);
    Reg#(Bool) busy_flag <- mkReg(False);

    rule gcd;
       if (x >= y) begin x <= x - y; end //subtract​
       else if (x != 0) begin x <= y; y <= x; end //swap​
    endrule
    
    method Action start(Bit#(32) a, Bit#(32) b);
      x <= a; y <= b;
      busy_flag <= True;
    endmethod
    
    method ActionValue#(Bit#(32)) getResult; 
      busy_flag <= False; 
      return y;
    endmethod
    
    method busy = busy_flag;
    
    method ready = x==0;
endmodule 