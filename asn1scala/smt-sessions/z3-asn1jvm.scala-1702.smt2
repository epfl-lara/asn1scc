; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47218 () Bool)

(assert start!47218)

(declare-fun b!225453 () Bool)

(declare-fun res!189200 () Bool)

(declare-fun e!153876 () Bool)

(assert (=> b!225453 (=> (not res!189200) (not e!153876))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!225453 (= res!189200 (bvsge i!761 to!496))))

(declare-fun res!189201 () Bool)

(assert (=> start!47218 (=> (not res!189201) (not e!153876))))

(declare-datatypes ((array!11200 0))(
  ( (array!11201 (arr!5870 (Array (_ BitVec 32) (_ BitVec 8))) (size!4913 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11200)

(assert (=> start!47218 (= res!189201 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4913 arr!308))))))

(assert (=> start!47218 e!153876))

(assert (=> start!47218 true))

(declare-fun array_inv!4654 (array!11200) Bool)

(assert (=> start!47218 (array_inv!4654 arr!308)))

(declare-datatypes ((BitStream!8928 0))(
  ( (BitStream!8929 (buf!5457 array!11200) (currentByte!10241 (_ BitVec 32)) (currentBit!10236 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8928)

(declare-fun e!153877 () Bool)

(declare-fun inv!12 (BitStream!8928) Bool)

(assert (=> start!47218 (and (inv!12 thiss!1870) e!153877)))

(declare-fun b!225452 () Bool)

(declare-fun res!189199 () Bool)

(assert (=> b!225452 (=> (not res!189199) (not e!153876))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225452 (= res!189199 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4913 (buf!5457 thiss!1870))) ((_ sign_extend 32) (currentByte!10241 thiss!1870)) ((_ sign_extend 32) (currentBit!10236 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225455 () Bool)

(assert (=> b!225455 (= e!153877 (array_inv!4654 (buf!5457 thiss!1870)))))

(declare-fun b!225454 () Bool)

(assert (=> b!225454 (= e!153876 (not true))))

(declare-fun arrayRangesEq!803 (array!11200 array!11200 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225454 (arrayRangesEq!803 arr!308 arr!308 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!16571 0))(
  ( (Unit!16572) )
))
(declare-fun lt!358624 () Unit!16571)

(declare-fun arrayRangesEqSlicedLemma!92 (array!11200 array!11200 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16571)

(assert (=> b!225454 (= lt!358624 (arrayRangesEqSlicedLemma!92 arr!308 arr!308 #b00000000000000000000000000000000 (size!4913 arr!308) #b00000000000000000000000000000000 i!761))))

(assert (=> b!225454 (arrayRangesEq!803 arr!308 arr!308 #b00000000000000000000000000000000 (size!4913 arr!308))))

(declare-fun lt!358626 () Unit!16571)

(declare-fun arrayRangesEqReflexiveLemma!107 (array!11200) Unit!16571)

(assert (=> b!225454 (= lt!358626 (arrayRangesEqReflexiveLemma!107 arr!308))))

(declare-fun lt!358625 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225454 (= lt!358625 (bitIndex!0 (size!4913 (buf!5457 thiss!1870)) (currentByte!10241 thiss!1870) (currentBit!10236 thiss!1870)))))

(assert (= (and start!47218 res!189201) b!225452))

(assert (= (and b!225452 res!189199) b!225453))

(assert (= (and b!225453 res!189200) b!225454))

(assert (= start!47218 b!225455))

(declare-fun m!346443 () Bool)

(assert (=> start!47218 m!346443))

(declare-fun m!346445 () Bool)

(assert (=> start!47218 m!346445))

(declare-fun m!346447 () Bool)

(assert (=> b!225452 m!346447))

(declare-fun m!346449 () Bool)

(assert (=> b!225455 m!346449))

(declare-fun m!346451 () Bool)

(assert (=> b!225454 m!346451))

(declare-fun m!346453 () Bool)

(assert (=> b!225454 m!346453))

(declare-fun m!346455 () Bool)

(assert (=> b!225454 m!346455))

(declare-fun m!346457 () Bool)

(assert (=> b!225454 m!346457))

(declare-fun m!346459 () Bool)

(assert (=> b!225454 m!346459))

(check-sat (not b!225455) (not start!47218) (not b!225452) (not b!225454))
