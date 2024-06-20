; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46706 () Bool)

(assert start!46706)

(declare-fun b!224016 () Bool)

(declare-fun res!188044 () Bool)

(declare-fun e!152558 () Bool)

(assert (=> b!224016 (=> (not res!188044) (not e!152558))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!224016 (= res!188044 (bvslt i!761 to!496))))

(declare-fun b!224017 () Bool)

(assert (=> b!224017 (= e!152558 (not true))))

(declare-datatypes ((array!11022 0))(
  ( (array!11023 (arr!5782 (Array (_ BitVec 32) (_ BitVec 8))) (size!4834 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11022)

(declare-fun lt!355246 () array!11022)

(declare-fun arrayRangesEq!730 (array!11022 array!11022 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224017 (arrayRangesEq!730 arr!308 lt!355246 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!16337 0))(
  ( (Unit!16338) )
))
(declare-fun lt!355245 () Unit!16337)

(declare-datatypes ((BitStream!8770 0))(
  ( (BitStream!8771 (buf!5378 array!11022) (currentByte!10106 (_ BitVec 32)) (currentBit!10101 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!19156 0))(
  ( (tuple2!19157 (_1!10317 (_ BitVec 8)) (_2!10317 BitStream!8770)) )
))
(declare-fun lt!355248 () tuple2!19156)

(declare-fun arrayUpdatedAtPrefixLemma!322 (array!11022 (_ BitVec 32) (_ BitVec 8)) Unit!16337)

(assert (=> b!224017 (= lt!355245 (arrayUpdatedAtPrefixLemma!322 arr!308 i!761 (_1!10317 lt!355248)))))

(declare-datatypes ((tuple3!1194 0))(
  ( (tuple3!1195 (_1!10318 Unit!16337) (_2!10318 BitStream!8770) (_3!739 array!11022)) )
))
(declare-fun lt!355247 () tuple3!1194)

(declare-fun lt!355249 () (_ BitVec 64))

(declare-fun lt!355251 () (_ BitVec 32))

(declare-fun thiss!1870 () BitStream!8770)

(declare-fun lt!355244 () (_ BitVec 64))

(declare-fun lt!355243 () (_ BitVec 64))

(assert (=> b!224017 (and (= (bvadd lt!355249 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!355251))) lt!355243) (= (bvadd lt!355244 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!355243) (= (buf!5378 thiss!1870) (buf!5378 (_2!10318 lt!355247))) (= (size!4834 arr!308) (size!4834 (_3!739 lt!355247))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224017 (= lt!355243 (bitIndex!0 (size!4834 (buf!5378 (_2!10318 lt!355247))) (currentByte!10106 (_2!10318 lt!355247)) (currentBit!10101 (_2!10318 lt!355247))))))

(assert (=> b!224017 (= lt!355249 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!355244))))

(assert (=> b!224017 (= lt!355249 (bitIndex!0 (size!4834 (buf!5378 (_2!10317 lt!355248))) (currentByte!10106 (_2!10317 lt!355248)) (currentBit!10101 (_2!10317 lt!355248))))))

(assert (=> b!224017 (= lt!355244 (bitIndex!0 (size!4834 (buf!5378 thiss!1870)) (currentByte!10106 thiss!1870) (currentBit!10101 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8770 array!11022 (_ BitVec 32) (_ BitVec 32)) tuple3!1194)

(assert (=> b!224017 (= lt!355247 (readByteArrayLoop!0 (_2!10317 lt!355248) lt!355246 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224017 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4834 (buf!5378 (_2!10317 lt!355248)))) ((_ sign_extend 32) (currentByte!10106 (_2!10317 lt!355248))) ((_ sign_extend 32) (currentBit!10101 (_2!10317 lt!355248))) lt!355251)))

(assert (=> b!224017 (= lt!355251 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!355250 () Unit!16337)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8770 BitStream!8770 (_ BitVec 64) (_ BitVec 32)) Unit!16337)

(assert (=> b!224017 (= lt!355250 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10317 lt!355248) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224017 (= lt!355246 (array!11023 (store (arr!5782 arr!308) i!761 (_1!10317 lt!355248)) (size!4834 arr!308)))))

(declare-fun readByte!0 (BitStream!8770) tuple2!19156)

(assert (=> b!224017 (= lt!355248 (readByte!0 thiss!1870))))

(declare-fun b!224015 () Bool)

(declare-fun res!188045 () Bool)

(assert (=> b!224015 (=> (not res!188045) (not e!152558))))

(assert (=> b!224015 (= res!188045 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4834 (buf!5378 thiss!1870))) ((_ sign_extend 32) (currentByte!10106 thiss!1870)) ((_ sign_extend 32) (currentBit!10101 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!188046 () Bool)

(assert (=> start!46706 (=> (not res!188046) (not e!152558))))

(assert (=> start!46706 (= res!188046 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4834 arr!308))))))

(assert (=> start!46706 e!152558))

(assert (=> start!46706 true))

(declare-fun array_inv!4575 (array!11022) Bool)

(assert (=> start!46706 (array_inv!4575 arr!308)))

(declare-fun e!152555 () Bool)

(declare-fun inv!12 (BitStream!8770) Bool)

(assert (=> start!46706 (and (inv!12 thiss!1870) e!152555)))

(declare-fun b!224018 () Bool)

(assert (=> b!224018 (= e!152555 (array_inv!4575 (buf!5378 thiss!1870)))))

(assert (= (and start!46706 res!188046) b!224015))

(assert (= (and b!224015 res!188045) b!224016))

(assert (= (and b!224016 res!188044) b!224017))

(assert (= start!46706 b!224018))

(declare-fun m!343535 () Bool)

(assert (=> b!224017 m!343535))

(declare-fun m!343537 () Bool)

(assert (=> b!224017 m!343537))

(declare-fun m!343539 () Bool)

(assert (=> b!224017 m!343539))

(declare-fun m!343541 () Bool)

(assert (=> b!224017 m!343541))

(declare-fun m!343543 () Bool)

(assert (=> b!224017 m!343543))

(declare-fun m!343545 () Bool)

(assert (=> b!224017 m!343545))

(declare-fun m!343547 () Bool)

(assert (=> b!224017 m!343547))

(declare-fun m!343549 () Bool)

(assert (=> b!224017 m!343549))

(declare-fun m!343551 () Bool)

(assert (=> b!224017 m!343551))

(declare-fun m!343553 () Bool)

(assert (=> b!224017 m!343553))

(declare-fun m!343555 () Bool)

(assert (=> b!224015 m!343555))

(declare-fun m!343557 () Bool)

(assert (=> start!46706 m!343557))

(declare-fun m!343559 () Bool)

(assert (=> start!46706 m!343559))

(declare-fun m!343561 () Bool)

(assert (=> b!224018 m!343561))

(push 1)

(assert (not b!224018))

(assert (not b!224015))

(assert (not b!224017))

(assert (not start!46706))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

