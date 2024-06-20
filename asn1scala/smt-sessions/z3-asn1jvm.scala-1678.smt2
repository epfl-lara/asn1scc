; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46720 () Bool)

(assert start!46720)

(declare-fun b!224101 () Bool)

(declare-fun e!152641 () Bool)

(assert (=> b!224101 (= e!152641 (not true))))

(declare-datatypes ((array!11036 0))(
  ( (array!11037 (arr!5789 (Array (_ BitVec 32) (_ BitVec 8))) (size!4841 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11036)

(declare-datatypes ((BitStream!8784 0))(
  ( (BitStream!8785 (buf!5385 array!11036) (currentByte!10113 (_ BitVec 32)) (currentBit!10108 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!16351 0))(
  ( (Unit!16352) )
))
(declare-datatypes ((tuple3!1208 0))(
  ( (tuple3!1209 (_1!10331 Unit!16351) (_2!10331 BitStream!8784) (_3!746 array!11036)) )
))
(declare-fun lt!355441 () tuple3!1208)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun arrayRangesEq!737 (array!11036 array!11036 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224101 (arrayRangesEq!737 arr!308 (_3!746 lt!355441) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!355444 () Unit!16351)

(declare-fun lt!355437 () array!11036)

(declare-fun arrayRangesEqTransitive!208 (array!11036 array!11036 array!11036 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16351)

(assert (=> b!224101 (= lt!355444 (arrayRangesEqTransitive!208 arr!308 lt!355437 (_3!746 lt!355441) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224101 (arrayRangesEq!737 arr!308 lt!355437 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!355443 () Unit!16351)

(declare-datatypes ((tuple2!19170 0))(
  ( (tuple2!19171 (_1!10332 (_ BitVec 8)) (_2!10332 BitStream!8784)) )
))
(declare-fun lt!355438 () tuple2!19170)

(declare-fun arrayUpdatedAtPrefixLemma!329 (array!11036 (_ BitVec 32) (_ BitVec 8)) Unit!16351)

(assert (=> b!224101 (= lt!355443 (arrayUpdatedAtPrefixLemma!329 arr!308 i!761 (_1!10332 lt!355438)))))

(declare-fun lt!355439 () (_ BitVec 64))

(declare-fun lt!355446 () (_ BitVec 32))

(declare-fun thiss!1870 () BitStream!8784)

(declare-fun to!496 () (_ BitVec 32))

(declare-fun lt!355445 () (_ BitVec 64))

(declare-fun lt!355440 () (_ BitVec 64))

(assert (=> b!224101 (and (= (bvadd lt!355439 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!355446))) lt!355445) (= (bvadd lt!355440 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!355445) (= (buf!5385 thiss!1870) (buf!5385 (_2!10331 lt!355441))) (= (size!4841 arr!308) (size!4841 (_3!746 lt!355441))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224101 (= lt!355445 (bitIndex!0 (size!4841 (buf!5385 (_2!10331 lt!355441))) (currentByte!10113 (_2!10331 lt!355441)) (currentBit!10108 (_2!10331 lt!355441))))))

(assert (=> b!224101 (= lt!355439 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!355440))))

(assert (=> b!224101 (= lt!355439 (bitIndex!0 (size!4841 (buf!5385 (_2!10332 lt!355438))) (currentByte!10113 (_2!10332 lt!355438)) (currentBit!10108 (_2!10332 lt!355438))))))

(assert (=> b!224101 (= lt!355440 (bitIndex!0 (size!4841 (buf!5385 thiss!1870)) (currentByte!10113 thiss!1870) (currentBit!10108 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8784 array!11036 (_ BitVec 32) (_ BitVec 32)) tuple3!1208)

(assert (=> b!224101 (= lt!355441 (readByteArrayLoop!0 (_2!10332 lt!355438) lt!355437 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224101 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4841 (buf!5385 (_2!10332 lt!355438)))) ((_ sign_extend 32) (currentByte!10113 (_2!10332 lt!355438))) ((_ sign_extend 32) (currentBit!10108 (_2!10332 lt!355438))) lt!355446)))

(assert (=> b!224101 (= lt!355446 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!355442 () Unit!16351)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8784 BitStream!8784 (_ BitVec 64) (_ BitVec 32)) Unit!16351)

(assert (=> b!224101 (= lt!355442 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10332 lt!355438) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224101 (= lt!355437 (array!11037 (store (arr!5789 arr!308) i!761 (_1!10332 lt!355438)) (size!4841 arr!308)))))

(declare-fun readByte!0 (BitStream!8784) tuple2!19170)

(assert (=> b!224101 (= lt!355438 (readByte!0 thiss!1870))))

(declare-fun b!224099 () Bool)

(declare-fun res!188108 () Bool)

(assert (=> b!224099 (=> (not res!188108) (not e!152641))))

(assert (=> b!224099 (= res!188108 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4841 (buf!5385 thiss!1870))) ((_ sign_extend 32) (currentByte!10113 thiss!1870)) ((_ sign_extend 32) (currentBit!10108 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!188107 () Bool)

(assert (=> start!46720 (=> (not res!188107) (not e!152641))))

(assert (=> start!46720 (= res!188107 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4841 arr!308))))))

(assert (=> start!46720 e!152641))

(assert (=> start!46720 true))

(declare-fun array_inv!4582 (array!11036) Bool)

(assert (=> start!46720 (array_inv!4582 arr!308)))

(declare-fun e!152640 () Bool)

(declare-fun inv!12 (BitStream!8784) Bool)

(assert (=> start!46720 (and (inv!12 thiss!1870) e!152640)))

(declare-fun b!224102 () Bool)

(assert (=> b!224102 (= e!152640 (array_inv!4582 (buf!5385 thiss!1870)))))

(declare-fun b!224100 () Bool)

(declare-fun res!188109 () Bool)

(assert (=> b!224100 (=> (not res!188109) (not e!152641))))

(assert (=> b!224100 (= res!188109 (bvslt i!761 to!496))))

(assert (= (and start!46720 res!188107) b!224099))

(assert (= (and b!224099 res!188108) b!224100))

(assert (= (and b!224100 res!188109) b!224101))

(assert (= start!46720 b!224102))

(declare-fun m!343735 () Bool)

(assert (=> b!224101 m!343735))

(declare-fun m!343737 () Bool)

(assert (=> b!224101 m!343737))

(declare-fun m!343739 () Bool)

(assert (=> b!224101 m!343739))

(declare-fun m!343741 () Bool)

(assert (=> b!224101 m!343741))

(declare-fun m!343743 () Bool)

(assert (=> b!224101 m!343743))

(declare-fun m!343745 () Bool)

(assert (=> b!224101 m!343745))

(declare-fun m!343747 () Bool)

(assert (=> b!224101 m!343747))

(declare-fun m!343749 () Bool)

(assert (=> b!224101 m!343749))

(declare-fun m!343751 () Bool)

(assert (=> b!224101 m!343751))

(declare-fun m!343753 () Bool)

(assert (=> b!224101 m!343753))

(declare-fun m!343755 () Bool)

(assert (=> b!224101 m!343755))

(declare-fun m!343757 () Bool)

(assert (=> b!224101 m!343757))

(declare-fun m!343759 () Bool)

(assert (=> b!224099 m!343759))

(declare-fun m!343761 () Bool)

(assert (=> start!46720 m!343761))

(declare-fun m!343763 () Bool)

(assert (=> start!46720 m!343763))

(declare-fun m!343765 () Bool)

(assert (=> b!224102 m!343765))

(check-sat (not b!224099) (not b!224101) (not b!224102) (not start!46720))
