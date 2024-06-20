; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46760 () Bool)

(assert start!46760)

(declare-fun b!224339 () Bool)

(declare-fun res!188288 () Bool)

(declare-fun e!152882 () Bool)

(assert (=> b!224339 (=> (not res!188288) (not e!152882))))

(declare-datatypes ((array!11076 0))(
  ( (array!11077 (arr!5809 (Array (_ BitVec 32) (_ BitVec 8))) (size!4861 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8824 0))(
  ( (BitStream!8825 (buf!5405 array!11076) (currentByte!10133 (_ BitVec 32)) (currentBit!10128 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8824)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224339 (= res!188288 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4861 (buf!5405 thiss!1870))) ((_ sign_extend 32) (currentByte!10133 thiss!1870)) ((_ sign_extend 32) (currentBit!10128 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!224342 () Bool)

(declare-fun e!152881 () Bool)

(declare-fun array_inv!4602 (array!11076) Bool)

(assert (=> b!224342 (= e!152881 (array_inv!4602 (buf!5405 thiss!1870)))))

(declare-fun res!188287 () Bool)

(assert (=> start!46760 (=> (not res!188287) (not e!152882))))

(declare-fun arr!308 () array!11076)

(assert (=> start!46760 (= res!188287 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4861 arr!308))))))

(assert (=> start!46760 e!152882))

(assert (=> start!46760 true))

(assert (=> start!46760 (array_inv!4602 arr!308)))

(declare-fun inv!12 (BitStream!8824) Bool)

(assert (=> start!46760 (and (inv!12 thiss!1870) e!152881)))

(declare-fun b!224340 () Bool)

(declare-fun res!188289 () Bool)

(assert (=> b!224340 (=> (not res!188289) (not e!152882))))

(assert (=> b!224340 (= res!188289 (bvslt i!761 to!496))))

(declare-fun b!224341 () Bool)

(assert (=> b!224341 (= e!152882 (not true))))

(declare-datatypes ((Unit!16391 0))(
  ( (Unit!16392) )
))
(declare-datatypes ((tuple3!1248 0))(
  ( (tuple3!1249 (_1!10371 Unit!16391) (_2!10371 BitStream!8824) (_3!766 array!11076)) )
))
(declare-fun lt!356041 () tuple3!1248)

(declare-fun arrayRangesEq!757 (array!11076 array!11076 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224341 (arrayRangesEq!757 arr!308 (_3!766 lt!356041) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!356044 () array!11076)

(declare-fun lt!356043 () Unit!16391)

(declare-fun arrayRangesEqTransitive!228 (array!11076 array!11076 array!11076 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16391)

(assert (=> b!224341 (= lt!356043 (arrayRangesEqTransitive!228 arr!308 lt!356044 (_3!766 lt!356041) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224341 (arrayRangesEq!757 arr!308 lt!356044 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!356042 () Unit!16391)

(declare-datatypes ((tuple2!19210 0))(
  ( (tuple2!19211 (_1!10372 (_ BitVec 8)) (_2!10372 BitStream!8824)) )
))
(declare-fun lt!356040 () tuple2!19210)

(declare-fun arrayUpdatedAtPrefixLemma!349 (array!11076 (_ BitVec 32) (_ BitVec 8)) Unit!16391)

(assert (=> b!224341 (= lt!356042 (arrayUpdatedAtPrefixLemma!349 arr!308 i!761 (_1!10372 lt!356040)))))

(declare-fun lt!356046 () (_ BitVec 64))

(declare-fun lt!356039 () (_ BitVec 32))

(declare-fun lt!356037 () (_ BitVec 64))

(declare-fun lt!356045 () (_ BitVec 64))

(assert (=> b!224341 (and (= (bvadd lt!356045 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!356039))) lt!356037) (= (bvadd lt!356046 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!356037) (= (buf!5405 thiss!1870) (buf!5405 (_2!10371 lt!356041))) (= (size!4861 arr!308) (size!4861 (_3!766 lt!356041))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224341 (= lt!356037 (bitIndex!0 (size!4861 (buf!5405 (_2!10371 lt!356041))) (currentByte!10133 (_2!10371 lt!356041)) (currentBit!10128 (_2!10371 lt!356041))))))

(assert (=> b!224341 (= lt!356045 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!356046))))

(assert (=> b!224341 (= lt!356045 (bitIndex!0 (size!4861 (buf!5405 (_2!10372 lt!356040))) (currentByte!10133 (_2!10372 lt!356040)) (currentBit!10128 (_2!10372 lt!356040))))))

(assert (=> b!224341 (= lt!356046 (bitIndex!0 (size!4861 (buf!5405 thiss!1870)) (currentByte!10133 thiss!1870) (currentBit!10128 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8824 array!11076 (_ BitVec 32) (_ BitVec 32)) tuple3!1248)

(assert (=> b!224341 (= lt!356041 (readByteArrayLoop!0 (_2!10372 lt!356040) lt!356044 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!224341 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4861 (buf!5405 (_2!10372 lt!356040)))) ((_ sign_extend 32) (currentByte!10133 (_2!10372 lt!356040))) ((_ sign_extend 32) (currentBit!10128 (_2!10372 lt!356040))) lt!356039)))

(assert (=> b!224341 (= lt!356039 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!356038 () Unit!16391)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8824 BitStream!8824 (_ BitVec 64) (_ BitVec 32)) Unit!16391)

(assert (=> b!224341 (= lt!356038 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10372 lt!356040) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224341 (= lt!356044 (array!11077 (store (arr!5809 arr!308) i!761 (_1!10372 lt!356040)) (size!4861 arr!308)))))

(declare-fun readByte!0 (BitStream!8824) tuple2!19210)

(assert (=> b!224341 (= lt!356040 (readByte!0 thiss!1870))))

(assert (= (and start!46760 res!188287) b!224339))

(assert (= (and b!224339 res!188288) b!224340))

(assert (= (and b!224340 res!188289) b!224341))

(assert (= start!46760 b!224342))

(declare-fun m!344375 () Bool)

(assert (=> b!224339 m!344375))

(declare-fun m!344377 () Bool)

(assert (=> b!224342 m!344377))

(declare-fun m!344379 () Bool)

(assert (=> start!46760 m!344379))

(declare-fun m!344381 () Bool)

(assert (=> start!46760 m!344381))

(declare-fun m!344383 () Bool)

(assert (=> b!224341 m!344383))

(declare-fun m!344385 () Bool)

(assert (=> b!224341 m!344385))

(declare-fun m!344387 () Bool)

(assert (=> b!224341 m!344387))

(declare-fun m!344389 () Bool)

(assert (=> b!224341 m!344389))

(declare-fun m!344391 () Bool)

(assert (=> b!224341 m!344391))

(declare-fun m!344393 () Bool)

(assert (=> b!224341 m!344393))

(declare-fun m!344395 () Bool)

(assert (=> b!224341 m!344395))

(declare-fun m!344397 () Bool)

(assert (=> b!224341 m!344397))

(declare-fun m!344399 () Bool)

(assert (=> b!224341 m!344399))

(declare-fun m!344401 () Bool)

(assert (=> b!224341 m!344401))

(declare-fun m!344403 () Bool)

(assert (=> b!224341 m!344403))

(declare-fun m!344405 () Bool)

(assert (=> b!224341 m!344405))

(push 1)

(assert (not b!224339))

(assert (not b!224342))

(assert (not start!46760))

(assert (not b!224341))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

