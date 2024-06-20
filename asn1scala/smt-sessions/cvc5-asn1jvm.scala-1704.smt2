; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47228 () Bool)

(assert start!47228)

(declare-fun res!189246 () Bool)

(declare-fun e!153937 () Bool)

(assert (=> start!47228 (=> (not res!189246) (not e!153937))))

(declare-datatypes ((array!11210 0))(
  ( (array!11211 (arr!5875 (Array (_ BitVec 32) (_ BitVec 8))) (size!4918 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11210)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47228 (= res!189246 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4918 arr!308))))))

(assert (=> start!47228 e!153937))

(assert (=> start!47228 true))

(declare-fun array_inv!4659 (array!11210) Bool)

(assert (=> start!47228 (array_inv!4659 arr!308)))

(declare-datatypes ((BitStream!8938 0))(
  ( (BitStream!8939 (buf!5462 array!11210) (currentByte!10246 (_ BitVec 32)) (currentBit!10241 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8938)

(declare-fun e!153935 () Bool)

(declare-fun inv!12 (BitStream!8938) Bool)

(assert (=> start!47228 (and (inv!12 thiss!1870) e!153935)))

(declare-fun b!225512 () Bool)

(declare-fun res!189244 () Bool)

(assert (=> b!225512 (=> (not res!189244) (not e!153937))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225512 (= res!189244 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4918 (buf!5462 thiss!1870))) ((_ sign_extend 32) (currentByte!10246 thiss!1870)) ((_ sign_extend 32) (currentBit!10241 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225515 () Bool)

(assert (=> b!225515 (= e!153935 (array_inv!4659 (buf!5462 thiss!1870)))))

(declare-fun b!225513 () Bool)

(declare-fun res!189245 () Bool)

(assert (=> b!225513 (=> (not res!189245) (not e!153937))))

(assert (=> b!225513 (= res!189245 (bvsge i!761 to!496))))

(declare-fun b!225514 () Bool)

(assert (=> b!225514 (= e!153937 (not true))))

(declare-fun arrayRangesEq!808 (array!11210 array!11210 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225514 (arrayRangesEq!808 arr!308 arr!308 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!16581 0))(
  ( (Unit!16582) )
))
(declare-fun lt!358669 () Unit!16581)

(declare-fun arrayRangesEqSlicedLemma!97 (array!11210 array!11210 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16581)

(assert (=> b!225514 (= lt!358669 (arrayRangesEqSlicedLemma!97 arr!308 arr!308 #b00000000000000000000000000000000 (size!4918 arr!308) #b00000000000000000000000000000000 i!761))))

(assert (=> b!225514 (arrayRangesEq!808 arr!308 arr!308 #b00000000000000000000000000000000 (size!4918 arr!308))))

(declare-fun lt!358670 () Unit!16581)

(declare-fun arrayRangesEqReflexiveLemma!112 (array!11210) Unit!16581)

(assert (=> b!225514 (= lt!358670 (arrayRangesEqReflexiveLemma!112 arr!308))))

(declare-fun lt!358671 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225514 (= lt!358671 (bitIndex!0 (size!4918 (buf!5462 thiss!1870)) (currentByte!10246 thiss!1870) (currentBit!10241 thiss!1870)))))

(assert (= (and start!47228 res!189246) b!225512))

(assert (= (and b!225512 res!189244) b!225513))

(assert (= (and b!225513 res!189245) b!225514))

(assert (= start!47228 b!225515))

(declare-fun m!346533 () Bool)

(assert (=> start!47228 m!346533))

(declare-fun m!346535 () Bool)

(assert (=> start!47228 m!346535))

(declare-fun m!346537 () Bool)

(assert (=> b!225512 m!346537))

(declare-fun m!346539 () Bool)

(assert (=> b!225515 m!346539))

(declare-fun m!346541 () Bool)

(assert (=> b!225514 m!346541))

(declare-fun m!346543 () Bool)

(assert (=> b!225514 m!346543))

(declare-fun m!346545 () Bool)

(assert (=> b!225514 m!346545))

(declare-fun m!346547 () Bool)

(assert (=> b!225514 m!346547))

(declare-fun m!346549 () Bool)

(assert (=> b!225514 m!346549))

(push 1)

(assert (not b!225515))

(assert (not start!47228))

(assert (not b!225512))

(assert (not b!225514))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

