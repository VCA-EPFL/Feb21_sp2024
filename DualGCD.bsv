import GCDGuarded::*;
import FIFO::*;

module mkGCD2(GCDGuarded);
    GCDGuarded gcd1 <- mkGCDGuarded(); 
    GCDGuarded gcd2 <- mkGCDGuarded();
    
    Reg#(Bool) turn <- mkReg(True); 
    FIFO#(Bool) bk<-mkFIFO;
    
    method Action start(Bit#(32) a, Bit#(32) b);
        turn <= ! turn; bk.enq(turn);
        if (turn) gcd1.start(a,b);
        else gcd2.start(a,b);
    endmethod
    
    method ActionValue#(Bit#(32)) getResult();
      let turn = bk.first(); bk.deq();
      if (turn) begin
        let v <- gcd1.getResult(); return v; 
      end
      else begin
        let v <- gcd2.getResult(); return v; 
      end
    endmethod
endmodule