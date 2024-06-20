; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48124 () Bool)

(assert start!48124)

(declare-fun b!228603 () Bool)

(declare-fun res!191750 () Bool)

(declare-fun e!156703 () Bool)

(assert (=> b!228603 (=> (not res!191750) (not e!156703))))

(declare-datatypes ((array!11551 0))(
  ( (array!11552 (arr!6056 (Array (_ BitVec 32) (_ BitVec 8))) (size!5069 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9234 0))(
  ( (BitStream!9235 (buf!5610 array!11551) (currentByte!10472 (_ BitVec 32)) (currentBit!10467 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9234)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228603 (= res!191750 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5069 (buf!5610 thiss!1870))) ((_ sign_extend 32) (currentByte!10472 thiss!1870)) ((_ sign_extend 32) (currentBit!10467 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!191752 () Bool)

(assert (=> start!48124 (=> (not res!191752) (not e!156703))))

(declare-fun arr!308 () array!11551)

(assert (=> start!48124 (= res!191752 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5069 arr!308))))))

(assert (=> start!48124 e!156703))

(assert (=> start!48124 true))

(declare-fun array_inv!4810 (array!11551) Bool)

(assert (=> start!48124 (array_inv!4810 arr!308)))

(declare-fun e!156704 () Bool)

(declare-fun inv!12 (BitStream!9234) Bool)

(assert (=> start!48124 (and (inv!12 thiss!1870) e!156704)))

(declare-fun b!228606 () Bool)

(assert (=> b!228606 (= e!156704 (array_inv!4810 (buf!5610 thiss!1870)))))

(declare-fun b!228604 () Bool)

(declare-fun res!191751 () Bool)

(assert (=> b!228604 (=> (not res!191751) (not e!156703))))

(assert (=> b!228604 (= res!191751 (bvsge i!761 to!496))))

(declare-fun b!228605 () Bool)

(assert (=> b!228605 (= e!156703 (not true))))

(declare-fun arrayRangesEq!902 (array!11551 array!11551 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228605 (arrayRangesEq!902 arr!308 arr!308 #b00000000000000000000000000000000 (size!5069 arr!308))))

(declare-datatypes ((Unit!17205 0))(
  ( (Unit!17206) )
))
(declare-fun lt!366812 () Unit!17205)

(declare-fun arrayRangesEqReflexiveLemma!158 (array!11551) Unit!17205)

(assert (=> b!228605 (= lt!366812 (arrayRangesEqReflexiveLemma!158 arr!308))))

(declare-fun lt!366813 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228605 (= lt!366813 (bitIndex!0 (size!5069 (buf!5610 thiss!1870)) (currentByte!10472 thiss!1870) (currentBit!10467 thiss!1870)))))

(assert (= (and start!48124 res!191752) b!228603))

(assert (= (and b!228603 res!191750) b!228604))

(assert (= (and b!228604 res!191751) b!228605))

(assert (= start!48124 b!228606))

(declare-fun m!352305 () Bool)

(assert (=> b!228603 m!352305))

(declare-fun m!352307 () Bool)

(assert (=> start!48124 m!352307))

(declare-fun m!352309 () Bool)

(assert (=> start!48124 m!352309))

(declare-fun m!352311 () Bool)

(assert (=> b!228606 m!352311))

(declare-fun m!352313 () Bool)

(assert (=> b!228605 m!352313))

(declare-fun m!352315 () Bool)

(assert (=> b!228605 m!352315))

(declare-fun m!352317 () Bool)

(assert (=> b!228605 m!352317))

(check-sat (not start!48124) (not b!228605) (not b!228603) (not b!228606))
