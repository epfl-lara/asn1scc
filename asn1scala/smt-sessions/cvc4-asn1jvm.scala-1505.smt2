; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41610 () Bool)

(assert start!41610)

(declare-fun b!195555 () Bool)

(declare-fun e!134458 () Bool)

(declare-fun e!134455 () Bool)

(assert (=> b!195555 (= e!134458 e!134455)))

(declare-fun res!163584 () Bool)

(assert (=> b!195555 (=> (not res!163584) (not e!134455))))

(declare-fun lt!303925 () (_ BitVec 64))

(declare-fun lt!303919 () (_ BitVec 64))

(assert (=> b!195555 (= res!163584 (= lt!303925 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!303919)))))

(declare-datatypes ((array!10047 0))(
  ( (array!10048 (arr!5361 (Array (_ BitVec 32) (_ BitVec 8))) (size!4431 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7970 0))(
  ( (BitStream!7971 (buf!4917 array!10047) (currentByte!9219 (_ BitVec 32)) (currentBit!9214 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!13805 0))(
  ( (Unit!13806) )
))
(declare-datatypes ((tuple2!16912 0))(
  ( (tuple2!16913 (_1!9101 Unit!13805) (_2!9101 BitStream!7970)) )
))
(declare-fun lt!303920 () tuple2!16912)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!195555 (= lt!303925 (bitIndex!0 (size!4431 (buf!4917 (_2!9101 lt!303920))) (currentByte!9219 (_2!9101 lt!303920)) (currentBit!9214 (_2!9101 lt!303920))))))

(declare-fun thiss!1204 () BitStream!7970)

(assert (=> b!195555 (= lt!303919 (bitIndex!0 (size!4431 (buf!4917 thiss!1204)) (currentByte!9219 thiss!1204) (currentBit!9214 thiss!1204)))))

(declare-fun b!195556 () Bool)

(declare-fun e!134459 () Bool)

(declare-fun array_inv!4172 (array!10047) Bool)

(assert (=> b!195556 (= e!134459 (array_inv!4172 (buf!4917 thiss!1204)))))

(declare-fun b!195557 () Bool)

(declare-fun res!163583 () Bool)

(declare-fun e!134456 () Bool)

(assert (=> b!195557 (=> (not res!163583) (not e!134456))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!195557 (= res!163583 (invariant!0 (currentBit!9214 thiss!1204) (currentByte!9219 thiss!1204) (size!4431 (buf!4917 thiss!1204))))))

(declare-fun b!195558 () Bool)

(declare-fun res!163586 () Bool)

(assert (=> b!195558 (=> (not res!163586) (not e!134455))))

(declare-fun isPrefixOf!0 (BitStream!7970 BitStream!7970) Bool)

(assert (=> b!195558 (= res!163586 (isPrefixOf!0 thiss!1204 (_2!9101 lt!303920)))))

(declare-fun b!195559 () Bool)

(declare-fun e!134457 () Bool)

(assert (=> b!195559 (= e!134455 e!134457)))

(declare-fun res!163588 () Bool)

(assert (=> b!195559 (=> (not res!163588) (not e!134457))))

(declare-fun lt!303923 () Bool)

(declare-datatypes ((tuple2!16914 0))(
  ( (tuple2!16915 (_1!9102 BitStream!7970) (_2!9102 Bool)) )
))
(declare-fun lt!303924 () tuple2!16914)

(assert (=> b!195559 (= res!163588 (and (= (_2!9102 lt!303924) lt!303923) (= (_1!9102 lt!303924) (_2!9101 lt!303920))))))

(declare-fun readBitPure!0 (BitStream!7970) tuple2!16914)

(declare-fun readerFrom!0 (BitStream!7970 (_ BitVec 32) (_ BitVec 32)) BitStream!7970)

(assert (=> b!195559 (= lt!303924 (readBitPure!0 (readerFrom!0 (_2!9101 lt!303920) (currentBit!9214 thiss!1204) (currentByte!9219 thiss!1204))))))

(declare-fun res!163589 () Bool)

(assert (=> start!41610 (=> (not res!163589) (not e!134456))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!41610 (= res!163589 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41610 e!134456))

(assert (=> start!41610 true))

(declare-fun inv!12 (BitStream!7970) Bool)

(assert (=> start!41610 (and (inv!12 thiss!1204) e!134459)))

(declare-fun b!195560 () Bool)

(assert (=> b!195560 (= e!134456 (not true))))

(declare-fun lt!303922 () (_ BitVec 64))

(assert (=> b!195560 (= lt!303922 (bitIndex!0 (size!4431 (buf!4917 (_2!9101 lt!303920))) (currentByte!9219 (_2!9101 lt!303920)) (currentBit!9214 (_2!9101 lt!303920))))))

(declare-fun lt!303921 () (_ BitVec 64))

(assert (=> b!195560 (= lt!303921 (bitIndex!0 (size!4431 (buf!4917 thiss!1204)) (currentByte!9219 thiss!1204) (currentBit!9214 thiss!1204)))))

(assert (=> b!195560 e!134458))

(declare-fun res!163587 () Bool)

(assert (=> b!195560 (=> (not res!163587) (not e!134458))))

(assert (=> b!195560 (= res!163587 (= (size!4431 (buf!4917 thiss!1204)) (size!4431 (buf!4917 (_2!9101 lt!303920)))))))

(declare-fun appendBit!0 (BitStream!7970 Bool) tuple2!16912)

(assert (=> b!195560 (= lt!303920 (appendBit!0 thiss!1204 lt!303923))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!195560 (= lt!303923 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!195561 () Bool)

(declare-fun res!163585 () Bool)

(assert (=> b!195561 (=> (not res!163585) (not e!134456))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!195561 (= res!163585 (validate_offset_bits!1 ((_ sign_extend 32) (size!4431 (buf!4917 thiss!1204))) ((_ sign_extend 32) (currentByte!9219 thiss!1204)) ((_ sign_extend 32) (currentBit!9214 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!195562 () Bool)

(assert (=> b!195562 (= e!134457 (= (bitIndex!0 (size!4431 (buf!4917 (_1!9102 lt!303924))) (currentByte!9219 (_1!9102 lt!303924)) (currentBit!9214 (_1!9102 lt!303924))) lt!303925))))

(declare-fun b!195563 () Bool)

(declare-fun res!163590 () Bool)

(assert (=> b!195563 (=> (not res!163590) (not e!134456))))

(assert (=> b!195563 (= res!163590 (not (= i!590 nBits!348)))))

(assert (= (and start!41610 res!163589) b!195561))

(assert (= (and b!195561 res!163585) b!195557))

(assert (= (and b!195557 res!163583) b!195563))

(assert (= (and b!195563 res!163590) b!195560))

(assert (= (and b!195560 res!163587) b!195555))

(assert (= (and b!195555 res!163584) b!195558))

(assert (= (and b!195558 res!163586) b!195559))

(assert (= (and b!195559 res!163588) b!195562))

(assert (= start!41610 b!195556))

(declare-fun m!302737 () Bool)

(assert (=> b!195560 m!302737))

(declare-fun m!302739 () Bool)

(assert (=> b!195560 m!302739))

(declare-fun m!302741 () Bool)

(assert (=> b!195560 m!302741))

(declare-fun m!302743 () Bool)

(assert (=> start!41610 m!302743))

(declare-fun m!302745 () Bool)

(assert (=> b!195562 m!302745))

(declare-fun m!302747 () Bool)

(assert (=> b!195557 m!302747))

(assert (=> b!195555 m!302737))

(assert (=> b!195555 m!302739))

(declare-fun m!302749 () Bool)

(assert (=> b!195559 m!302749))

(assert (=> b!195559 m!302749))

(declare-fun m!302751 () Bool)

(assert (=> b!195559 m!302751))

(declare-fun m!302753 () Bool)

(assert (=> b!195561 m!302753))

(declare-fun m!302755 () Bool)

(assert (=> b!195556 m!302755))

(declare-fun m!302757 () Bool)

(assert (=> b!195558 m!302757))

(push 1)

(assert (not b!195558))

(assert (not b!195559))

