; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53662 () Bool)

(assert start!53662)

(declare-fun b!249172 () Bool)

(declare-fun e!172652 () Bool)

(declare-datatypes ((array!13571 0))(
  ( (array!13572 (arr!6936 (Array (_ BitVec 32) (_ BitVec 8))) (size!5949 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10820 0))(
  ( (BitStream!10821 (buf!6442 array!13571) (currentByte!11873 (_ BitVec 32)) (currentBit!11868 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!21302 0))(
  ( (tuple2!21303 (_1!11576 BitStream!10820) (_2!11576 Bool)) )
))
(declare-fun lt!388078 () tuple2!21302)

(declare-fun lt!388077 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!249172 (= e!172652 (= (bitIndex!0 (size!5949 (buf!6442 (_1!11576 lt!388078))) (currentByte!11873 (_1!11576 lt!388078)) (currentBit!11868 (_1!11576 lt!388078))) lt!388077))))

(declare-fun b!249173 () Bool)

(declare-fun e!172648 () Bool)

(declare-fun thiss!1005 () BitStream!10820)

(declare-fun array_inv!5690 (array!13571) Bool)

(assert (=> b!249173 (= e!172648 (array_inv!5690 (buf!6442 thiss!1005)))))

(declare-fun b!249174 () Bool)

(declare-fun e!172649 () Bool)

(declare-fun e!172647 () Bool)

(assert (=> b!249174 (= e!172649 e!172647)))

(declare-fun res!208525 () Bool)

(assert (=> b!249174 (=> (not res!208525) (not e!172647))))

(declare-fun lt!388080 () (_ BitVec 64))

(assert (=> b!249174 (= res!208525 (= lt!388077 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388080)))))

(declare-datatypes ((Unit!18034 0))(
  ( (Unit!18035) )
))
(declare-datatypes ((tuple2!21304 0))(
  ( (tuple2!21305 (_1!11577 Unit!18034) (_2!11577 BitStream!10820)) )
))
(declare-fun lt!388079 () tuple2!21304)

(assert (=> b!249174 (= lt!388077 (bitIndex!0 (size!5949 (buf!6442 (_2!11577 lt!388079))) (currentByte!11873 (_2!11577 lt!388079)) (currentBit!11868 (_2!11577 lt!388079))))))

(assert (=> b!249174 (= lt!388080 (bitIndex!0 (size!5949 (buf!6442 thiss!1005)) (currentByte!11873 thiss!1005) (currentBit!11868 thiss!1005)))))

(declare-fun b!249175 () Bool)

(declare-fun res!208526 () Bool)

(declare-fun e!172651 () Bool)

(assert (=> b!249175 (=> (not res!208526) (not e!172651))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!249175 (= res!208526 (bvslt from!289 nBits!297))))

(declare-fun b!249176 () Bool)

(declare-fun res!208529 () Bool)

(assert (=> b!249176 (=> (not res!208529) (not e!172651))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249176 (= res!208529 (validate_offset_bits!1 ((_ sign_extend 32) (size!5949 (buf!6442 thiss!1005))) ((_ sign_extend 32) (currentByte!11873 thiss!1005)) ((_ sign_extend 32) (currentBit!11868 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!249177 () Bool)

(assert (=> b!249177 (= e!172647 e!172652)))

(declare-fun res!208530 () Bool)

(assert (=> b!249177 (=> (not res!208530) (not e!172652))))

(declare-fun bit!26 () Bool)

(assert (=> b!249177 (= res!208530 (and (= (_2!11576 lt!388078) bit!26) (= (_1!11576 lt!388078) (_2!11577 lt!388079))))))

(declare-fun readBitPure!0 (BitStream!10820) tuple2!21302)

(declare-fun readerFrom!0 (BitStream!10820 (_ BitVec 32) (_ BitVec 32)) BitStream!10820)

(assert (=> b!249177 (= lt!388078 (readBitPure!0 (readerFrom!0 (_2!11577 lt!388079) (currentBit!11868 thiss!1005) (currentByte!11873 thiss!1005))))))

(declare-fun b!249178 () Bool)

(assert (=> b!249178 (= e!172651 (not (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!249178 e!172649))

(declare-fun res!208524 () Bool)

(assert (=> b!249178 (=> (not res!208524) (not e!172649))))

(assert (=> b!249178 (= res!208524 (= (size!5949 (buf!6442 thiss!1005)) (size!5949 (buf!6442 (_2!11577 lt!388079)))))))

(declare-fun appendBit!0 (BitStream!10820 Bool) tuple2!21304)

(assert (=> b!249178 (= lt!388079 (appendBit!0 thiss!1005 bit!26))))

(declare-fun res!208527 () Bool)

(assert (=> start!53662 (=> (not res!208527) (not e!172651))))

(assert (=> start!53662 (= res!208527 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53662 e!172651))

(assert (=> start!53662 true))

(declare-fun inv!12 (BitStream!10820) Bool)

(assert (=> start!53662 (and (inv!12 thiss!1005) e!172648)))

(declare-fun b!249179 () Bool)

(declare-fun res!208528 () Bool)

(assert (=> b!249179 (=> (not res!208528) (not e!172647))))

(declare-fun isPrefixOf!0 (BitStream!10820 BitStream!10820) Bool)

(assert (=> b!249179 (= res!208528 (isPrefixOf!0 thiss!1005 (_2!11577 lt!388079)))))

(assert (= (and start!53662 res!208527) b!249176))

(assert (= (and b!249176 res!208529) b!249175))

(assert (= (and b!249175 res!208526) b!249178))

(assert (= (and b!249178 res!208524) b!249174))

(assert (= (and b!249174 res!208525) b!249179))

(assert (= (and b!249179 res!208528) b!249177))

(assert (= (and b!249177 res!208530) b!249172))

(assert (= start!53662 b!249173))

(declare-fun m!375625 () Bool)

(assert (=> start!53662 m!375625))

(declare-fun m!375627 () Bool)

(assert (=> b!249179 m!375627))

(declare-fun m!375629 () Bool)

(assert (=> b!249173 m!375629))

(declare-fun m!375631 () Bool)

(assert (=> b!249174 m!375631))

(declare-fun m!375633 () Bool)

(assert (=> b!249174 m!375633))

(declare-fun m!375635 () Bool)

(assert (=> b!249178 m!375635))

(declare-fun m!375637 () Bool)

(assert (=> b!249172 m!375637))

(declare-fun m!375639 () Bool)

(assert (=> b!249177 m!375639))

(assert (=> b!249177 m!375639))

(declare-fun m!375641 () Bool)

(assert (=> b!249177 m!375641))

(declare-fun m!375643 () Bool)

(assert (=> b!249176 m!375643))

(push 1)

(assert (not b!249174))

(assert (not b!249173))

(assert (not b!249172))

(assert (not b!249178))

(assert (not b!249177))

(assert (not start!53662))

(assert (not b!249176))

(assert (not b!249179))

(check-sat)

(pop 1)

(push 1)

(check-sat)

