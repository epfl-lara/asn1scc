; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48126 () Bool)

(assert start!48126)

(declare-fun b!228616 () Bool)

(declare-fun res!191761 () Bool)

(declare-fun e!156716 () Bool)

(assert (=> b!228616 (=> (not res!191761) (not e!156716))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!228616 (= res!191761 (bvsge i!761 to!496))))

(declare-fun res!191759 () Bool)

(assert (=> start!48126 (=> (not res!191759) (not e!156716))))

(declare-datatypes ((array!11553 0))(
  ( (array!11554 (arr!6057 (Array (_ BitVec 32) (_ BitVec 8))) (size!5070 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11553)

(assert (=> start!48126 (= res!191759 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5070 arr!308))))))

(assert (=> start!48126 e!156716))

(assert (=> start!48126 true))

(declare-fun array_inv!4811 (array!11553) Bool)

(assert (=> start!48126 (array_inv!4811 arr!308)))

(declare-datatypes ((BitStream!9236 0))(
  ( (BitStream!9237 (buf!5611 array!11553) (currentByte!10473 (_ BitVec 32)) (currentBit!10468 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9236)

(declare-fun e!156715 () Bool)

(declare-fun inv!12 (BitStream!9236) Bool)

(assert (=> start!48126 (and (inv!12 thiss!1870) e!156715)))

(declare-fun b!228618 () Bool)

(assert (=> b!228618 (= e!156715 (array_inv!4811 (buf!5611 thiss!1870)))))

(declare-fun b!228615 () Bool)

(declare-fun res!191760 () Bool)

(assert (=> b!228615 (=> (not res!191760) (not e!156716))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228615 (= res!191760 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5070 (buf!5611 thiss!1870))) ((_ sign_extend 32) (currentByte!10473 thiss!1870)) ((_ sign_extend 32) (currentBit!10468 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!228617 () Bool)

(assert (=> b!228617 (= e!156716 (not true))))

(declare-fun arrayRangesEq!903 (array!11553 array!11553 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228617 (arrayRangesEq!903 arr!308 arr!308 #b00000000000000000000000000000000 (size!5070 arr!308))))

(declare-datatypes ((Unit!17207 0))(
  ( (Unit!17208) )
))
(declare-fun lt!366818 () Unit!17207)

(declare-fun arrayRangesEqReflexiveLemma!159 (array!11553) Unit!17207)

(assert (=> b!228617 (= lt!366818 (arrayRangesEqReflexiveLemma!159 arr!308))))

(declare-fun lt!366819 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228617 (= lt!366819 (bitIndex!0 (size!5070 (buf!5611 thiss!1870)) (currentByte!10473 thiss!1870) (currentBit!10468 thiss!1870)))))

(assert (= (and start!48126 res!191759) b!228615))

(assert (= (and b!228615 res!191760) b!228616))

(assert (= (and b!228616 res!191761) b!228617))

(assert (= start!48126 b!228618))

(declare-fun m!352319 () Bool)

(assert (=> start!48126 m!352319))

(declare-fun m!352321 () Bool)

(assert (=> start!48126 m!352321))

(declare-fun m!352323 () Bool)

(assert (=> b!228618 m!352323))

(declare-fun m!352325 () Bool)

(assert (=> b!228615 m!352325))

(declare-fun m!352327 () Bool)

(assert (=> b!228617 m!352327))

(declare-fun m!352329 () Bool)

(assert (=> b!228617 m!352329))

(declare-fun m!352331 () Bool)

(assert (=> b!228617 m!352331))

(push 1)

(assert (not start!48126))

(assert (not b!228617))

(assert (not b!228615))

(assert (not b!228618))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

