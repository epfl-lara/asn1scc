; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47212 () Bool)

(assert start!47212)

(declare-fun b!225419 () Bool)

(declare-fun e!153841 () Bool)

(declare-datatypes ((array!11194 0))(
  ( (array!11195 (arr!5867 (Array (_ BitVec 32) (_ BitVec 8))) (size!4910 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8922 0))(
  ( (BitStream!8923 (buf!5454 array!11194) (currentByte!10238 (_ BitVec 32)) (currentBit!10233 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8922)

(declare-fun array_inv!4651 (array!11194) Bool)

(assert (=> b!225419 (= e!153841 (array_inv!4651 (buf!5454 thiss!1870)))))

(declare-fun res!189172 () Bool)

(declare-fun e!153842 () Bool)

(assert (=> start!47212 (=> (not res!189172) (not e!153842))))

(declare-fun arr!308 () array!11194)

(declare-fun to!496 () (_ BitVec 32))

(declare-fun i!761 () (_ BitVec 32))

(assert (=> start!47212 (= res!189172 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4910 arr!308))))))

(assert (=> start!47212 e!153842))

(assert (=> start!47212 true))

(assert (=> start!47212 (array_inv!4651 arr!308)))

(declare-fun inv!12 (BitStream!8922) Bool)

(assert (=> start!47212 (and (inv!12 thiss!1870) e!153841)))

(declare-fun b!225418 () Bool)

(assert (=> b!225418 (= e!153842 (not true))))

(declare-fun arrayRangesEq!800 (array!11194 array!11194 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225418 (arrayRangesEq!800 arr!308 arr!308 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!16565 0))(
  ( (Unit!16566) )
))
(declare-fun lt!358598 () Unit!16565)

(declare-fun arrayRangesEqSlicedLemma!89 (array!11194 array!11194 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16565)

(assert (=> b!225418 (= lt!358598 (arrayRangesEqSlicedLemma!89 arr!308 arr!308 #b00000000000000000000000000000000 (size!4910 arr!308) #b00000000000000000000000000000000 i!761))))

(assert (=> b!225418 (arrayRangesEq!800 arr!308 arr!308 #b00000000000000000000000000000000 (size!4910 arr!308))))

(declare-fun lt!358599 () Unit!16565)

(declare-fun arrayRangesEqReflexiveLemma!104 (array!11194) Unit!16565)

(assert (=> b!225418 (= lt!358599 (arrayRangesEqReflexiveLemma!104 arr!308))))

(declare-fun lt!358597 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225418 (= lt!358597 (bitIndex!0 (size!4910 (buf!5454 thiss!1870)) (currentByte!10238 thiss!1870) (currentBit!10233 thiss!1870)))))

(declare-fun b!225417 () Bool)

(declare-fun res!189174 () Bool)

(assert (=> b!225417 (=> (not res!189174) (not e!153842))))

(assert (=> b!225417 (= res!189174 (bvsge i!761 to!496))))

(declare-fun b!225416 () Bool)

(declare-fun res!189173 () Bool)

(assert (=> b!225416 (=> (not res!189173) (not e!153842))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225416 (= res!189173 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4910 (buf!5454 thiss!1870))) ((_ sign_extend 32) (currentByte!10238 thiss!1870)) ((_ sign_extend 32) (currentBit!10233 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!47212 res!189172) b!225416))

(assert (= (and b!225416 res!189173) b!225417))

(assert (= (and b!225417 res!189174) b!225418))

(assert (= start!47212 b!225419))

(declare-fun m!346389 () Bool)

(assert (=> b!225419 m!346389))

(declare-fun m!346391 () Bool)

(assert (=> start!47212 m!346391))

(declare-fun m!346393 () Bool)

(assert (=> start!47212 m!346393))

(declare-fun m!346395 () Bool)

(assert (=> b!225418 m!346395))

(declare-fun m!346397 () Bool)

(assert (=> b!225418 m!346397))

(declare-fun m!346399 () Bool)

(assert (=> b!225418 m!346399))

(declare-fun m!346401 () Bool)

(assert (=> b!225418 m!346401))

(declare-fun m!346403 () Bool)

(assert (=> b!225418 m!346403))

(declare-fun m!346405 () Bool)

(assert (=> b!225416 m!346405))

(check-sat (not b!225418) (not b!225419) (not start!47212) (not b!225416))
