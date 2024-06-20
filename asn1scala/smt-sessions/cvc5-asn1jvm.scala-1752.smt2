; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48110 () Bool)

(assert start!48110)

(declare-fun b!228522 () Bool)

(declare-fun e!156620 () Bool)

(declare-datatypes ((array!11537 0))(
  ( (array!11538 (arr!6049 (Array (_ BitVec 32) (_ BitVec 8))) (size!5062 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9220 0))(
  ( (BitStream!9221 (buf!5603 array!11537) (currentByte!10465 (_ BitVec 32)) (currentBit!10460 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9220)

(declare-fun array_inv!4803 (array!11537) Bool)

(assert (=> b!228522 (= e!156620 (array_inv!4803 (buf!5603 thiss!1870)))))

(declare-fun res!191688 () Bool)

(declare-fun e!156622 () Bool)

(assert (=> start!48110 (=> (not res!191688) (not e!156622))))

(declare-fun arr!308 () array!11537)

(declare-fun to!496 () (_ BitVec 32))

(declare-fun i!761 () (_ BitVec 32))

(assert (=> start!48110 (= res!191688 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5062 arr!308))))))

(assert (=> start!48110 e!156622))

(assert (=> start!48110 true))

(assert (=> start!48110 (array_inv!4803 arr!308)))

(declare-fun inv!12 (BitStream!9220) Bool)

(assert (=> start!48110 (and (inv!12 thiss!1870) e!156620)))

(declare-fun b!228521 () Bool)

(assert (=> b!228521 (= e!156622 (not true))))

(declare-fun arrayRangesEq!895 (array!11537 array!11537 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228521 (arrayRangesEq!895 arr!308 arr!308 #b00000000000000000000000000000000 (size!5062 arr!308))))

(declare-datatypes ((Unit!17191 0))(
  ( (Unit!17192) )
))
(declare-fun lt!366771 () Unit!17191)

(declare-fun arrayRangesEqReflexiveLemma!151 (array!11537) Unit!17191)

(assert (=> b!228521 (= lt!366771 (arrayRangesEqReflexiveLemma!151 arr!308))))

(declare-fun lt!366770 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228521 (= lt!366770 (bitIndex!0 (size!5062 (buf!5603 thiss!1870)) (currentByte!10465 thiss!1870) (currentBit!10460 thiss!1870)))))

(declare-fun b!228519 () Bool)

(declare-fun res!191689 () Bool)

(assert (=> b!228519 (=> (not res!191689) (not e!156622))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228519 (= res!191689 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5062 (buf!5603 thiss!1870))) ((_ sign_extend 32) (currentByte!10465 thiss!1870)) ((_ sign_extend 32) (currentBit!10460 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!228520 () Bool)

(declare-fun res!191687 () Bool)

(assert (=> b!228520 (=> (not res!191687) (not e!156622))))

(assert (=> b!228520 (= res!191687 (bvsge i!761 to!496))))

(assert (= (and start!48110 res!191688) b!228519))

(assert (= (and b!228519 res!191689) b!228520))

(assert (= (and b!228520 res!191687) b!228521))

(assert (= start!48110 b!228522))

(declare-fun m!352207 () Bool)

(assert (=> b!228522 m!352207))

(declare-fun m!352209 () Bool)

(assert (=> start!48110 m!352209))

(declare-fun m!352211 () Bool)

(assert (=> start!48110 m!352211))

(declare-fun m!352213 () Bool)

(assert (=> b!228521 m!352213))

(declare-fun m!352215 () Bool)

(assert (=> b!228521 m!352215))

(declare-fun m!352217 () Bool)

(assert (=> b!228521 m!352217))

(declare-fun m!352219 () Bool)

(assert (=> b!228519 m!352219))

(push 1)

(assert (not start!48110))

(assert (not b!228521))

(assert (not b!228519))

(assert (not b!228522))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

