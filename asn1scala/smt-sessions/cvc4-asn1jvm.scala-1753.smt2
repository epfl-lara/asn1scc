; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48120 () Bool)

(assert start!48120)

(declare-fun res!191733 () Bool)

(declare-fun e!156680 () Bool)

(assert (=> start!48120 (=> (not res!191733) (not e!156680))))

(declare-datatypes ((array!11547 0))(
  ( (array!11548 (arr!6054 (Array (_ BitVec 32) (_ BitVec 8))) (size!5067 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11547)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!48120 (= res!191733 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5067 arr!308))))))

(assert (=> start!48120 e!156680))

(assert (=> start!48120 true))

(declare-fun array_inv!4808 (array!11547) Bool)

(assert (=> start!48120 (array_inv!4808 arr!308)))

(declare-datatypes ((BitStream!9230 0))(
  ( (BitStream!9231 (buf!5608 array!11547) (currentByte!10470 (_ BitVec 32)) (currentBit!10465 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9230)

(declare-fun e!156681 () Bool)

(declare-fun inv!12 (BitStream!9230) Bool)

(assert (=> start!48120 (and (inv!12 thiss!1870) e!156681)))

(declare-fun b!228581 () Bool)

(assert (=> b!228581 (= e!156680 (not (or (bvsgt #b00000000000000000000000000000000 (size!5067 arr!308)) (bvsle i!761 (size!5067 arr!308)))))))

(declare-fun arrayRangesEq!900 (array!11547 array!11547 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228581 (arrayRangesEq!900 arr!308 arr!308 #b00000000000000000000000000000000 (size!5067 arr!308))))

(declare-datatypes ((Unit!17201 0))(
  ( (Unit!17202) )
))
(declare-fun lt!366801 () Unit!17201)

(declare-fun arrayRangesEqReflexiveLemma!156 (array!11547) Unit!17201)

(assert (=> b!228581 (= lt!366801 (arrayRangesEqReflexiveLemma!156 arr!308))))

(declare-fun lt!366800 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228581 (= lt!366800 (bitIndex!0 (size!5067 (buf!5608 thiss!1870)) (currentByte!10470 thiss!1870) (currentBit!10465 thiss!1870)))))

(declare-fun b!228580 () Bool)

(declare-fun res!191734 () Bool)

(assert (=> b!228580 (=> (not res!191734) (not e!156680))))

(assert (=> b!228580 (= res!191734 (bvsge i!761 to!496))))

(declare-fun b!228582 () Bool)

(assert (=> b!228582 (= e!156681 (array_inv!4808 (buf!5608 thiss!1870)))))

(declare-fun b!228579 () Bool)

(declare-fun res!191732 () Bool)

(assert (=> b!228579 (=> (not res!191732) (not e!156680))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228579 (= res!191732 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5067 (buf!5608 thiss!1870))) ((_ sign_extend 32) (currentByte!10470 thiss!1870)) ((_ sign_extend 32) (currentBit!10465 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!48120 res!191733) b!228579))

(assert (= (and b!228579 res!191732) b!228580))

(assert (= (and b!228580 res!191734) b!228581))

(assert (= start!48120 b!228582))

(declare-fun m!352277 () Bool)

(assert (=> start!48120 m!352277))

(declare-fun m!352279 () Bool)

(assert (=> start!48120 m!352279))

(declare-fun m!352281 () Bool)

(assert (=> b!228581 m!352281))

(declare-fun m!352283 () Bool)

(assert (=> b!228581 m!352283))

(declare-fun m!352285 () Bool)

(assert (=> b!228581 m!352285))

(declare-fun m!352287 () Bool)

(assert (=> b!228582 m!352287))

(declare-fun m!352289 () Bool)

(assert (=> b!228579 m!352289))

(push 1)

(assert (not b!228581))

(assert (not start!48120))

(assert (not b!228579))

(assert (not b!228582))

(check-sat)

(pop 1)

(push 1)

(check-sat)

