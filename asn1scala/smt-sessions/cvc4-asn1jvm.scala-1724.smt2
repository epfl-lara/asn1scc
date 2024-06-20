; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47610 () Bool)

(assert start!47610)

(declare-fun b!226757 () Bool)

(declare-fun e!155057 () Bool)

(declare-fun lt!361504 () (_ BitVec 64))

(assert (=> b!226757 (= e!155057 (not (or (= lt!361504 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!361504) lt!361504)))))))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun i!761 () (_ BitVec 32))

(assert (=> b!226757 (= lt!361504 ((_ sign_extend 32) (bvsub to!496 i!761)))))

(declare-fun e!155058 () Bool)

(assert (=> b!226757 e!155058))

(declare-fun res!190263 () Bool)

(assert (=> b!226757 (=> (not res!190263) (not e!155058))))

(declare-fun lt!361509 () (_ BitVec 64))

(declare-fun lt!361507 () (_ BitVec 64))

(assert (=> b!226757 (= res!190263 (= lt!361509 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!361507)))))

(declare-datatypes ((array!11355 0))(
  ( (array!11356 (arr!5949 (Array (_ BitVec 32) (_ BitVec 8))) (size!4980 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9056 0))(
  ( (BitStream!9057 (buf!5521 array!11355) (currentByte!10347 (_ BitVec 32)) (currentBit!10342 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!19458 0))(
  ( (tuple2!19459 (_1!10542 (_ BitVec 8)) (_2!10542 BitStream!9056)) )
))
(declare-fun lt!361505 () tuple2!19458)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!226757 (= lt!361509 (bitIndex!0 (size!4980 (buf!5521 (_2!10542 lt!361505))) (currentByte!10347 (_2!10542 lt!361505)) (currentBit!10342 (_2!10542 lt!361505))))))

(declare-fun thiss!1870 () BitStream!9056)

(assert (=> b!226757 (= lt!361507 (bitIndex!0 (size!4980 (buf!5521 thiss!1870)) (currentByte!10347 thiss!1870) (currentBit!10342 thiss!1870)))))

(declare-datatypes ((Unit!16837 0))(
  ( (Unit!16838) )
))
(declare-datatypes ((tuple3!1342 0))(
  ( (tuple3!1343 (_1!10543 Unit!16837) (_2!10543 BitStream!9056) (_3!813 array!11355)) )
))
(declare-fun lt!361506 () tuple3!1342)

(declare-fun arr!308 () array!11355)

(declare-fun readByteArrayLoop!0 (BitStream!9056 array!11355 (_ BitVec 32) (_ BitVec 32)) tuple3!1342)

(assert (=> b!226757 (= lt!361506 (readByteArrayLoop!0 (_2!10542 lt!361505) (array!11356 (store (arr!5949 arr!308) i!761 (_1!10542 lt!361505)) (size!4980 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!361503 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226757 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4980 (buf!5521 (_2!10542 lt!361505)))) ((_ sign_extend 32) (currentByte!10347 (_2!10542 lt!361505))) ((_ sign_extend 32) (currentBit!10342 (_2!10542 lt!361505))) lt!361503)))

(assert (=> b!226757 (= lt!361503 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!361508 () Unit!16837)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9056 BitStream!9056 (_ BitVec 64) (_ BitVec 32)) Unit!16837)

(assert (=> b!226757 (= lt!361508 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10542 lt!361505) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!9056) tuple2!19458)

(assert (=> b!226757 (= lt!361505 (readByte!0 thiss!1870))))

(declare-fun b!226758 () Bool)

(declare-fun res!190261 () Bool)

(assert (=> b!226758 (=> (not res!190261) (not e!155057))))

(assert (=> b!226758 (= res!190261 (bvslt i!761 to!496))))

(declare-fun b!226759 () Bool)

(assert (=> b!226759 (= e!155058 (= (bvadd lt!361509 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!361503))) (bitIndex!0 (size!4980 (buf!5521 (_2!10543 lt!361506))) (currentByte!10347 (_2!10543 lt!361506)) (currentBit!10342 (_2!10543 lt!361506)))))))

(declare-fun b!226760 () Bool)

(declare-fun e!155055 () Bool)

(declare-fun array_inv!4721 (array!11355) Bool)

(assert (=> b!226760 (= e!155055 (array_inv!4721 (buf!5521 thiss!1870)))))

(declare-fun res!190264 () Bool)

(assert (=> start!47610 (=> (not res!190264) (not e!155057))))

(assert (=> start!47610 (= res!190264 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4980 arr!308))))))

(assert (=> start!47610 e!155057))

(assert (=> start!47610 true))

(assert (=> start!47610 (array_inv!4721 arr!308)))

(declare-fun inv!12 (BitStream!9056) Bool)

(assert (=> start!47610 (and (inv!12 thiss!1870) e!155055)))

(declare-fun b!226761 () Bool)

(declare-fun res!190262 () Bool)

(assert (=> b!226761 (=> (not res!190262) (not e!155057))))

(assert (=> b!226761 (= res!190262 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4980 (buf!5521 thiss!1870))) ((_ sign_extend 32) (currentByte!10347 thiss!1870)) ((_ sign_extend 32) (currentBit!10342 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!47610 res!190264) b!226761))

(assert (= (and b!226761 res!190262) b!226758))

(assert (= (and b!226758 res!190261) b!226757))

(assert (= (and b!226757 res!190263) b!226759))

(assert (= start!47610 b!226760))

(declare-fun m!348427 () Bool)

(assert (=> b!226761 m!348427))

(declare-fun m!348429 () Bool)

(assert (=> b!226760 m!348429))

(declare-fun m!348431 () Bool)

(assert (=> b!226757 m!348431))

(declare-fun m!348433 () Bool)

(assert (=> b!226757 m!348433))

(declare-fun m!348435 () Bool)

(assert (=> b!226757 m!348435))

(declare-fun m!348437 () Bool)

(assert (=> b!226757 m!348437))

(declare-fun m!348439 () Bool)

(assert (=> b!226757 m!348439))

(declare-fun m!348441 () Bool)

(assert (=> b!226757 m!348441))

(declare-fun m!348443 () Bool)

(assert (=> b!226757 m!348443))

(declare-fun m!348445 () Bool)

(assert (=> b!226759 m!348445))

(declare-fun m!348447 () Bool)

(assert (=> start!47610 m!348447))

(declare-fun m!348449 () Bool)

(assert (=> start!47610 m!348449))

(push 1)

(assert (not start!47610))

(assert (not b!226761))

(assert (not b!226759))

(assert (not b!226757))

(assert (not b!226760))

(check-sat)

(pop 1)

(push 1)

(check-sat)

