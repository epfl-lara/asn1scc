; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47606 () Bool)

(assert start!47606)

(declare-fun b!226727 () Bool)

(declare-fun e!155026 () Bool)

(declare-fun lt!361466 () (_ BitVec 64))

(assert (=> b!226727 (= e!155026 (not (or (= lt!361466 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!361466) lt!361466)))))))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun i!761 () (_ BitVec 32))

(assert (=> b!226727 (= lt!361466 ((_ sign_extend 32) (bvsub to!496 i!761)))))

(declare-fun e!155028 () Bool)

(assert (=> b!226727 e!155028))

(declare-fun res!190240 () Bool)

(assert (=> b!226727 (=> (not res!190240) (not e!155028))))

(declare-fun lt!361464 () (_ BitVec 64))

(declare-fun lt!361463 () (_ BitVec 64))

(assert (=> b!226727 (= res!190240 (= lt!361464 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!361463)))))

(declare-datatypes ((array!11351 0))(
  ( (array!11352 (arr!5947 (Array (_ BitVec 32) (_ BitVec 8))) (size!4978 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9052 0))(
  ( (BitStream!9053 (buf!5519 array!11351) (currentByte!10345 (_ BitVec 32)) (currentBit!10340 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!19454 0))(
  ( (tuple2!19455 (_1!10538 (_ BitVec 8)) (_2!10538 BitStream!9052)) )
))
(declare-fun lt!361465 () tuple2!19454)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!226727 (= lt!361464 (bitIndex!0 (size!4978 (buf!5519 (_2!10538 lt!361465))) (currentByte!10345 (_2!10538 lt!361465)) (currentBit!10340 (_2!10538 lt!361465))))))

(declare-fun thiss!1870 () BitStream!9052)

(assert (=> b!226727 (= lt!361463 (bitIndex!0 (size!4978 (buf!5519 thiss!1870)) (currentByte!10345 thiss!1870) (currentBit!10340 thiss!1870)))))

(declare-fun arr!308 () array!11351)

(declare-datatypes ((Unit!16833 0))(
  ( (Unit!16834) )
))
(declare-datatypes ((tuple3!1338 0))(
  ( (tuple3!1339 (_1!10539 Unit!16833) (_2!10539 BitStream!9052) (_3!811 array!11351)) )
))
(declare-fun lt!361462 () tuple3!1338)

(declare-fun readByteArrayLoop!0 (BitStream!9052 array!11351 (_ BitVec 32) (_ BitVec 32)) tuple3!1338)

(assert (=> b!226727 (= lt!361462 (readByteArrayLoop!0 (_2!10538 lt!361465) (array!11352 (store (arr!5947 arr!308) i!761 (_1!10538 lt!361465)) (size!4978 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!361461 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226727 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4978 (buf!5519 (_2!10538 lt!361465)))) ((_ sign_extend 32) (currentByte!10345 (_2!10538 lt!361465))) ((_ sign_extend 32) (currentBit!10340 (_2!10538 lt!361465))) lt!361461)))

(assert (=> b!226727 (= lt!361461 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!361467 () Unit!16833)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9052 BitStream!9052 (_ BitVec 64) (_ BitVec 32)) Unit!16833)

(assert (=> b!226727 (= lt!361467 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10538 lt!361465) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!9052) tuple2!19454)

(assert (=> b!226727 (= lt!361465 (readByte!0 thiss!1870))))

(declare-fun b!226728 () Bool)

(declare-fun res!190238 () Bool)

(assert (=> b!226728 (=> (not res!190238) (not e!155026))))

(assert (=> b!226728 (= res!190238 (bvslt i!761 to!496))))

(declare-fun b!226729 () Bool)

(declare-fun res!190237 () Bool)

(assert (=> b!226729 (=> (not res!190237) (not e!155026))))

(assert (=> b!226729 (= res!190237 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4978 (buf!5519 thiss!1870))) ((_ sign_extend 32) (currentByte!10345 thiss!1870)) ((_ sign_extend 32) (currentBit!10340 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!226730 () Bool)

(declare-fun e!155025 () Bool)

(declare-fun array_inv!4719 (array!11351) Bool)

(assert (=> b!226730 (= e!155025 (array_inv!4719 (buf!5519 thiss!1870)))))

(declare-fun res!190239 () Bool)

(assert (=> start!47606 (=> (not res!190239) (not e!155026))))

(assert (=> start!47606 (= res!190239 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4978 arr!308))))))

(assert (=> start!47606 e!155026))

(assert (=> start!47606 true))

(assert (=> start!47606 (array_inv!4719 arr!308)))

(declare-fun inv!12 (BitStream!9052) Bool)

(assert (=> start!47606 (and (inv!12 thiss!1870) e!155025)))

(declare-fun b!226731 () Bool)

(assert (=> b!226731 (= e!155028 (= (bvadd lt!361464 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!361461))) (bitIndex!0 (size!4978 (buf!5519 (_2!10539 lt!361462))) (currentByte!10345 (_2!10539 lt!361462)) (currentBit!10340 (_2!10539 lt!361462)))))))

(assert (= (and start!47606 res!190239) b!226729))

(assert (= (and b!226729 res!190237) b!226728))

(assert (= (and b!226728 res!190238) b!226727))

(assert (= (and b!226727 res!190240) b!226731))

(assert (= start!47606 b!226730))

(declare-fun m!348379 () Bool)

(assert (=> b!226727 m!348379))

(declare-fun m!348381 () Bool)

(assert (=> b!226727 m!348381))

(declare-fun m!348383 () Bool)

(assert (=> b!226727 m!348383))

(declare-fun m!348385 () Bool)

(assert (=> b!226727 m!348385))

(declare-fun m!348387 () Bool)

(assert (=> b!226727 m!348387))

(declare-fun m!348389 () Bool)

(assert (=> b!226727 m!348389))

(declare-fun m!348391 () Bool)

(assert (=> b!226727 m!348391))

(declare-fun m!348393 () Bool)

(assert (=> b!226730 m!348393))

(declare-fun m!348395 () Bool)

(assert (=> start!47606 m!348395))

(declare-fun m!348397 () Bool)

(assert (=> start!47606 m!348397))

(declare-fun m!348399 () Bool)

(assert (=> b!226731 m!348399))

(declare-fun m!348401 () Bool)

(assert (=> b!226729 m!348401))

(push 1)

(assert (not b!226731))

(assert (not start!47606))

(assert (not b!226727))

(assert (not b!226730))

(assert (not b!226729))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

