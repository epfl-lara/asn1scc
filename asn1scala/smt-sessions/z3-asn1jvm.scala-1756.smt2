; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48136 () Bool)

(assert start!48136)

(declare-fun res!191805 () Bool)

(declare-fun e!156776 () Bool)

(assert (=> start!48136 (=> (not res!191805) (not e!156776))))

(declare-datatypes ((array!11563 0))(
  ( (array!11564 (arr!6062 (Array (_ BitVec 32) (_ BitVec 8))) (size!5075 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11563)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!48136 (= res!191805 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5075 arr!308))))))

(assert (=> start!48136 e!156776))

(assert (=> start!48136 true))

(declare-fun array_inv!4816 (array!11563) Bool)

(assert (=> start!48136 (array_inv!4816 arr!308)))

(declare-datatypes ((BitStream!9246 0))(
  ( (BitStream!9247 (buf!5616 array!11563) (currentByte!10478 (_ BitVec 32)) (currentBit!10473 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9246)

(declare-fun e!156775 () Bool)

(declare-fun inv!12 (BitStream!9246) Bool)

(assert (=> start!48136 (and (inv!12 thiss!1870) e!156775)))

(declare-fun b!228676 () Bool)

(declare-fun res!191806 () Bool)

(assert (=> b!228676 (=> (not res!191806) (not e!156776))))

(assert (=> b!228676 (= res!191806 (bvsge i!761 to!496))))

(declare-fun b!228677 () Bool)

(declare-fun lt!366867 () (_ BitVec 64))

(assert (=> b!228677 (= e!156776 (not (or (= lt!366867 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!366867) lt!366867)))))))

(assert (=> b!228677 (= lt!366867 ((_ sign_extend 32) (bvsub to!496 i!761)))))

(declare-fun arrayRangesEq!908 (array!11563 array!11563 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228677 (arrayRangesEq!908 arr!308 arr!308 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!17217 0))(
  ( (Unit!17218) )
))
(declare-fun lt!366870 () Unit!17217)

(declare-fun arrayRangesEqSlicedLemma!134 (array!11563 array!11563 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17217)

(assert (=> b!228677 (= lt!366870 (arrayRangesEqSlicedLemma!134 arr!308 arr!308 #b00000000000000000000000000000000 (size!5075 arr!308) #b00000000000000000000000000000000 i!761))))

(assert (=> b!228677 (arrayRangesEq!908 arr!308 arr!308 #b00000000000000000000000000000000 (size!5075 arr!308))))

(declare-fun lt!366868 () Unit!17217)

(declare-fun arrayRangesEqReflexiveLemma!164 (array!11563) Unit!17217)

(assert (=> b!228677 (= lt!366868 (arrayRangesEqReflexiveLemma!164 arr!308))))

(declare-fun lt!366869 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228677 (= lt!366869 (bitIndex!0 (size!5075 (buf!5616 thiss!1870)) (currentByte!10478 thiss!1870) (currentBit!10473 thiss!1870)))))

(declare-fun b!228678 () Bool)

(assert (=> b!228678 (= e!156775 (array_inv!4816 (buf!5616 thiss!1870)))))

(declare-fun b!228675 () Bool)

(declare-fun res!191804 () Bool)

(assert (=> b!228675 (=> (not res!191804) (not e!156776))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228675 (= res!191804 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5075 (buf!5616 thiss!1870))) ((_ sign_extend 32) (currentByte!10478 thiss!1870)) ((_ sign_extend 32) (currentBit!10473 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!48136 res!191805) b!228675))

(assert (= (and b!228675 res!191804) b!228676))

(assert (= (and b!228676 res!191806) b!228677))

(assert (= start!48136 b!228678))

(declare-fun m!352405 () Bool)

(assert (=> start!48136 m!352405))

(declare-fun m!352407 () Bool)

(assert (=> start!48136 m!352407))

(declare-fun m!352409 () Bool)

(assert (=> b!228677 m!352409))

(declare-fun m!352411 () Bool)

(assert (=> b!228677 m!352411))

(declare-fun m!352413 () Bool)

(assert (=> b!228677 m!352413))

(declare-fun m!352415 () Bool)

(assert (=> b!228677 m!352415))

(declare-fun m!352417 () Bool)

(assert (=> b!228677 m!352417))

(declare-fun m!352419 () Bool)

(assert (=> b!228678 m!352419))

(declare-fun m!352421 () Bool)

(assert (=> b!228675 m!352421))

(check-sat (not b!228675) (not b!228678) (not b!228677) (not start!48136))
(check-sat)
