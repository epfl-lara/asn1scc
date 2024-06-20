; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47222 () Bool)

(assert start!47222)

(declare-datatypes ((array!11204 0))(
  ( (array!11205 (arr!5872 (Array (_ BitVec 32) (_ BitVec 8))) (size!4915 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11204)

(declare-fun b!225478 () Bool)

(declare-fun lt!358644 () (_ BitVec 64))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun e!153901 () Bool)

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!225478 (= e!153901 (not (or (not (= (bvadd lt!358644 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!358644)) (bvsle i!761 (size!4915 arr!308)))))))

(declare-fun arrayRangesEq!805 (array!11204 array!11204 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225478 (arrayRangesEq!805 arr!308 arr!308 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!16575 0))(
  ( (Unit!16576) )
))
(declare-fun lt!358643 () Unit!16575)

(declare-fun arrayRangesEqSlicedLemma!94 (array!11204 array!11204 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16575)

(assert (=> b!225478 (= lt!358643 (arrayRangesEqSlicedLemma!94 arr!308 arr!308 #b00000000000000000000000000000000 (size!4915 arr!308) #b00000000000000000000000000000000 i!761))))

(assert (=> b!225478 (arrayRangesEq!805 arr!308 arr!308 #b00000000000000000000000000000000 (size!4915 arr!308))))

(declare-fun lt!358642 () Unit!16575)

(declare-fun arrayRangesEqReflexiveLemma!109 (array!11204) Unit!16575)

(assert (=> b!225478 (= lt!358642 (arrayRangesEqReflexiveLemma!109 arr!308))))

(declare-datatypes ((BitStream!8932 0))(
  ( (BitStream!8933 (buf!5459 array!11204) (currentByte!10243 (_ BitVec 32)) (currentBit!10238 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8932)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225478 (= lt!358644 (bitIndex!0 (size!4915 (buf!5459 thiss!1870)) (currentByte!10243 thiss!1870) (currentBit!10238 thiss!1870)))))

(declare-fun res!189219 () Bool)

(assert (=> start!47222 (=> (not res!189219) (not e!153901))))

(assert (=> start!47222 (= res!189219 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4915 arr!308))))))

(assert (=> start!47222 e!153901))

(assert (=> start!47222 true))

(declare-fun array_inv!4656 (array!11204) Bool)

(assert (=> start!47222 (array_inv!4656 arr!308)))

(declare-fun e!153900 () Bool)

(declare-fun inv!12 (BitStream!8932) Bool)

(assert (=> start!47222 (and (inv!12 thiss!1870) e!153900)))

(declare-fun b!225479 () Bool)

(assert (=> b!225479 (= e!153900 (array_inv!4656 (buf!5459 thiss!1870)))))

(declare-fun b!225476 () Bool)

(declare-fun res!189217 () Bool)

(assert (=> b!225476 (=> (not res!189217) (not e!153901))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225476 (= res!189217 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4915 (buf!5459 thiss!1870))) ((_ sign_extend 32) (currentByte!10243 thiss!1870)) ((_ sign_extend 32) (currentBit!10238 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225477 () Bool)

(declare-fun res!189218 () Bool)

(assert (=> b!225477 (=> (not res!189218) (not e!153901))))

(assert (=> b!225477 (= res!189218 (bvsge i!761 to!496))))

(assert (= (and start!47222 res!189219) b!225476))

(assert (= (and b!225476 res!189217) b!225477))

(assert (= (and b!225477 res!189218) b!225478))

(assert (= start!47222 b!225479))

(declare-fun m!346479 () Bool)

(assert (=> b!225478 m!346479))

(declare-fun m!346481 () Bool)

(assert (=> b!225478 m!346481))

(declare-fun m!346483 () Bool)

(assert (=> b!225478 m!346483))

(declare-fun m!346485 () Bool)

(assert (=> b!225478 m!346485))

(declare-fun m!346487 () Bool)

(assert (=> b!225478 m!346487))

(declare-fun m!346489 () Bool)

(assert (=> start!47222 m!346489))

(declare-fun m!346491 () Bool)

(assert (=> start!47222 m!346491))

(declare-fun m!346493 () Bool)

(assert (=> b!225479 m!346493))

(declare-fun m!346495 () Bool)

(assert (=> b!225476 m!346495))

(push 1)

(assert (not b!225478))

(assert (not b!225479))

(assert (not start!47222))

(assert (not b!225476))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

