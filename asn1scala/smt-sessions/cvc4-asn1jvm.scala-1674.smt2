; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46698 () Bool)

(assert start!46698)

(declare-fun b!223969 () Bool)

(declare-fun e!152509 () Bool)

(assert (=> b!223969 (= e!152509 (not true))))

(declare-datatypes ((array!11014 0))(
  ( (array!11015 (arr!5778 (Array (_ BitVec 32) (_ BitVec 8))) (size!4830 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11014)

(declare-fun lt!355141 () array!11014)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun arrayRangesEq!726 (array!11014 array!11014 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!223969 (arrayRangesEq!726 arr!308 lt!355141 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!16329 0))(
  ( (Unit!16330) )
))
(declare-fun lt!355142 () Unit!16329)

(declare-datatypes ((BitStream!8762 0))(
  ( (BitStream!8763 (buf!5374 array!11014) (currentByte!10102 (_ BitVec 32)) (currentBit!10097 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!19148 0))(
  ( (tuple2!19149 (_1!10309 (_ BitVec 8)) (_2!10309 BitStream!8762)) )
))
(declare-fun lt!355135 () tuple2!19148)

(declare-fun arrayUpdatedAtPrefixLemma!318 (array!11014 (_ BitVec 32) (_ BitVec 8)) Unit!16329)

(assert (=> b!223969 (= lt!355142 (arrayUpdatedAtPrefixLemma!318 arr!308 i!761 (_1!10309 lt!355135)))))

(declare-datatypes ((tuple3!1186 0))(
  ( (tuple3!1187 (_1!10310 Unit!16329) (_2!10310 BitStream!8762) (_3!735 array!11014)) )
))
(declare-fun lt!355138 () tuple3!1186)

(declare-fun thiss!1870 () BitStream!8762)

(declare-fun lt!355140 () (_ BitVec 64))

(declare-fun lt!355136 () (_ BitVec 64))

(declare-fun lt!355143 () (_ BitVec 32))

(declare-fun lt!355137 () (_ BitVec 64))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!223969 (and (= (bvadd lt!355140 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!355143))) lt!355137) (= (bvadd lt!355136 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!355137) (= (buf!5374 thiss!1870) (buf!5374 (_2!10310 lt!355138))) (= (size!4830 arr!308) (size!4830 (_3!735 lt!355138))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!223969 (= lt!355137 (bitIndex!0 (size!4830 (buf!5374 (_2!10310 lt!355138))) (currentByte!10102 (_2!10310 lt!355138)) (currentBit!10097 (_2!10310 lt!355138))))))

(assert (=> b!223969 (= lt!355140 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!355136))))

(assert (=> b!223969 (= lt!355140 (bitIndex!0 (size!4830 (buf!5374 (_2!10309 lt!355135))) (currentByte!10102 (_2!10309 lt!355135)) (currentBit!10097 (_2!10309 lt!355135))))))

(assert (=> b!223969 (= lt!355136 (bitIndex!0 (size!4830 (buf!5374 thiss!1870)) (currentByte!10102 thiss!1870) (currentBit!10097 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8762 array!11014 (_ BitVec 32) (_ BitVec 32)) tuple3!1186)

(assert (=> b!223969 (= lt!355138 (readByteArrayLoop!0 (_2!10309 lt!355135) lt!355141 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!223969 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4830 (buf!5374 (_2!10309 lt!355135)))) ((_ sign_extend 32) (currentByte!10102 (_2!10309 lt!355135))) ((_ sign_extend 32) (currentBit!10097 (_2!10309 lt!355135))) lt!355143)))

(assert (=> b!223969 (= lt!355143 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!355139 () Unit!16329)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8762 BitStream!8762 (_ BitVec 64) (_ BitVec 32)) Unit!16329)

(assert (=> b!223969 (= lt!355139 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10309 lt!355135) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!223969 (= lt!355141 (array!11015 (store (arr!5778 arr!308) i!761 (_1!10309 lt!355135)) (size!4830 arr!308)))))

(declare-fun readByte!0 (BitStream!8762) tuple2!19148)

(assert (=> b!223969 (= lt!355135 (readByte!0 thiss!1870))))

(declare-fun res!188009 () Bool)

(assert (=> start!46698 (=> (not res!188009) (not e!152509))))

(assert (=> start!46698 (= res!188009 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4830 arr!308))))))

(assert (=> start!46698 e!152509))

(assert (=> start!46698 true))

(declare-fun array_inv!4571 (array!11014) Bool)

(assert (=> start!46698 (array_inv!4571 arr!308)))

(declare-fun e!152510 () Bool)

(declare-fun inv!12 (BitStream!8762) Bool)

(assert (=> start!46698 (and (inv!12 thiss!1870) e!152510)))

(declare-fun b!223970 () Bool)

(assert (=> b!223970 (= e!152510 (array_inv!4571 (buf!5374 thiss!1870)))))

(declare-fun b!223967 () Bool)

(declare-fun res!188008 () Bool)

(assert (=> b!223967 (=> (not res!188008) (not e!152509))))

(assert (=> b!223967 (= res!188008 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4830 (buf!5374 thiss!1870))) ((_ sign_extend 32) (currentByte!10102 thiss!1870)) ((_ sign_extend 32) (currentBit!10097 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!223968 () Bool)

(declare-fun res!188010 () Bool)

(assert (=> b!223968 (=> (not res!188010) (not e!152509))))

(assert (=> b!223968 (= res!188010 (bvslt i!761 to!496))))

(assert (= (and start!46698 res!188009) b!223967))

(assert (= (and b!223967 res!188008) b!223968))

(assert (= (and b!223968 res!188010) b!223969))

(assert (= start!46698 b!223970))

(declare-fun m!343423 () Bool)

(assert (=> b!223969 m!343423))

(declare-fun m!343425 () Bool)

(assert (=> b!223969 m!343425))

(declare-fun m!343427 () Bool)

(assert (=> b!223969 m!343427))

(declare-fun m!343429 () Bool)

(assert (=> b!223969 m!343429))

(declare-fun m!343431 () Bool)

(assert (=> b!223969 m!343431))

(declare-fun m!343433 () Bool)

(assert (=> b!223969 m!343433))

(declare-fun m!343435 () Bool)

(assert (=> b!223969 m!343435))

(declare-fun m!343437 () Bool)

(assert (=> b!223969 m!343437))

(declare-fun m!343439 () Bool)

(assert (=> b!223969 m!343439))

(declare-fun m!343441 () Bool)

(assert (=> b!223969 m!343441))

(declare-fun m!343443 () Bool)

(assert (=> start!46698 m!343443))

(declare-fun m!343445 () Bool)

(assert (=> start!46698 m!343445))

(declare-fun m!343447 () Bool)

(assert (=> b!223970 m!343447))

(declare-fun m!343449 () Bool)

(assert (=> b!223967 m!343449))

(push 1)

