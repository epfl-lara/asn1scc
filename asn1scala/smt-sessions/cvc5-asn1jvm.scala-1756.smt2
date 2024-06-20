; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48134 () Bool)

(assert start!48134)

(declare-fun b!228666 () Bool)

(declare-fun e!156764 () Bool)

(declare-datatypes ((array!11561 0))(
  ( (array!11562 (arr!6061 (Array (_ BitVec 32) (_ BitVec 8))) (size!5074 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9244 0))(
  ( (BitStream!9245 (buf!5615 array!11561) (currentByte!10477 (_ BitVec 32)) (currentBit!10472 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9244)

(declare-fun array_inv!4815 (array!11561) Bool)

(assert (=> b!228666 (= e!156764 (array_inv!4815 (buf!5615 thiss!1870)))))

(declare-fun b!228665 () Bool)

(declare-fun e!156765 () Bool)

(declare-fun lt!366856 () (_ BitVec 64))

(assert (=> b!228665 (= e!156765 (not (or (= lt!366856 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!366856) lt!366856)))))))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun i!761 () (_ BitVec 32))

(assert (=> b!228665 (= lt!366856 ((_ sign_extend 32) (bvsub to!496 i!761)))))

(declare-fun arr!308 () array!11561)

(declare-fun arrayRangesEq!907 (array!11561 array!11561 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228665 (arrayRangesEq!907 arr!308 arr!308 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!17215 0))(
  ( (Unit!17216) )
))
(declare-fun lt!366855 () Unit!17215)

(declare-fun arrayRangesEqSlicedLemma!133 (array!11561 array!11561 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17215)

(assert (=> b!228665 (= lt!366855 (arrayRangesEqSlicedLemma!133 arr!308 arr!308 #b00000000000000000000000000000000 (size!5074 arr!308) #b00000000000000000000000000000000 i!761))))

(assert (=> b!228665 (arrayRangesEq!907 arr!308 arr!308 #b00000000000000000000000000000000 (size!5074 arr!308))))

(declare-fun lt!366858 () Unit!17215)

(declare-fun arrayRangesEqReflexiveLemma!163 (array!11561) Unit!17215)

(assert (=> b!228665 (= lt!366858 (arrayRangesEqReflexiveLemma!163 arr!308))))

(declare-fun lt!366857 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228665 (= lt!366857 (bitIndex!0 (size!5074 (buf!5615 thiss!1870)) (currentByte!10477 thiss!1870) (currentBit!10472 thiss!1870)))))

(declare-fun b!228663 () Bool)

(declare-fun res!191797 () Bool)

(assert (=> b!228663 (=> (not res!191797) (not e!156765))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228663 (= res!191797 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5074 (buf!5615 thiss!1870))) ((_ sign_extend 32) (currentByte!10477 thiss!1870)) ((_ sign_extend 32) (currentBit!10472 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!191796 () Bool)

(assert (=> start!48134 (=> (not res!191796) (not e!156765))))

(assert (=> start!48134 (= res!191796 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5074 arr!308))))))

(assert (=> start!48134 e!156765))

(assert (=> start!48134 true))

(assert (=> start!48134 (array_inv!4815 arr!308)))

(declare-fun inv!12 (BitStream!9244) Bool)

(assert (=> start!48134 (and (inv!12 thiss!1870) e!156764)))

(declare-fun b!228664 () Bool)

(declare-fun res!191795 () Bool)

(assert (=> b!228664 (=> (not res!191795) (not e!156765))))

(assert (=> b!228664 (= res!191795 (bvsge i!761 to!496))))

(assert (= (and start!48134 res!191796) b!228663))

(assert (= (and b!228663 res!191797) b!228664))

(assert (= (and b!228664 res!191795) b!228665))

(assert (= start!48134 b!228666))

(declare-fun m!352387 () Bool)

(assert (=> b!228666 m!352387))

(declare-fun m!352389 () Bool)

(assert (=> b!228665 m!352389))

(declare-fun m!352391 () Bool)

(assert (=> b!228665 m!352391))

(declare-fun m!352393 () Bool)

(assert (=> b!228665 m!352393))

(declare-fun m!352395 () Bool)

(assert (=> b!228665 m!352395))

(declare-fun m!352397 () Bool)

(assert (=> b!228665 m!352397))

(declare-fun m!352399 () Bool)

(assert (=> b!228663 m!352399))

(declare-fun m!352401 () Bool)

(assert (=> start!48134 m!352401))

(declare-fun m!352403 () Bool)

(assert (=> start!48134 m!352403))

(push 1)

(assert (not b!228663))

(assert (not b!228666))

(assert (not b!228665))

(assert (not start!48134))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

