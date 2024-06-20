; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46934 () Bool)

(assert start!46934)

(declare-fun b!224789 () Bool)

(declare-fun res!188662 () Bool)

(declare-fun e!153263 () Bool)

(assert (=> b!224789 (=> (not res!188662) (not e!153263))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-datatypes ((array!11112 0))(
  ( (array!11113 (arr!5830 (Array (_ BitVec 32) (_ BitVec 8))) (size!4876 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8854 0))(
  ( (BitStream!8855 (buf!5420 array!11112) (currentByte!10166 (_ BitVec 32)) (currentBit!10161 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8854)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224789 (= res!188662 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4876 (buf!5420 thiss!1870))) ((_ sign_extend 32) (currentByte!10166 thiss!1870)) ((_ sign_extend 32) (currentBit!10161 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!224791 () Bool)

(declare-fun arr!308 () array!11112)

(assert (=> b!224791 (= e!153263 (not (bvsle i!761 (size!4876 arr!308))))))

(declare-datatypes ((tuple2!19262 0))(
  ( (tuple2!19263 (_1!10412 (_ BitVec 8)) (_2!10412 BitStream!8854)) )
))
(declare-fun lt!357595 () tuple2!19262)

(declare-datatypes ((Unit!16476 0))(
  ( (Unit!16477) )
))
(declare-datatypes ((tuple3!1278 0))(
  ( (tuple3!1279 (_1!10413 Unit!16476) (_2!10413 BitStream!8854) (_3!781 array!11112)) )
))
(declare-fun lt!357587 () tuple3!1278)

(assert (=> b!224791 (and (= (_1!10412 lt!357595) (select (arr!5830 (_3!781 lt!357587)) i!761)) (= (select (arr!5830 (_3!781 lt!357587)) i!761) (_1!10412 lt!357595)))))

(declare-fun lt!357593 () Unit!16476)

(declare-fun lt!357591 () array!11112)

(declare-fun arrayRangesEqImpliesEq!94 (array!11112 array!11112 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16476)

(assert (=> b!224791 (= lt!357593 (arrayRangesEqImpliesEq!94 lt!357591 (_3!781 lt!357587) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun arrayRangesEq!772 (array!11112 array!11112 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224791 (arrayRangesEq!772 arr!308 (_3!781 lt!357587) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!357597 () Unit!16476)

(declare-fun arrayRangesEqTransitive!243 (array!11112 array!11112 array!11112 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16476)

(assert (=> b!224791 (= lt!357597 (arrayRangesEqTransitive!243 arr!308 lt!357591 (_3!781 lt!357587) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224791 (arrayRangesEq!772 arr!308 lt!357591 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!357590 () Unit!16476)

(declare-fun arrayUpdatedAtPrefixLemma!364 (array!11112 (_ BitVec 32) (_ BitVec 8)) Unit!16476)

(assert (=> b!224791 (= lt!357590 (arrayUpdatedAtPrefixLemma!364 arr!308 i!761 (_1!10412 lt!357595)))))

(declare-fun lt!357596 () (_ BitVec 64))

(declare-fun lt!357589 () (_ BitVec 32))

(declare-fun lt!357588 () (_ BitVec 64))

(declare-fun lt!357592 () (_ BitVec 64))

(assert (=> b!224791 (and (= (bvadd lt!357588 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!357589))) lt!357592) (= (bvadd lt!357596 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!357592) (= (buf!5420 thiss!1870) (buf!5420 (_2!10413 lt!357587))) (= (size!4876 arr!308) (size!4876 (_3!781 lt!357587))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224791 (= lt!357592 (bitIndex!0 (size!4876 (buf!5420 (_2!10413 lt!357587))) (currentByte!10166 (_2!10413 lt!357587)) (currentBit!10161 (_2!10413 lt!357587))))))

(assert (=> b!224791 (= lt!357588 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!357596))))

(assert (=> b!224791 (= lt!357588 (bitIndex!0 (size!4876 (buf!5420 (_2!10412 lt!357595))) (currentByte!10166 (_2!10412 lt!357595)) (currentBit!10161 (_2!10412 lt!357595))))))

(assert (=> b!224791 (= lt!357596 (bitIndex!0 (size!4876 (buf!5420 thiss!1870)) (currentByte!10166 thiss!1870) (currentBit!10161 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8854 array!11112 (_ BitVec 32) (_ BitVec 32)) tuple3!1278)

(assert (=> b!224791 (= lt!357587 (readByteArrayLoop!0 (_2!10412 lt!357595) lt!357591 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!224791 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4876 (buf!5420 (_2!10412 lt!357595)))) ((_ sign_extend 32) (currentByte!10166 (_2!10412 lt!357595))) ((_ sign_extend 32) (currentBit!10161 (_2!10412 lt!357595))) lt!357589)))

(assert (=> b!224791 (= lt!357589 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!357594 () Unit!16476)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8854 BitStream!8854 (_ BitVec 64) (_ BitVec 32)) Unit!16476)

(assert (=> b!224791 (= lt!357594 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10412 lt!357595) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224791 (= lt!357591 (array!11113 (store (arr!5830 arr!308) i!761 (_1!10412 lt!357595)) (size!4876 arr!308)))))

(declare-fun readByte!0 (BitStream!8854) tuple2!19262)

(assert (=> b!224791 (= lt!357595 (readByte!0 thiss!1870))))

(declare-fun res!188663 () Bool)

(assert (=> start!46934 (=> (not res!188663) (not e!153263))))

(assert (=> start!46934 (= res!188663 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4876 arr!308))))))

(assert (=> start!46934 e!153263))

(assert (=> start!46934 true))

(declare-fun array_inv!4617 (array!11112) Bool)

(assert (=> start!46934 (array_inv!4617 arr!308)))

(declare-fun e!153265 () Bool)

(declare-fun inv!12 (BitStream!8854) Bool)

(assert (=> start!46934 (and (inv!12 thiss!1870) e!153265)))

(declare-fun b!224790 () Bool)

(declare-fun res!188664 () Bool)

(assert (=> b!224790 (=> (not res!188664) (not e!153263))))

(assert (=> b!224790 (= res!188664 (bvslt i!761 to!496))))

(declare-fun b!224792 () Bool)

(assert (=> b!224792 (= e!153265 (array_inv!4617 (buf!5420 thiss!1870)))))

(assert (= (and start!46934 res!188663) b!224789))

(assert (= (and b!224789 res!188662) b!224790))

(assert (= (and b!224790 res!188664) b!224791))

(assert (= start!46934 b!224792))

(declare-fun m!345419 () Bool)

(assert (=> b!224789 m!345419))

(declare-fun m!345421 () Bool)

(assert (=> b!224791 m!345421))

(declare-fun m!345423 () Bool)

(assert (=> b!224791 m!345423))

(declare-fun m!345425 () Bool)

(assert (=> b!224791 m!345425))

(declare-fun m!345427 () Bool)

(assert (=> b!224791 m!345427))

(declare-fun m!345429 () Bool)

(assert (=> b!224791 m!345429))

(declare-fun m!345431 () Bool)

(assert (=> b!224791 m!345431))

(declare-fun m!345433 () Bool)

(assert (=> b!224791 m!345433))

(declare-fun m!345435 () Bool)

(assert (=> b!224791 m!345435))

(declare-fun m!345437 () Bool)

(assert (=> b!224791 m!345437))

(declare-fun m!345439 () Bool)

(assert (=> b!224791 m!345439))

(declare-fun m!345441 () Bool)

(assert (=> b!224791 m!345441))

(declare-fun m!345443 () Bool)

(assert (=> b!224791 m!345443))

(declare-fun m!345445 () Bool)

(assert (=> b!224791 m!345445))

(declare-fun m!345447 () Bool)

(assert (=> b!224791 m!345447))

(declare-fun m!345449 () Bool)

(assert (=> start!46934 m!345449))

(declare-fun m!345451 () Bool)

(assert (=> start!46934 m!345451))

(declare-fun m!345453 () Bool)

(assert (=> b!224792 m!345453))

(push 1)

(assert (not b!224791))

(assert (not start!46934))

(assert (not b!224789))

(assert (not b!224792))

(check-sat)

(pop 1)

(push 1)

(check-sat)

