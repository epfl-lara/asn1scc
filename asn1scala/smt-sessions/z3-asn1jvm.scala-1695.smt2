; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47080 () Bool)

(assert start!47080)

(declare-fun res!188926 () Bool)

(declare-fun e!153559 () Bool)

(assert (=> start!47080 (=> (not res!188926) (not e!153559))))

(declare-datatypes ((array!11152 0))(
  ( (array!11153 (arr!5849 (Array (_ BitVec 32) (_ BitVec 8))) (size!4892 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11152)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47080 (= res!188926 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4892 arr!308))))))

(assert (=> start!47080 e!153559))

(assert (=> start!47080 true))

(declare-fun array_inv!4633 (array!11152) Bool)

(assert (=> start!47080 (array_inv!4633 arr!308)))

(declare-datatypes ((BitStream!8886 0))(
  ( (BitStream!8887 (buf!5436 array!11152) (currentByte!10202 (_ BitVec 32)) (currentBit!10197 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8886)

(declare-fun e!153558 () Bool)

(declare-fun inv!12 (BitStream!8886) Bool)

(assert (=> start!47080 (and (inv!12 thiss!1870) e!153558)))

(declare-fun b!225116 () Bool)

(declare-fun res!188927 () Bool)

(assert (=> b!225116 (=> (not res!188927) (not e!153559))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225116 (= res!188927 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4892 (buf!5436 thiss!1870))) ((_ sign_extend 32) (currentByte!10202 thiss!1870)) ((_ sign_extend 32) (currentBit!10197 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225119 () Bool)

(assert (=> b!225119 (= e!153558 (array_inv!4633 (buf!5436 thiss!1870)))))

(declare-fun b!225118 () Bool)

(assert (=> b!225118 (= e!153559 (not true))))

(declare-fun arrayRangesEq!782 (array!11152 array!11152 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225118 (arrayRangesEq!782 arr!308 arr!308 #b00000000000000000000000000000000 (size!4892 arr!308))))

(declare-datatypes ((Unit!16529 0))(
  ( (Unit!16530) )
))
(declare-fun lt!358322 () Unit!16529)

(declare-fun arrayRangesEqReflexiveLemma!86 (array!11152) Unit!16529)

(assert (=> b!225118 (= lt!358322 (arrayRangesEqReflexiveLemma!86 arr!308))))

(declare-fun lt!358323 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225118 (= lt!358323 (bitIndex!0 (size!4892 (buf!5436 thiss!1870)) (currentByte!10202 thiss!1870) (currentBit!10197 thiss!1870)))))

(declare-fun b!225117 () Bool)

(declare-fun res!188928 () Bool)

(assert (=> b!225117 (=> (not res!188928) (not e!153559))))

(assert (=> b!225117 (= res!188928 (bvsge i!761 to!496))))

(assert (= (and start!47080 res!188926) b!225116))

(assert (= (and b!225116 res!188927) b!225117))

(assert (= (and b!225117 res!188928) b!225118))

(assert (= start!47080 b!225119))

(declare-fun m!346025 () Bool)

(assert (=> start!47080 m!346025))

(declare-fun m!346027 () Bool)

(assert (=> start!47080 m!346027))

(declare-fun m!346029 () Bool)

(assert (=> b!225116 m!346029))

(declare-fun m!346031 () Bool)

(assert (=> b!225119 m!346031))

(declare-fun m!346033 () Bool)

(assert (=> b!225118 m!346033))

(declare-fun m!346035 () Bool)

(assert (=> b!225118 m!346035))

(declare-fun m!346037 () Bool)

(assert (=> b!225118 m!346037))

(check-sat (not start!47080) (not b!225118) (not b!225116) (not b!225119))
