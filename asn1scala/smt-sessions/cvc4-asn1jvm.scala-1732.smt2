; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47742 () Bool)

(assert start!47742)

(declare-fun b!227261 () Bool)

(declare-fun e!155493 () Bool)

(declare-fun i!761 () (_ BitVec 32))

(declare-datatypes ((array!11409 0))(
  ( (array!11410 (arr!5979 (Array (_ BitVec 32) (_ BitVec 8))) (size!5004 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11409)

(assert (=> b!227261 (= e!155493 (not (or (bvsgt i!761 (bvadd #b00000000000000000000000000000001 i!761)) (and (bvsle i!761 (size!5004 arr!308)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) (size!5004 arr!308))))))))

(declare-fun lt!363097 () array!11409)

(declare-fun arrayRangesEq!840 (array!11409 array!11409 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227261 (arrayRangesEq!840 arr!308 lt!363097 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((BitStream!9104 0))(
  ( (BitStream!9105 (buf!5545 array!11409) (currentByte!10383 (_ BitVec 32)) (currentBit!10378 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!19530 0))(
  ( (tuple2!19531 (_1!10602 (_ BitVec 8)) (_2!10602 BitStream!9104)) )
))
(declare-fun lt!363096 () tuple2!19530)

(declare-datatypes ((Unit!16951 0))(
  ( (Unit!16952) )
))
(declare-fun lt!363100 () Unit!16951)

(declare-fun arrayUpdatedAtPrefixLemma!399 (array!11409 (_ BitVec 32) (_ BitVec 8)) Unit!16951)

(assert (=> b!227261 (= lt!363100 (arrayUpdatedAtPrefixLemma!399 arr!308 i!761 (_1!10602 lt!363096)))))

(declare-fun lt!363101 () (_ BitVec 64))

(declare-fun lt!363098 () (_ BitVec 32))

(declare-datatypes ((tuple3!1390 0))(
  ( (tuple3!1391 (_1!10603 Unit!16951) (_2!10603 BitStream!9104) (_3!837 array!11409)) )
))
(declare-fun lt!363099 () tuple3!1390)

(declare-fun lt!363095 () (_ BitVec 64))

(declare-fun thiss!1870 () BitStream!9104)

(declare-fun to!496 () (_ BitVec 32))

(declare-fun lt!363094 () (_ BitVec 64))

(assert (=> b!227261 (and (= (bvadd lt!363095 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!363098))) lt!363094) (= (bvadd lt!363101 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!363094) (= (buf!5545 thiss!1870) (buf!5545 (_2!10603 lt!363099))) (= (size!5004 arr!308) (size!5004 (_3!837 lt!363099))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227261 (= lt!363094 (bitIndex!0 (size!5004 (buf!5545 (_2!10603 lt!363099))) (currentByte!10383 (_2!10603 lt!363099)) (currentBit!10378 (_2!10603 lt!363099))))))

(assert (=> b!227261 (= lt!363095 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!363101))))

(assert (=> b!227261 (= lt!363095 (bitIndex!0 (size!5004 (buf!5545 (_2!10602 lt!363096))) (currentByte!10383 (_2!10602 lt!363096)) (currentBit!10378 (_2!10602 lt!363096))))))

(assert (=> b!227261 (= lt!363101 (bitIndex!0 (size!5004 (buf!5545 thiss!1870)) (currentByte!10383 thiss!1870) (currentBit!10378 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9104 array!11409 (_ BitVec 32) (_ BitVec 32)) tuple3!1390)

(assert (=> b!227261 (= lt!363099 (readByteArrayLoop!0 (_2!10602 lt!363096) lt!363097 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227261 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5004 (buf!5545 (_2!10602 lt!363096)))) ((_ sign_extend 32) (currentByte!10383 (_2!10602 lt!363096))) ((_ sign_extend 32) (currentBit!10378 (_2!10602 lt!363096))) lt!363098)))

(assert (=> b!227261 (= lt!363098 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!363102 () Unit!16951)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9104 BitStream!9104 (_ BitVec 64) (_ BitVec 32)) Unit!16951)

(assert (=> b!227261 (= lt!363102 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10602 lt!363096) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227261 (= lt!363097 (array!11410 (store (arr!5979 arr!308) i!761 (_1!10602 lt!363096)) (size!5004 arr!308)))))

(declare-fun readByte!0 (BitStream!9104) tuple2!19530)

(assert (=> b!227261 (= lt!363096 (readByte!0 thiss!1870))))

(declare-fun res!190661 () Bool)

(assert (=> start!47742 (=> (not res!190661) (not e!155493))))

(assert (=> start!47742 (= res!190661 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5004 arr!308))))))

(assert (=> start!47742 e!155493))

(assert (=> start!47742 true))

(declare-fun array_inv!4745 (array!11409) Bool)

(assert (=> start!47742 (array_inv!4745 arr!308)))

(declare-fun e!155491 () Bool)

(declare-fun inv!12 (BitStream!9104) Bool)

(assert (=> start!47742 (and (inv!12 thiss!1870) e!155491)))

(declare-fun b!227262 () Bool)

(assert (=> b!227262 (= e!155491 (array_inv!4745 (buf!5545 thiss!1870)))))

(declare-fun b!227260 () Bool)

(declare-fun res!190662 () Bool)

(assert (=> b!227260 (=> (not res!190662) (not e!155493))))

(assert (=> b!227260 (= res!190662 (bvslt i!761 to!496))))

(declare-fun b!227259 () Bool)

(declare-fun res!190663 () Bool)

(assert (=> b!227259 (=> (not res!190663) (not e!155493))))

(assert (=> b!227259 (= res!190663 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5004 (buf!5545 thiss!1870))) ((_ sign_extend 32) (currentByte!10383 thiss!1870)) ((_ sign_extend 32) (currentBit!10378 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!47742 res!190661) b!227259))

(assert (= (and b!227259 res!190663) b!227260))

(assert (= (and b!227260 res!190662) b!227261))

(assert (= start!47742 b!227262))

(declare-fun m!349443 () Bool)

(assert (=> b!227261 m!349443))

(declare-fun m!349445 () Bool)

(assert (=> b!227261 m!349445))

(declare-fun m!349447 () Bool)

(assert (=> b!227261 m!349447))

(declare-fun m!349449 () Bool)

(assert (=> b!227261 m!349449))

(declare-fun m!349451 () Bool)

(assert (=> b!227261 m!349451))

(declare-fun m!349453 () Bool)

(assert (=> b!227261 m!349453))

(declare-fun m!349455 () Bool)

(assert (=> b!227261 m!349455))

(declare-fun m!349457 () Bool)

(assert (=> b!227261 m!349457))

(declare-fun m!349459 () Bool)

(assert (=> b!227261 m!349459))

(declare-fun m!349461 () Bool)

(assert (=> b!227261 m!349461))

(declare-fun m!349463 () Bool)

(assert (=> start!47742 m!349463))

(declare-fun m!349465 () Bool)

(assert (=> start!47742 m!349465))

(declare-fun m!349467 () Bool)

(assert (=> b!227262 m!349467))

(declare-fun m!349469 () Bool)

(assert (=> b!227259 m!349469))

(push 1)

(assert (not b!227261))

(assert (not b!227262))

(assert (not start!47742))

(assert (not b!227259))

(check-sat)

(pop 1)

(push 1)

(check-sat)

