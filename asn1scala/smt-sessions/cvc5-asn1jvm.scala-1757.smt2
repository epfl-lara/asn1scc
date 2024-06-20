; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48140 () Bool)

(assert start!48140)

(declare-fun res!191824 () Bool)

(declare-fun e!156802 () Bool)

(assert (=> start!48140 (=> (not res!191824) (not e!156802))))

(declare-datatypes ((array!11567 0))(
  ( (array!11568 (arr!6064 (Array (_ BitVec 32) (_ BitVec 8))) (size!5077 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11567)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!48140 (= res!191824 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5077 arr!308))))))

(assert (=> start!48140 e!156802))

(assert (=> start!48140 true))

(declare-fun array_inv!4818 (array!11567) Bool)

(assert (=> start!48140 (array_inv!4818 arr!308)))

(declare-datatypes ((BitStream!9250 0))(
  ( (BitStream!9251 (buf!5618 array!11567) (currentByte!10480 (_ BitVec 32)) (currentBit!10475 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9250)

(declare-fun e!156799 () Bool)

(declare-fun inv!12 (BitStream!9250) Bool)

(assert (=> start!48140 (and (inv!12 thiss!1870) e!156799)))

(declare-fun b!228699 () Bool)

(declare-fun res!191823 () Bool)

(assert (=> b!228699 (=> (not res!191823) (not e!156802))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228699 (= res!191823 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5077 (buf!5618 thiss!1870))) ((_ sign_extend 32) (currentByte!10480 thiss!1870)) ((_ sign_extend 32) (currentBit!10475 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!228700 () Bool)

(declare-fun res!191822 () Bool)

(assert (=> b!228700 (=> (not res!191822) (not e!156802))))

(assert (=> b!228700 (= res!191822 (bvsge i!761 to!496))))

(declare-fun b!228702 () Bool)

(assert (=> b!228702 (= e!156799 (array_inv!4818 (buf!5618 thiss!1870)))))

(declare-fun lt!366894 () (_ BitVec 64))

(declare-fun lt!366897 () (_ BitVec 64))

(declare-fun lt!366893 () (_ BitVec 64))

(declare-fun b!228701 () Bool)

(assert (=> b!228701 (= e!156802 (not (or (not (= lt!366894 (bvand lt!366893 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!366894 (bvand (bvadd lt!366897 lt!366893) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!228701 (= lt!366894 (bvand lt!366897 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!228701 (= lt!366893 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761))))))

(declare-fun arrayRangesEq!910 (array!11567 array!11567 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228701 (arrayRangesEq!910 arr!308 arr!308 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!17221 0))(
  ( (Unit!17222) )
))
(declare-fun lt!366895 () Unit!17221)

(declare-fun arrayRangesEqSlicedLemma!136 (array!11567 array!11567 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17221)

(assert (=> b!228701 (= lt!366895 (arrayRangesEqSlicedLemma!136 arr!308 arr!308 #b00000000000000000000000000000000 (size!5077 arr!308) #b00000000000000000000000000000000 i!761))))

(assert (=> b!228701 (arrayRangesEq!910 arr!308 arr!308 #b00000000000000000000000000000000 (size!5077 arr!308))))

(declare-fun lt!366896 () Unit!17221)

(declare-fun arrayRangesEqReflexiveLemma!166 (array!11567) Unit!17221)

(assert (=> b!228701 (= lt!366896 (arrayRangesEqReflexiveLemma!166 arr!308))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228701 (= lt!366897 (bitIndex!0 (size!5077 (buf!5618 thiss!1870)) (currentByte!10480 thiss!1870) (currentBit!10475 thiss!1870)))))

(assert (= (and start!48140 res!191824) b!228699))

(assert (= (and b!228699 res!191823) b!228700))

(assert (= (and b!228700 res!191822) b!228701))

(assert (= start!48140 b!228702))

(declare-fun m!352441 () Bool)

(assert (=> start!48140 m!352441))

(declare-fun m!352443 () Bool)

(assert (=> start!48140 m!352443))

(declare-fun m!352445 () Bool)

(assert (=> b!228699 m!352445))

(declare-fun m!352447 () Bool)

(assert (=> b!228702 m!352447))

(declare-fun m!352449 () Bool)

(assert (=> b!228701 m!352449))

(declare-fun m!352451 () Bool)

(assert (=> b!228701 m!352451))

(declare-fun m!352453 () Bool)

(assert (=> b!228701 m!352453))

(declare-fun m!352455 () Bool)

(assert (=> b!228701 m!352455))

(declare-fun m!352457 () Bool)

(assert (=> b!228701 m!352457))

(push 1)

(assert (not start!48140))

(assert (not b!228702))

(assert (not b!228701))

(assert (not b!228699))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

