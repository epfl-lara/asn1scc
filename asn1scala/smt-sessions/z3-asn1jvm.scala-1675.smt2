; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46702 () Bool)

(assert start!46702)

(declare-fun b!223992 () Bool)

(declare-fun res!188027 () Bool)

(declare-fun e!152534 () Bool)

(assert (=> b!223992 (=> (not res!188027) (not e!152534))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!223992 (= res!188027 (bvslt i!761 to!496))))

(declare-fun b!223991 () Bool)

(declare-fun res!188026 () Bool)

(assert (=> b!223991 (=> (not res!188026) (not e!152534))))

(declare-datatypes ((array!11018 0))(
  ( (array!11019 (arr!5780 (Array (_ BitVec 32) (_ BitVec 8))) (size!4832 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8766 0))(
  ( (BitStream!8767 (buf!5376 array!11018) (currentByte!10104 (_ BitVec 32)) (currentBit!10099 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8766)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!223991 (= res!188026 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4832 (buf!5376 thiss!1870))) ((_ sign_extend 32) (currentByte!10104 thiss!1870)) ((_ sign_extend 32) (currentBit!10099 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!188028 () Bool)

(assert (=> start!46702 (=> (not res!188028) (not e!152534))))

(declare-fun arr!308 () array!11018)

(assert (=> start!46702 (= res!188028 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4832 arr!308))))))

(assert (=> start!46702 e!152534))

(assert (=> start!46702 true))

(declare-fun array_inv!4573 (array!11018) Bool)

(assert (=> start!46702 (array_inv!4573 arr!308)))

(declare-fun e!152531 () Bool)

(declare-fun inv!12 (BitStream!8766) Bool)

(assert (=> start!46702 (and (inv!12 thiss!1870) e!152531)))

(declare-fun b!223994 () Bool)

(assert (=> b!223994 (= e!152531 (array_inv!4573 (buf!5376 thiss!1870)))))

(declare-fun b!223993 () Bool)

(assert (=> b!223993 (= e!152534 (not true))))

(declare-fun lt!355191 () array!11018)

(declare-fun arrayRangesEq!728 (array!11018 array!11018 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!223993 (arrayRangesEq!728 arr!308 lt!355191 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((tuple2!19152 0))(
  ( (tuple2!19153 (_1!10313 (_ BitVec 8)) (_2!10313 BitStream!8766)) )
))
(declare-fun lt!355193 () tuple2!19152)

(declare-datatypes ((Unit!16333 0))(
  ( (Unit!16334) )
))
(declare-fun lt!355196 () Unit!16333)

(declare-fun arrayUpdatedAtPrefixLemma!320 (array!11018 (_ BitVec 32) (_ BitVec 8)) Unit!16333)

(assert (=> b!223993 (= lt!355196 (arrayUpdatedAtPrefixLemma!320 arr!308 i!761 (_1!10313 lt!355193)))))

(declare-fun lt!355190 () (_ BitVec 64))

(declare-datatypes ((tuple3!1190 0))(
  ( (tuple3!1191 (_1!10314 Unit!16333) (_2!10314 BitStream!8766) (_3!737 array!11018)) )
))
(declare-fun lt!355192 () tuple3!1190)

(declare-fun lt!355189 () (_ BitVec 64))

(declare-fun lt!355194 () (_ BitVec 32))

(declare-fun lt!355195 () (_ BitVec 64))

(assert (=> b!223993 (and (= (bvadd lt!355195 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!355194))) lt!355189) (= (bvadd lt!355190 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!355189) (= (buf!5376 thiss!1870) (buf!5376 (_2!10314 lt!355192))) (= (size!4832 arr!308) (size!4832 (_3!737 lt!355192))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!223993 (= lt!355189 (bitIndex!0 (size!4832 (buf!5376 (_2!10314 lt!355192))) (currentByte!10104 (_2!10314 lt!355192)) (currentBit!10099 (_2!10314 lt!355192))))))

(assert (=> b!223993 (= lt!355195 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!355190))))

(assert (=> b!223993 (= lt!355195 (bitIndex!0 (size!4832 (buf!5376 (_2!10313 lt!355193))) (currentByte!10104 (_2!10313 lt!355193)) (currentBit!10099 (_2!10313 lt!355193))))))

(assert (=> b!223993 (= lt!355190 (bitIndex!0 (size!4832 (buf!5376 thiss!1870)) (currentByte!10104 thiss!1870) (currentBit!10099 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8766 array!11018 (_ BitVec 32) (_ BitVec 32)) tuple3!1190)

(assert (=> b!223993 (= lt!355192 (readByteArrayLoop!0 (_2!10313 lt!355193) lt!355191 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!223993 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4832 (buf!5376 (_2!10313 lt!355193)))) ((_ sign_extend 32) (currentByte!10104 (_2!10313 lt!355193))) ((_ sign_extend 32) (currentBit!10099 (_2!10313 lt!355193))) lt!355194)))

(assert (=> b!223993 (= lt!355194 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!355197 () Unit!16333)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8766 BitStream!8766 (_ BitVec 64) (_ BitVec 32)) Unit!16333)

(assert (=> b!223993 (= lt!355197 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10313 lt!355193) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!223993 (= lt!355191 (array!11019 (store (arr!5780 arr!308) i!761 (_1!10313 lt!355193)) (size!4832 arr!308)))))

(declare-fun readByte!0 (BitStream!8766) tuple2!19152)

(assert (=> b!223993 (= lt!355193 (readByte!0 thiss!1870))))

(assert (= (and start!46702 res!188028) b!223991))

(assert (= (and b!223991 res!188026) b!223992))

(assert (= (and b!223992 res!188027) b!223993))

(assert (= start!46702 b!223994))

(declare-fun m!343479 () Bool)

(assert (=> b!223991 m!343479))

(declare-fun m!343481 () Bool)

(assert (=> start!46702 m!343481))

(declare-fun m!343483 () Bool)

(assert (=> start!46702 m!343483))

(declare-fun m!343485 () Bool)

(assert (=> b!223994 m!343485))

(declare-fun m!343487 () Bool)

(assert (=> b!223993 m!343487))

(declare-fun m!343489 () Bool)

(assert (=> b!223993 m!343489))

(declare-fun m!343491 () Bool)

(assert (=> b!223993 m!343491))

(declare-fun m!343493 () Bool)

(assert (=> b!223993 m!343493))

(declare-fun m!343495 () Bool)

(assert (=> b!223993 m!343495))

(declare-fun m!343497 () Bool)

(assert (=> b!223993 m!343497))

(declare-fun m!343499 () Bool)

(assert (=> b!223993 m!343499))

(declare-fun m!343501 () Bool)

(assert (=> b!223993 m!343501))

(declare-fun m!343503 () Bool)

(assert (=> b!223993 m!343503))

(declare-fun m!343505 () Bool)

(assert (=> b!223993 m!343505))

(check-sat (not b!223994) (not b!223991) (not b!223993) (not start!46702))
