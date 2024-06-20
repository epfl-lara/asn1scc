; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48100 () Bool)

(assert start!48100)

(declare-fun b!228460 () Bool)

(declare-fun res!191644 () Bool)

(declare-fun e!156562 () Bool)

(assert (=> b!228460 (=> (not res!191644) (not e!156562))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!228460 (= res!191644 (bvsge i!761 to!496))))

(declare-fun res!191642 () Bool)

(assert (=> start!48100 (=> (not res!191642) (not e!156562))))

(declare-datatypes ((array!11527 0))(
  ( (array!11528 (arr!6044 (Array (_ BitVec 32) (_ BitVec 8))) (size!5057 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11527)

(assert (=> start!48100 (= res!191642 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5057 arr!308))))))

(assert (=> start!48100 e!156562))

(assert (=> start!48100 true))

(declare-fun array_inv!4798 (array!11527) Bool)

(assert (=> start!48100 (array_inv!4798 arr!308)))

(declare-datatypes ((BitStream!9210 0))(
  ( (BitStream!9211 (buf!5598 array!11527) (currentByte!10460 (_ BitVec 32)) (currentBit!10455 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9210)

(declare-fun e!156561 () Bool)

(declare-fun inv!12 (BitStream!9210) Bool)

(assert (=> start!48100 (and (inv!12 thiss!1870) e!156561)))

(declare-fun b!228462 () Bool)

(assert (=> b!228462 (= e!156561 (array_inv!4798 (buf!5598 thiss!1870)))))

(declare-fun b!228459 () Bool)

(declare-fun res!191643 () Bool)

(assert (=> b!228459 (=> (not res!191643) (not e!156562))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228459 (= res!191643 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5057 (buf!5598 thiss!1870))) ((_ sign_extend 32) (currentByte!10460 thiss!1870)) ((_ sign_extend 32) (currentBit!10455 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!228461 () Bool)

(assert (=> b!228461 (= e!156562 (not (bvsle #b00000000000000000000000000000000 (size!5057 arr!308))))))

(declare-fun arrayRangesEq!890 (array!11527 array!11527 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228461 (arrayRangesEq!890 arr!308 arr!308 #b00000000000000000000000000000000 (size!5057 arr!308))))

(declare-datatypes ((Unit!17181 0))(
  ( (Unit!17182) )
))
(declare-fun lt!366740 () Unit!17181)

(declare-fun arrayRangesEqReflexiveLemma!146 (array!11527) Unit!17181)

(assert (=> b!228461 (= lt!366740 (arrayRangesEqReflexiveLemma!146 arr!308))))

(declare-fun lt!366741 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228461 (= lt!366741 (bitIndex!0 (size!5057 (buf!5598 thiss!1870)) (currentByte!10460 thiss!1870) (currentBit!10455 thiss!1870)))))

(assert (= (and start!48100 res!191642) b!228459))

(assert (= (and b!228459 res!191643) b!228460))

(assert (= (and b!228460 res!191644) b!228461))

(assert (= start!48100 b!228462))

(declare-fun m!352137 () Bool)

(assert (=> start!48100 m!352137))

(declare-fun m!352139 () Bool)

(assert (=> start!48100 m!352139))

(declare-fun m!352141 () Bool)

(assert (=> b!228462 m!352141))

(declare-fun m!352143 () Bool)

(assert (=> b!228459 m!352143))

(declare-fun m!352145 () Bool)

(assert (=> b!228461 m!352145))

(declare-fun m!352147 () Bool)

(assert (=> b!228461 m!352147))

(declare-fun m!352149 () Bool)

(assert (=> b!228461 m!352149))

(check-sat (not b!228462) (not b!228461) (not start!48100) (not b!228459))
(check-sat)
