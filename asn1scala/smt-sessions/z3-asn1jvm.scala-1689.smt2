; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46930 () Bool)

(assert start!46930)

(declare-fun b!224766 () Bool)

(declare-fun res!188645 () Bool)

(declare-fun e!153239 () Bool)

(assert (=> b!224766 (=> (not res!188645) (not e!153239))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!224766 (= res!188645 (bvslt i!761 to!496))))

(declare-fun b!224765 () Bool)

(declare-fun res!188644 () Bool)

(assert (=> b!224765 (=> (not res!188644) (not e!153239))))

(declare-datatypes ((array!11108 0))(
  ( (array!11109 (arr!5828 (Array (_ BitVec 32) (_ BitVec 8))) (size!4874 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8850 0))(
  ( (BitStream!8851 (buf!5418 array!11108) (currentByte!10164 (_ BitVec 32)) (currentBit!10159 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8850)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224765 (= res!188644 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4874 (buf!5418 thiss!1870))) ((_ sign_extend 32) (currentByte!10164 thiss!1870)) ((_ sign_extend 32) (currentBit!10159 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!224768 () Bool)

(declare-fun e!153240 () Bool)

(declare-fun array_inv!4615 (array!11108) Bool)

(assert (=> b!224768 (= e!153240 (array_inv!4615 (buf!5418 thiss!1870)))))

(declare-fun b!224767 () Bool)

(assert (=> b!224767 (= e!153239 (not true))))

(declare-datatypes ((tuple2!19258 0))(
  ( (tuple2!19259 (_1!10408 (_ BitVec 8)) (_2!10408 BitStream!8850)) )
))
(declare-fun lt!357525 () tuple2!19258)

(declare-datatypes ((Unit!16472 0))(
  ( (Unit!16473) )
))
(declare-datatypes ((tuple3!1274 0))(
  ( (tuple3!1275 (_1!10409 Unit!16472) (_2!10409 BitStream!8850) (_3!779 array!11108)) )
))
(declare-fun lt!357527 () tuple3!1274)

(assert (=> b!224767 (and (= (_1!10408 lt!357525) (select (arr!5828 (_3!779 lt!357527)) i!761)) (= (select (arr!5828 (_3!779 lt!357527)) i!761) (_1!10408 lt!357525)))))

(declare-fun lt!357521 () array!11108)

(declare-fun lt!357528 () Unit!16472)

(declare-fun arrayRangesEqImpliesEq!92 (array!11108 array!11108 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16472)

(assert (=> b!224767 (= lt!357528 (arrayRangesEqImpliesEq!92 lt!357521 (_3!779 lt!357527) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun arr!308 () array!11108)

(declare-fun arrayRangesEq!770 (array!11108 array!11108 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224767 (arrayRangesEq!770 arr!308 (_3!779 lt!357527) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!357522 () Unit!16472)

(declare-fun arrayRangesEqTransitive!241 (array!11108 array!11108 array!11108 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16472)

(assert (=> b!224767 (= lt!357522 (arrayRangesEqTransitive!241 arr!308 lt!357521 (_3!779 lt!357527) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224767 (arrayRangesEq!770 arr!308 lt!357521 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!357523 () Unit!16472)

(declare-fun arrayUpdatedAtPrefixLemma!362 (array!11108 (_ BitVec 32) (_ BitVec 8)) Unit!16472)

(assert (=> b!224767 (= lt!357523 (arrayUpdatedAtPrefixLemma!362 arr!308 i!761 (_1!10408 lt!357525)))))

(declare-fun lt!357524 () (_ BitVec 32))

(declare-fun lt!357530 () (_ BitVec 64))

(declare-fun lt!357531 () (_ BitVec 64))

(declare-fun lt!357526 () (_ BitVec 64))

(assert (=> b!224767 (and (= (bvadd lt!357526 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!357524))) lt!357530) (= (bvadd lt!357531 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!357530) (= (buf!5418 thiss!1870) (buf!5418 (_2!10409 lt!357527))) (= (size!4874 arr!308) (size!4874 (_3!779 lt!357527))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224767 (= lt!357530 (bitIndex!0 (size!4874 (buf!5418 (_2!10409 lt!357527))) (currentByte!10164 (_2!10409 lt!357527)) (currentBit!10159 (_2!10409 lt!357527))))))

(assert (=> b!224767 (= lt!357526 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!357531))))

(assert (=> b!224767 (= lt!357526 (bitIndex!0 (size!4874 (buf!5418 (_2!10408 lt!357525))) (currentByte!10164 (_2!10408 lt!357525)) (currentBit!10159 (_2!10408 lt!357525))))))

(assert (=> b!224767 (= lt!357531 (bitIndex!0 (size!4874 (buf!5418 thiss!1870)) (currentByte!10164 thiss!1870) (currentBit!10159 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8850 array!11108 (_ BitVec 32) (_ BitVec 32)) tuple3!1274)

(assert (=> b!224767 (= lt!357527 (readByteArrayLoop!0 (_2!10408 lt!357525) lt!357521 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!224767 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4874 (buf!5418 (_2!10408 lt!357525)))) ((_ sign_extend 32) (currentByte!10164 (_2!10408 lt!357525))) ((_ sign_extend 32) (currentBit!10159 (_2!10408 lt!357525))) lt!357524)))

(assert (=> b!224767 (= lt!357524 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!357529 () Unit!16472)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8850 BitStream!8850 (_ BitVec 64) (_ BitVec 32)) Unit!16472)

(assert (=> b!224767 (= lt!357529 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10408 lt!357525) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224767 (= lt!357521 (array!11109 (store (arr!5828 arr!308) i!761 (_1!10408 lt!357525)) (size!4874 arr!308)))))

(declare-fun readByte!0 (BitStream!8850) tuple2!19258)

(assert (=> b!224767 (= lt!357525 (readByte!0 thiss!1870))))

(declare-fun res!188646 () Bool)

(assert (=> start!46930 (=> (not res!188646) (not e!153239))))

(assert (=> start!46930 (= res!188646 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4874 arr!308))))))

(assert (=> start!46930 e!153239))

(assert (=> start!46930 true))

(assert (=> start!46930 (array_inv!4615 arr!308)))

(declare-fun inv!12 (BitStream!8850) Bool)

(assert (=> start!46930 (and (inv!12 thiss!1870) e!153240)))

(assert (= (and start!46930 res!188646) b!224765))

(assert (= (and b!224765 res!188644) b!224766))

(assert (= (and b!224766 res!188645) b!224767))

(assert (= start!46930 b!224768))

(declare-fun m!345347 () Bool)

(assert (=> b!224765 m!345347))

(declare-fun m!345349 () Bool)

(assert (=> b!224768 m!345349))

(declare-fun m!345351 () Bool)

(assert (=> b!224767 m!345351))

(declare-fun m!345353 () Bool)

(assert (=> b!224767 m!345353))

(declare-fun m!345355 () Bool)

(assert (=> b!224767 m!345355))

(declare-fun m!345357 () Bool)

(assert (=> b!224767 m!345357))

(declare-fun m!345359 () Bool)

(assert (=> b!224767 m!345359))

(declare-fun m!345361 () Bool)

(assert (=> b!224767 m!345361))

(declare-fun m!345363 () Bool)

(assert (=> b!224767 m!345363))

(declare-fun m!345365 () Bool)

(assert (=> b!224767 m!345365))

(declare-fun m!345367 () Bool)

(assert (=> b!224767 m!345367))

(declare-fun m!345369 () Bool)

(assert (=> b!224767 m!345369))

(declare-fun m!345371 () Bool)

(assert (=> b!224767 m!345371))

(declare-fun m!345373 () Bool)

(assert (=> b!224767 m!345373))

(declare-fun m!345375 () Bool)

(assert (=> b!224767 m!345375))

(declare-fun m!345377 () Bool)

(assert (=> b!224767 m!345377))

(declare-fun m!345379 () Bool)

(assert (=> start!46930 m!345379))

(declare-fun m!345381 () Bool)

(assert (=> start!46930 m!345381))

(check-sat (not b!224767) (not b!224768) (not b!224765) (not start!46930))
