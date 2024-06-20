; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48096 () Bool)

(assert start!48096)

(declare-fun b!228437 () Bool)

(declare-fun e!156536 () Bool)

(assert (=> b!228437 (= e!156536 false)))

(declare-fun lt!366729 () (_ BitVec 64))

(declare-datatypes ((array!11523 0))(
  ( (array!11524 (arr!6042 (Array (_ BitVec 32) (_ BitVec 8))) (size!5055 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9206 0))(
  ( (BitStream!9207 (buf!5596 array!11523) (currentByte!10458 (_ BitVec 32)) (currentBit!10453 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9206)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228437 (= lt!366729 (bitIndex!0 (size!5055 (buf!5596 thiss!1870)) (currentByte!10458 thiss!1870) (currentBit!10453 thiss!1870)))))

(declare-fun res!191624 () Bool)

(assert (=> start!48096 (=> (not res!191624) (not e!156536))))

(declare-fun arr!308 () array!11523)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!48096 (= res!191624 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5055 arr!308))))))

(assert (=> start!48096 e!156536))

(assert (=> start!48096 true))

(declare-fun array_inv!4796 (array!11523) Bool)

(assert (=> start!48096 (array_inv!4796 arr!308)))

(declare-fun e!156535 () Bool)

(declare-fun inv!12 (BitStream!9206) Bool)

(assert (=> start!48096 (and (inv!12 thiss!1870) e!156535)))

(declare-fun b!228436 () Bool)

(declare-fun res!191626 () Bool)

(assert (=> b!228436 (=> (not res!191626) (not e!156536))))

(assert (=> b!228436 (= res!191626 (bvsge i!761 to!496))))

(declare-fun b!228435 () Bool)

(declare-fun res!191625 () Bool)

(assert (=> b!228435 (=> (not res!191625) (not e!156536))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228435 (= res!191625 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5055 (buf!5596 thiss!1870))) ((_ sign_extend 32) (currentByte!10458 thiss!1870)) ((_ sign_extend 32) (currentBit!10453 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!228438 () Bool)

(assert (=> b!228438 (= e!156535 (array_inv!4796 (buf!5596 thiss!1870)))))

(assert (= (and start!48096 res!191624) b!228435))

(assert (= (and b!228435 res!191625) b!228436))

(assert (= (and b!228436 res!191626) b!228437))

(assert (= start!48096 b!228438))

(declare-fun m!352113 () Bool)

(assert (=> b!228437 m!352113))

(declare-fun m!352115 () Bool)

(assert (=> start!48096 m!352115))

(declare-fun m!352117 () Bool)

(assert (=> start!48096 m!352117))

(declare-fun m!352119 () Bool)

(assert (=> b!228435 m!352119))

(declare-fun m!352121 () Bool)

(assert (=> b!228438 m!352121))

(push 1)

(assert (not b!228435))

