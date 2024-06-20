; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48114 () Bool)

(assert start!48114)

(declare-fun b!228544 () Bool)

(declare-fun res!191705 () Bool)

(declare-fun e!156644 () Bool)

(assert (=> b!228544 (=> (not res!191705) (not e!156644))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!228544 (= res!191705 (bvsge i!761 to!496))))

(declare-fun b!228545 () Bool)

(assert (=> b!228545 (= e!156644 (not true))))

(declare-datatypes ((array!11541 0))(
  ( (array!11542 (arr!6051 (Array (_ BitVec 32) (_ BitVec 8))) (size!5064 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11541)

(declare-fun arrayRangesEq!897 (array!11541 array!11541 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228545 (arrayRangesEq!897 arr!308 arr!308 #b00000000000000000000000000000000 (size!5064 arr!308))))

(declare-datatypes ((Unit!17195 0))(
  ( (Unit!17196) )
))
(declare-fun lt!366783 () Unit!17195)

(declare-fun arrayRangesEqReflexiveLemma!153 (array!11541) Unit!17195)

(assert (=> b!228545 (= lt!366783 (arrayRangesEqReflexiveLemma!153 arr!308))))

(declare-fun lt!366782 () (_ BitVec 64))

(declare-datatypes ((BitStream!9224 0))(
  ( (BitStream!9225 (buf!5605 array!11541) (currentByte!10467 (_ BitVec 32)) (currentBit!10462 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9224)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228545 (= lt!366782 (bitIndex!0 (size!5064 (buf!5605 thiss!1870)) (currentByte!10467 thiss!1870) (currentBit!10462 thiss!1870)))))

(declare-fun res!191706 () Bool)

(assert (=> start!48114 (=> (not res!191706) (not e!156644))))

(assert (=> start!48114 (= res!191706 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5064 arr!308))))))

(assert (=> start!48114 e!156644))

(assert (=> start!48114 true))

(declare-fun array_inv!4805 (array!11541) Bool)

(assert (=> start!48114 (array_inv!4805 arr!308)))

(declare-fun e!156646 () Bool)

(declare-fun inv!12 (BitStream!9224) Bool)

(assert (=> start!48114 (and (inv!12 thiss!1870) e!156646)))

(declare-fun b!228546 () Bool)

(assert (=> b!228546 (= e!156646 (array_inv!4805 (buf!5605 thiss!1870)))))

(declare-fun b!228543 () Bool)

(declare-fun res!191707 () Bool)

(assert (=> b!228543 (=> (not res!191707) (not e!156644))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228543 (= res!191707 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5064 (buf!5605 thiss!1870))) ((_ sign_extend 32) (currentByte!10467 thiss!1870)) ((_ sign_extend 32) (currentBit!10462 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!48114 res!191706) b!228543))

(assert (= (and b!228543 res!191707) b!228544))

(assert (= (and b!228544 res!191705) b!228545))

(assert (= start!48114 b!228546))

(declare-fun m!352235 () Bool)

(assert (=> b!228545 m!352235))

(declare-fun m!352237 () Bool)

(assert (=> b!228545 m!352237))

(declare-fun m!352239 () Bool)

(assert (=> b!228545 m!352239))

(declare-fun m!352241 () Bool)

(assert (=> start!48114 m!352241))

(declare-fun m!352243 () Bool)

(assert (=> start!48114 m!352243))

(declare-fun m!352245 () Bool)

(assert (=> b!228546 m!352245))

(declare-fun m!352247 () Bool)

(assert (=> b!228543 m!352247))

(push 1)

(assert (not b!228545))

(assert (not b!228546))

(assert (not start!48114))

(assert (not b!228543))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

