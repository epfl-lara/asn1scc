; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46936 () Bool)

(assert start!46936)

(declare-fun b!224801 () Bool)

(declare-fun res!188672 () Bool)

(declare-fun e!153277 () Bool)

(assert (=> b!224801 (=> (not res!188672) (not e!153277))))

(declare-datatypes ((array!11114 0))(
  ( (array!11115 (arr!5831 (Array (_ BitVec 32) (_ BitVec 8))) (size!4877 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8856 0))(
  ( (BitStream!8857 (buf!5421 array!11114) (currentByte!10167 (_ BitVec 32)) (currentBit!10162 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8856)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224801 (= res!188672 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4877 (buf!5421 thiss!1870))) ((_ sign_extend 32) (currentByte!10167 thiss!1870)) ((_ sign_extend 32) (currentBit!10162 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!224803 () Bool)

(declare-fun arr!308 () array!11114)

(assert (=> b!224803 (= e!153277 (not (bvsle i!761 (size!4877 arr!308))))))

(declare-datatypes ((tuple2!19264 0))(
  ( (tuple2!19265 (_1!10414 (_ BitVec 8)) (_2!10414 BitStream!8856)) )
))
(declare-fun lt!357623 () tuple2!19264)

(declare-datatypes ((Unit!16478 0))(
  ( (Unit!16479) )
))
(declare-datatypes ((tuple3!1280 0))(
  ( (tuple3!1281 (_1!10415 Unit!16478) (_2!10415 BitStream!8856) (_3!782 array!11114)) )
))
(declare-fun lt!357622 () tuple3!1280)

(assert (=> b!224803 (and (= (_1!10414 lt!357623) (select (arr!5831 (_3!782 lt!357622)) i!761)) (= (select (arr!5831 (_3!782 lt!357622)) i!761) (_1!10414 lt!357623)))))

(declare-fun lt!357628 () array!11114)

(declare-fun lt!357629 () Unit!16478)

(declare-fun arrayRangesEqImpliesEq!95 (array!11114 array!11114 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16478)

(assert (=> b!224803 (= lt!357629 (arrayRangesEqImpliesEq!95 lt!357628 (_3!782 lt!357622) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun arrayRangesEq!773 (array!11114 array!11114 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224803 (arrayRangesEq!773 arr!308 (_3!782 lt!357622) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!357621 () Unit!16478)

(declare-fun arrayRangesEqTransitive!244 (array!11114 array!11114 array!11114 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16478)

(assert (=> b!224803 (= lt!357621 (arrayRangesEqTransitive!244 arr!308 lt!357628 (_3!782 lt!357622) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224803 (arrayRangesEq!773 arr!308 lt!357628 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!357627 () Unit!16478)

(declare-fun arrayUpdatedAtPrefixLemma!365 (array!11114 (_ BitVec 32) (_ BitVec 8)) Unit!16478)

(assert (=> b!224803 (= lt!357627 (arrayUpdatedAtPrefixLemma!365 arr!308 i!761 (_1!10414 lt!357623)))))

(declare-fun lt!357625 () (_ BitVec 64))

(declare-fun lt!357626 () (_ BitVec 64))

(declare-fun lt!357620 () (_ BitVec 32))

(declare-fun lt!357624 () (_ BitVec 64))

(assert (=> b!224803 (and (= (bvadd lt!357626 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!357620))) lt!357624) (= (bvadd lt!357625 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!357624) (= (buf!5421 thiss!1870) (buf!5421 (_2!10415 lt!357622))) (= (size!4877 arr!308) (size!4877 (_3!782 lt!357622))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224803 (= lt!357624 (bitIndex!0 (size!4877 (buf!5421 (_2!10415 lt!357622))) (currentByte!10167 (_2!10415 lt!357622)) (currentBit!10162 (_2!10415 lt!357622))))))

(assert (=> b!224803 (= lt!357626 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!357625))))

(assert (=> b!224803 (= lt!357626 (bitIndex!0 (size!4877 (buf!5421 (_2!10414 lt!357623))) (currentByte!10167 (_2!10414 lt!357623)) (currentBit!10162 (_2!10414 lt!357623))))))

(assert (=> b!224803 (= lt!357625 (bitIndex!0 (size!4877 (buf!5421 thiss!1870)) (currentByte!10167 thiss!1870) (currentBit!10162 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8856 array!11114 (_ BitVec 32) (_ BitVec 32)) tuple3!1280)

(assert (=> b!224803 (= lt!357622 (readByteArrayLoop!0 (_2!10414 lt!357623) lt!357628 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!224803 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4877 (buf!5421 (_2!10414 lt!357623)))) ((_ sign_extend 32) (currentByte!10167 (_2!10414 lt!357623))) ((_ sign_extend 32) (currentBit!10162 (_2!10414 lt!357623))) lt!357620)))

(assert (=> b!224803 (= lt!357620 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!357630 () Unit!16478)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8856 BitStream!8856 (_ BitVec 64) (_ BitVec 32)) Unit!16478)

(assert (=> b!224803 (= lt!357630 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10414 lt!357623) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224803 (= lt!357628 (array!11115 (store (arr!5831 arr!308) i!761 (_1!10414 lt!357623)) (size!4877 arr!308)))))

(declare-fun readByte!0 (BitStream!8856) tuple2!19264)

(assert (=> b!224803 (= lt!357623 (readByte!0 thiss!1870))))

(declare-fun res!188673 () Bool)

(assert (=> start!46936 (=> (not res!188673) (not e!153277))))

(assert (=> start!46936 (= res!188673 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4877 arr!308))))))

(assert (=> start!46936 e!153277))

(assert (=> start!46936 true))

(declare-fun array_inv!4618 (array!11114) Bool)

(assert (=> start!46936 (array_inv!4618 arr!308)))

(declare-fun e!153278 () Bool)

(declare-fun inv!12 (BitStream!8856) Bool)

(assert (=> start!46936 (and (inv!12 thiss!1870) e!153278)))

(declare-fun b!224802 () Bool)

(declare-fun res!188671 () Bool)

(assert (=> b!224802 (=> (not res!188671) (not e!153277))))

(assert (=> b!224802 (= res!188671 (bvslt i!761 to!496))))

(declare-fun b!224804 () Bool)

(assert (=> b!224804 (= e!153278 (array_inv!4618 (buf!5421 thiss!1870)))))

(assert (= (and start!46936 res!188673) b!224801))

(assert (= (and b!224801 res!188672) b!224802))

(assert (= (and b!224802 res!188671) b!224803))

(assert (= start!46936 b!224804))

(declare-fun m!345455 () Bool)

(assert (=> b!224801 m!345455))

(declare-fun m!345457 () Bool)

(assert (=> b!224803 m!345457))

(declare-fun m!345459 () Bool)

(assert (=> b!224803 m!345459))

(declare-fun m!345461 () Bool)

(assert (=> b!224803 m!345461))

(declare-fun m!345463 () Bool)

(assert (=> b!224803 m!345463))

(declare-fun m!345465 () Bool)

(assert (=> b!224803 m!345465))

(declare-fun m!345467 () Bool)

(assert (=> b!224803 m!345467))

(declare-fun m!345469 () Bool)

(assert (=> b!224803 m!345469))

(declare-fun m!345471 () Bool)

(assert (=> b!224803 m!345471))

(declare-fun m!345473 () Bool)

(assert (=> b!224803 m!345473))

(declare-fun m!345475 () Bool)

(assert (=> b!224803 m!345475))

(declare-fun m!345477 () Bool)

(assert (=> b!224803 m!345477))

(declare-fun m!345479 () Bool)

(assert (=> b!224803 m!345479))

(declare-fun m!345481 () Bool)

(assert (=> b!224803 m!345481))

(declare-fun m!345483 () Bool)

(assert (=> b!224803 m!345483))

(declare-fun m!345485 () Bool)

(assert (=> start!46936 m!345485))

(declare-fun m!345487 () Bool)

(assert (=> start!46936 m!345487))

(declare-fun m!345489 () Bool)

(assert (=> b!224804 m!345489))

(check-sat (not start!46936) (not b!224801) (not b!224804) (not b!224803))
(check-sat)
