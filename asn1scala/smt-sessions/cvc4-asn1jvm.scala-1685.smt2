; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46764 () Bool)

(assert start!46764)

(declare-fun res!188305 () Bool)

(declare-fun e!152905 () Bool)

(assert (=> start!46764 (=> (not res!188305) (not e!152905))))

(declare-datatypes ((array!11080 0))(
  ( (array!11081 (arr!5811 (Array (_ BitVec 32) (_ BitVec 8))) (size!4863 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11080)

(declare-fun to!496 () (_ BitVec 32))

(declare-fun i!761 () (_ BitVec 32))

(assert (=> start!46764 (= res!188305 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4863 arr!308))))))

(assert (=> start!46764 e!152905))

(assert (=> start!46764 true))

(declare-fun array_inv!4604 (array!11080) Bool)

(assert (=> start!46764 (array_inv!4604 arr!308)))

(declare-datatypes ((BitStream!8828 0))(
  ( (BitStream!8829 (buf!5407 array!11080) (currentByte!10135 (_ BitVec 32)) (currentBit!10130 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8828)

(declare-fun e!152903 () Bool)

(declare-fun inv!12 (BitStream!8828) Bool)

(assert (=> start!46764 (and (inv!12 thiss!1870) e!152903)))

(declare-fun b!224363 () Bool)

(declare-fun res!188306 () Bool)

(assert (=> b!224363 (=> (not res!188306) (not e!152905))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224363 (= res!188306 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4863 (buf!5407 thiss!1870))) ((_ sign_extend 32) (currentByte!10135 thiss!1870)) ((_ sign_extend 32) (currentBit!10130 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!224364 () Bool)

(declare-fun res!188307 () Bool)

(assert (=> b!224364 (=> (not res!188307) (not e!152905))))

(assert (=> b!224364 (= res!188307 (bvslt i!761 to!496))))

(declare-fun b!224365 () Bool)

(assert (=> b!224365 (= e!152905 (not true))))

(declare-datatypes ((Unit!16395 0))(
  ( (Unit!16396) )
))
(declare-datatypes ((tuple3!1252 0))(
  ( (tuple3!1253 (_1!10375 Unit!16395) (_2!10375 BitStream!8828) (_3!768 array!11080)) )
))
(declare-fun lt!356099 () tuple3!1252)

(declare-fun arrayRangesEq!759 (array!11080 array!11080 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224365 (arrayRangesEq!759 arr!308 (_3!768 lt!356099) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!356097 () array!11080)

(declare-fun lt!356105 () Unit!16395)

(declare-fun arrayRangesEqTransitive!230 (array!11080 array!11080 array!11080 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16395)

(assert (=> b!224365 (= lt!356105 (arrayRangesEqTransitive!230 arr!308 lt!356097 (_3!768 lt!356099) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224365 (arrayRangesEq!759 arr!308 lt!356097 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((tuple2!19214 0))(
  ( (tuple2!19215 (_1!10376 (_ BitVec 8)) (_2!10376 BitStream!8828)) )
))
(declare-fun lt!356101 () tuple2!19214)

(declare-fun lt!356103 () Unit!16395)

(declare-fun arrayUpdatedAtPrefixLemma!351 (array!11080 (_ BitVec 32) (_ BitVec 8)) Unit!16395)

(assert (=> b!224365 (= lt!356103 (arrayUpdatedAtPrefixLemma!351 arr!308 i!761 (_1!10376 lt!356101)))))

(declare-fun lt!356102 () (_ BitVec 64))

(declare-fun lt!356098 () (_ BitVec 64))

(declare-fun lt!356100 () (_ BitVec 64))

(declare-fun lt!356106 () (_ BitVec 32))

(assert (=> b!224365 (and (= (bvadd lt!356100 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!356106))) lt!356102) (= (bvadd lt!356098 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!356102) (= (buf!5407 thiss!1870) (buf!5407 (_2!10375 lt!356099))) (= (size!4863 arr!308) (size!4863 (_3!768 lt!356099))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224365 (= lt!356102 (bitIndex!0 (size!4863 (buf!5407 (_2!10375 lt!356099))) (currentByte!10135 (_2!10375 lt!356099)) (currentBit!10130 (_2!10375 lt!356099))))))

(assert (=> b!224365 (= lt!356100 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!356098))))

(assert (=> b!224365 (= lt!356100 (bitIndex!0 (size!4863 (buf!5407 (_2!10376 lt!356101))) (currentByte!10135 (_2!10376 lt!356101)) (currentBit!10130 (_2!10376 lt!356101))))))

(assert (=> b!224365 (= lt!356098 (bitIndex!0 (size!4863 (buf!5407 thiss!1870)) (currentByte!10135 thiss!1870) (currentBit!10130 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8828 array!11080 (_ BitVec 32) (_ BitVec 32)) tuple3!1252)

(assert (=> b!224365 (= lt!356099 (readByteArrayLoop!0 (_2!10376 lt!356101) lt!356097 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!224365 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4863 (buf!5407 (_2!10376 lt!356101)))) ((_ sign_extend 32) (currentByte!10135 (_2!10376 lt!356101))) ((_ sign_extend 32) (currentBit!10130 (_2!10376 lt!356101))) lt!356106)))

(assert (=> b!224365 (= lt!356106 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!356104 () Unit!16395)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8828 BitStream!8828 (_ BitVec 64) (_ BitVec 32)) Unit!16395)

(assert (=> b!224365 (= lt!356104 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10376 lt!356101) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224365 (= lt!356097 (array!11081 (store (arr!5811 arr!308) i!761 (_1!10376 lt!356101)) (size!4863 arr!308)))))

(declare-fun readByte!0 (BitStream!8828) tuple2!19214)

(assert (=> b!224365 (= lt!356101 (readByte!0 thiss!1870))))

(declare-fun b!224366 () Bool)

(assert (=> b!224366 (= e!152903 (array_inv!4604 (buf!5407 thiss!1870)))))

(assert (= (and start!46764 res!188305) b!224363))

(assert (= (and b!224363 res!188306) b!224364))

(assert (= (and b!224364 res!188307) b!224365))

(assert (= start!46764 b!224366))

(declare-fun m!344439 () Bool)

(assert (=> start!46764 m!344439))

(declare-fun m!344441 () Bool)

(assert (=> start!46764 m!344441))

(declare-fun m!344443 () Bool)

(assert (=> b!224363 m!344443))

(declare-fun m!344445 () Bool)

(assert (=> b!224365 m!344445))

(declare-fun m!344447 () Bool)

(assert (=> b!224365 m!344447))

(declare-fun m!344449 () Bool)

(assert (=> b!224365 m!344449))

(declare-fun m!344451 () Bool)

(assert (=> b!224365 m!344451))

(declare-fun m!344453 () Bool)

(assert (=> b!224365 m!344453))

(declare-fun m!344455 () Bool)

(assert (=> b!224365 m!344455))

(declare-fun m!344457 () Bool)

(assert (=> b!224365 m!344457))

(declare-fun m!344459 () Bool)

(assert (=> b!224365 m!344459))

(declare-fun m!344461 () Bool)

(assert (=> b!224365 m!344461))

(declare-fun m!344463 () Bool)

(assert (=> b!224365 m!344463))

(declare-fun m!344465 () Bool)

(assert (=> b!224365 m!344465))

(declare-fun m!344467 () Bool)

(assert (=> b!224365 m!344467))

(declare-fun m!344469 () Bool)

(assert (=> b!224366 m!344469))

(push 1)

