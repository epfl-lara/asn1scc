; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46722 () Bool)

(assert start!46722)

(declare-fun b!224113 () Bool)

(declare-fun e!152651 () Bool)

(assert (=> b!224113 (= e!152651 (not true))))

(declare-datatypes ((array!11038 0))(
  ( (array!11039 (arr!5790 (Array (_ BitVec 32) (_ BitVec 8))) (size!4842 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11038)

(declare-datatypes ((BitStream!8786 0))(
  ( (BitStream!8787 (buf!5386 array!11038) (currentByte!10114 (_ BitVec 32)) (currentBit!10109 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!16353 0))(
  ( (Unit!16354) )
))
(declare-datatypes ((tuple3!1210 0))(
  ( (tuple3!1211 (_1!10333 Unit!16353) (_2!10333 BitStream!8786) (_3!747 array!11038)) )
))
(declare-fun lt!355474 () tuple3!1210)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun arrayRangesEq!738 (array!11038 array!11038 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224113 (arrayRangesEq!738 arr!308 (_3!747 lt!355474) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!355467 () Unit!16353)

(declare-fun lt!355473 () array!11038)

(declare-fun arrayRangesEqTransitive!209 (array!11038 array!11038 array!11038 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16353)

(assert (=> b!224113 (= lt!355467 (arrayRangesEqTransitive!209 arr!308 lt!355473 (_3!747 lt!355474) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224113 (arrayRangesEq!738 arr!308 lt!355473 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((tuple2!19172 0))(
  ( (tuple2!19173 (_1!10334 (_ BitVec 8)) (_2!10334 BitStream!8786)) )
))
(declare-fun lt!355476 () tuple2!19172)

(declare-fun lt!355468 () Unit!16353)

(declare-fun arrayUpdatedAtPrefixLemma!330 (array!11038 (_ BitVec 32) (_ BitVec 8)) Unit!16353)

(assert (=> b!224113 (= lt!355468 (arrayUpdatedAtPrefixLemma!330 arr!308 i!761 (_1!10334 lt!355476)))))

(declare-fun lt!355470 () (_ BitVec 64))

(declare-fun lt!355472 () (_ BitVec 64))

(declare-fun thiss!1870 () BitStream!8786)

(declare-fun to!496 () (_ BitVec 32))

(declare-fun lt!355469 () (_ BitVec 32))

(declare-fun lt!355475 () (_ BitVec 64))

(assert (=> b!224113 (and (= (bvadd lt!355472 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!355469))) lt!355470) (= (bvadd lt!355475 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!355470) (= (buf!5386 thiss!1870) (buf!5386 (_2!10333 lt!355474))) (= (size!4842 arr!308) (size!4842 (_3!747 lt!355474))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224113 (= lt!355470 (bitIndex!0 (size!4842 (buf!5386 (_2!10333 lt!355474))) (currentByte!10114 (_2!10333 lt!355474)) (currentBit!10109 (_2!10333 lt!355474))))))

(assert (=> b!224113 (= lt!355472 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!355475))))

(assert (=> b!224113 (= lt!355472 (bitIndex!0 (size!4842 (buf!5386 (_2!10334 lt!355476))) (currentByte!10114 (_2!10334 lt!355476)) (currentBit!10109 (_2!10334 lt!355476))))))

(assert (=> b!224113 (= lt!355475 (bitIndex!0 (size!4842 (buf!5386 thiss!1870)) (currentByte!10114 thiss!1870) (currentBit!10109 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8786 array!11038 (_ BitVec 32) (_ BitVec 32)) tuple3!1210)

(assert (=> b!224113 (= lt!355474 (readByteArrayLoop!0 (_2!10334 lt!355476) lt!355473 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224113 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4842 (buf!5386 (_2!10334 lt!355476)))) ((_ sign_extend 32) (currentByte!10114 (_2!10334 lt!355476))) ((_ sign_extend 32) (currentBit!10109 (_2!10334 lt!355476))) lt!355469)))

(assert (=> b!224113 (= lt!355469 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!355471 () Unit!16353)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8786 BitStream!8786 (_ BitVec 64) (_ BitVec 32)) Unit!16353)

(assert (=> b!224113 (= lt!355471 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10334 lt!355476) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224113 (= lt!355473 (array!11039 (store (arr!5790 arr!308) i!761 (_1!10334 lt!355476)) (size!4842 arr!308)))))

(declare-fun readByte!0 (BitStream!8786) tuple2!19172)

(assert (=> b!224113 (= lt!355476 (readByte!0 thiss!1870))))

(declare-fun b!224112 () Bool)

(declare-fun res!188118 () Bool)

(assert (=> b!224112 (=> (not res!188118) (not e!152651))))

(assert (=> b!224112 (= res!188118 (bvslt i!761 to!496))))

(declare-fun b!224114 () Bool)

(declare-fun e!152652 () Bool)

(declare-fun array_inv!4583 (array!11038) Bool)

(assert (=> b!224114 (= e!152652 (array_inv!4583 (buf!5386 thiss!1870)))))

(declare-fun b!224111 () Bool)

(declare-fun res!188116 () Bool)

(assert (=> b!224111 (=> (not res!188116) (not e!152651))))

(assert (=> b!224111 (= res!188116 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4842 (buf!5386 thiss!1870))) ((_ sign_extend 32) (currentByte!10114 thiss!1870)) ((_ sign_extend 32) (currentBit!10109 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!188117 () Bool)

(assert (=> start!46722 (=> (not res!188117) (not e!152651))))

(assert (=> start!46722 (= res!188117 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4842 arr!308))))))

(assert (=> start!46722 e!152651))

(assert (=> start!46722 true))

(assert (=> start!46722 (array_inv!4583 arr!308)))

(declare-fun inv!12 (BitStream!8786) Bool)

(assert (=> start!46722 (and (inv!12 thiss!1870) e!152652)))

(assert (= (and start!46722 res!188117) b!224111))

(assert (= (and b!224111 res!188116) b!224112))

(assert (= (and b!224112 res!188118) b!224113))

(assert (= start!46722 b!224114))

(declare-fun m!343767 () Bool)

(assert (=> b!224113 m!343767))

(declare-fun m!343769 () Bool)

(assert (=> b!224113 m!343769))

(declare-fun m!343771 () Bool)

(assert (=> b!224113 m!343771))

(declare-fun m!343773 () Bool)

(assert (=> b!224113 m!343773))

(declare-fun m!343775 () Bool)

(assert (=> b!224113 m!343775))

(declare-fun m!343777 () Bool)

(assert (=> b!224113 m!343777))

(declare-fun m!343779 () Bool)

(assert (=> b!224113 m!343779))

(declare-fun m!343781 () Bool)

(assert (=> b!224113 m!343781))

(declare-fun m!343783 () Bool)

(assert (=> b!224113 m!343783))

(declare-fun m!343785 () Bool)

(assert (=> b!224113 m!343785))

(declare-fun m!343787 () Bool)

(assert (=> b!224113 m!343787))

(declare-fun m!343789 () Bool)

(assert (=> b!224113 m!343789))

(declare-fun m!343791 () Bool)

(assert (=> b!224114 m!343791))

(declare-fun m!343793 () Bool)

(assert (=> b!224111 m!343793))

(declare-fun m!343795 () Bool)

(assert (=> start!46722 m!343795))

(declare-fun m!343797 () Bool)

(assert (=> start!46722 m!343797))

(push 1)

(assert (not b!224113))

