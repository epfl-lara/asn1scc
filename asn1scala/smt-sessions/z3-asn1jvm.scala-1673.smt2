; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46690 () Bool)

(assert start!46690)

(declare-fun res!187972 () Bool)

(declare-fun e!152462 () Bool)

(assert (=> start!46690 (=> (not res!187972) (not e!152462))))

(declare-datatypes ((array!11006 0))(
  ( (array!11007 (arr!5774 (Array (_ BitVec 32) (_ BitVec 8))) (size!4826 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11006)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!46690 (= res!187972 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4826 arr!308))))))

(assert (=> start!46690 e!152462))

(assert (=> start!46690 true))

(declare-fun array_inv!4567 (array!11006) Bool)

(assert (=> start!46690 (array_inv!4567 arr!308)))

(declare-datatypes ((BitStream!8754 0))(
  ( (BitStream!8755 (buf!5370 array!11006) (currentByte!10098 (_ BitVec 32)) (currentBit!10093 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8754)

(declare-fun e!152461 () Bool)

(declare-fun inv!12 (BitStream!8754) Bool)

(assert (=> start!46690 (and (inv!12 thiss!1870) e!152461)))

(declare-fun b!223920 () Bool)

(declare-fun res!187974 () Bool)

(assert (=> b!223920 (=> (not res!187974) (not e!152462))))

(assert (=> b!223920 (= res!187974 (bvslt i!761 to!496))))

(declare-fun b!223921 () Bool)

(assert (=> b!223921 (= e!152462 (not true))))

(declare-fun lt!355028 () array!11006)

(declare-fun arrayRangesEq!722 (array!11006 array!11006 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!223921 (arrayRangesEq!722 arr!308 lt!355028 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!16321 0))(
  ( (Unit!16322) )
))
(declare-fun lt!355029 () Unit!16321)

(declare-datatypes ((tuple2!19140 0))(
  ( (tuple2!19141 (_1!10301 (_ BitVec 8)) (_2!10301 BitStream!8754)) )
))
(declare-fun lt!355031 () tuple2!19140)

(declare-fun arrayUpdatedAtPrefixLemma!314 (array!11006 (_ BitVec 32) (_ BitVec 8)) Unit!16321)

(assert (=> b!223921 (= lt!355029 (arrayUpdatedAtPrefixLemma!314 arr!308 i!761 (_1!10301 lt!355031)))))

(declare-fun lt!355030 () (_ BitVec 32))

(declare-fun lt!355033 () (_ BitVec 64))

(declare-fun lt!355027 () (_ BitVec 64))

(declare-fun lt!355032 () (_ BitVec 64))

(declare-datatypes ((tuple3!1178 0))(
  ( (tuple3!1179 (_1!10302 Unit!16321) (_2!10302 BitStream!8754) (_3!731 array!11006)) )
))
(declare-fun lt!355034 () tuple3!1178)

(assert (=> b!223921 (and (= (bvadd lt!355027 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!355030))) lt!355033) (= (bvadd lt!355032 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!355033) (= (buf!5370 thiss!1870) (buf!5370 (_2!10302 lt!355034))) (= (size!4826 arr!308) (size!4826 (_3!731 lt!355034))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!223921 (= lt!355033 (bitIndex!0 (size!4826 (buf!5370 (_2!10302 lt!355034))) (currentByte!10098 (_2!10302 lt!355034)) (currentBit!10093 (_2!10302 lt!355034))))))

(assert (=> b!223921 (= lt!355027 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!355032))))

(assert (=> b!223921 (= lt!355027 (bitIndex!0 (size!4826 (buf!5370 (_2!10301 lt!355031))) (currentByte!10098 (_2!10301 lt!355031)) (currentBit!10093 (_2!10301 lt!355031))))))

(assert (=> b!223921 (= lt!355032 (bitIndex!0 (size!4826 (buf!5370 thiss!1870)) (currentByte!10098 thiss!1870) (currentBit!10093 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8754 array!11006 (_ BitVec 32) (_ BitVec 32)) tuple3!1178)

(assert (=> b!223921 (= lt!355034 (readByteArrayLoop!0 (_2!10301 lt!355031) lt!355028 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!223921 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4826 (buf!5370 (_2!10301 lt!355031)))) ((_ sign_extend 32) (currentByte!10098 (_2!10301 lt!355031))) ((_ sign_extend 32) (currentBit!10093 (_2!10301 lt!355031))) lt!355030)))

(assert (=> b!223921 (= lt!355030 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!355035 () Unit!16321)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8754 BitStream!8754 (_ BitVec 64) (_ BitVec 32)) Unit!16321)

(assert (=> b!223921 (= lt!355035 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10301 lt!355031) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!223921 (= lt!355028 (array!11007 (store (arr!5774 arr!308) i!761 (_1!10301 lt!355031)) (size!4826 arr!308)))))

(declare-fun readByte!0 (BitStream!8754) tuple2!19140)

(assert (=> b!223921 (= lt!355031 (readByte!0 thiss!1870))))

(declare-fun b!223922 () Bool)

(assert (=> b!223922 (= e!152461 (array_inv!4567 (buf!5370 thiss!1870)))))

(declare-fun b!223919 () Bool)

(declare-fun res!187973 () Bool)

(assert (=> b!223919 (=> (not res!187973) (not e!152462))))

(assert (=> b!223919 (= res!187973 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4826 (buf!5370 thiss!1870))) ((_ sign_extend 32) (currentByte!10098 thiss!1870)) ((_ sign_extend 32) (currentBit!10093 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!46690 res!187972) b!223919))

(assert (= (and b!223919 res!187973) b!223920))

(assert (= (and b!223920 res!187974) b!223921))

(assert (= start!46690 b!223922))

(declare-fun m!343311 () Bool)

(assert (=> start!46690 m!343311))

(declare-fun m!343313 () Bool)

(assert (=> start!46690 m!343313))

(declare-fun m!343315 () Bool)

(assert (=> b!223921 m!343315))

(declare-fun m!343317 () Bool)

(assert (=> b!223921 m!343317))

(declare-fun m!343319 () Bool)

(assert (=> b!223921 m!343319))

(declare-fun m!343321 () Bool)

(assert (=> b!223921 m!343321))

(declare-fun m!343323 () Bool)

(assert (=> b!223921 m!343323))

(declare-fun m!343325 () Bool)

(assert (=> b!223921 m!343325))

(declare-fun m!343327 () Bool)

(assert (=> b!223921 m!343327))

(declare-fun m!343329 () Bool)

(assert (=> b!223921 m!343329))

(declare-fun m!343331 () Bool)

(assert (=> b!223921 m!343331))

(declare-fun m!343333 () Bool)

(assert (=> b!223921 m!343333))

(declare-fun m!343335 () Bool)

(assert (=> b!223922 m!343335))

(declare-fun m!343337 () Bool)

(assert (=> b!223919 m!343337))

(check-sat (not start!46690) (not b!223921) (not b!223922) (not b!223919))
