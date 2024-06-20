; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47746 () Bool)

(assert start!47746)

(declare-fun b!227286 () Bool)

(declare-fun e!155516 () Bool)

(declare-datatypes ((array!11413 0))(
  ( (array!11414 (arr!5981 (Array (_ BitVec 32) (_ BitVec 8))) (size!5006 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9108 0))(
  ( (BitStream!9109 (buf!5547 array!11413) (currentByte!10385 (_ BitVec 32)) (currentBit!10380 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9108)

(declare-fun array_inv!4747 (array!11413) Bool)

(assert (=> b!227286 (= e!155516 (array_inv!4747 (buf!5547 thiss!1870)))))

(declare-fun res!190679 () Bool)

(declare-fun e!155517 () Bool)

(assert (=> start!47746 (=> (not res!190679) (not e!155517))))

(declare-fun arr!308 () array!11413)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47746 (= res!190679 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5006 arr!308))))))

(assert (=> start!47746 e!155517))

(assert (=> start!47746 true))

(assert (=> start!47746 (array_inv!4747 arr!308)))

(declare-fun inv!12 (BitStream!9108) Bool)

(assert (=> start!47746 (and (inv!12 thiss!1870) e!155516)))

(declare-fun b!227285 () Bool)

(assert (=> b!227285 (= e!155517 (not true))))

(declare-fun lt!363150 () array!11413)

(declare-fun arrayRangesEq!842 (array!11413 array!11413 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227285 (arrayRangesEq!842 arr!308 lt!363150 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!16955 0))(
  ( (Unit!16956) )
))
(declare-fun lt!363151 () Unit!16955)

(declare-datatypes ((tuple2!19534 0))(
  ( (tuple2!19535 (_1!10606 (_ BitVec 8)) (_2!10606 BitStream!9108)) )
))
(declare-fun lt!363154 () tuple2!19534)

(declare-fun arrayUpdatedAtPrefixLemma!401 (array!11413 (_ BitVec 32) (_ BitVec 8)) Unit!16955)

(assert (=> b!227285 (= lt!363151 (arrayUpdatedAtPrefixLemma!401 arr!308 i!761 (_1!10606 lt!363154)))))

(declare-fun lt!363156 () (_ BitVec 64))

(declare-datatypes ((tuple3!1394 0))(
  ( (tuple3!1395 (_1!10607 Unit!16955) (_2!10607 BitStream!9108) (_3!839 array!11413)) )
))
(declare-fun lt!363153 () tuple3!1394)

(declare-fun lt!363152 () (_ BitVec 64))

(declare-fun lt!363148 () (_ BitVec 64))

(declare-fun lt!363155 () (_ BitVec 32))

(assert (=> b!227285 (and (= (bvadd lt!363156 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!363155))) lt!363152) (= (bvadd lt!363148 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!363152) (= (buf!5547 thiss!1870) (buf!5547 (_2!10607 lt!363153))) (= (size!5006 arr!308) (size!5006 (_3!839 lt!363153))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227285 (= lt!363152 (bitIndex!0 (size!5006 (buf!5547 (_2!10607 lt!363153))) (currentByte!10385 (_2!10607 lt!363153)) (currentBit!10380 (_2!10607 lt!363153))))))

(assert (=> b!227285 (= lt!363156 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!363148))))

(assert (=> b!227285 (= lt!363156 (bitIndex!0 (size!5006 (buf!5547 (_2!10606 lt!363154))) (currentByte!10385 (_2!10606 lt!363154)) (currentBit!10380 (_2!10606 lt!363154))))))

(assert (=> b!227285 (= lt!363148 (bitIndex!0 (size!5006 (buf!5547 thiss!1870)) (currentByte!10385 thiss!1870) (currentBit!10380 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9108 array!11413 (_ BitVec 32) (_ BitVec 32)) tuple3!1394)

(assert (=> b!227285 (= lt!363153 (readByteArrayLoop!0 (_2!10606 lt!363154) lt!363150 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227285 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5006 (buf!5547 (_2!10606 lt!363154)))) ((_ sign_extend 32) (currentByte!10385 (_2!10606 lt!363154))) ((_ sign_extend 32) (currentBit!10380 (_2!10606 lt!363154))) lt!363155)))

(assert (=> b!227285 (= lt!363155 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!363149 () Unit!16955)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9108 BitStream!9108 (_ BitVec 64) (_ BitVec 32)) Unit!16955)

(assert (=> b!227285 (= lt!363149 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10606 lt!363154) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227285 (= lt!363150 (array!11414 (store (arr!5981 arr!308) i!761 (_1!10606 lt!363154)) (size!5006 arr!308)))))

(declare-fun readByte!0 (BitStream!9108) tuple2!19534)

(assert (=> b!227285 (= lt!363154 (readByte!0 thiss!1870))))

(declare-fun b!227283 () Bool)

(declare-fun res!190681 () Bool)

(assert (=> b!227283 (=> (not res!190681) (not e!155517))))

(assert (=> b!227283 (= res!190681 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5006 (buf!5547 thiss!1870))) ((_ sign_extend 32) (currentByte!10385 thiss!1870)) ((_ sign_extend 32) (currentBit!10380 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!227284 () Bool)

(declare-fun res!190680 () Bool)

(assert (=> b!227284 (=> (not res!190680) (not e!155517))))

(assert (=> b!227284 (= res!190680 (bvslt i!761 to!496))))

(assert (= (and start!47746 res!190679) b!227283))

(assert (= (and b!227283 res!190681) b!227284))

(assert (= (and b!227284 res!190680) b!227285))

(assert (= start!47746 b!227286))

(declare-fun m!349499 () Bool)

(assert (=> b!227286 m!349499))

(declare-fun m!349501 () Bool)

(assert (=> start!47746 m!349501))

(declare-fun m!349503 () Bool)

(assert (=> start!47746 m!349503))

(declare-fun m!349505 () Bool)

(assert (=> b!227285 m!349505))

(declare-fun m!349507 () Bool)

(assert (=> b!227285 m!349507))

(declare-fun m!349509 () Bool)

(assert (=> b!227285 m!349509))

(declare-fun m!349511 () Bool)

(assert (=> b!227285 m!349511))

(declare-fun m!349513 () Bool)

(assert (=> b!227285 m!349513))

(declare-fun m!349515 () Bool)

(assert (=> b!227285 m!349515))

(declare-fun m!349517 () Bool)

(assert (=> b!227285 m!349517))

(declare-fun m!349519 () Bool)

(assert (=> b!227285 m!349519))

(declare-fun m!349521 () Bool)

(assert (=> b!227285 m!349521))

(declare-fun m!349523 () Bool)

(assert (=> b!227285 m!349523))

(declare-fun m!349525 () Bool)

(assert (=> b!227283 m!349525))

(check-sat (not b!227286) (not start!47746) (not b!227285) (not b!227283))
