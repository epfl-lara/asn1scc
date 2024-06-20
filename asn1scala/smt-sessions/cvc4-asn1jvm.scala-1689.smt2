; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46932 () Bool)

(assert start!46932)

(declare-fun b!224779 () Bool)

(declare-fun e!153251 () Bool)

(assert (=> b!224779 (= e!153251 (not true))))

(declare-datatypes ((array!11110 0))(
  ( (array!11111 (arr!5829 (Array (_ BitVec 32) (_ BitVec 8))) (size!4875 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8852 0))(
  ( (BitStream!8853 (buf!5419 array!11110) (currentByte!10165 (_ BitVec 32)) (currentBit!10160 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!19260 0))(
  ( (tuple2!19261 (_1!10410 (_ BitVec 8)) (_2!10410 BitStream!8852)) )
))
(declare-fun lt!357555 () tuple2!19260)

(declare-datatypes ((Unit!16474 0))(
  ( (Unit!16475) )
))
(declare-datatypes ((tuple3!1276 0))(
  ( (tuple3!1277 (_1!10411 Unit!16474) (_2!10411 BitStream!8852) (_3!780 array!11110)) )
))
(declare-fun lt!357560 () tuple3!1276)

(declare-fun i!761 () (_ BitVec 32))

(assert (=> b!224779 (and (= (_1!10410 lt!357555) (select (arr!5829 (_3!780 lt!357560)) i!761)) (= (select (arr!5829 (_3!780 lt!357560)) i!761) (_1!10410 lt!357555)))))

(declare-fun lt!357561 () Unit!16474)

(declare-fun lt!357557 () array!11110)

(declare-fun arrayRangesEqImpliesEq!93 (array!11110 array!11110 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16474)

(assert (=> b!224779 (= lt!357561 (arrayRangesEqImpliesEq!93 lt!357557 (_3!780 lt!357560) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun arr!308 () array!11110)

(declare-fun arrayRangesEq!771 (array!11110 array!11110 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224779 (arrayRangesEq!771 arr!308 (_3!780 lt!357560) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!357554 () Unit!16474)

(declare-fun arrayRangesEqTransitive!242 (array!11110 array!11110 array!11110 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16474)

(assert (=> b!224779 (= lt!357554 (arrayRangesEqTransitive!242 arr!308 lt!357557 (_3!780 lt!357560) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224779 (arrayRangesEq!771 arr!308 lt!357557 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!357563 () Unit!16474)

(declare-fun arrayUpdatedAtPrefixLemma!363 (array!11110 (_ BitVec 32) (_ BitVec 8)) Unit!16474)

(assert (=> b!224779 (= lt!357563 (arrayUpdatedAtPrefixLemma!363 arr!308 i!761 (_1!10410 lt!357555)))))

(declare-fun lt!357556 () (_ BitVec 64))

(declare-fun lt!357564 () (_ BitVec 64))

(declare-fun thiss!1870 () BitStream!8852)

(declare-fun lt!357558 () (_ BitVec 64))

(declare-fun lt!357559 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!224779 (and (= (bvadd lt!357556 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!357559))) lt!357558) (= (bvadd lt!357564 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!357558) (= (buf!5419 thiss!1870) (buf!5419 (_2!10411 lt!357560))) (= (size!4875 arr!308) (size!4875 (_3!780 lt!357560))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224779 (= lt!357558 (bitIndex!0 (size!4875 (buf!5419 (_2!10411 lt!357560))) (currentByte!10165 (_2!10411 lt!357560)) (currentBit!10160 (_2!10411 lt!357560))))))

(assert (=> b!224779 (= lt!357556 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!357564))))

(assert (=> b!224779 (= lt!357556 (bitIndex!0 (size!4875 (buf!5419 (_2!10410 lt!357555))) (currentByte!10165 (_2!10410 lt!357555)) (currentBit!10160 (_2!10410 lt!357555))))))

(assert (=> b!224779 (= lt!357564 (bitIndex!0 (size!4875 (buf!5419 thiss!1870)) (currentByte!10165 thiss!1870) (currentBit!10160 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8852 array!11110 (_ BitVec 32) (_ BitVec 32)) tuple3!1276)

(assert (=> b!224779 (= lt!357560 (readByteArrayLoop!0 (_2!10410 lt!357555) lt!357557 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224779 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4875 (buf!5419 (_2!10410 lt!357555)))) ((_ sign_extend 32) (currentByte!10165 (_2!10410 lt!357555))) ((_ sign_extend 32) (currentBit!10160 (_2!10410 lt!357555))) lt!357559)))

(assert (=> b!224779 (= lt!357559 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!357562 () Unit!16474)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8852 BitStream!8852 (_ BitVec 64) (_ BitVec 32)) Unit!16474)

(assert (=> b!224779 (= lt!357562 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10410 lt!357555) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224779 (= lt!357557 (array!11111 (store (arr!5829 arr!308) i!761 (_1!10410 lt!357555)) (size!4875 arr!308)))))

(declare-fun readByte!0 (BitStream!8852) tuple2!19260)

(assert (=> b!224779 (= lt!357555 (readByte!0 thiss!1870))))

(declare-fun res!188653 () Bool)

(assert (=> start!46932 (=> (not res!188653) (not e!153251))))

(assert (=> start!46932 (= res!188653 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4875 arr!308))))))

(assert (=> start!46932 e!153251))

(assert (=> start!46932 true))

(declare-fun array_inv!4616 (array!11110) Bool)

(assert (=> start!46932 (array_inv!4616 arr!308)))

(declare-fun e!153253 () Bool)

(declare-fun inv!12 (BitStream!8852) Bool)

(assert (=> start!46932 (and (inv!12 thiss!1870) e!153253)))

(declare-fun b!224777 () Bool)

(declare-fun res!188654 () Bool)

(assert (=> b!224777 (=> (not res!188654) (not e!153251))))

(assert (=> b!224777 (= res!188654 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4875 (buf!5419 thiss!1870))) ((_ sign_extend 32) (currentByte!10165 thiss!1870)) ((_ sign_extend 32) (currentBit!10160 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!224778 () Bool)

(declare-fun res!188655 () Bool)

(assert (=> b!224778 (=> (not res!188655) (not e!153251))))

(assert (=> b!224778 (= res!188655 (bvslt i!761 to!496))))

(declare-fun b!224780 () Bool)

(assert (=> b!224780 (= e!153253 (array_inv!4616 (buf!5419 thiss!1870)))))

(assert (= (and start!46932 res!188653) b!224777))

(assert (= (and b!224777 res!188654) b!224778))

(assert (= (and b!224778 res!188655) b!224779))

(assert (= start!46932 b!224780))

(declare-fun m!345383 () Bool)

(assert (=> b!224779 m!345383))

(declare-fun m!345385 () Bool)

(assert (=> b!224779 m!345385))

(declare-fun m!345387 () Bool)

(assert (=> b!224779 m!345387))

(declare-fun m!345389 () Bool)

(assert (=> b!224779 m!345389))

(declare-fun m!345391 () Bool)

(assert (=> b!224779 m!345391))

(declare-fun m!345393 () Bool)

(assert (=> b!224779 m!345393))

(declare-fun m!345395 () Bool)

(assert (=> b!224779 m!345395))

(declare-fun m!345397 () Bool)

(assert (=> b!224779 m!345397))

(declare-fun m!345399 () Bool)

(assert (=> b!224779 m!345399))

(declare-fun m!345401 () Bool)

(assert (=> b!224779 m!345401))

(declare-fun m!345403 () Bool)

(assert (=> b!224779 m!345403))

(declare-fun m!345405 () Bool)

(assert (=> b!224779 m!345405))

(declare-fun m!345407 () Bool)

(assert (=> b!224779 m!345407))

(declare-fun m!345409 () Bool)

(assert (=> b!224779 m!345409))

(declare-fun m!345411 () Bool)

(assert (=> start!46932 m!345411))

(declare-fun m!345413 () Bool)

(assert (=> start!46932 m!345413))

(declare-fun m!345415 () Bool)

(assert (=> b!224777 m!345415))

(declare-fun m!345417 () Bool)

(assert (=> b!224780 m!345417))

(push 1)

(assert (not start!46932))

