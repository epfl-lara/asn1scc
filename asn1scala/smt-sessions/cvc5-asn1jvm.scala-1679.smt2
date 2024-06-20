; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46724 () Bool)

(assert start!46724)

(declare-fun res!188127 () Bool)

(declare-fun e!152666 () Bool)

(assert (=> start!46724 (=> (not res!188127) (not e!152666))))

(declare-datatypes ((array!11040 0))(
  ( (array!11041 (arr!5791 (Array (_ BitVec 32) (_ BitVec 8))) (size!4843 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11040)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!46724 (= res!188127 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4843 arr!308))))))

(assert (=> start!46724 e!152666))

(assert (=> start!46724 true))

(declare-fun array_inv!4584 (array!11040) Bool)

(assert (=> start!46724 (array_inv!4584 arr!308)))

(declare-datatypes ((BitStream!8788 0))(
  ( (BitStream!8789 (buf!5387 array!11040) (currentByte!10115 (_ BitVec 32)) (currentBit!10110 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8788)

(declare-fun e!152665 () Bool)

(declare-fun inv!12 (BitStream!8788) Bool)

(assert (=> start!46724 (and (inv!12 thiss!1870) e!152665)))

(declare-fun b!224123 () Bool)

(declare-fun res!188126 () Bool)

(assert (=> b!224123 (=> (not res!188126) (not e!152666))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224123 (= res!188126 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4843 (buf!5387 thiss!1870))) ((_ sign_extend 32) (currentByte!10115 thiss!1870)) ((_ sign_extend 32) (currentBit!10110 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!224125 () Bool)

(assert (=> b!224125 (= e!152666 (not true))))

(declare-datatypes ((Unit!16355 0))(
  ( (Unit!16356) )
))
(declare-datatypes ((tuple3!1212 0))(
  ( (tuple3!1213 (_1!10335 Unit!16355) (_2!10335 BitStream!8788) (_3!748 array!11040)) )
))
(declare-fun lt!355505 () tuple3!1212)

(declare-fun arrayRangesEq!739 (array!11040 array!11040 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224125 (arrayRangesEq!739 arr!308 (_3!748 lt!355505) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!355498 () Unit!16355)

(declare-fun lt!355501 () array!11040)

(declare-fun arrayRangesEqTransitive!210 (array!11040 array!11040 array!11040 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16355)

(assert (=> b!224125 (= lt!355498 (arrayRangesEqTransitive!210 arr!308 lt!355501 (_3!748 lt!355505) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224125 (arrayRangesEq!739 arr!308 lt!355501 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!355504 () Unit!16355)

(declare-datatypes ((tuple2!19174 0))(
  ( (tuple2!19175 (_1!10336 (_ BitVec 8)) (_2!10336 BitStream!8788)) )
))
(declare-fun lt!355499 () tuple2!19174)

(declare-fun arrayUpdatedAtPrefixLemma!331 (array!11040 (_ BitVec 32) (_ BitVec 8)) Unit!16355)

(assert (=> b!224125 (= lt!355504 (arrayUpdatedAtPrefixLemma!331 arr!308 i!761 (_1!10336 lt!355499)))))

(declare-fun lt!355506 () (_ BitVec 64))

(declare-fun lt!355500 () (_ BitVec 32))

(declare-fun lt!355503 () (_ BitVec 64))

(declare-fun lt!355497 () (_ BitVec 64))

(assert (=> b!224125 (and (= (bvadd lt!355497 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!355500))) lt!355506) (= (bvadd lt!355503 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!355506) (= (buf!5387 thiss!1870) (buf!5387 (_2!10335 lt!355505))) (= (size!4843 arr!308) (size!4843 (_3!748 lt!355505))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224125 (= lt!355506 (bitIndex!0 (size!4843 (buf!5387 (_2!10335 lt!355505))) (currentByte!10115 (_2!10335 lt!355505)) (currentBit!10110 (_2!10335 lt!355505))))))

(assert (=> b!224125 (= lt!355497 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!355503))))

(assert (=> b!224125 (= lt!355497 (bitIndex!0 (size!4843 (buf!5387 (_2!10336 lt!355499))) (currentByte!10115 (_2!10336 lt!355499)) (currentBit!10110 (_2!10336 lt!355499))))))

(assert (=> b!224125 (= lt!355503 (bitIndex!0 (size!4843 (buf!5387 thiss!1870)) (currentByte!10115 thiss!1870) (currentBit!10110 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8788 array!11040 (_ BitVec 32) (_ BitVec 32)) tuple3!1212)

(assert (=> b!224125 (= lt!355505 (readByteArrayLoop!0 (_2!10336 lt!355499) lt!355501 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!224125 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4843 (buf!5387 (_2!10336 lt!355499)))) ((_ sign_extend 32) (currentByte!10115 (_2!10336 lt!355499))) ((_ sign_extend 32) (currentBit!10110 (_2!10336 lt!355499))) lt!355500)))

(assert (=> b!224125 (= lt!355500 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!355502 () Unit!16355)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8788 BitStream!8788 (_ BitVec 64) (_ BitVec 32)) Unit!16355)

(assert (=> b!224125 (= lt!355502 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10336 lt!355499) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224125 (= lt!355501 (array!11041 (store (arr!5791 arr!308) i!761 (_1!10336 lt!355499)) (size!4843 arr!308)))))

(declare-fun readByte!0 (BitStream!8788) tuple2!19174)

(assert (=> b!224125 (= lt!355499 (readByte!0 thiss!1870))))

(declare-fun b!224126 () Bool)

(assert (=> b!224126 (= e!152665 (array_inv!4584 (buf!5387 thiss!1870)))))

(declare-fun b!224124 () Bool)

(declare-fun res!188125 () Bool)

(assert (=> b!224124 (=> (not res!188125) (not e!152666))))

(assert (=> b!224124 (= res!188125 (bvslt i!761 to!496))))

(assert (= (and start!46724 res!188127) b!224123))

(assert (= (and b!224123 res!188126) b!224124))

(assert (= (and b!224124 res!188125) b!224125))

(assert (= start!46724 b!224126))

(declare-fun m!343799 () Bool)

(assert (=> start!46724 m!343799))

(declare-fun m!343801 () Bool)

(assert (=> start!46724 m!343801))

(declare-fun m!343803 () Bool)

(assert (=> b!224123 m!343803))

(declare-fun m!343805 () Bool)

(assert (=> b!224125 m!343805))

(declare-fun m!343807 () Bool)

(assert (=> b!224125 m!343807))

(declare-fun m!343809 () Bool)

(assert (=> b!224125 m!343809))

(declare-fun m!343811 () Bool)

(assert (=> b!224125 m!343811))

(declare-fun m!343813 () Bool)

(assert (=> b!224125 m!343813))

(declare-fun m!343815 () Bool)

(assert (=> b!224125 m!343815))

(declare-fun m!343817 () Bool)

(assert (=> b!224125 m!343817))

(declare-fun m!343819 () Bool)

(assert (=> b!224125 m!343819))

(declare-fun m!343821 () Bool)

(assert (=> b!224125 m!343821))

(declare-fun m!343823 () Bool)

(assert (=> b!224125 m!343823))

(declare-fun m!343825 () Bool)

(assert (=> b!224125 m!343825))

(declare-fun m!343827 () Bool)

(assert (=> b!224125 m!343827))

(declare-fun m!343829 () Bool)

(assert (=> b!224126 m!343829))

(push 1)

(assert (not b!224125))

(assert (not b!224126))

(assert (not start!46724))

(assert (not b!224123))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

