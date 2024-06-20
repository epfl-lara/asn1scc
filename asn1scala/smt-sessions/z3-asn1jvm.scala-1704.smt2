; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47230 () Bool)

(assert start!47230)

(declare-fun b!225525 () Bool)

(declare-fun res!189255 () Bool)

(declare-fun e!153950 () Bool)

(assert (=> b!225525 (=> (not res!189255) (not e!153950))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!225525 (= res!189255 (bvsge i!761 to!496))))

(declare-fun b!225524 () Bool)

(declare-fun res!189254 () Bool)

(assert (=> b!225524 (=> (not res!189254) (not e!153950))))

(declare-datatypes ((array!11212 0))(
  ( (array!11213 (arr!5876 (Array (_ BitVec 32) (_ BitVec 8))) (size!4919 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8940 0))(
  ( (BitStream!8941 (buf!5463 array!11212) (currentByte!10247 (_ BitVec 32)) (currentBit!10242 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8940)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225524 (= res!189254 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4919 (buf!5463 thiss!1870))) ((_ sign_extend 32) (currentByte!10247 thiss!1870)) ((_ sign_extend 32) (currentBit!10242 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!189253 () Bool)

(assert (=> start!47230 (=> (not res!189253) (not e!153950))))

(declare-fun arr!308 () array!11212)

(assert (=> start!47230 (= res!189253 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4919 arr!308))))))

(assert (=> start!47230 e!153950))

(assert (=> start!47230 true))

(declare-fun array_inv!4660 (array!11212) Bool)

(assert (=> start!47230 (array_inv!4660 arr!308)))

(declare-fun e!153949 () Bool)

(declare-fun inv!12 (BitStream!8940) Bool)

(assert (=> start!47230 (and (inv!12 thiss!1870) e!153949)))

(declare-fun b!225527 () Bool)

(assert (=> b!225527 (= e!153949 (array_inv!4660 (buf!5463 thiss!1870)))))

(declare-fun b!225526 () Bool)

(assert (=> b!225526 (= e!153950 (not true))))

(declare-fun arrayRangesEq!809 (array!11212 array!11212 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225526 (arrayRangesEq!809 arr!308 arr!308 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!16583 0))(
  ( (Unit!16584) )
))
(declare-fun lt!358678 () Unit!16583)

(declare-fun arrayRangesEqSlicedLemma!98 (array!11212 array!11212 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16583)

(assert (=> b!225526 (= lt!358678 (arrayRangesEqSlicedLemma!98 arr!308 arr!308 #b00000000000000000000000000000000 (size!4919 arr!308) #b00000000000000000000000000000000 i!761))))

(assert (=> b!225526 (arrayRangesEq!809 arr!308 arr!308 #b00000000000000000000000000000000 (size!4919 arr!308))))

(declare-fun lt!358680 () Unit!16583)

(declare-fun arrayRangesEqReflexiveLemma!113 (array!11212) Unit!16583)

(assert (=> b!225526 (= lt!358680 (arrayRangesEqReflexiveLemma!113 arr!308))))

(declare-fun lt!358679 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225526 (= lt!358679 (bitIndex!0 (size!4919 (buf!5463 thiss!1870)) (currentByte!10247 thiss!1870) (currentBit!10242 thiss!1870)))))

(assert (= (and start!47230 res!189253) b!225524))

(assert (= (and b!225524 res!189254) b!225525))

(assert (= (and b!225525 res!189255) b!225526))

(assert (= start!47230 b!225527))

(declare-fun m!346551 () Bool)

(assert (=> b!225524 m!346551))

(declare-fun m!346553 () Bool)

(assert (=> start!47230 m!346553))

(declare-fun m!346555 () Bool)

(assert (=> start!47230 m!346555))

(declare-fun m!346557 () Bool)

(assert (=> b!225527 m!346557))

(declare-fun m!346559 () Bool)

(assert (=> b!225526 m!346559))

(declare-fun m!346561 () Bool)

(assert (=> b!225526 m!346561))

(declare-fun m!346563 () Bool)

(assert (=> b!225526 m!346563))

(declare-fun m!346565 () Bool)

(assert (=> b!225526 m!346565))

(declare-fun m!346567 () Bool)

(assert (=> b!225526 m!346567))

(check-sat (not b!225524) (not b!225526) (not b!225527) (not start!47230))
