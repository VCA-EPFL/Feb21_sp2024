interface GCDGuarded;
  method Action start (Bit#(32) a,
                       Bit#(32) b); 
  method ActionValue#(Bit#(32)) getResult;
endinterface

module mkGCDGuarded (GCDGuarded);
    Reg#(Bit#(32)) x <- mkReg(0);
    Reg#(Bit#(32)) y <- mkReg(0);
    Reg#(Bool) busy_flag <- mkReg(False);

    rule gcd;
       if (x >= y) begin x <= x - y; end //subtract​
       else if (x != 0) begin x <= y; y <= x; end //swap​
    endrule
    
    method Action start(Bit#(32) a, Bit#(32) b) if (!busy_flag);
      x <= a; y <= b;
      busy_flag <= True;
    endmethod
    
    method ActionValue#(Bit#(32)) getResult if (x==0); 
      busy_flag <= False; 
      return y;
    endmethod
    
endmodule 


module mkParent(Empty);
  GCDGuarded gcd <- mkGCDGuarded;

  rule feed_gcd;
    gcd.start(10,24);
  endrule

  rule get_result_gcd;
    let x <- gcd.getResult;
    $display("The result is ", x);
    $finish;
  endrule

endmodule