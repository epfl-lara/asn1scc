; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48098 () Bool)

(assert start!48098)

(declare-fun b!228449 () Bool)

(declare-fun e!156548 () Bool)

(declare-datatypes ((array!11525 0))(
  ( (array!11526 (arr!6043 (Array (_ BitVec 32) (_ BitVec 8))) (size!5056 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11525)

(assert (=> b!228449 (= e!156548 (not (bvsle #b00000000000000000000000000000000 (size!5056 arr!308))))))

(declare-fun arrayRangesEq!889 (array!11525 array!11525 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228449 (arrayRangesEq!889 arr!308 arr!308 #b00000000000000000000000000000000 (size!5056 arr!308))))

(declare-datatypes ((Unit!17179 0))(
  ( (Unit!17180) )
))
(declare-fun lt!366735 () Unit!17179)

(declare-fun arrayRangesEqReflexiveLemma!145 (array!11525) Unit!17179)

(assert (=> b!228449 (= lt!366735 (arrayRangesEqReflexiveLemma!145 arr!308))))

(declare-fun lt!366734 () (_ BitVec 64))

(declare-datatypes ((BitStream!9208 0))(
  ( (BitStream!9209 (buf!5597 array!11525) (currentByte!10459 (_ BitVec 32)) (currentBit!10454 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9208)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228449 (= lt!366734 (bitIndex!0 (size!5056 (buf!5597 thiss!1870)) (currentByte!10459 thiss!1870) (currentBit!10454 thiss!1870)))))

(declare-fun res!191634 () Bool)

(assert (=> start!48098 (=> (not res!191634) (not e!156548))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!48098 (= res!191634 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5056 arr!308))))))

(assert (=> start!48098 e!156548))

(assert (=> start!48098 true))

(declare-fun array_inv!4797 (array!11525) Bool)

(assert (=> start!48098 (array_inv!4797 arr!308)))

(declare-fun e!156547 () Bool)

(declare-fun inv!12 (BitStream!9208) Bool)

(assert (=> start!48098 (and (inv!12 thiss!1870) e!156547)))

(declare-fun b!228450 () Bool)

(assert (=> b!228450 (= e!156547 (array_inv!4797 (buf!5597 thiss!1870)))))

(declare-fun b!228447 () Bool)

(declare-fun res!191635 () Bool)

(assert (=> b!228447 (=> (not res!191635) (not e!156548))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228447 (= res!191635 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5056 (buf!5597 thiss!1870))) ((_ sign_extend 32) (currentByte!10459 thiss!1870)) ((_ sign_extend 32) (currentBit!10454 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!228448 () Bool)

(declare-fun res!191633 () Bool)

(assert (=> b!228448 (=> (not res!191633) (not e!156548))))

(assert (=> b!228448 (= res!191633 (bvsge i!761 to!496))))

(assert (= (and start!48098 res!191634) b!228447))

(assert (= (and b!228447 res!191635) b!228448))

(assert (= (and b!228448 res!191633) b!228449))

(assert (= start!48098 b!228450))

(declare-fun m!352123 () Bool)

(assert (=> b!228449 m!352123))

(declare-fun m!352125 () Bool)

(assert (=> b!228449 m!352125))

(declare-fun m!352127 () Bool)

(assert (=> b!228449 m!352127))

(declare-fun m!352129 () Bool)

(assert (=> start!48098 m!352129))

(declare-fun m!352131 () Bool)

(assert (=> start!48098 m!352131))

(declare-fun m!352133 () Bool)

(assert (=> b!228450 m!352133))

(declare-fun m!352135 () Bool)

(assert (=> b!228447 m!352135))

(push 1)

(assert (not b!228450))

(assert (not b!228449))

(assert (not start!48098))

(assert (not b!228447))

(check-sat)

(pop 1)

(push 1)

(check-sat)

