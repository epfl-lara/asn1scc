; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48104 () Bool)

(assert start!48104)

(declare-fun b!228485 () Bool)

(declare-fun e!156583 () Bool)

(assert (=> b!228485 (= e!156583 (not true))))

(declare-datatypes ((array!11531 0))(
  ( (array!11532 (arr!6046 (Array (_ BitVec 32) (_ BitVec 8))) (size!5059 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11531)

(declare-fun arrayRangesEq!892 (array!11531 array!11531 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228485 (arrayRangesEq!892 arr!308 arr!308 #b00000000000000000000000000000000 (size!5059 arr!308))))

(declare-datatypes ((Unit!17185 0))(
  ( (Unit!17186) )
))
(declare-fun lt!366752 () Unit!17185)

(declare-fun arrayRangesEqReflexiveLemma!148 (array!11531) Unit!17185)

(assert (=> b!228485 (= lt!366752 (arrayRangesEqReflexiveLemma!148 arr!308))))

(declare-fun lt!366753 () (_ BitVec 64))

(declare-datatypes ((BitStream!9214 0))(
  ( (BitStream!9215 (buf!5600 array!11531) (currentByte!10462 (_ BitVec 32)) (currentBit!10457 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9214)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228485 (= lt!366753 (bitIndex!0 (size!5059 (buf!5600 thiss!1870)) (currentByte!10462 thiss!1870) (currentBit!10457 thiss!1870)))))

(declare-fun b!228483 () Bool)

(declare-fun res!191662 () Bool)

(assert (=> b!228483 (=> (not res!191662) (not e!156583))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228483 (= res!191662 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5059 (buf!5600 thiss!1870))) ((_ sign_extend 32) (currentByte!10462 thiss!1870)) ((_ sign_extend 32) (currentBit!10457 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!228486 () Bool)

(declare-fun e!156586 () Bool)

(declare-fun array_inv!4800 (array!11531) Bool)

(assert (=> b!228486 (= e!156586 (array_inv!4800 (buf!5600 thiss!1870)))))

(declare-fun res!191660 () Bool)

(assert (=> start!48104 (=> (not res!191660) (not e!156583))))

(assert (=> start!48104 (= res!191660 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5059 arr!308))))))

(assert (=> start!48104 e!156583))

(assert (=> start!48104 true))

(assert (=> start!48104 (array_inv!4800 arr!308)))

(declare-fun inv!12 (BitStream!9214) Bool)

(assert (=> start!48104 (and (inv!12 thiss!1870) e!156586)))

(declare-fun b!228484 () Bool)

(declare-fun res!191661 () Bool)

(assert (=> b!228484 (=> (not res!191661) (not e!156583))))

(assert (=> b!228484 (= res!191661 (bvsge i!761 to!496))))

(assert (= (and start!48104 res!191660) b!228483))

(assert (= (and b!228483 res!191662) b!228484))

(assert (= (and b!228484 res!191661) b!228485))

(assert (= start!48104 b!228486))

(declare-fun m!352165 () Bool)

(assert (=> b!228485 m!352165))

(declare-fun m!352167 () Bool)

(assert (=> b!228485 m!352167))

(declare-fun m!352169 () Bool)

(assert (=> b!228485 m!352169))

(declare-fun m!352171 () Bool)

(assert (=> b!228483 m!352171))

(declare-fun m!352173 () Bool)

(assert (=> b!228486 m!352173))

(declare-fun m!352175 () Bool)

(assert (=> start!48104 m!352175))

(declare-fun m!352177 () Bool)

(assert (=> start!48104 m!352177))

(push 1)

(assert (not b!228485))

(assert (not start!48104))

(assert (not b!228483))

(assert (not b!228486))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

