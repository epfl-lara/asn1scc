; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46740 () Bool)

(assert start!46740)

(declare-fun b!224219 () Bool)

(declare-fun res!188199 () Bool)

(declare-fun e!152760 () Bool)

(assert (=> b!224219 (=> (not res!188199) (not e!152760))))

(declare-datatypes ((array!11056 0))(
  ( (array!11057 (arr!5799 (Array (_ BitVec 32) (_ BitVec 8))) (size!4851 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8804 0))(
  ( (BitStream!8805 (buf!5395 array!11056) (currentByte!10123 (_ BitVec 32)) (currentBit!10118 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8804)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224219 (= res!188199 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4851 (buf!5395 thiss!1870))) ((_ sign_extend 32) (currentByte!10123 thiss!1870)) ((_ sign_extend 32) (currentBit!10118 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!224220 () Bool)

(declare-fun res!188198 () Bool)

(assert (=> b!224220 (=> (not res!188198) (not e!152760))))

(assert (=> b!224220 (= res!188198 (bvslt i!761 to!496))))

(declare-fun res!188197 () Bool)

(assert (=> start!46740 (=> (not res!188197) (not e!152760))))

(declare-fun arr!308 () array!11056)

(assert (=> start!46740 (= res!188197 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4851 arr!308))))))

(assert (=> start!46740 e!152760))

(assert (=> start!46740 true))

(declare-fun array_inv!4592 (array!11056) Bool)

(assert (=> start!46740 (array_inv!4592 arr!308)))

(declare-fun e!152762 () Bool)

(declare-fun inv!12 (BitStream!8804) Bool)

(assert (=> start!46740 (and (inv!12 thiss!1870) e!152762)))

(declare-fun b!224222 () Bool)

(assert (=> b!224222 (= e!152762 (array_inv!4592 (buf!5395 thiss!1870)))))

(declare-fun b!224221 () Bool)

(assert (=> b!224221 (= e!152760 (not true))))

(declare-datatypes ((Unit!16371 0))(
  ( (Unit!16372) )
))
(declare-datatypes ((tuple3!1228 0))(
  ( (tuple3!1229 (_1!10351 Unit!16371) (_2!10351 BitStream!8804) (_3!756 array!11056)) )
))
(declare-fun lt!355738 () tuple3!1228)

(declare-fun arrayRangesEq!747 (array!11056 array!11056 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224221 (arrayRangesEq!747 arr!308 (_3!756 lt!355738) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!355742 () array!11056)

(declare-fun lt!355746 () Unit!16371)

(declare-fun arrayRangesEqTransitive!218 (array!11056 array!11056 array!11056 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16371)

(assert (=> b!224221 (= lt!355746 (arrayRangesEqTransitive!218 arr!308 lt!355742 (_3!756 lt!355738) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224221 (arrayRangesEq!747 arr!308 lt!355742 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!355744 () Unit!16371)

(declare-datatypes ((tuple2!19190 0))(
  ( (tuple2!19191 (_1!10352 (_ BitVec 8)) (_2!10352 BitStream!8804)) )
))
(declare-fun lt!355741 () tuple2!19190)

(declare-fun arrayUpdatedAtPrefixLemma!339 (array!11056 (_ BitVec 32) (_ BitVec 8)) Unit!16371)

(assert (=> b!224221 (= lt!355744 (arrayUpdatedAtPrefixLemma!339 arr!308 i!761 (_1!10352 lt!355741)))))

(declare-fun lt!355739 () (_ BitVec 64))

(declare-fun lt!355740 () (_ BitVec 64))

(declare-fun lt!355745 () (_ BitVec 32))

(declare-fun lt!355737 () (_ BitVec 64))

(assert (=> b!224221 (and (= (bvadd lt!355739 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!355745))) lt!355737) (= (bvadd lt!355740 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!355737) (= (buf!5395 thiss!1870) (buf!5395 (_2!10351 lt!355738))) (= (size!4851 arr!308) (size!4851 (_3!756 lt!355738))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224221 (= lt!355737 (bitIndex!0 (size!4851 (buf!5395 (_2!10351 lt!355738))) (currentByte!10123 (_2!10351 lt!355738)) (currentBit!10118 (_2!10351 lt!355738))))))

(assert (=> b!224221 (= lt!355739 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!355740))))

(assert (=> b!224221 (= lt!355739 (bitIndex!0 (size!4851 (buf!5395 (_2!10352 lt!355741))) (currentByte!10123 (_2!10352 lt!355741)) (currentBit!10118 (_2!10352 lt!355741))))))

(assert (=> b!224221 (= lt!355740 (bitIndex!0 (size!4851 (buf!5395 thiss!1870)) (currentByte!10123 thiss!1870) (currentBit!10118 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8804 array!11056 (_ BitVec 32) (_ BitVec 32)) tuple3!1228)

(assert (=> b!224221 (= lt!355738 (readByteArrayLoop!0 (_2!10352 lt!355741) lt!355742 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!224221 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4851 (buf!5395 (_2!10352 lt!355741)))) ((_ sign_extend 32) (currentByte!10123 (_2!10352 lt!355741))) ((_ sign_extend 32) (currentBit!10118 (_2!10352 lt!355741))) lt!355745)))

(assert (=> b!224221 (= lt!355745 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!355743 () Unit!16371)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8804 BitStream!8804 (_ BitVec 64) (_ BitVec 32)) Unit!16371)

(assert (=> b!224221 (= lt!355743 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10352 lt!355741) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224221 (= lt!355742 (array!11057 (store (arr!5799 arr!308) i!761 (_1!10352 lt!355741)) (size!4851 arr!308)))))

(declare-fun readByte!0 (BitStream!8804) tuple2!19190)

(assert (=> b!224221 (= lt!355741 (readByte!0 thiss!1870))))

(assert (= (and start!46740 res!188197) b!224219))

(assert (= (and b!224219 res!188199) b!224220))

(assert (= (and b!224220 res!188198) b!224221))

(assert (= start!46740 b!224222))

(declare-fun m!344055 () Bool)

(assert (=> b!224219 m!344055))

(declare-fun m!344057 () Bool)

(assert (=> start!46740 m!344057))

(declare-fun m!344059 () Bool)

(assert (=> start!46740 m!344059))

(declare-fun m!344061 () Bool)

(assert (=> b!224222 m!344061))

(declare-fun m!344063 () Bool)

(assert (=> b!224221 m!344063))

(declare-fun m!344065 () Bool)

(assert (=> b!224221 m!344065))

(declare-fun m!344067 () Bool)

(assert (=> b!224221 m!344067))

(declare-fun m!344069 () Bool)

(assert (=> b!224221 m!344069))

(declare-fun m!344071 () Bool)

(assert (=> b!224221 m!344071))

(declare-fun m!344073 () Bool)

(assert (=> b!224221 m!344073))

(declare-fun m!344075 () Bool)

(assert (=> b!224221 m!344075))

(declare-fun m!344077 () Bool)

(assert (=> b!224221 m!344077))

(declare-fun m!344079 () Bool)

(assert (=> b!224221 m!344079))

(declare-fun m!344081 () Bool)

(assert (=> b!224221 m!344081))

(declare-fun m!344083 () Bool)

(assert (=> b!224221 m!344083))

(declare-fun m!344085 () Bool)

(assert (=> b!224221 m!344085))

(push 1)

(assert (not b!224219))

(assert (not start!46740))

