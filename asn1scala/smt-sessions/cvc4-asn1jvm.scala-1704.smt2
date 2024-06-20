; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47232 () Bool)

(assert start!47232)

(declare-fun b!225537 () Bool)

(declare-fun res!189263 () Bool)

(declare-fun e!153962 () Bool)

(assert (=> b!225537 (=> (not res!189263) (not e!153962))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!225537 (= res!189263 (bvsge i!761 to!496))))

(declare-fun b!225536 () Bool)

(declare-fun res!189264 () Bool)

(assert (=> b!225536 (=> (not res!189264) (not e!153962))))

(declare-datatypes ((array!11214 0))(
  ( (array!11215 (arr!5877 (Array (_ BitVec 32) (_ BitVec 8))) (size!4920 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8942 0))(
  ( (BitStream!8943 (buf!5464 array!11214) (currentByte!10248 (_ BitVec 32)) (currentBit!10243 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8942)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225536 (= res!189264 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4920 (buf!5464 thiss!1870))) ((_ sign_extend 32) (currentByte!10248 thiss!1870)) ((_ sign_extend 32) (currentBit!10243 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225539 () Bool)

(declare-fun e!153961 () Bool)

(declare-fun array_inv!4661 (array!11214) Bool)

(assert (=> b!225539 (= e!153961 (array_inv!4661 (buf!5464 thiss!1870)))))

(declare-fun b!225538 () Bool)

(assert (=> b!225538 (= e!153962 (not true))))

(declare-fun arr!308 () array!11214)

(declare-fun arrayRangesEq!810 (array!11214 array!11214 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225538 (arrayRangesEq!810 arr!308 arr!308 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!16585 0))(
  ( (Unit!16586) )
))
(declare-fun lt!358689 () Unit!16585)

(declare-fun arrayRangesEqSlicedLemma!99 (array!11214 array!11214 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16585)

(assert (=> b!225538 (= lt!358689 (arrayRangesEqSlicedLemma!99 arr!308 arr!308 #b00000000000000000000000000000000 (size!4920 arr!308) #b00000000000000000000000000000000 i!761))))

(assert (=> b!225538 (arrayRangesEq!810 arr!308 arr!308 #b00000000000000000000000000000000 (size!4920 arr!308))))

(declare-fun lt!358688 () Unit!16585)

(declare-fun arrayRangesEqReflexiveLemma!114 (array!11214) Unit!16585)

(assert (=> b!225538 (= lt!358688 (arrayRangesEqReflexiveLemma!114 arr!308))))

(declare-fun lt!358687 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225538 (= lt!358687 (bitIndex!0 (size!4920 (buf!5464 thiss!1870)) (currentByte!10248 thiss!1870) (currentBit!10243 thiss!1870)))))

(declare-fun res!189262 () Bool)

(assert (=> start!47232 (=> (not res!189262) (not e!153962))))

(assert (=> start!47232 (= res!189262 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4920 arr!308))))))

(assert (=> start!47232 e!153962))

(assert (=> start!47232 true))

(assert (=> start!47232 (array_inv!4661 arr!308)))

(declare-fun inv!12 (BitStream!8942) Bool)

(assert (=> start!47232 (and (inv!12 thiss!1870) e!153961)))

(assert (= (and start!47232 res!189262) b!225536))

(assert (= (and b!225536 res!189264) b!225537))

(assert (= (and b!225537 res!189263) b!225538))

(assert (= start!47232 b!225539))

(declare-fun m!346569 () Bool)

(assert (=> b!225536 m!346569))

(declare-fun m!346571 () Bool)

(assert (=> b!225539 m!346571))

(declare-fun m!346573 () Bool)

(assert (=> b!225538 m!346573))

(declare-fun m!346575 () Bool)

(assert (=> b!225538 m!346575))

(declare-fun m!346577 () Bool)

(assert (=> b!225538 m!346577))

(declare-fun m!346579 () Bool)

(assert (=> b!225538 m!346579))

(declare-fun m!346581 () Bool)

(assert (=> b!225538 m!346581))

(declare-fun m!346583 () Bool)

(assert (=> start!47232 m!346583))

(declare-fun m!346585 () Bool)

(assert (=> start!47232 m!346585))

(push 1)

(assert (not b!225539))

(assert (not start!47232))

(assert (not b!225536))

(assert (not b!225538))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

