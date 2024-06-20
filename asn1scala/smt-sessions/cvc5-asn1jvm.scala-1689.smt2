; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46928 () Bool)

(assert start!46928)

(declare-fun res!188637 () Bool)

(declare-fun e!153229 () Bool)

(assert (=> start!46928 (=> (not res!188637) (not e!153229))))

(declare-datatypes ((array!11106 0))(
  ( (array!11107 (arr!5827 (Array (_ BitVec 32) (_ BitVec 8))) (size!4873 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11106)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!46928 (= res!188637 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4873 arr!308))))))

(assert (=> start!46928 e!153229))

(assert (=> start!46928 true))

(declare-fun array_inv!4614 (array!11106) Bool)

(assert (=> start!46928 (array_inv!4614 arr!308)))

(declare-datatypes ((BitStream!8848 0))(
  ( (BitStream!8849 (buf!5417 array!11106) (currentByte!10163 (_ BitVec 32)) (currentBit!10158 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8848)

(declare-fun e!153227 () Bool)

(declare-fun inv!12 (BitStream!8848) Bool)

(assert (=> start!46928 (and (inv!12 thiss!1870) e!153227)))

(declare-fun b!224756 () Bool)

(assert (=> b!224756 (= e!153227 (array_inv!4614 (buf!5417 thiss!1870)))))

(declare-fun b!224754 () Bool)

(declare-fun res!188636 () Bool)

(assert (=> b!224754 (=> (not res!188636) (not e!153229))))

(assert (=> b!224754 (= res!188636 (bvslt i!761 to!496))))

(declare-fun b!224755 () Bool)

(assert (=> b!224755 (= e!153229 (not true))))

(declare-datatypes ((tuple2!19256 0))(
  ( (tuple2!19257 (_1!10406 (_ BitVec 8)) (_2!10406 BitStream!8848)) )
))
(declare-fun lt!357491 () tuple2!19256)

(declare-datatypes ((Unit!16470 0))(
  ( (Unit!16471) )
))
(declare-datatypes ((tuple3!1272 0))(
  ( (tuple3!1273 (_1!10407 Unit!16470) (_2!10407 BitStream!8848) (_3!778 array!11106)) )
))
(declare-fun lt!357498 () tuple3!1272)

(assert (=> b!224755 (and (= (_1!10406 lt!357491) (select (arr!5827 (_3!778 lt!357498)) i!761)) (= (select (arr!5827 (_3!778 lt!357498)) i!761) (_1!10406 lt!357491)))))

(declare-fun lt!357492 () array!11106)

(declare-fun lt!357496 () Unit!16470)

(declare-fun arrayRangesEqImpliesEq!91 (array!11106 array!11106 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16470)

(assert (=> b!224755 (= lt!357496 (arrayRangesEqImpliesEq!91 lt!357492 (_3!778 lt!357498) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun arrayRangesEq!769 (array!11106 array!11106 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224755 (arrayRangesEq!769 arr!308 (_3!778 lt!357498) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!357494 () Unit!16470)

(declare-fun arrayRangesEqTransitive!240 (array!11106 array!11106 array!11106 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16470)

(assert (=> b!224755 (= lt!357494 (arrayRangesEqTransitive!240 arr!308 lt!357492 (_3!778 lt!357498) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224755 (arrayRangesEq!769 arr!308 lt!357492 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!357488 () Unit!16470)

(declare-fun arrayUpdatedAtPrefixLemma!361 (array!11106 (_ BitVec 32) (_ BitVec 8)) Unit!16470)

(assert (=> b!224755 (= lt!357488 (arrayUpdatedAtPrefixLemma!361 arr!308 i!761 (_1!10406 lt!357491)))))

(declare-fun lt!357489 () (_ BitVec 32))

(declare-fun lt!357497 () (_ BitVec 64))

(declare-fun lt!357495 () (_ BitVec 64))

(declare-fun lt!357493 () (_ BitVec 64))

(assert (=> b!224755 (and (= (bvadd lt!357493 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!357489))) lt!357495) (= (bvadd lt!357497 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!357495) (= (buf!5417 thiss!1870) (buf!5417 (_2!10407 lt!357498))) (= (size!4873 arr!308) (size!4873 (_3!778 lt!357498))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224755 (= lt!357495 (bitIndex!0 (size!4873 (buf!5417 (_2!10407 lt!357498))) (currentByte!10163 (_2!10407 lt!357498)) (currentBit!10158 (_2!10407 lt!357498))))))

(assert (=> b!224755 (= lt!357493 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!357497))))

(assert (=> b!224755 (= lt!357493 (bitIndex!0 (size!4873 (buf!5417 (_2!10406 lt!357491))) (currentByte!10163 (_2!10406 lt!357491)) (currentBit!10158 (_2!10406 lt!357491))))))

(assert (=> b!224755 (= lt!357497 (bitIndex!0 (size!4873 (buf!5417 thiss!1870)) (currentByte!10163 thiss!1870) (currentBit!10158 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8848 array!11106 (_ BitVec 32) (_ BitVec 32)) tuple3!1272)

(assert (=> b!224755 (= lt!357498 (readByteArrayLoop!0 (_2!10406 lt!357491) lt!357492 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224755 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4873 (buf!5417 (_2!10406 lt!357491)))) ((_ sign_extend 32) (currentByte!10163 (_2!10406 lt!357491))) ((_ sign_extend 32) (currentBit!10158 (_2!10406 lt!357491))) lt!357489)))

(assert (=> b!224755 (= lt!357489 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!357490 () Unit!16470)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8848 BitStream!8848 (_ BitVec 64) (_ BitVec 32)) Unit!16470)

(assert (=> b!224755 (= lt!357490 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10406 lt!357491) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224755 (= lt!357492 (array!11107 (store (arr!5827 arr!308) i!761 (_1!10406 lt!357491)) (size!4873 arr!308)))))

(declare-fun readByte!0 (BitStream!8848) tuple2!19256)

(assert (=> b!224755 (= lt!357491 (readByte!0 thiss!1870))))

(declare-fun b!224753 () Bool)

(declare-fun res!188635 () Bool)

(assert (=> b!224753 (=> (not res!188635) (not e!153229))))

(assert (=> b!224753 (= res!188635 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4873 (buf!5417 thiss!1870))) ((_ sign_extend 32) (currentByte!10163 thiss!1870)) ((_ sign_extend 32) (currentBit!10158 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!46928 res!188637) b!224753))

(assert (= (and b!224753 res!188635) b!224754))

(assert (= (and b!224754 res!188636) b!224755))

(assert (= start!46928 b!224756))

(declare-fun m!345311 () Bool)

(assert (=> start!46928 m!345311))

(declare-fun m!345313 () Bool)

(assert (=> start!46928 m!345313))

(declare-fun m!345315 () Bool)

(assert (=> b!224756 m!345315))

(declare-fun m!345317 () Bool)

(assert (=> b!224755 m!345317))

(declare-fun m!345319 () Bool)

(assert (=> b!224755 m!345319))

(declare-fun m!345321 () Bool)

(assert (=> b!224755 m!345321))

(declare-fun m!345323 () Bool)

(assert (=> b!224755 m!345323))

(declare-fun m!345325 () Bool)

(assert (=> b!224755 m!345325))

(declare-fun m!345327 () Bool)

(assert (=> b!224755 m!345327))

(declare-fun m!345329 () Bool)

(assert (=> b!224755 m!345329))

(declare-fun m!345331 () Bool)

(assert (=> b!224755 m!345331))

(declare-fun m!345333 () Bool)

(assert (=> b!224755 m!345333))

(declare-fun m!345335 () Bool)

(assert (=> b!224755 m!345335))

(declare-fun m!345337 () Bool)

(assert (=> b!224755 m!345337))

(declare-fun m!345339 () Bool)

(assert (=> b!224755 m!345339))

(declare-fun m!345341 () Bool)

(assert (=> b!224755 m!345341))

(declare-fun m!345343 () Bool)

(assert (=> b!224755 m!345343))

(declare-fun m!345345 () Bool)

(assert (=> b!224753 m!345345))

(push 1)

(assert (not b!224756))

(assert (not b!224753))

(assert (not start!46928))

(assert (not b!224755))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

