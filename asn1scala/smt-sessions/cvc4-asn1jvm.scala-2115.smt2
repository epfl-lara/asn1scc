; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53680 () Bool)

(assert start!53680)

(declare-fun b!249388 () Bool)

(declare-fun res!208715 () Bool)

(declare-fun e!172814 () Bool)

(assert (=> b!249388 (=> (not res!208715) (not e!172814))))

(declare-datatypes ((array!13589 0))(
  ( (array!13590 (arr!6945 (Array (_ BitVec 32) (_ BitVec 8))) (size!5958 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10838 0))(
  ( (BitStream!10839 (buf!6451 array!13589) (currentByte!11882 (_ BitVec 32)) (currentBit!11877 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10838)

(declare-datatypes ((Unit!18052 0))(
  ( (Unit!18053) )
))
(declare-datatypes ((tuple2!21338 0))(
  ( (tuple2!21339 (_1!11594 Unit!18052) (_2!11594 BitStream!10838)) )
))
(declare-fun lt!388185 () tuple2!21338)

(declare-fun isPrefixOf!0 (BitStream!10838 BitStream!10838) Bool)

(assert (=> b!249388 (= res!208715 (isPrefixOf!0 thiss!1005 (_2!11594 lt!388185)))))

(declare-fun res!208714 () Bool)

(declare-fun e!172812 () Bool)

(assert (=> start!53680 (=> (not res!208714) (not e!172812))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!53680 (= res!208714 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53680 e!172812))

(assert (=> start!53680 true))

(declare-fun e!172809 () Bool)

(declare-fun inv!12 (BitStream!10838) Bool)

(assert (=> start!53680 (and (inv!12 thiss!1005) e!172809)))

(declare-fun b!249389 () Bool)

(declare-fun res!208718 () Bool)

(assert (=> b!249389 (=> (not res!208718) (not e!172812))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249389 (= res!208718 (validate_offset_bits!1 ((_ sign_extend 32) (size!5958 (buf!6451 thiss!1005))) ((_ sign_extend 32) (currentByte!11882 thiss!1005)) ((_ sign_extend 32) (currentBit!11877 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!249390 () Bool)

(declare-fun res!208716 () Bool)

(assert (=> b!249390 (=> (not res!208716) (not e!172812))))

(assert (=> b!249390 (= res!208716 (bvslt from!289 nBits!297))))

(declare-fun b!249391 () Bool)

(declare-fun e!172813 () Bool)

(assert (=> b!249391 (= e!172814 e!172813)))

(declare-fun res!208717 () Bool)

(assert (=> b!249391 (=> (not res!208717) (not e!172813))))

(declare-datatypes ((tuple2!21340 0))(
  ( (tuple2!21341 (_1!11595 BitStream!10838) (_2!11595 Bool)) )
))
(declare-fun lt!388187 () tuple2!21340)

(declare-fun bit!26 () Bool)

(assert (=> b!249391 (= res!208717 (and (= (_2!11595 lt!388187) bit!26) (= (_1!11595 lt!388187) (_2!11594 lt!388185))))))

(declare-fun readBitPure!0 (BitStream!10838) tuple2!21340)

(declare-fun readerFrom!0 (BitStream!10838 (_ BitVec 32) (_ BitVec 32)) BitStream!10838)

(assert (=> b!249391 (= lt!388187 (readBitPure!0 (readerFrom!0 (_2!11594 lt!388185) (currentBit!11877 thiss!1005) (currentByte!11882 thiss!1005))))))

(declare-fun b!249392 () Bool)

(declare-fun array_inv!5699 (array!13589) Bool)

(assert (=> b!249392 (= e!172809 (array_inv!5699 (buf!6451 thiss!1005)))))

(declare-fun b!249393 () Bool)

(declare-fun e!172811 () Bool)

(assert (=> b!249393 (= e!172811 e!172814)))

(declare-fun res!208713 () Bool)

(assert (=> b!249393 (=> (not res!208713) (not e!172814))))

(declare-fun lt!388186 () (_ BitVec 64))

(declare-fun lt!388188 () (_ BitVec 64))

(assert (=> b!249393 (= res!208713 (= lt!388186 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388188)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!249393 (= lt!388186 (bitIndex!0 (size!5958 (buf!6451 (_2!11594 lt!388185))) (currentByte!11882 (_2!11594 lt!388185)) (currentBit!11877 (_2!11594 lt!388185))))))

(assert (=> b!249393 (= lt!388188 (bitIndex!0 (size!5958 (buf!6451 thiss!1005)) (currentByte!11882 thiss!1005) (currentBit!11877 thiss!1005)))))

(declare-fun b!249394 () Bool)

(assert (=> b!249394 (= e!172812 (not true))))

(assert (=> b!249394 e!172811))

(declare-fun res!208719 () Bool)

(assert (=> b!249394 (=> (not res!208719) (not e!172811))))

(assert (=> b!249394 (= res!208719 (= (size!5958 (buf!6451 thiss!1005)) (size!5958 (buf!6451 (_2!11594 lt!388185)))))))

(declare-fun appendBit!0 (BitStream!10838 Bool) tuple2!21338)

(assert (=> b!249394 (= lt!388185 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!249395 () Bool)

(assert (=> b!249395 (= e!172813 (= (bitIndex!0 (size!5958 (buf!6451 (_1!11595 lt!388187))) (currentByte!11882 (_1!11595 lt!388187)) (currentBit!11877 (_1!11595 lt!388187))) lt!388186))))

(assert (= (and start!53680 res!208714) b!249389))

(assert (= (and b!249389 res!208718) b!249390))

(assert (= (and b!249390 res!208716) b!249394))

(assert (= (and b!249394 res!208719) b!249393))

(assert (= (and b!249393 res!208713) b!249388))

(assert (= (and b!249388 res!208715) b!249391))

(assert (= (and b!249391 res!208717) b!249395))

(assert (= start!53680 b!249392))

(declare-fun m!375805 () Bool)

(assert (=> b!249389 m!375805))

(declare-fun m!375807 () Bool)

(assert (=> b!249391 m!375807))

(assert (=> b!249391 m!375807))

(declare-fun m!375809 () Bool)

(assert (=> b!249391 m!375809))

(declare-fun m!375811 () Bool)

(assert (=> start!53680 m!375811))

(declare-fun m!375813 () Bool)

(assert (=> b!249392 m!375813))

(declare-fun m!375815 () Bool)

(assert (=> b!249388 m!375815))

(declare-fun m!375817 () Bool)

(assert (=> b!249394 m!375817))

(declare-fun m!375819 () Bool)

(assert (=> b!249393 m!375819))

(declare-fun m!375821 () Bool)

(assert (=> b!249393 m!375821))

(declare-fun m!375823 () Bool)

(assert (=> b!249395 m!375823))

(push 1)

(assert (not start!53680))

(assert (not b!249389))

(assert (not b!249388))

(assert (not b!249392))

(assert (not b!249393))

(assert (not b!249391))

(assert (not b!249395))

(assert (not b!249394))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

