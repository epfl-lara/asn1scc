; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48154 () Bool)

(assert start!48154)

(declare-fun b!228785 () Bool)

(declare-fun e!156883 () Bool)

(assert (=> b!228785 (= e!156883 (not true))))

(declare-datatypes ((array!11581 0))(
  ( (array!11582 (arr!6071 (Array (_ BitVec 32) (_ BitVec 8))) (size!5084 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11581)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun arrayRangesEq!917 (array!11581 array!11581 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228785 (arrayRangesEq!917 arr!308 arr!308 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!17235 0))(
  ( (Unit!17236) )
))
(declare-fun lt!366972 () Unit!17235)

(declare-fun arrayRangesEqSlicedLemma!143 (array!11581 array!11581 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17235)

(assert (=> b!228785 (= lt!366972 (arrayRangesEqSlicedLemma!143 arr!308 arr!308 #b00000000000000000000000000000000 (size!5084 arr!308) #b00000000000000000000000000000000 i!761))))

(assert (=> b!228785 (arrayRangesEq!917 arr!308 arr!308 #b00000000000000000000000000000000 (size!5084 arr!308))))

(declare-fun lt!366971 () Unit!17235)

(declare-fun arrayRangesEqReflexiveLemma!173 (array!11581) Unit!17235)

(assert (=> b!228785 (= lt!366971 (arrayRangesEqReflexiveLemma!173 arr!308))))

(declare-fun lt!366970 () (_ BitVec 64))

(declare-datatypes ((BitStream!9264 0))(
  ( (BitStream!9265 (buf!5625 array!11581) (currentByte!10487 (_ BitVec 32)) (currentBit!10482 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9264)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228785 (= lt!366970 (bitIndex!0 (size!5084 (buf!5625 thiss!1870)) (currentByte!10487 thiss!1870) (currentBit!10482 thiss!1870)))))

(declare-fun res!191886 () Bool)

(assert (=> start!48154 (=> (not res!191886) (not e!156883))))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!48154 (= res!191886 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5084 arr!308))))))

(assert (=> start!48154 e!156883))

(assert (=> start!48154 true))

(declare-fun array_inv!4825 (array!11581) Bool)

(assert (=> start!48154 (array_inv!4825 arr!308)))

(declare-fun e!156886 () Bool)

(declare-fun inv!12 (BitStream!9264) Bool)

(assert (=> start!48154 (and (inv!12 thiss!1870) e!156886)))

(declare-fun b!228786 () Bool)

(assert (=> b!228786 (= e!156886 (array_inv!4825 (buf!5625 thiss!1870)))))

(declare-fun b!228784 () Bool)

(declare-fun res!191885 () Bool)

(assert (=> b!228784 (=> (not res!191885) (not e!156883))))

(assert (=> b!228784 (= res!191885 (bvsge i!761 to!496))))

(declare-fun b!228783 () Bool)

(declare-fun res!191887 () Bool)

(assert (=> b!228783 (=> (not res!191887) (not e!156883))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228783 (= res!191887 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5084 (buf!5625 thiss!1870))) ((_ sign_extend 32) (currentByte!10487 thiss!1870)) ((_ sign_extend 32) (currentBit!10482 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!48154 res!191886) b!228783))

(assert (= (and b!228783 res!191887) b!228784))

(assert (= (and b!228784 res!191885) b!228785))

(assert (= start!48154 b!228786))

(declare-fun m!352567 () Bool)

(assert (=> b!228785 m!352567))

(declare-fun m!352569 () Bool)

(assert (=> b!228785 m!352569))

(declare-fun m!352571 () Bool)

(assert (=> b!228785 m!352571))

(declare-fun m!352573 () Bool)

(assert (=> b!228785 m!352573))

(declare-fun m!352575 () Bool)

(assert (=> b!228785 m!352575))

(declare-fun m!352577 () Bool)

(assert (=> start!48154 m!352577))

(declare-fun m!352579 () Bool)

(assert (=> start!48154 m!352579))

(declare-fun m!352581 () Bool)

(assert (=> b!228786 m!352581))

(declare-fun m!352583 () Bool)

(assert (=> b!228783 m!352583))

(check-sat (not b!228783) (not b!228785) (not start!48154) (not b!228786))
