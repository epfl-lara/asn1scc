; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46716 () Bool)

(assert start!46716)

(declare-fun b!224075 () Bool)

(declare-fun res!188091 () Bool)

(declare-fun e!152616 () Bool)

(assert (=> b!224075 (=> (not res!188091) (not e!152616))))

(declare-datatypes ((array!11032 0))(
  ( (array!11033 (arr!5787 (Array (_ BitVec 32) (_ BitVec 8))) (size!4839 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8780 0))(
  ( (BitStream!8781 (buf!5383 array!11032) (currentByte!10111 (_ BitVec 32)) (currentBit!10106 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8780)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224075 (= res!188091 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4839 (buf!5383 thiss!1870))) ((_ sign_extend 32) (currentByte!10111 thiss!1870)) ((_ sign_extend 32) (currentBit!10106 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!224077 () Bool)

(assert (=> b!224077 (= e!152616 (not true))))

(declare-fun arr!308 () array!11032)

(declare-fun lt!355383 () array!11032)

(declare-fun arrayRangesEq!735 (array!11032 array!11032 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224077 (arrayRangesEq!735 arr!308 lt!355383 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!16347 0))(
  ( (Unit!16348) )
))
(declare-fun lt!355382 () Unit!16347)

(declare-datatypes ((tuple2!19166 0))(
  ( (tuple2!19167 (_1!10327 (_ BitVec 8)) (_2!10327 BitStream!8780)) )
))
(declare-fun lt!355380 () tuple2!19166)

(declare-fun arrayUpdatedAtPrefixLemma!327 (array!11032 (_ BitVec 32) (_ BitVec 8)) Unit!16347)

(assert (=> b!224077 (= lt!355382 (arrayUpdatedAtPrefixLemma!327 arr!308 i!761 (_1!10327 lt!355380)))))

(declare-fun lt!355379 () (_ BitVec 64))

(declare-fun lt!355378 () (_ BitVec 64))

(declare-datatypes ((tuple3!1204 0))(
  ( (tuple3!1205 (_1!10328 Unit!16347) (_2!10328 BitStream!8780) (_3!744 array!11032)) )
))
(declare-fun lt!355385 () tuple3!1204)

(declare-fun lt!355381 () (_ BitVec 32))

(declare-fun lt!355386 () (_ BitVec 64))

(assert (=> b!224077 (and (= (bvadd lt!355386 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!355381))) lt!355378) (= (bvadd lt!355379 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!355378) (= (buf!5383 thiss!1870) (buf!5383 (_2!10328 lt!355385))) (= (size!4839 arr!308) (size!4839 (_3!744 lt!355385))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224077 (= lt!355378 (bitIndex!0 (size!4839 (buf!5383 (_2!10328 lt!355385))) (currentByte!10111 (_2!10328 lt!355385)) (currentBit!10106 (_2!10328 lt!355385))))))

(assert (=> b!224077 (= lt!355386 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!355379))))

(assert (=> b!224077 (= lt!355386 (bitIndex!0 (size!4839 (buf!5383 (_2!10327 lt!355380))) (currentByte!10111 (_2!10327 lt!355380)) (currentBit!10106 (_2!10327 lt!355380))))))

(assert (=> b!224077 (= lt!355379 (bitIndex!0 (size!4839 (buf!5383 thiss!1870)) (currentByte!10111 thiss!1870) (currentBit!10106 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8780 array!11032 (_ BitVec 32) (_ BitVec 32)) tuple3!1204)

(assert (=> b!224077 (= lt!355385 (readByteArrayLoop!0 (_2!10327 lt!355380) lt!355383 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!224077 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4839 (buf!5383 (_2!10327 lt!355380)))) ((_ sign_extend 32) (currentByte!10111 (_2!10327 lt!355380))) ((_ sign_extend 32) (currentBit!10106 (_2!10327 lt!355380))) lt!355381)))

(assert (=> b!224077 (= lt!355381 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!355384 () Unit!16347)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8780 BitStream!8780 (_ BitVec 64) (_ BitVec 32)) Unit!16347)

(assert (=> b!224077 (= lt!355384 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10327 lt!355380) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224077 (= lt!355383 (array!11033 (store (arr!5787 arr!308) i!761 (_1!10327 lt!355380)) (size!4839 arr!308)))))

(declare-fun readByte!0 (BitStream!8780) tuple2!19166)

(assert (=> b!224077 (= lt!355380 (readByte!0 thiss!1870))))

(declare-fun b!224078 () Bool)

(declare-fun e!152615 () Bool)

(declare-fun array_inv!4580 (array!11032) Bool)

(assert (=> b!224078 (= e!152615 (array_inv!4580 (buf!5383 thiss!1870)))))

(declare-fun res!188089 () Bool)

(assert (=> start!46716 (=> (not res!188089) (not e!152616))))

(assert (=> start!46716 (= res!188089 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4839 arr!308))))))

(assert (=> start!46716 e!152616))

(assert (=> start!46716 true))

(assert (=> start!46716 (array_inv!4580 arr!308)))

(declare-fun inv!12 (BitStream!8780) Bool)

(assert (=> start!46716 (and (inv!12 thiss!1870) e!152615)))

(declare-fun b!224076 () Bool)

(declare-fun res!188090 () Bool)

(assert (=> b!224076 (=> (not res!188090) (not e!152616))))

(assert (=> b!224076 (= res!188090 (bvslt i!761 to!496))))

(assert (= (and start!46716 res!188089) b!224075))

(assert (= (and b!224075 res!188091) b!224076))

(assert (= (and b!224076 res!188090) b!224077))

(assert (= start!46716 b!224078))

(declare-fun m!343675 () Bool)

(assert (=> b!224075 m!343675))

(declare-fun m!343677 () Bool)

(assert (=> b!224077 m!343677))

(declare-fun m!343679 () Bool)

(assert (=> b!224077 m!343679))

(declare-fun m!343681 () Bool)

(assert (=> b!224077 m!343681))

(declare-fun m!343683 () Bool)

(assert (=> b!224077 m!343683))

(declare-fun m!343685 () Bool)

(assert (=> b!224077 m!343685))

(declare-fun m!343687 () Bool)

(assert (=> b!224077 m!343687))

(declare-fun m!343689 () Bool)

(assert (=> b!224077 m!343689))

(declare-fun m!343691 () Bool)

(assert (=> b!224077 m!343691))

(declare-fun m!343693 () Bool)

(assert (=> b!224077 m!343693))

(declare-fun m!343695 () Bool)

(assert (=> b!224077 m!343695))

(declare-fun m!343697 () Bool)

(assert (=> b!224078 m!343697))

(declare-fun m!343699 () Bool)

(assert (=> start!46716 m!343699))

(declare-fun m!343701 () Bool)

(assert (=> start!46716 m!343701))

(push 1)

(assert (not b!224075))

(assert (not start!46716))

(assert (not b!224077))

(assert (not b!224078))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

