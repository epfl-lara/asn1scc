; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48116 () Bool)

(assert start!48116)

(declare-fun b!228555 () Bool)

(declare-fun res!191716 () Bool)

(declare-fun e!156658 () Bool)

(assert (=> b!228555 (=> (not res!191716) (not e!156658))))

(declare-datatypes ((array!11543 0))(
  ( (array!11544 (arr!6052 (Array (_ BitVec 32) (_ BitVec 8))) (size!5065 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9226 0))(
  ( (BitStream!9227 (buf!5606 array!11543) (currentByte!10468 (_ BitVec 32)) (currentBit!10463 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9226)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228555 (= res!191716 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5065 (buf!5606 thiss!1870))) ((_ sign_extend 32) (currentByte!10468 thiss!1870)) ((_ sign_extend 32) (currentBit!10463 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!228558 () Bool)

(declare-fun e!156657 () Bool)

(declare-fun array_inv!4806 (array!11543) Bool)

(assert (=> b!228558 (= e!156657 (array_inv!4806 (buf!5606 thiss!1870)))))

(declare-fun b!228556 () Bool)

(declare-fun res!191714 () Bool)

(assert (=> b!228556 (=> (not res!191714) (not e!156658))))

(assert (=> b!228556 (= res!191714 (bvsge i!761 to!496))))

(declare-fun res!191715 () Bool)

(assert (=> start!48116 (=> (not res!191715) (not e!156658))))

(declare-fun arr!308 () array!11543)

(assert (=> start!48116 (= res!191715 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5065 arr!308))))))

(assert (=> start!48116 e!156658))

(assert (=> start!48116 true))

(assert (=> start!48116 (array_inv!4806 arr!308)))

(declare-fun inv!12 (BitStream!9226) Bool)

(assert (=> start!48116 (and (inv!12 thiss!1870) e!156657)))

(declare-fun b!228557 () Bool)

(assert (=> b!228557 (= e!156658 (not (or (bvsgt #b00000000000000000000000000000000 (size!5065 arr!308)) (bvsle i!761 (size!5065 arr!308)))))))

(declare-fun arrayRangesEq!898 (array!11543 array!11543 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228557 (arrayRangesEq!898 arr!308 arr!308 #b00000000000000000000000000000000 (size!5065 arr!308))))

(declare-datatypes ((Unit!17197 0))(
  ( (Unit!17198) )
))
(declare-fun lt!366788 () Unit!17197)

(declare-fun arrayRangesEqReflexiveLemma!154 (array!11543) Unit!17197)

(assert (=> b!228557 (= lt!366788 (arrayRangesEqReflexiveLemma!154 arr!308))))

(declare-fun lt!366789 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228557 (= lt!366789 (bitIndex!0 (size!5065 (buf!5606 thiss!1870)) (currentByte!10468 thiss!1870) (currentBit!10463 thiss!1870)))))

(assert (= (and start!48116 res!191715) b!228555))

(assert (= (and b!228555 res!191716) b!228556))

(assert (= (and b!228556 res!191714) b!228557))

(assert (= start!48116 b!228558))

(declare-fun m!352249 () Bool)

(assert (=> b!228555 m!352249))

(declare-fun m!352251 () Bool)

(assert (=> b!228558 m!352251))

(declare-fun m!352253 () Bool)

(assert (=> start!48116 m!352253))

(declare-fun m!352255 () Bool)

(assert (=> start!48116 m!352255))

(declare-fun m!352257 () Bool)

(assert (=> b!228557 m!352257))

(declare-fun m!352259 () Bool)

(assert (=> b!228557 m!352259))

(declare-fun m!352261 () Bool)

(assert (=> b!228557 m!352261))

(push 1)

(assert (not start!48116))

(assert (not b!228557))

(assert (not b!228555))

(assert (not b!228558))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

