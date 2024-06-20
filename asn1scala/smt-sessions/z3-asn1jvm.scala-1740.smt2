; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47842 () Bool)

(assert start!47842)

(declare-fun b!227680 () Bool)

(declare-fun res!190997 () Bool)

(declare-fun e!155881 () Bool)

(assert (=> b!227680 (=> (not res!190997) (not e!155881))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!227680 (= res!190997 (bvslt i!761 to!496))))

(declare-fun b!227681 () Bool)

(declare-datatypes ((array!11458 0))(
  ( (array!11459 (arr!6005 (Array (_ BitVec 32) (_ BitVec 8))) (size!5027 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11458)

(assert (=> b!227681 (= e!155881 (not (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsgt (bvadd #b00000000000000000000000000000001 i!761) (size!5027 arr!308)) (bvslt i!761 (bvadd #b00000000000000000000000000000001 i!761)))))))

(declare-datatypes ((BitStream!9150 0))(
  ( (BitStream!9151 (buf!5568 array!11458) (currentByte!10412 (_ BitVec 32)) (currentBit!10407 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17028 0))(
  ( (Unit!17029) )
))
(declare-datatypes ((tuple3!1436 0))(
  ( (tuple3!1437 (_1!10654 Unit!17028) (_2!10654 BitStream!9150) (_3!860 array!11458)) )
))
(declare-fun lt!364282 () tuple3!1436)

(declare-fun arrayRangesEq!863 (array!11458 array!11458 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227681 (arrayRangesEq!863 arr!308 (_3!860 lt!364282) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!364285 () array!11458)

(declare-fun lt!364283 () Unit!17028)

(declare-fun arrayRangesEqTransitive!286 (array!11458 array!11458 array!11458 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17028)

(assert (=> b!227681 (= lt!364283 (arrayRangesEqTransitive!286 arr!308 lt!364285 (_3!860 lt!364282) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!227681 (arrayRangesEq!863 arr!308 lt!364285 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((tuple2!19588 0))(
  ( (tuple2!19589 (_1!10655 (_ BitVec 8)) (_2!10655 BitStream!9150)) )
))
(declare-fun lt!364286 () tuple2!19588)

(declare-fun lt!364279 () Unit!17028)

(declare-fun arrayUpdatedAtPrefixLemma!422 (array!11458 (_ BitVec 32) (_ BitVec 8)) Unit!17028)

(assert (=> b!227681 (= lt!364279 (arrayUpdatedAtPrefixLemma!422 arr!308 i!761 (_1!10655 lt!364286)))))

(declare-fun lt!364281 () (_ BitVec 64))

(declare-fun lt!364280 () (_ BitVec 64))

(declare-fun lt!364284 () (_ BitVec 32))

(declare-fun thiss!1870 () BitStream!9150)

(declare-fun lt!364278 () (_ BitVec 64))

(assert (=> b!227681 (and (= (bvadd lt!364280 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!364284))) lt!364281) (= (bvadd lt!364278 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!364281) (= (buf!5568 thiss!1870) (buf!5568 (_2!10654 lt!364282))) (= (size!5027 arr!308) (size!5027 (_3!860 lt!364282))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227681 (= lt!364281 (bitIndex!0 (size!5027 (buf!5568 (_2!10654 lt!364282))) (currentByte!10412 (_2!10654 lt!364282)) (currentBit!10407 (_2!10654 lt!364282))))))

(assert (=> b!227681 (= lt!364280 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!364278))))

(assert (=> b!227681 (= lt!364280 (bitIndex!0 (size!5027 (buf!5568 (_2!10655 lt!364286))) (currentByte!10412 (_2!10655 lt!364286)) (currentBit!10407 (_2!10655 lt!364286))))))

(assert (=> b!227681 (= lt!364278 (bitIndex!0 (size!5027 (buf!5568 thiss!1870)) (currentByte!10412 thiss!1870) (currentBit!10407 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9150 array!11458 (_ BitVec 32) (_ BitVec 32)) tuple3!1436)

(assert (=> b!227681 (= lt!364282 (readByteArrayLoop!0 (_2!10655 lt!364286) lt!364285 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227681 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5027 (buf!5568 (_2!10655 lt!364286)))) ((_ sign_extend 32) (currentByte!10412 (_2!10655 lt!364286))) ((_ sign_extend 32) (currentBit!10407 (_2!10655 lt!364286))) lt!364284)))

(assert (=> b!227681 (= lt!364284 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!364287 () Unit!17028)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9150 BitStream!9150 (_ BitVec 64) (_ BitVec 32)) Unit!17028)

(assert (=> b!227681 (= lt!364287 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10655 lt!364286) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227681 (= lt!364285 (array!11459 (store (arr!6005 arr!308) i!761 (_1!10655 lt!364286)) (size!5027 arr!308)))))

(declare-fun readByte!0 (BitStream!9150) tuple2!19588)

(assert (=> b!227681 (= lt!364286 (readByte!0 thiss!1870))))

(declare-fun b!227679 () Bool)

(declare-fun res!190999 () Bool)

(assert (=> b!227679 (=> (not res!190999) (not e!155881))))

(assert (=> b!227679 (= res!190999 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5027 (buf!5568 thiss!1870))) ((_ sign_extend 32) (currentByte!10412 thiss!1870)) ((_ sign_extend 32) (currentBit!10407 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!227682 () Bool)

(declare-fun e!155879 () Bool)

(declare-fun array_inv!4768 (array!11458) Bool)

(assert (=> b!227682 (= e!155879 (array_inv!4768 (buf!5568 thiss!1870)))))

(declare-fun res!190998 () Bool)

(assert (=> start!47842 (=> (not res!190998) (not e!155881))))

(assert (=> start!47842 (= res!190998 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5027 arr!308))))))

(assert (=> start!47842 e!155881))

(assert (=> start!47842 true))

(assert (=> start!47842 (array_inv!4768 arr!308)))

(declare-fun inv!12 (BitStream!9150) Bool)

(assert (=> start!47842 (and (inv!12 thiss!1870) e!155879)))

(assert (= (and start!47842 res!190998) b!227679))

(assert (= (and b!227679 res!190999) b!227680))

(assert (= (and b!227680 res!190997) b!227681))

(assert (= start!47842 b!227682))

(declare-fun m!350397 () Bool)

(assert (=> b!227681 m!350397))

(declare-fun m!350399 () Bool)

(assert (=> b!227681 m!350399))

(declare-fun m!350401 () Bool)

(assert (=> b!227681 m!350401))

(declare-fun m!350403 () Bool)

(assert (=> b!227681 m!350403))

(declare-fun m!350405 () Bool)

(assert (=> b!227681 m!350405))

(declare-fun m!350407 () Bool)

(assert (=> b!227681 m!350407))

(declare-fun m!350409 () Bool)

(assert (=> b!227681 m!350409))

(declare-fun m!350411 () Bool)

(assert (=> b!227681 m!350411))

(declare-fun m!350413 () Bool)

(assert (=> b!227681 m!350413))

(declare-fun m!350415 () Bool)

(assert (=> b!227681 m!350415))

(declare-fun m!350417 () Bool)

(assert (=> b!227681 m!350417))

(declare-fun m!350419 () Bool)

(assert (=> b!227681 m!350419))

(declare-fun m!350421 () Bool)

(assert (=> b!227679 m!350421))

(declare-fun m!350423 () Bool)

(assert (=> b!227682 m!350423))

(declare-fun m!350425 () Bool)

(assert (=> start!47842 m!350425))

(declare-fun m!350427 () Bool)

(assert (=> start!47842 m!350427))

(check-sat (not b!227679) (not start!47842) (not b!227682) (not b!227681))
(check-sat)
