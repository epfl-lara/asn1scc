; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46926 () Bool)

(assert start!46926)

(declare-fun res!188627 () Bool)

(declare-fun e!153216 () Bool)

(assert (=> start!46926 (=> (not res!188627) (not e!153216))))

(declare-datatypes ((array!11104 0))(
  ( (array!11105 (arr!5826 (Array (_ BitVec 32) (_ BitVec 8))) (size!4872 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11104)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!46926 (= res!188627 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4872 arr!308))))))

(assert (=> start!46926 e!153216))

(assert (=> start!46926 true))

(declare-fun array_inv!4613 (array!11104) Bool)

(assert (=> start!46926 (array_inv!4613 arr!308)))

(declare-datatypes ((BitStream!8846 0))(
  ( (BitStream!8847 (buf!5416 array!11104) (currentByte!10162 (_ BitVec 32)) (currentBit!10157 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8846)

(declare-fun e!153218 () Bool)

(declare-fun inv!12 (BitStream!8846) Bool)

(assert (=> start!46926 (and (inv!12 thiss!1870) e!153218)))

(declare-fun b!224743 () Bool)

(assert (=> b!224743 (= e!153216 (not true))))

(declare-datatypes ((tuple2!19254 0))(
  ( (tuple2!19255 (_1!10404 (_ BitVec 8)) (_2!10404 BitStream!8846)) )
))
(declare-fun lt!357457 () tuple2!19254)

(declare-datatypes ((Unit!16468 0))(
  ( (Unit!16469) )
))
(declare-datatypes ((tuple3!1270 0))(
  ( (tuple3!1271 (_1!10405 Unit!16468) (_2!10405 BitStream!8846) (_3!777 array!11104)) )
))
(declare-fun lt!357465 () tuple3!1270)

(assert (=> b!224743 (and (= (_1!10404 lt!357457) (select (arr!5826 (_3!777 lt!357465)) i!761)) (= (select (arr!5826 (_3!777 lt!357465)) i!761) (_1!10404 lt!357457)))))

(declare-fun lt!357461 () array!11104)

(declare-fun lt!357462 () Unit!16468)

(declare-fun arrayRangesEqImpliesEq!90 (array!11104 array!11104 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16468)

(assert (=> b!224743 (= lt!357462 (arrayRangesEqImpliesEq!90 lt!357461 (_3!777 lt!357465) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun arrayRangesEq!768 (array!11104 array!11104 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224743 (arrayRangesEq!768 arr!308 (_3!777 lt!357465) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!357456 () Unit!16468)

(declare-fun arrayRangesEqTransitive!239 (array!11104 array!11104 array!11104 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16468)

(assert (=> b!224743 (= lt!357456 (arrayRangesEqTransitive!239 arr!308 lt!357461 (_3!777 lt!357465) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224743 (arrayRangesEq!768 arr!308 lt!357461 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!357459 () Unit!16468)

(declare-fun arrayUpdatedAtPrefixLemma!360 (array!11104 (_ BitVec 32) (_ BitVec 8)) Unit!16468)

(assert (=> b!224743 (= lt!357459 (arrayUpdatedAtPrefixLemma!360 arr!308 i!761 (_1!10404 lt!357457)))))

(declare-fun lt!357463 () (_ BitVec 32))

(declare-fun lt!357458 () (_ BitVec 64))

(declare-fun lt!357460 () (_ BitVec 64))

(declare-fun lt!357464 () (_ BitVec 64))

(assert (=> b!224743 (and (= (bvadd lt!357460 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!357463))) lt!357458) (= (bvadd lt!357464 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!357458) (= (buf!5416 thiss!1870) (buf!5416 (_2!10405 lt!357465))) (= (size!4872 arr!308) (size!4872 (_3!777 lt!357465))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224743 (= lt!357458 (bitIndex!0 (size!4872 (buf!5416 (_2!10405 lt!357465))) (currentByte!10162 (_2!10405 lt!357465)) (currentBit!10157 (_2!10405 lt!357465))))))

(assert (=> b!224743 (= lt!357460 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!357464))))

(assert (=> b!224743 (= lt!357460 (bitIndex!0 (size!4872 (buf!5416 (_2!10404 lt!357457))) (currentByte!10162 (_2!10404 lt!357457)) (currentBit!10157 (_2!10404 lt!357457))))))

(assert (=> b!224743 (= lt!357464 (bitIndex!0 (size!4872 (buf!5416 thiss!1870)) (currentByte!10162 thiss!1870) (currentBit!10157 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8846 array!11104 (_ BitVec 32) (_ BitVec 32)) tuple3!1270)

(assert (=> b!224743 (= lt!357465 (readByteArrayLoop!0 (_2!10404 lt!357457) lt!357461 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224743 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4872 (buf!5416 (_2!10404 lt!357457)))) ((_ sign_extend 32) (currentByte!10162 (_2!10404 lt!357457))) ((_ sign_extend 32) (currentBit!10157 (_2!10404 lt!357457))) lt!357463)))

(assert (=> b!224743 (= lt!357463 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!357455 () Unit!16468)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8846 BitStream!8846 (_ BitVec 64) (_ BitVec 32)) Unit!16468)

(assert (=> b!224743 (= lt!357455 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10404 lt!357457) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224743 (= lt!357461 (array!11105 (store (arr!5826 arr!308) i!761 (_1!10404 lt!357457)) (size!4872 arr!308)))))

(declare-fun readByte!0 (BitStream!8846) tuple2!19254)

(assert (=> b!224743 (= lt!357457 (readByte!0 thiss!1870))))

(declare-fun b!224741 () Bool)

(declare-fun res!188626 () Bool)

(assert (=> b!224741 (=> (not res!188626) (not e!153216))))

(assert (=> b!224741 (= res!188626 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4872 (buf!5416 thiss!1870))) ((_ sign_extend 32) (currentByte!10162 thiss!1870)) ((_ sign_extend 32) (currentBit!10157 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!224742 () Bool)

(declare-fun res!188628 () Bool)

(assert (=> b!224742 (=> (not res!188628) (not e!153216))))

(assert (=> b!224742 (= res!188628 (bvslt i!761 to!496))))

(declare-fun b!224744 () Bool)

(assert (=> b!224744 (= e!153218 (array_inv!4613 (buf!5416 thiss!1870)))))

(assert (= (and start!46926 res!188627) b!224741))

(assert (= (and b!224741 res!188626) b!224742))

(assert (= (and b!224742 res!188628) b!224743))

(assert (= start!46926 b!224744))

(declare-fun m!345275 () Bool)

(assert (=> start!46926 m!345275))

(declare-fun m!345277 () Bool)

(assert (=> start!46926 m!345277))

(declare-fun m!345279 () Bool)

(assert (=> b!224743 m!345279))

(declare-fun m!345281 () Bool)

(assert (=> b!224743 m!345281))

(declare-fun m!345283 () Bool)

(assert (=> b!224743 m!345283))

(declare-fun m!345285 () Bool)

(assert (=> b!224743 m!345285))

(declare-fun m!345287 () Bool)

(assert (=> b!224743 m!345287))

(declare-fun m!345289 () Bool)

(assert (=> b!224743 m!345289))

(declare-fun m!345291 () Bool)

(assert (=> b!224743 m!345291))

(declare-fun m!345293 () Bool)

(assert (=> b!224743 m!345293))

(declare-fun m!345295 () Bool)

(assert (=> b!224743 m!345295))

(declare-fun m!345297 () Bool)

(assert (=> b!224743 m!345297))

(declare-fun m!345299 () Bool)

(assert (=> b!224743 m!345299))

(declare-fun m!345301 () Bool)

(assert (=> b!224743 m!345301))

(declare-fun m!345303 () Bool)

(assert (=> b!224743 m!345303))

(declare-fun m!345305 () Bool)

(assert (=> b!224743 m!345305))

(declare-fun m!345307 () Bool)

(assert (=> b!224741 m!345307))

(declare-fun m!345309 () Bool)

(assert (=> b!224744 m!345309))

(push 1)

(assert (not start!46926))

(assert (not b!224743))

(assert (not b!224744))

(assert (not b!224741))

(check-sat)

(pop 1)

