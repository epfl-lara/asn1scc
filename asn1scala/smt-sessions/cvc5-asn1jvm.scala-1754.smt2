; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48122 () Bool)

(assert start!48122)

(declare-fun b!228591 () Bool)

(declare-fun res!191741 () Bool)

(declare-fun e!156693 () Bool)

(assert (=> b!228591 (=> (not res!191741) (not e!156693))))

(declare-datatypes ((array!11549 0))(
  ( (array!11550 (arr!6055 (Array (_ BitVec 32) (_ BitVec 8))) (size!5068 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9232 0))(
  ( (BitStream!9233 (buf!5609 array!11549) (currentByte!10471 (_ BitVec 32)) (currentBit!10466 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9232)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228591 (= res!191741 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5068 (buf!5609 thiss!1870))) ((_ sign_extend 32) (currentByte!10471 thiss!1870)) ((_ sign_extend 32) (currentBit!10466 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!228594 () Bool)

(declare-fun e!156694 () Bool)

(declare-fun array_inv!4809 (array!11549) Bool)

(assert (=> b!228594 (= e!156694 (array_inv!4809 (buf!5609 thiss!1870)))))

(declare-fun b!228592 () Bool)

(declare-fun res!191743 () Bool)

(assert (=> b!228592 (=> (not res!191743) (not e!156693))))

(assert (=> b!228592 (= res!191743 (bvsge i!761 to!496))))

(declare-fun res!191742 () Bool)

(assert (=> start!48122 (=> (not res!191742) (not e!156693))))

(declare-fun arr!308 () array!11549)

(assert (=> start!48122 (= res!191742 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5068 arr!308))))))

(assert (=> start!48122 e!156693))

(assert (=> start!48122 true))

(assert (=> start!48122 (array_inv!4809 arr!308)))

(declare-fun inv!12 (BitStream!9232) Bool)

(assert (=> start!48122 (and (inv!12 thiss!1870) e!156694)))

(declare-fun b!228593 () Bool)

(assert (=> b!228593 (= e!156693 (not true))))

(declare-fun arrayRangesEq!901 (array!11549 array!11549 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228593 (arrayRangesEq!901 arr!308 arr!308 #b00000000000000000000000000000000 (size!5068 arr!308))))

(declare-datatypes ((Unit!17203 0))(
  ( (Unit!17204) )
))
(declare-fun lt!366806 () Unit!17203)

(declare-fun arrayRangesEqReflexiveLemma!157 (array!11549) Unit!17203)

(assert (=> b!228593 (= lt!366806 (arrayRangesEqReflexiveLemma!157 arr!308))))

(declare-fun lt!366807 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228593 (= lt!366807 (bitIndex!0 (size!5068 (buf!5609 thiss!1870)) (currentByte!10471 thiss!1870) (currentBit!10466 thiss!1870)))))

(assert (= (and start!48122 res!191742) b!228591))

(assert (= (and b!228591 res!191741) b!228592))

(assert (= (and b!228592 res!191743) b!228593))

(assert (= start!48122 b!228594))

(declare-fun m!352291 () Bool)

(assert (=> b!228591 m!352291))

(declare-fun m!352293 () Bool)

(assert (=> b!228594 m!352293))

(declare-fun m!352295 () Bool)

(assert (=> start!48122 m!352295))

(declare-fun m!352297 () Bool)

(assert (=> start!48122 m!352297))

(declare-fun m!352299 () Bool)

(assert (=> b!228593 m!352299))

(declare-fun m!352301 () Bool)

(assert (=> b!228593 m!352301))

(declare-fun m!352303 () Bool)

(assert (=> b!228593 m!352303))

(push 1)

(assert (not start!48122))

(assert (not b!228591))

(assert (not b!228593))

(assert (not b!228594))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

