; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47494 () Bool)

(assert start!47494)

(declare-fun b!226353 () Bool)

(declare-fun e!154713 () Bool)

(declare-datatypes ((array!11317 0))(
  ( (array!11318 (arr!5927 (Array (_ BitVec 32) (_ BitVec 8))) (size!4964 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9024 0))(
  ( (BitStream!9025 (buf!5505 array!11317) (currentByte!10319 (_ BitVec 32)) (currentBit!10314 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9024)

(declare-fun array_inv!4705 (array!11317) Bool)

(assert (=> b!226353 (= e!154713 (array_inv!4705 (buf!5505 thiss!1870)))))

(declare-fun b!226351 () Bool)

(declare-fun res!189933 () Bool)

(declare-fun e!154711 () Bool)

(assert (=> b!226351 (=> (not res!189933) (not e!154711))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!226351 (= res!189933 (bvslt i!761 to!496))))

(declare-fun res!189934 () Bool)

(assert (=> start!47494 (=> (not res!189934) (not e!154711))))

(declare-fun arr!308 () array!11317)

(assert (=> start!47494 (= res!189934 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4964 arr!308))))))

(assert (=> start!47494 e!154711))

(assert (=> start!47494 true))

(assert (=> start!47494 (array_inv!4705 arr!308)))

(declare-fun inv!12 (BitStream!9024) Bool)

(assert (=> start!47494 (and (inv!12 thiss!1870) e!154713)))

(declare-fun b!226352 () Bool)

(declare-fun lt!360212 () (_ BitVec 32))

(declare-fun lt!360216 () (_ BitVec 32))

(assert (=> b!226352 (= e!154711 (not (or (= lt!360212 #b00000000000000000000000000000000) (= lt!360212 (bvand lt!360216 #b10000000000000000000000000000000)))))))

(assert (=> b!226352 (= lt!360212 (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000))))

(declare-datatypes ((tuple2!19402 0))(
  ( (tuple2!19403 (_1!10498 (_ BitVec 8)) (_2!10498 BitStream!9024)) )
))
(declare-fun lt!360215 () tuple2!19402)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!226352 (= (bitIndex!0 (size!4964 (buf!5505 (_2!10498 lt!360215))) (currentByte!10319 (_2!10498 lt!360215)) (currentBit!10314 (_2!10498 lt!360215))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!4964 (buf!5505 thiss!1870)) (currentByte!10319 thiss!1870) (currentBit!10314 thiss!1870))))))

(declare-datatypes ((Unit!16739 0))(
  ( (Unit!16740) )
))
(declare-datatypes ((tuple3!1310 0))(
  ( (tuple3!1311 (_1!10499 Unit!16739) (_2!10499 BitStream!9024) (_3!797 array!11317)) )
))
(declare-fun lt!360214 () tuple3!1310)

(declare-fun readByteArrayLoop!0 (BitStream!9024 array!11317 (_ BitVec 32) (_ BitVec 32)) tuple3!1310)

(assert (=> b!226352 (= lt!360214 (readByteArrayLoop!0 (_2!10498 lt!360215) (array!11318 (store (arr!5927 arr!308) i!761 (_1!10498 lt!360215)) (size!4964 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226352 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4964 (buf!5505 (_2!10498 lt!360215)))) ((_ sign_extend 32) (currentByte!10319 (_2!10498 lt!360215))) ((_ sign_extend 32) (currentBit!10314 (_2!10498 lt!360215))) lt!360216)))

(assert (=> b!226352 (= lt!360216 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!360213 () Unit!16739)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9024 BitStream!9024 (_ BitVec 64) (_ BitVec 32)) Unit!16739)

(assert (=> b!226352 (= lt!360213 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10498 lt!360215) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!9024) tuple2!19402)

(assert (=> b!226352 (= lt!360215 (readByte!0 thiss!1870))))

(declare-fun b!226350 () Bool)

(declare-fun res!189932 () Bool)

(assert (=> b!226350 (=> (not res!189932) (not e!154711))))

(assert (=> b!226350 (= res!189932 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4964 (buf!5505 thiss!1870))) ((_ sign_extend 32) (currentByte!10319 thiss!1870)) ((_ sign_extend 32) (currentBit!10314 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!47494 res!189934) b!226350))

(assert (= (and b!226350 res!189932) b!226351))

(assert (= (and b!226351 res!189933) b!226352))

(assert (= start!47494 b!226353))

(declare-fun m!347675 () Bool)

(assert (=> b!226353 m!347675))

(declare-fun m!347677 () Bool)

(assert (=> start!47494 m!347677))

(declare-fun m!347679 () Bool)

(assert (=> start!47494 m!347679))

(declare-fun m!347681 () Bool)

(assert (=> b!226352 m!347681))

(declare-fun m!347683 () Bool)

(assert (=> b!226352 m!347683))

(declare-fun m!347685 () Bool)

(assert (=> b!226352 m!347685))

(declare-fun m!347687 () Bool)

(assert (=> b!226352 m!347687))

(declare-fun m!347689 () Bool)

(assert (=> b!226352 m!347689))

(declare-fun m!347691 () Bool)

(assert (=> b!226352 m!347691))

(declare-fun m!347693 () Bool)

(assert (=> b!226352 m!347693))

(declare-fun m!347695 () Bool)

(assert (=> b!226350 m!347695))

(check-sat (not b!226352) (not b!226350) (not b!226353) (not start!47494))
(check-sat)
