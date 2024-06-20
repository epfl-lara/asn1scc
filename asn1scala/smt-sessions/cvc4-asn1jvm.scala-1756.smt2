; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48138 () Bool)

(assert start!48138)

(declare-fun b!228687 () Bool)

(declare-fun res!191813 () Bool)

(declare-fun e!156787 () Bool)

(assert (=> b!228687 (=> (not res!191813) (not e!156787))))

(declare-datatypes ((array!11565 0))(
  ( (array!11566 (arr!6063 (Array (_ BitVec 32) (_ BitVec 8))) (size!5076 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9248 0))(
  ( (BitStream!9249 (buf!5617 array!11565) (currentByte!10479 (_ BitVec 32)) (currentBit!10474 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9248)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228687 (= res!191813 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5076 (buf!5617 thiss!1870))) ((_ sign_extend 32) (currentByte!10479 thiss!1870)) ((_ sign_extend 32) (currentBit!10474 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!228690 () Bool)

(declare-fun e!156789 () Bool)

(declare-fun array_inv!4817 (array!11565) Bool)

(assert (=> b!228690 (= e!156789 (array_inv!4817 (buf!5617 thiss!1870)))))

(declare-fun res!191815 () Bool)

(assert (=> start!48138 (=> (not res!191815) (not e!156787))))

(declare-fun arr!308 () array!11565)

(assert (=> start!48138 (= res!191815 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5076 arr!308))))))

(assert (=> start!48138 e!156787))

(assert (=> start!48138 true))

(assert (=> start!48138 (array_inv!4817 arr!308)))

(declare-fun inv!12 (BitStream!9248) Bool)

(assert (=> start!48138 (and (inv!12 thiss!1870) e!156789)))

(declare-fun b!228689 () Bool)

(declare-fun lt!366880 () (_ BitVec 64))

(assert (=> b!228689 (= e!156787 (not (or (= lt!366880 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!366880) lt!366880)))))))

(assert (=> b!228689 (= lt!366880 ((_ sign_extend 32) (bvsub to!496 i!761)))))

(declare-fun arrayRangesEq!909 (array!11565 array!11565 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228689 (arrayRangesEq!909 arr!308 arr!308 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!17219 0))(
  ( (Unit!17220) )
))
(declare-fun lt!366882 () Unit!17219)

(declare-fun arrayRangesEqSlicedLemma!135 (array!11565 array!11565 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17219)

(assert (=> b!228689 (= lt!366882 (arrayRangesEqSlicedLemma!135 arr!308 arr!308 #b00000000000000000000000000000000 (size!5076 arr!308) #b00000000000000000000000000000000 i!761))))

(assert (=> b!228689 (arrayRangesEq!909 arr!308 arr!308 #b00000000000000000000000000000000 (size!5076 arr!308))))

(declare-fun lt!366879 () Unit!17219)

(declare-fun arrayRangesEqReflexiveLemma!165 (array!11565) Unit!17219)

(assert (=> b!228689 (= lt!366879 (arrayRangesEqReflexiveLemma!165 arr!308))))

(declare-fun lt!366881 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228689 (= lt!366881 (bitIndex!0 (size!5076 (buf!5617 thiss!1870)) (currentByte!10479 thiss!1870) (currentBit!10474 thiss!1870)))))

(declare-fun b!228688 () Bool)

(declare-fun res!191814 () Bool)

(assert (=> b!228688 (=> (not res!191814) (not e!156787))))

(assert (=> b!228688 (= res!191814 (bvsge i!761 to!496))))

(assert (= (and start!48138 res!191815) b!228687))

(assert (= (and b!228687 res!191813) b!228688))

(assert (= (and b!228688 res!191814) b!228689))

(assert (= start!48138 b!228690))

(declare-fun m!352423 () Bool)

(assert (=> b!228687 m!352423))

(declare-fun m!352425 () Bool)

(assert (=> b!228690 m!352425))

(declare-fun m!352427 () Bool)

(assert (=> start!48138 m!352427))

(declare-fun m!352429 () Bool)

(assert (=> start!48138 m!352429))

(declare-fun m!352431 () Bool)

(assert (=> b!228689 m!352431))

(declare-fun m!352433 () Bool)

(assert (=> b!228689 m!352433))

(declare-fun m!352435 () Bool)

(assert (=> b!228689 m!352435))

(declare-fun m!352437 () Bool)

(assert (=> b!228689 m!352437))

(declare-fun m!352439 () Bool)

(assert (=> b!228689 m!352439))

(push 1)

(assert (not b!228687))

(assert (not b!228690))

(assert (not b!228689))

(assert (not start!48138))

(check-sat)

(pop 1)

(push 1)

(check-sat)

