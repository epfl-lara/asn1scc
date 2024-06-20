; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46750 () Bool)

(assert start!46750)

(declare-fun b!224280 () Bool)

(declare-fun res!188242 () Bool)

(declare-fun e!152822 () Bool)

(assert (=> b!224280 (=> (not res!188242) (not e!152822))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!224280 (= res!188242 (bvslt i!761 to!496))))

(declare-fun res!188243 () Bool)

(assert (=> start!46750 (=> (not res!188243) (not e!152822))))

(declare-datatypes ((array!11066 0))(
  ( (array!11067 (arr!5804 (Array (_ BitVec 32) (_ BitVec 8))) (size!4856 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11066)

(assert (=> start!46750 (= res!188243 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4856 arr!308))))))

(assert (=> start!46750 e!152822))

(assert (=> start!46750 true))

(declare-fun array_inv!4597 (array!11066) Bool)

(assert (=> start!46750 (array_inv!4597 arr!308)))

(declare-datatypes ((BitStream!8814 0))(
  ( (BitStream!8815 (buf!5400 array!11066) (currentByte!10128 (_ BitVec 32)) (currentBit!10123 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8814)

(declare-fun e!152819 () Bool)

(declare-fun inv!12 (BitStream!8814) Bool)

(assert (=> start!46750 (and (inv!12 thiss!1870) e!152819)))

(declare-fun b!224282 () Bool)

(assert (=> b!224282 (= e!152819 (array_inv!4597 (buf!5400 thiss!1870)))))

(declare-fun b!224279 () Bool)

(declare-fun res!188244 () Bool)

(assert (=> b!224279 (=> (not res!188244) (not e!152822))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224279 (= res!188244 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4856 (buf!5400 thiss!1870))) ((_ sign_extend 32) (currentByte!10128 thiss!1870)) ((_ sign_extend 32) (currentBit!10123 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!224281 () Bool)

(assert (=> b!224281 (= e!152822 (not true))))

(declare-datatypes ((Unit!16381 0))(
  ( (Unit!16382) )
))
(declare-datatypes ((tuple3!1238 0))(
  ( (tuple3!1239 (_1!10361 Unit!16381) (_2!10361 BitStream!8814) (_3!761 array!11066)) )
))
(declare-fun lt!355891 () tuple3!1238)

(declare-fun arrayRangesEq!752 (array!11066 array!11066 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224281 (arrayRangesEq!752 arr!308 (_3!761 lt!355891) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!355889 () Unit!16381)

(declare-fun lt!355892 () array!11066)

(declare-fun arrayRangesEqTransitive!223 (array!11066 array!11066 array!11066 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16381)

(assert (=> b!224281 (= lt!355889 (arrayRangesEqTransitive!223 arr!308 lt!355892 (_3!761 lt!355891) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224281 (arrayRangesEq!752 arr!308 lt!355892 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!355887 () Unit!16381)

(declare-datatypes ((tuple2!19200 0))(
  ( (tuple2!19201 (_1!10362 (_ BitVec 8)) (_2!10362 BitStream!8814)) )
))
(declare-fun lt!355893 () tuple2!19200)

(declare-fun arrayUpdatedAtPrefixLemma!344 (array!11066 (_ BitVec 32) (_ BitVec 8)) Unit!16381)

(assert (=> b!224281 (= lt!355887 (arrayUpdatedAtPrefixLemma!344 arr!308 i!761 (_1!10362 lt!355893)))))

(declare-fun lt!355890 () (_ BitVec 32))

(declare-fun lt!355895 () (_ BitVec 64))

(declare-fun lt!355888 () (_ BitVec 64))

(declare-fun lt!355896 () (_ BitVec 64))

(assert (=> b!224281 (and (= (bvadd lt!355896 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!355890))) lt!355895) (= (bvadd lt!355888 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!355895) (= (buf!5400 thiss!1870) (buf!5400 (_2!10361 lt!355891))) (= (size!4856 arr!308) (size!4856 (_3!761 lt!355891))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224281 (= lt!355895 (bitIndex!0 (size!4856 (buf!5400 (_2!10361 lt!355891))) (currentByte!10128 (_2!10361 lt!355891)) (currentBit!10123 (_2!10361 lt!355891))))))

(assert (=> b!224281 (= lt!355896 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!355888))))

(assert (=> b!224281 (= lt!355896 (bitIndex!0 (size!4856 (buf!5400 (_2!10362 lt!355893))) (currentByte!10128 (_2!10362 lt!355893)) (currentBit!10123 (_2!10362 lt!355893))))))

(assert (=> b!224281 (= lt!355888 (bitIndex!0 (size!4856 (buf!5400 thiss!1870)) (currentByte!10128 thiss!1870) (currentBit!10123 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8814 array!11066 (_ BitVec 32) (_ BitVec 32)) tuple3!1238)

(assert (=> b!224281 (= lt!355891 (readByteArrayLoop!0 (_2!10362 lt!355893) lt!355892 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!224281 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4856 (buf!5400 (_2!10362 lt!355893)))) ((_ sign_extend 32) (currentByte!10128 (_2!10362 lt!355893))) ((_ sign_extend 32) (currentBit!10123 (_2!10362 lt!355893))) lt!355890)))

(assert (=> b!224281 (= lt!355890 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!355894 () Unit!16381)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8814 BitStream!8814 (_ BitVec 64) (_ BitVec 32)) Unit!16381)

(assert (=> b!224281 (= lt!355894 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10362 lt!355893) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224281 (= lt!355892 (array!11067 (store (arr!5804 arr!308) i!761 (_1!10362 lt!355893)) (size!4856 arr!308)))))

(declare-fun readByte!0 (BitStream!8814) tuple2!19200)

(assert (=> b!224281 (= lt!355893 (readByte!0 thiss!1870))))

(assert (= (and start!46750 res!188243) b!224279))

(assert (= (and b!224279 res!188244) b!224280))

(assert (= (and b!224280 res!188242) b!224281))

(assert (= start!46750 b!224282))

(declare-fun m!344215 () Bool)

(assert (=> start!46750 m!344215))

(declare-fun m!344217 () Bool)

(assert (=> start!46750 m!344217))

(declare-fun m!344219 () Bool)

(assert (=> b!224282 m!344219))

(declare-fun m!344221 () Bool)

(assert (=> b!224279 m!344221))

(declare-fun m!344223 () Bool)

(assert (=> b!224281 m!344223))

(declare-fun m!344225 () Bool)

(assert (=> b!224281 m!344225))

(declare-fun m!344227 () Bool)

(assert (=> b!224281 m!344227))

(declare-fun m!344229 () Bool)

(assert (=> b!224281 m!344229))

(declare-fun m!344231 () Bool)

(assert (=> b!224281 m!344231))

(declare-fun m!344233 () Bool)

(assert (=> b!224281 m!344233))

(declare-fun m!344235 () Bool)

(assert (=> b!224281 m!344235))

(declare-fun m!344237 () Bool)

(assert (=> b!224281 m!344237))

(declare-fun m!344239 () Bool)

(assert (=> b!224281 m!344239))

(declare-fun m!344241 () Bool)

(assert (=> b!224281 m!344241))

(declare-fun m!344243 () Bool)

(assert (=> b!224281 m!344243))

(declare-fun m!344245 () Bool)

(assert (=> b!224281 m!344245))

(check-sat (not b!224279) (not start!46750) (not b!224282) (not b!224281))
