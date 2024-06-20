; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48112 () Bool)

(assert start!48112)

(declare-fun b!228533 () Bool)

(declare-fun e!156631 () Bool)

(assert (=> b!228533 (= e!156631 (not true))))

(declare-datatypes ((array!11539 0))(
  ( (array!11540 (arr!6050 (Array (_ BitVec 32) (_ BitVec 8))) (size!5063 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11539)

(declare-fun arrayRangesEq!896 (array!11539 array!11539 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228533 (arrayRangesEq!896 arr!308 arr!308 #b00000000000000000000000000000000 (size!5063 arr!308))))

(declare-datatypes ((Unit!17193 0))(
  ( (Unit!17194) )
))
(declare-fun lt!366776 () Unit!17193)

(declare-fun arrayRangesEqReflexiveLemma!152 (array!11539) Unit!17193)

(assert (=> b!228533 (= lt!366776 (arrayRangesEqReflexiveLemma!152 arr!308))))

(declare-fun lt!366777 () (_ BitVec 64))

(declare-datatypes ((BitStream!9222 0))(
  ( (BitStream!9223 (buf!5604 array!11539) (currentByte!10466 (_ BitVec 32)) (currentBit!10461 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9222)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228533 (= lt!366777 (bitIndex!0 (size!5063 (buf!5604 thiss!1870)) (currentByte!10466 thiss!1870) (currentBit!10461 thiss!1870)))))

(declare-fun b!228534 () Bool)

(declare-fun e!156634 () Bool)

(declare-fun array_inv!4804 (array!11539) Bool)

(assert (=> b!228534 (= e!156634 (array_inv!4804 (buf!5604 thiss!1870)))))

(declare-fun res!191697 () Bool)

(assert (=> start!48112 (=> (not res!191697) (not e!156631))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!48112 (= res!191697 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5063 arr!308))))))

(assert (=> start!48112 e!156631))

(assert (=> start!48112 true))

(assert (=> start!48112 (array_inv!4804 arr!308)))

(declare-fun inv!12 (BitStream!9222) Bool)

(assert (=> start!48112 (and (inv!12 thiss!1870) e!156634)))

(declare-fun b!228532 () Bool)

(declare-fun res!191698 () Bool)

(assert (=> b!228532 (=> (not res!191698) (not e!156631))))

(assert (=> b!228532 (= res!191698 (bvsge i!761 to!496))))

(declare-fun b!228531 () Bool)

(declare-fun res!191696 () Bool)

(assert (=> b!228531 (=> (not res!191696) (not e!156631))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228531 (= res!191696 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5063 (buf!5604 thiss!1870))) ((_ sign_extend 32) (currentByte!10466 thiss!1870)) ((_ sign_extend 32) (currentBit!10461 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!48112 res!191697) b!228531))

(assert (= (and b!228531 res!191696) b!228532))

(assert (= (and b!228532 res!191698) b!228533))

(assert (= start!48112 b!228534))

(declare-fun m!352221 () Bool)

(assert (=> b!228533 m!352221))

(declare-fun m!352223 () Bool)

(assert (=> b!228533 m!352223))

(declare-fun m!352225 () Bool)

(assert (=> b!228533 m!352225))

(declare-fun m!352227 () Bool)

(assert (=> b!228534 m!352227))

(declare-fun m!352229 () Bool)

(assert (=> start!48112 m!352229))

(declare-fun m!352231 () Bool)

(assert (=> start!48112 m!352231))

(declare-fun m!352233 () Bool)

(assert (=> b!228531 m!352233))

(check-sat (not b!228533) (not start!48112) (not b!228531) (not b!228534))
