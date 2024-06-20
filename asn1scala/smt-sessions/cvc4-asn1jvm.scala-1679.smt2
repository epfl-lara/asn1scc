; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46728 () Bool)

(assert start!46728)

(declare-fun b!224147 () Bool)

(declare-fun res!188144 () Bool)

(declare-fun e!152687 () Bool)

(assert (=> b!224147 (=> (not res!188144) (not e!152687))))

(declare-datatypes ((array!11044 0))(
  ( (array!11045 (arr!5793 (Array (_ BitVec 32) (_ BitVec 8))) (size!4845 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8792 0))(
  ( (BitStream!8793 (buf!5389 array!11044) (currentByte!10117 (_ BitVec 32)) (currentBit!10112 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8792)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224147 (= res!188144 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4845 (buf!5389 thiss!1870))) ((_ sign_extend 32) (currentByte!10117 thiss!1870)) ((_ sign_extend 32) (currentBit!10112 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!224148 () Bool)

(declare-fun res!188143 () Bool)

(assert (=> b!224148 (=> (not res!188143) (not e!152687))))

(assert (=> b!224148 (= res!188143 (bvslt i!761 to!496))))

(declare-fun b!224149 () Bool)

(assert (=> b!224149 (= e!152687 (not true))))

(declare-fun arr!308 () array!11044)

(declare-datatypes ((Unit!16359 0))(
  ( (Unit!16360) )
))
(declare-datatypes ((tuple3!1216 0))(
  ( (tuple3!1217 (_1!10339 Unit!16359) (_2!10339 BitStream!8792) (_3!750 array!11044)) )
))
(declare-fun lt!355565 () tuple3!1216)

(declare-fun arrayRangesEq!741 (array!11044 array!11044 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224149 (arrayRangesEq!741 arr!308 (_3!750 lt!355565) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!355558 () Unit!16359)

(declare-fun lt!355566 () array!11044)

(declare-fun arrayRangesEqTransitive!212 (array!11044 array!11044 array!11044 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16359)

(assert (=> b!224149 (= lt!355558 (arrayRangesEqTransitive!212 arr!308 lt!355566 (_3!750 lt!355565) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224149 (arrayRangesEq!741 arr!308 lt!355566 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!355562 () Unit!16359)

(declare-datatypes ((tuple2!19178 0))(
  ( (tuple2!19179 (_1!10340 (_ BitVec 8)) (_2!10340 BitStream!8792)) )
))
(declare-fun lt!355563 () tuple2!19178)

(declare-fun arrayUpdatedAtPrefixLemma!333 (array!11044 (_ BitVec 32) (_ BitVec 8)) Unit!16359)

(assert (=> b!224149 (= lt!355562 (arrayUpdatedAtPrefixLemma!333 arr!308 i!761 (_1!10340 lt!355563)))))

(declare-fun lt!355557 () (_ BitVec 64))

(declare-fun lt!355564 () (_ BitVec 64))

(declare-fun lt!355559 () (_ BitVec 32))

(declare-fun lt!355561 () (_ BitVec 64))

(assert (=> b!224149 (and (= (bvadd lt!355561 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!355559))) lt!355564) (= (bvadd lt!355557 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!355564) (= (buf!5389 thiss!1870) (buf!5389 (_2!10339 lt!355565))) (= (size!4845 arr!308) (size!4845 (_3!750 lt!355565))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224149 (= lt!355564 (bitIndex!0 (size!4845 (buf!5389 (_2!10339 lt!355565))) (currentByte!10117 (_2!10339 lt!355565)) (currentBit!10112 (_2!10339 lt!355565))))))

(assert (=> b!224149 (= lt!355561 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!355557))))

(assert (=> b!224149 (= lt!355561 (bitIndex!0 (size!4845 (buf!5389 (_2!10340 lt!355563))) (currentByte!10117 (_2!10340 lt!355563)) (currentBit!10112 (_2!10340 lt!355563))))))

(assert (=> b!224149 (= lt!355557 (bitIndex!0 (size!4845 (buf!5389 thiss!1870)) (currentByte!10117 thiss!1870) (currentBit!10112 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8792 array!11044 (_ BitVec 32) (_ BitVec 32)) tuple3!1216)

(assert (=> b!224149 (= lt!355565 (readByteArrayLoop!0 (_2!10340 lt!355563) lt!355566 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!224149 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4845 (buf!5389 (_2!10340 lt!355563)))) ((_ sign_extend 32) (currentByte!10117 (_2!10340 lt!355563))) ((_ sign_extend 32) (currentBit!10112 (_2!10340 lt!355563))) lt!355559)))

(assert (=> b!224149 (= lt!355559 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!355560 () Unit!16359)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8792 BitStream!8792 (_ BitVec 64) (_ BitVec 32)) Unit!16359)

(assert (=> b!224149 (= lt!355560 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10340 lt!355563) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224149 (= lt!355566 (array!11045 (store (arr!5793 arr!308) i!761 (_1!10340 lt!355563)) (size!4845 arr!308)))))

(declare-fun readByte!0 (BitStream!8792) tuple2!19178)

(assert (=> b!224149 (= lt!355563 (readByte!0 thiss!1870))))

(declare-fun b!224150 () Bool)

(declare-fun e!152689 () Bool)

(declare-fun array_inv!4586 (array!11044) Bool)

(assert (=> b!224150 (= e!152689 (array_inv!4586 (buf!5389 thiss!1870)))))

(declare-fun res!188145 () Bool)

(assert (=> start!46728 (=> (not res!188145) (not e!152687))))

(assert (=> start!46728 (= res!188145 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4845 arr!308))))))

(assert (=> start!46728 e!152687))

(assert (=> start!46728 true))

(assert (=> start!46728 (array_inv!4586 arr!308)))

(declare-fun inv!12 (BitStream!8792) Bool)

(assert (=> start!46728 (and (inv!12 thiss!1870) e!152689)))

(assert (= (and start!46728 res!188145) b!224147))

(assert (= (and b!224147 res!188144) b!224148))

(assert (= (and b!224148 res!188143) b!224149))

(assert (= start!46728 b!224150))

(declare-fun m!343863 () Bool)

(assert (=> b!224147 m!343863))

(declare-fun m!343865 () Bool)

(assert (=> b!224149 m!343865))

(declare-fun m!343867 () Bool)

(assert (=> b!224149 m!343867))

(declare-fun m!343869 () Bool)

(assert (=> b!224149 m!343869))

(declare-fun m!343871 () Bool)

(assert (=> b!224149 m!343871))

(declare-fun m!343873 () Bool)

(assert (=> b!224149 m!343873))

(declare-fun m!343875 () Bool)

(assert (=> b!224149 m!343875))

(declare-fun m!343877 () Bool)

(assert (=> b!224149 m!343877))

(declare-fun m!343879 () Bool)

(assert (=> b!224149 m!343879))

(declare-fun m!343881 () Bool)

(assert (=> b!224149 m!343881))

(declare-fun m!343883 () Bool)

(assert (=> b!224149 m!343883))

(declare-fun m!343885 () Bool)

(assert (=> b!224149 m!343885))

(declare-fun m!343887 () Bool)

(assert (=> b!224149 m!343887))

(declare-fun m!343889 () Bool)

(assert (=> b!224150 m!343889))

(declare-fun m!343891 () Bool)

(assert (=> start!46728 m!343891))

(declare-fun m!343893 () Bool)

(assert (=> start!46728 m!343893))

(push 1)

(assert (not b!224150))

