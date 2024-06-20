; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41606 () Bool)

(assert start!41606)

(declare-fun b!195502 () Bool)

(declare-fun e!134419 () Bool)

(declare-fun e!134423 () Bool)

(assert (=> b!195502 (= e!134419 e!134423)))

(declare-fun res!163542 () Bool)

(assert (=> b!195502 (=> (not res!163542) (not e!134423))))

(declare-fun lt!303877 () (_ BitVec 64))

(declare-fun lt!303881 () (_ BitVec 64))

(assert (=> b!195502 (= res!163542 (= lt!303877 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!303881)))))

(declare-datatypes ((array!10043 0))(
  ( (array!10044 (arr!5359 (Array (_ BitVec 32) (_ BitVec 8))) (size!4429 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7966 0))(
  ( (BitStream!7967 (buf!4915 array!10043) (currentByte!9217 (_ BitVec 32)) (currentBit!9212 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!13801 0))(
  ( (Unit!13802) )
))
(declare-datatypes ((tuple2!16904 0))(
  ( (tuple2!16905 (_1!9097 Unit!13801) (_2!9097 BitStream!7966)) )
))
(declare-fun lt!303883 () tuple2!16904)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!195502 (= lt!303877 (bitIndex!0 (size!4429 (buf!4915 (_2!9097 lt!303883))) (currentByte!9217 (_2!9097 lt!303883)) (currentBit!9212 (_2!9097 lt!303883))))))

(declare-fun thiss!1204 () BitStream!7966)

(assert (=> b!195502 (= lt!303881 (bitIndex!0 (size!4429 (buf!4915 thiss!1204)) (currentByte!9217 thiss!1204) (currentBit!9212 thiss!1204)))))

(declare-fun b!195503 () Bool)

(declare-fun e!134420 () Bool)

(declare-fun array_inv!4170 (array!10043) Bool)

(assert (=> b!195503 (= e!134420 (array_inv!4170 (buf!4915 thiss!1204)))))

(declare-fun b!195504 () Bool)

(declare-fun e!134421 () Bool)

(assert (=> b!195504 (= e!134421 (not true))))

(declare-fun lt!303878 () (_ BitVec 64))

(assert (=> b!195504 (= lt!303878 (bitIndex!0 (size!4429 (buf!4915 (_2!9097 lt!303883))) (currentByte!9217 (_2!9097 lt!303883)) (currentBit!9212 (_2!9097 lt!303883))))))

(declare-fun lt!303882 () (_ BitVec 64))

(assert (=> b!195504 (= lt!303882 (bitIndex!0 (size!4429 (buf!4915 thiss!1204)) (currentByte!9217 thiss!1204) (currentBit!9212 thiss!1204)))))

(assert (=> b!195504 e!134419))

(declare-fun res!163535 () Bool)

(assert (=> b!195504 (=> (not res!163535) (not e!134419))))

(assert (=> b!195504 (= res!163535 (= (size!4429 (buf!4915 thiss!1204)) (size!4429 (buf!4915 (_2!9097 lt!303883)))))))

(declare-fun lt!303879 () Bool)

(declare-fun appendBit!0 (BitStream!7966 Bool) tuple2!16904)

(assert (=> b!195504 (= lt!303883 (appendBit!0 thiss!1204 lt!303879))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!195504 (= lt!303879 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!195505 () Bool)

(declare-fun res!163537 () Bool)

(assert (=> b!195505 (=> (not res!163537) (not e!134423))))

(declare-fun isPrefixOf!0 (BitStream!7966 BitStream!7966) Bool)

(assert (=> b!195505 (= res!163537 (isPrefixOf!0 thiss!1204 (_2!9097 lt!303883)))))

(declare-fun b!195506 () Bool)

(declare-fun e!134418 () Bool)

(assert (=> b!195506 (= e!134423 e!134418)))

(declare-fun res!163540 () Bool)

(assert (=> b!195506 (=> (not res!163540) (not e!134418))))

(declare-datatypes ((tuple2!16906 0))(
  ( (tuple2!16907 (_1!9098 BitStream!7966) (_2!9098 Bool)) )
))
(declare-fun lt!303880 () tuple2!16906)

(assert (=> b!195506 (= res!163540 (and (= (_2!9098 lt!303880) lt!303879) (= (_1!9098 lt!303880) (_2!9097 lt!303883))))))

(declare-fun readBitPure!0 (BitStream!7966) tuple2!16906)

(declare-fun readerFrom!0 (BitStream!7966 (_ BitVec 32) (_ BitVec 32)) BitStream!7966)

(assert (=> b!195506 (= lt!303880 (readBitPure!0 (readerFrom!0 (_2!9097 lt!303883) (currentBit!9212 thiss!1204) (currentByte!9217 thiss!1204))))))

(declare-fun b!195507 () Bool)

(declare-fun res!163541 () Bool)

(assert (=> b!195507 (=> (not res!163541) (not e!134421))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!195507 (= res!163541 (invariant!0 (currentBit!9212 thiss!1204) (currentByte!9217 thiss!1204) (size!4429 (buf!4915 thiss!1204))))))

(declare-fun b!195508 () Bool)

(declare-fun res!163539 () Bool)

(assert (=> b!195508 (=> (not res!163539) (not e!134421))))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!195508 (= res!163539 (not (= i!590 nBits!348)))))

(declare-fun b!195509 () Bool)

(assert (=> b!195509 (= e!134418 (= (bitIndex!0 (size!4429 (buf!4915 (_1!9098 lt!303880))) (currentByte!9217 (_1!9098 lt!303880)) (currentBit!9212 (_1!9098 lt!303880))) lt!303877))))

(declare-fun res!163538 () Bool)

(assert (=> start!41606 (=> (not res!163538) (not e!134421))))

(assert (=> start!41606 (= res!163538 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41606 e!134421))

(assert (=> start!41606 true))

(declare-fun inv!12 (BitStream!7966) Bool)

(assert (=> start!41606 (and (inv!12 thiss!1204) e!134420)))

(declare-fun b!195501 () Bool)

(declare-fun res!163536 () Bool)

(assert (=> b!195501 (=> (not res!163536) (not e!134421))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!195501 (= res!163536 (validate_offset_bits!1 ((_ sign_extend 32) (size!4429 (buf!4915 thiss!1204))) ((_ sign_extend 32) (currentByte!9217 thiss!1204)) ((_ sign_extend 32) (currentBit!9212 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(assert (= (and start!41606 res!163538) b!195501))

(assert (= (and b!195501 res!163536) b!195507))

(assert (= (and b!195507 res!163541) b!195508))

(assert (= (and b!195508 res!163539) b!195504))

(assert (= (and b!195504 res!163535) b!195502))

(assert (= (and b!195502 res!163542) b!195505))

(assert (= (and b!195505 res!163537) b!195506))

(assert (= (and b!195506 res!163540) b!195509))

(assert (= start!41606 b!195503))

(declare-fun m!302693 () Bool)

(assert (=> b!195505 m!302693))

(declare-fun m!302695 () Bool)

(assert (=> b!195509 m!302695))

(declare-fun m!302697 () Bool)

(assert (=> b!195501 m!302697))

(declare-fun m!302699 () Bool)

(assert (=> start!41606 m!302699))

(declare-fun m!302701 () Bool)

(assert (=> b!195507 m!302701))

(declare-fun m!302703 () Bool)

(assert (=> b!195503 m!302703))

(declare-fun m!302705 () Bool)

(assert (=> b!195504 m!302705))

(declare-fun m!302707 () Bool)

(assert (=> b!195504 m!302707))

(declare-fun m!302709 () Bool)

(assert (=> b!195504 m!302709))

(declare-fun m!302711 () Bool)

(assert (=> b!195506 m!302711))

(assert (=> b!195506 m!302711))

(declare-fun m!302713 () Bool)

(assert (=> b!195506 m!302713))

(assert (=> b!195502 m!302705))

(assert (=> b!195502 m!302707))

(push 1)

(assert (not start!41606))

(assert (not b!195507))

(assert (not b!195503))

(assert (not b!195505))

(assert (not b!195501))

(assert (not b!195504))

(assert (not b!195506))

(assert (not b!195502))

(assert (not b!195509))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

