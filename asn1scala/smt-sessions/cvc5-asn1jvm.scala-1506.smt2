; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41612 () Bool)

(assert start!41612)

(declare-fun b!195582 () Bool)

(declare-fun res!163612 () Bool)

(declare-fun e!134472 () Bool)

(assert (=> b!195582 (=> (not res!163612) (not e!134472))))

(declare-datatypes ((array!10049 0))(
  ( (array!10050 (arr!5362 (Array (_ BitVec 32) (_ BitVec 8))) (size!4432 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7972 0))(
  ( (BitStream!7973 (buf!4918 array!10049) (currentByte!9220 (_ BitVec 32)) (currentBit!9215 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7972)

(declare-datatypes ((Unit!13807 0))(
  ( (Unit!13808) )
))
(declare-datatypes ((tuple2!16916 0))(
  ( (tuple2!16917 (_1!9103 Unit!13807) (_2!9103 BitStream!7972)) )
))
(declare-fun lt!303942 () tuple2!16916)

(declare-fun isPrefixOf!0 (BitStream!7972 BitStream!7972) Bool)

(assert (=> b!195582 (= res!163612 (isPrefixOf!0 thiss!1204 (_2!9103 lt!303942)))))

(declare-fun b!195583 () Bool)

(declare-fun e!134476 () Bool)

(assert (=> b!195583 (= e!134472 e!134476)))

(declare-fun res!163609 () Bool)

(assert (=> b!195583 (=> (not res!163609) (not e!134476))))

(declare-fun lt!303946 () Bool)

(declare-datatypes ((tuple2!16918 0))(
  ( (tuple2!16919 (_1!9104 BitStream!7972) (_2!9104 Bool)) )
))
(declare-fun lt!303944 () tuple2!16918)

(assert (=> b!195583 (= res!163609 (and (= (_2!9104 lt!303944) lt!303946) (= (_1!9104 lt!303944) (_2!9103 lt!303942))))))

(declare-fun readBitPure!0 (BitStream!7972) tuple2!16918)

(declare-fun readerFrom!0 (BitStream!7972 (_ BitVec 32) (_ BitVec 32)) BitStream!7972)

(assert (=> b!195583 (= lt!303944 (readBitPure!0 (readerFrom!0 (_2!9103 lt!303942) (currentBit!9215 thiss!1204) (currentByte!9220 thiss!1204))))))

(declare-fun b!195584 () Bool)

(declare-fun res!163614 () Bool)

(declare-fun e!134474 () Bool)

(assert (=> b!195584 (=> (not res!163614) (not e!134474))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!195584 (= res!163614 (validate_offset_bits!1 ((_ sign_extend 32) (size!4432 (buf!4918 thiss!1204))) ((_ sign_extend 32) (currentByte!9220 thiss!1204)) ((_ sign_extend 32) (currentBit!9215 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!195585 () Bool)

(assert (=> b!195585 (= e!134474 (not true))))

(declare-fun lt!303943 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!195585 (= lt!303943 (bitIndex!0 (size!4432 (buf!4918 (_2!9103 lt!303942))) (currentByte!9220 (_2!9103 lt!303942)) (currentBit!9215 (_2!9103 lt!303942))))))

(declare-fun lt!303945 () (_ BitVec 64))

(assert (=> b!195585 (= lt!303945 (bitIndex!0 (size!4432 (buf!4918 thiss!1204)) (currentByte!9220 thiss!1204) (currentBit!9215 thiss!1204)))))

(declare-fun e!134473 () Bool)

(assert (=> b!195585 e!134473))

(declare-fun res!163610 () Bool)

(assert (=> b!195585 (=> (not res!163610) (not e!134473))))

(assert (=> b!195585 (= res!163610 (= (size!4432 (buf!4918 thiss!1204)) (size!4432 (buf!4918 (_2!9103 lt!303942)))))))

(declare-fun appendBit!0 (BitStream!7972 Bool) tuple2!16916)

(assert (=> b!195585 (= lt!303942 (appendBit!0 thiss!1204 lt!303946))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!195585 (= lt!303946 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!195586 () Bool)

(declare-fun res!163613 () Bool)

(assert (=> b!195586 (=> (not res!163613) (not e!134474))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!195586 (= res!163613 (invariant!0 (currentBit!9215 thiss!1204) (currentByte!9220 thiss!1204) (size!4432 (buf!4918 thiss!1204))))))

(declare-fun b!195587 () Bool)

(declare-fun e!134475 () Bool)

(declare-fun array_inv!4173 (array!10049) Bool)

(assert (=> b!195587 (= e!134475 (array_inv!4173 (buf!4918 thiss!1204)))))

(declare-fun res!163611 () Bool)

(assert (=> start!41612 (=> (not res!163611) (not e!134474))))

(assert (=> start!41612 (= res!163611 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41612 e!134474))

(assert (=> start!41612 true))

(declare-fun inv!12 (BitStream!7972) Bool)

(assert (=> start!41612 (and (inv!12 thiss!1204) e!134475)))

(declare-fun b!195588 () Bool)

(declare-fun lt!303941 () (_ BitVec 64))

(assert (=> b!195588 (= e!134476 (= (bitIndex!0 (size!4432 (buf!4918 (_1!9104 lt!303944))) (currentByte!9220 (_1!9104 lt!303944)) (currentBit!9215 (_1!9104 lt!303944))) lt!303941))))

(declare-fun b!195589 () Bool)

(assert (=> b!195589 (= e!134473 e!134472)))

(declare-fun res!163607 () Bool)

(assert (=> b!195589 (=> (not res!163607) (not e!134472))))

(declare-fun lt!303940 () (_ BitVec 64))

(assert (=> b!195589 (= res!163607 (= lt!303941 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!303940)))))

(assert (=> b!195589 (= lt!303941 (bitIndex!0 (size!4432 (buf!4918 (_2!9103 lt!303942))) (currentByte!9220 (_2!9103 lt!303942)) (currentBit!9215 (_2!9103 lt!303942))))))

(assert (=> b!195589 (= lt!303940 (bitIndex!0 (size!4432 (buf!4918 thiss!1204)) (currentByte!9220 thiss!1204) (currentBit!9215 thiss!1204)))))

(declare-fun b!195590 () Bool)

(declare-fun res!163608 () Bool)

(assert (=> b!195590 (=> (not res!163608) (not e!134474))))

(assert (=> b!195590 (= res!163608 (not (= i!590 nBits!348)))))

(assert (= (and start!41612 res!163611) b!195584))

(assert (= (and b!195584 res!163614) b!195586))

(assert (= (and b!195586 res!163613) b!195590))

(assert (= (and b!195590 res!163608) b!195585))

(assert (= (and b!195585 res!163610) b!195589))

(assert (= (and b!195589 res!163607) b!195582))

(assert (= (and b!195582 res!163612) b!195583))

(assert (= (and b!195583 res!163609) b!195588))

(assert (= start!41612 b!195587))

(declare-fun m!302759 () Bool)

(assert (=> b!195582 m!302759))

(declare-fun m!302761 () Bool)

(assert (=> b!195587 m!302761))

(declare-fun m!302763 () Bool)

(assert (=> start!41612 m!302763))

(declare-fun m!302765 () Bool)

(assert (=> b!195583 m!302765))

(assert (=> b!195583 m!302765))

(declare-fun m!302767 () Bool)

(assert (=> b!195583 m!302767))

(declare-fun m!302769 () Bool)

(assert (=> b!195588 m!302769))

(declare-fun m!302771 () Bool)

(assert (=> b!195585 m!302771))

(declare-fun m!302773 () Bool)

(assert (=> b!195585 m!302773))

(declare-fun m!302775 () Bool)

(assert (=> b!195585 m!302775))

(assert (=> b!195589 m!302771))

(assert (=> b!195589 m!302773))

(declare-fun m!302777 () Bool)

(assert (=> b!195586 m!302777))

(declare-fun m!302779 () Bool)

(assert (=> b!195584 m!302779))

(push 1)

(assert (not b!195585))

(assert (not b!195589))

(assert (not b!195584))

(assert (not b!195587))

(assert (not b!195583))

(assert (not start!41612))

(assert (not b!195588))

(assert (not b!195586))

(assert (not b!195582))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

