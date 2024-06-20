; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46762 () Bool)

(assert start!46762)

(declare-fun b!224353 () Bool)

(declare-fun e!152891 () Bool)

(assert (=> b!224353 (= e!152891 (not true))))

(declare-datatypes ((array!11078 0))(
  ( (array!11079 (arr!5810 (Array (_ BitVec 32) (_ BitVec 8))) (size!4862 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11078)

(declare-datatypes ((BitStream!8826 0))(
  ( (BitStream!8827 (buf!5406 array!11078) (currentByte!10134 (_ BitVec 32)) (currentBit!10129 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!16393 0))(
  ( (Unit!16394) )
))
(declare-datatypes ((tuple3!1250 0))(
  ( (tuple3!1251 (_1!10373 Unit!16393) (_2!10373 BitStream!8826) (_3!767 array!11078)) )
))
(declare-fun lt!356075 () tuple3!1250)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun arrayRangesEq!758 (array!11078 array!11078 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224353 (arrayRangesEq!758 arr!308 (_3!767 lt!356075) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!356076 () array!11078)

(declare-fun lt!356073 () Unit!16393)

(declare-fun arrayRangesEqTransitive!229 (array!11078 array!11078 array!11078 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16393)

(assert (=> b!224353 (= lt!356073 (arrayRangesEqTransitive!229 arr!308 lt!356076 (_3!767 lt!356075) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224353 (arrayRangesEq!758 arr!308 lt!356076 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((tuple2!19212 0))(
  ( (tuple2!19213 (_1!10374 (_ BitVec 8)) (_2!10374 BitStream!8826)) )
))
(declare-fun lt!356074 () tuple2!19212)

(declare-fun lt!356068 () Unit!16393)

(declare-fun arrayUpdatedAtPrefixLemma!350 (array!11078 (_ BitVec 32) (_ BitVec 8)) Unit!16393)

(assert (=> b!224353 (= lt!356068 (arrayUpdatedAtPrefixLemma!350 arr!308 i!761 (_1!10374 lt!356074)))))

(declare-fun lt!356069 () (_ BitVec 64))

(declare-fun lt!356072 () (_ BitVec 64))

(declare-fun thiss!1870 () BitStream!8826)

(declare-fun lt!356070 () (_ BitVec 64))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun lt!356071 () (_ BitVec 32))

(assert (=> b!224353 (and (= (bvadd lt!356070 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!356071))) lt!356072) (= (bvadd lt!356069 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!356072) (= (buf!5406 thiss!1870) (buf!5406 (_2!10373 lt!356075))) (= (size!4862 arr!308) (size!4862 (_3!767 lt!356075))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224353 (= lt!356072 (bitIndex!0 (size!4862 (buf!5406 (_2!10373 lt!356075))) (currentByte!10134 (_2!10373 lt!356075)) (currentBit!10129 (_2!10373 lt!356075))))))

(assert (=> b!224353 (= lt!356070 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!356069))))

(assert (=> b!224353 (= lt!356070 (bitIndex!0 (size!4862 (buf!5406 (_2!10374 lt!356074))) (currentByte!10134 (_2!10374 lt!356074)) (currentBit!10129 (_2!10374 lt!356074))))))

(assert (=> b!224353 (= lt!356069 (bitIndex!0 (size!4862 (buf!5406 thiss!1870)) (currentByte!10134 thiss!1870) (currentBit!10129 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8826 array!11078 (_ BitVec 32) (_ BitVec 32)) tuple3!1250)

(assert (=> b!224353 (= lt!356075 (readByteArrayLoop!0 (_2!10374 lt!356074) lt!356076 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224353 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4862 (buf!5406 (_2!10374 lt!356074)))) ((_ sign_extend 32) (currentByte!10134 (_2!10374 lt!356074))) ((_ sign_extend 32) (currentBit!10129 (_2!10374 lt!356074))) lt!356071)))

(assert (=> b!224353 (= lt!356071 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!356067 () Unit!16393)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8826 BitStream!8826 (_ BitVec 64) (_ BitVec 32)) Unit!16393)

(assert (=> b!224353 (= lt!356067 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10374 lt!356074) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224353 (= lt!356076 (array!11079 (store (arr!5810 arr!308) i!761 (_1!10374 lt!356074)) (size!4862 arr!308)))))

(declare-fun readByte!0 (BitStream!8826) tuple2!19212)

(assert (=> b!224353 (= lt!356074 (readByte!0 thiss!1870))))

(declare-fun res!188296 () Bool)

(assert (=> start!46762 (=> (not res!188296) (not e!152891))))

(assert (=> start!46762 (= res!188296 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4862 arr!308))))))

(assert (=> start!46762 e!152891))

(assert (=> start!46762 true))

(declare-fun array_inv!4603 (array!11078) Bool)

(assert (=> start!46762 (array_inv!4603 arr!308)))

(declare-fun e!152894 () Bool)

(declare-fun inv!12 (BitStream!8826) Bool)

(assert (=> start!46762 (and (inv!12 thiss!1870) e!152894)))

(declare-fun b!224352 () Bool)

(declare-fun res!188298 () Bool)

(assert (=> b!224352 (=> (not res!188298) (not e!152891))))

(assert (=> b!224352 (= res!188298 (bvslt i!761 to!496))))

(declare-fun b!224354 () Bool)

(assert (=> b!224354 (= e!152894 (array_inv!4603 (buf!5406 thiss!1870)))))

(declare-fun b!224351 () Bool)

(declare-fun res!188297 () Bool)

(assert (=> b!224351 (=> (not res!188297) (not e!152891))))

(assert (=> b!224351 (= res!188297 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4862 (buf!5406 thiss!1870))) ((_ sign_extend 32) (currentByte!10134 thiss!1870)) ((_ sign_extend 32) (currentBit!10129 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!46762 res!188296) b!224351))

(assert (= (and b!224351 res!188297) b!224352))

(assert (= (and b!224352 res!188298) b!224353))

(assert (= start!46762 b!224354))

(declare-fun m!344407 () Bool)

(assert (=> b!224353 m!344407))

(declare-fun m!344409 () Bool)

(assert (=> b!224353 m!344409))

(declare-fun m!344411 () Bool)

(assert (=> b!224353 m!344411))

(declare-fun m!344413 () Bool)

(assert (=> b!224353 m!344413))

(declare-fun m!344415 () Bool)

(assert (=> b!224353 m!344415))

(declare-fun m!344417 () Bool)

(assert (=> b!224353 m!344417))

(declare-fun m!344419 () Bool)

(assert (=> b!224353 m!344419))

(declare-fun m!344421 () Bool)

(assert (=> b!224353 m!344421))

(declare-fun m!344423 () Bool)

(assert (=> b!224353 m!344423))

(declare-fun m!344425 () Bool)

(assert (=> b!224353 m!344425))

(declare-fun m!344427 () Bool)

(assert (=> b!224353 m!344427))

(declare-fun m!344429 () Bool)

(assert (=> b!224353 m!344429))

(declare-fun m!344431 () Bool)

(assert (=> start!46762 m!344431))

(declare-fun m!344433 () Bool)

(assert (=> start!46762 m!344433))

(declare-fun m!344435 () Bool)

(assert (=> b!224354 m!344435))

(declare-fun m!344437 () Bool)

(assert (=> b!224351 m!344437))

(check-sat (not b!224351) (not start!46762) (not b!224353) (not b!224354))
