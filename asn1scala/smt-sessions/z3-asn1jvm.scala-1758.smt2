; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48148 () Bool)

(assert start!48148)

(declare-fun b!228747 () Bool)

(declare-fun res!191860 () Bool)

(declare-fun e!156848 () Bool)

(assert (=> b!228747 (=> (not res!191860) (not e!156848))))

(declare-datatypes ((array!11575 0))(
  ( (array!11576 (arr!6068 (Array (_ BitVec 32) (_ BitVec 8))) (size!5081 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9258 0))(
  ( (BitStream!9259 (buf!5622 array!11575) (currentByte!10484 (_ BitVec 32)) (currentBit!10479 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9258)

(declare-fun to!496 () (_ BitVec 32))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228747 (= res!191860 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5081 (buf!5622 thiss!1870))) ((_ sign_extend 32) (currentByte!10484 thiss!1870)) ((_ sign_extend 32) (currentBit!10479 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!228749 () Bool)

(assert (=> b!228749 (= e!156848 (not true))))

(declare-fun arr!308 () array!11575)

(declare-fun arrayRangesEq!914 (array!11575 array!11575 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228749 (arrayRangesEq!914 arr!308 arr!308 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!17229 0))(
  ( (Unit!17230) )
))
(declare-fun lt!366944 () Unit!17229)

(declare-fun arrayRangesEqSlicedLemma!140 (array!11575 array!11575 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17229)

(assert (=> b!228749 (= lt!366944 (arrayRangesEqSlicedLemma!140 arr!308 arr!308 #b00000000000000000000000000000000 (size!5081 arr!308) #b00000000000000000000000000000000 i!761))))

(assert (=> b!228749 (arrayRangesEq!914 arr!308 arr!308 #b00000000000000000000000000000000 (size!5081 arr!308))))

(declare-fun lt!366943 () Unit!17229)

(declare-fun arrayRangesEqReflexiveLemma!170 (array!11575) Unit!17229)

(assert (=> b!228749 (= lt!366943 (arrayRangesEqReflexiveLemma!170 arr!308))))

(declare-fun lt!366945 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228749 (= lt!366945 (bitIndex!0 (size!5081 (buf!5622 thiss!1870)) (currentByte!10484 thiss!1870) (currentBit!10479 thiss!1870)))))

(declare-fun b!228750 () Bool)

(declare-fun e!156850 () Bool)

(declare-fun array_inv!4822 (array!11575) Bool)

(assert (=> b!228750 (= e!156850 (array_inv!4822 (buf!5622 thiss!1870)))))

(declare-fun b!228748 () Bool)

(declare-fun res!191858 () Bool)

(assert (=> b!228748 (=> (not res!191858) (not e!156848))))

(assert (=> b!228748 (= res!191858 (bvsge i!761 to!496))))

(declare-fun res!191859 () Bool)

(assert (=> start!48148 (=> (not res!191859) (not e!156848))))

(assert (=> start!48148 (= res!191859 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5081 arr!308))))))

(assert (=> start!48148 e!156848))

(assert (=> start!48148 true))

(assert (=> start!48148 (array_inv!4822 arr!308)))

(declare-fun inv!12 (BitStream!9258) Bool)

(assert (=> start!48148 (and (inv!12 thiss!1870) e!156850)))

(assert (= (and start!48148 res!191859) b!228747))

(assert (= (and b!228747 res!191860) b!228748))

(assert (= (and b!228748 res!191858) b!228749))

(assert (= start!48148 b!228750))

(declare-fun m!352513 () Bool)

(assert (=> b!228747 m!352513))

(declare-fun m!352515 () Bool)

(assert (=> b!228749 m!352515))

(declare-fun m!352517 () Bool)

(assert (=> b!228749 m!352517))

(declare-fun m!352519 () Bool)

(assert (=> b!228749 m!352519))

(declare-fun m!352521 () Bool)

(assert (=> b!228749 m!352521))

(declare-fun m!352523 () Bool)

(assert (=> b!228749 m!352523))

(declare-fun m!352525 () Bool)

(assert (=> b!228750 m!352525))

(declare-fun m!352527 () Bool)

(assert (=> start!48148 m!352527))

(declare-fun m!352529 () Bool)

(assert (=> start!48148 m!352529))

(check-sat (not b!228747) (not b!228749) (not start!48148) (not b!228750))
