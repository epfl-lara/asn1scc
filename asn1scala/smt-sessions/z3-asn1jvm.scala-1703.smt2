; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47224 () Bool)

(assert start!47224)

(declare-fun res!189228 () Bool)

(declare-fun e!153912 () Bool)

(assert (=> start!47224 (=> (not res!189228) (not e!153912))))

(declare-datatypes ((array!11206 0))(
  ( (array!11207 (arr!5873 (Array (_ BitVec 32) (_ BitVec 8))) (size!4916 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11206)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47224 (= res!189228 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4916 arr!308))))))

(assert (=> start!47224 e!153912))

(assert (=> start!47224 true))

(declare-fun array_inv!4657 (array!11206) Bool)

(assert (=> start!47224 (array_inv!4657 arr!308)))

(declare-datatypes ((BitStream!8934 0))(
  ( (BitStream!8935 (buf!5460 array!11206) (currentByte!10244 (_ BitVec 32)) (currentBit!10239 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8934)

(declare-fun e!153913 () Bool)

(declare-fun inv!12 (BitStream!8934) Bool)

(assert (=> start!47224 (and (inv!12 thiss!1870) e!153913)))

(declare-fun b!225491 () Bool)

(assert (=> b!225491 (= e!153913 (array_inv!4657 (buf!5460 thiss!1870)))))

(declare-fun b!225489 () Bool)

(declare-fun res!189227 () Bool)

(assert (=> b!225489 (=> (not res!189227) (not e!153912))))

(assert (=> b!225489 (= res!189227 (bvsge i!761 to!496))))

(declare-fun b!225488 () Bool)

(declare-fun res!189226 () Bool)

(assert (=> b!225488 (=> (not res!189226) (not e!153912))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225488 (= res!189226 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4916 (buf!5460 thiss!1870))) ((_ sign_extend 32) (currentByte!10244 thiss!1870)) ((_ sign_extend 32) (currentBit!10239 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225490 () Bool)

(declare-fun lt!358652 () (_ BitVec 64))

(assert (=> b!225490 (= e!153912 (not (or (not (= (bvadd lt!358652 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!358652)) (bvsle i!761 (size!4916 arr!308)))))))

(declare-fun arrayRangesEq!806 (array!11206 array!11206 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225490 (arrayRangesEq!806 arr!308 arr!308 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!16577 0))(
  ( (Unit!16578) )
))
(declare-fun lt!358651 () Unit!16577)

(declare-fun arrayRangesEqSlicedLemma!95 (array!11206 array!11206 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16577)

(assert (=> b!225490 (= lt!358651 (arrayRangesEqSlicedLemma!95 arr!308 arr!308 #b00000000000000000000000000000000 (size!4916 arr!308) #b00000000000000000000000000000000 i!761))))

(assert (=> b!225490 (arrayRangesEq!806 arr!308 arr!308 #b00000000000000000000000000000000 (size!4916 arr!308))))

(declare-fun lt!358653 () Unit!16577)

(declare-fun arrayRangesEqReflexiveLemma!110 (array!11206) Unit!16577)

(assert (=> b!225490 (= lt!358653 (arrayRangesEqReflexiveLemma!110 arr!308))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225490 (= lt!358652 (bitIndex!0 (size!4916 (buf!5460 thiss!1870)) (currentByte!10244 thiss!1870) (currentBit!10239 thiss!1870)))))

(assert (= (and start!47224 res!189228) b!225488))

(assert (= (and b!225488 res!189226) b!225489))

(assert (= (and b!225489 res!189227) b!225490))

(assert (= start!47224 b!225491))

(declare-fun m!346497 () Bool)

(assert (=> start!47224 m!346497))

(declare-fun m!346499 () Bool)

(assert (=> start!47224 m!346499))

(declare-fun m!346501 () Bool)

(assert (=> b!225491 m!346501))

(declare-fun m!346503 () Bool)

(assert (=> b!225488 m!346503))

(declare-fun m!346505 () Bool)

(assert (=> b!225490 m!346505))

(declare-fun m!346507 () Bool)

(assert (=> b!225490 m!346507))

(declare-fun m!346509 () Bool)

(assert (=> b!225490 m!346509))

(declare-fun m!346511 () Bool)

(assert (=> b!225490 m!346511))

(declare-fun m!346513 () Bool)

(assert (=> b!225490 m!346513))

(check-sat (not b!225488) (not b!225490) (not b!225491) (not start!47224))
(check-sat)
