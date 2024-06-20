; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47844 () Bool)

(assert start!47844)

(declare-fun res!191006 () Bool)

(declare-fun e!155890 () Bool)

(assert (=> start!47844 (=> (not res!191006) (not e!155890))))

(declare-datatypes ((array!11460 0))(
  ( (array!11461 (arr!6006 (Array (_ BitVec 32) (_ BitVec 8))) (size!5028 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11460)

(declare-fun to!496 () (_ BitVec 32))

(declare-fun i!761 () (_ BitVec 32))

(assert (=> start!47844 (= res!191006 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5028 arr!308))))))

(assert (=> start!47844 e!155890))

(assert (=> start!47844 true))

(declare-fun array_inv!4769 (array!11460) Bool)

(assert (=> start!47844 (array_inv!4769 arr!308)))

(declare-datatypes ((BitStream!9152 0))(
  ( (BitStream!9153 (buf!5569 array!11460) (currentByte!10413 (_ BitVec 32)) (currentBit!10408 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9152)

(declare-fun e!155893 () Bool)

(declare-fun inv!12 (BitStream!9152) Bool)

(assert (=> start!47844 (and (inv!12 thiss!1870) e!155893)))

(declare-fun b!227692 () Bool)

(declare-fun res!191007 () Bool)

(assert (=> b!227692 (=> (not res!191007) (not e!155890))))

(assert (=> b!227692 (= res!191007 (bvslt i!761 to!496))))

(declare-fun b!227693 () Bool)

(assert (=> b!227693 (= e!155890 (not (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsgt (bvadd #b00000000000000000000000000000001 i!761) (size!5028 arr!308)) (bvslt i!761 (bvadd #b00000000000000000000000000000001 i!761)))))))

(declare-datatypes ((Unit!17030 0))(
  ( (Unit!17031) )
))
(declare-datatypes ((tuple3!1438 0))(
  ( (tuple3!1439 (_1!10656 Unit!17030) (_2!10656 BitStream!9152) (_3!861 array!11460)) )
))
(declare-fun lt!364308 () tuple3!1438)

(declare-fun arrayRangesEq!864 (array!11460 array!11460 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227693 (arrayRangesEq!864 arr!308 (_3!861 lt!364308) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!364313 () Unit!17030)

(declare-fun lt!364316 () array!11460)

(declare-fun arrayRangesEqTransitive!287 (array!11460 array!11460 array!11460 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17030)

(assert (=> b!227693 (= lt!364313 (arrayRangesEqTransitive!287 arr!308 lt!364316 (_3!861 lt!364308) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!227693 (arrayRangesEq!864 arr!308 lt!364316 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!364309 () Unit!17030)

(declare-datatypes ((tuple2!19590 0))(
  ( (tuple2!19591 (_1!10657 (_ BitVec 8)) (_2!10657 BitStream!9152)) )
))
(declare-fun lt!364311 () tuple2!19590)

(declare-fun arrayUpdatedAtPrefixLemma!423 (array!11460 (_ BitVec 32) (_ BitVec 8)) Unit!17030)

(assert (=> b!227693 (= lt!364309 (arrayUpdatedAtPrefixLemma!423 arr!308 i!761 (_1!10657 lt!364311)))))

(declare-fun lt!364310 () (_ BitVec 32))

(declare-fun lt!364317 () (_ BitVec 64))

(declare-fun lt!364312 () (_ BitVec 64))

(declare-fun lt!364315 () (_ BitVec 64))

(assert (=> b!227693 (and (= (bvadd lt!364315 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!364310))) lt!364312) (= (bvadd lt!364317 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!364312) (= (buf!5569 thiss!1870) (buf!5569 (_2!10656 lt!364308))) (= (size!5028 arr!308) (size!5028 (_3!861 lt!364308))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227693 (= lt!364312 (bitIndex!0 (size!5028 (buf!5569 (_2!10656 lt!364308))) (currentByte!10413 (_2!10656 lt!364308)) (currentBit!10408 (_2!10656 lt!364308))))))

(assert (=> b!227693 (= lt!364315 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!364317))))

(assert (=> b!227693 (= lt!364315 (bitIndex!0 (size!5028 (buf!5569 (_2!10657 lt!364311))) (currentByte!10413 (_2!10657 lt!364311)) (currentBit!10408 (_2!10657 lt!364311))))))

(assert (=> b!227693 (= lt!364317 (bitIndex!0 (size!5028 (buf!5569 thiss!1870)) (currentByte!10413 thiss!1870) (currentBit!10408 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9152 array!11460 (_ BitVec 32) (_ BitVec 32)) tuple3!1438)

(assert (=> b!227693 (= lt!364308 (readByteArrayLoop!0 (_2!10657 lt!364311) lt!364316 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227693 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5028 (buf!5569 (_2!10657 lt!364311)))) ((_ sign_extend 32) (currentByte!10413 (_2!10657 lt!364311))) ((_ sign_extend 32) (currentBit!10408 (_2!10657 lt!364311))) lt!364310)))

(assert (=> b!227693 (= lt!364310 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!364314 () Unit!17030)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9152 BitStream!9152 (_ BitVec 64) (_ BitVec 32)) Unit!17030)

(assert (=> b!227693 (= lt!364314 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10657 lt!364311) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227693 (= lt!364316 (array!11461 (store (arr!6006 arr!308) i!761 (_1!10657 lt!364311)) (size!5028 arr!308)))))

(declare-fun readByte!0 (BitStream!9152) tuple2!19590)

(assert (=> b!227693 (= lt!364311 (readByte!0 thiss!1870))))

(declare-fun b!227691 () Bool)

(declare-fun res!191008 () Bool)

(assert (=> b!227691 (=> (not res!191008) (not e!155890))))

(assert (=> b!227691 (= res!191008 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5028 (buf!5569 thiss!1870))) ((_ sign_extend 32) (currentByte!10413 thiss!1870)) ((_ sign_extend 32) (currentBit!10408 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!227694 () Bool)

(assert (=> b!227694 (= e!155893 (array_inv!4769 (buf!5569 thiss!1870)))))

(assert (= (and start!47844 res!191006) b!227691))

(assert (= (and b!227691 res!191008) b!227692))

(assert (= (and b!227692 res!191007) b!227693))

(assert (= start!47844 b!227694))

(declare-fun m!350429 () Bool)

(assert (=> start!47844 m!350429))

(declare-fun m!350431 () Bool)

(assert (=> start!47844 m!350431))

(declare-fun m!350433 () Bool)

(assert (=> b!227693 m!350433))

(declare-fun m!350435 () Bool)

(assert (=> b!227693 m!350435))

(declare-fun m!350437 () Bool)

(assert (=> b!227693 m!350437))

(declare-fun m!350439 () Bool)

(assert (=> b!227693 m!350439))

(declare-fun m!350441 () Bool)

(assert (=> b!227693 m!350441))

(declare-fun m!350443 () Bool)

(assert (=> b!227693 m!350443))

(declare-fun m!350445 () Bool)

(assert (=> b!227693 m!350445))

(declare-fun m!350447 () Bool)

(assert (=> b!227693 m!350447))

(declare-fun m!350449 () Bool)

(assert (=> b!227693 m!350449))

(declare-fun m!350451 () Bool)

(assert (=> b!227693 m!350451))

(declare-fun m!350453 () Bool)

(assert (=> b!227693 m!350453))

(declare-fun m!350455 () Bool)

(assert (=> b!227693 m!350455))

(declare-fun m!350457 () Bool)

(assert (=> b!227691 m!350457))

(declare-fun m!350459 () Bool)

(assert (=> b!227694 m!350459))

(push 1)

(assert (not b!227694))

(assert (not b!227693))

(assert (not b!227691))

(assert (not start!47844))

(check-sat)

(pop 1)

(push 1)

(check-sat)

