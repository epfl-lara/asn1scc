; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48132 () Bool)

(assert start!48132)

(declare-fun b!228653 () Bool)

(declare-fun e!156752 () Bool)

(declare-fun to!496 () (_ BitVec 32))

(declare-fun i!761 () (_ BitVec 32))

(assert (=> b!228653 (= e!156752 (not (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand i!761 #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000)))))))

(declare-datatypes ((array!11559 0))(
  ( (array!11560 (arr!6060 (Array (_ BitVec 32) (_ BitVec 8))) (size!5073 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11559)

(declare-fun arrayRangesEq!906 (array!11559 array!11559 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228653 (arrayRangesEq!906 arr!308 arr!308 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!17213 0))(
  ( (Unit!17214) )
))
(declare-fun lt!366846 () Unit!17213)

(declare-fun arrayRangesEqSlicedLemma!132 (array!11559 array!11559 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17213)

(assert (=> b!228653 (= lt!366846 (arrayRangesEqSlicedLemma!132 arr!308 arr!308 #b00000000000000000000000000000000 (size!5073 arr!308) #b00000000000000000000000000000000 i!761))))

(assert (=> b!228653 (arrayRangesEq!906 arr!308 arr!308 #b00000000000000000000000000000000 (size!5073 arr!308))))

(declare-fun lt!366844 () Unit!17213)

(declare-fun arrayRangesEqReflexiveLemma!162 (array!11559) Unit!17213)

(assert (=> b!228653 (= lt!366844 (arrayRangesEqReflexiveLemma!162 arr!308))))

(declare-fun lt!366845 () (_ BitVec 64))

(declare-datatypes ((BitStream!9242 0))(
  ( (BitStream!9243 (buf!5614 array!11559) (currentByte!10476 (_ BitVec 32)) (currentBit!10471 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9242)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228653 (= lt!366845 (bitIndex!0 (size!5073 (buf!5614 thiss!1870)) (currentByte!10476 thiss!1870) (currentBit!10471 thiss!1870)))))

(declare-fun b!228652 () Bool)

(declare-fun res!191788 () Bool)

(assert (=> b!228652 (=> (not res!191788) (not e!156752))))

(assert (=> b!228652 (= res!191788 (bvsge i!761 to!496))))

(declare-fun b!228654 () Bool)

(declare-fun e!156753 () Bool)

(declare-fun array_inv!4814 (array!11559) Bool)

(assert (=> b!228654 (= e!156753 (array_inv!4814 (buf!5614 thiss!1870)))))

(declare-fun b!228651 () Bool)

(declare-fun res!191787 () Bool)

(assert (=> b!228651 (=> (not res!191787) (not e!156752))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228651 (= res!191787 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5073 (buf!5614 thiss!1870))) ((_ sign_extend 32) (currentByte!10476 thiss!1870)) ((_ sign_extend 32) (currentBit!10471 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!191786 () Bool)

(assert (=> start!48132 (=> (not res!191786) (not e!156752))))

(assert (=> start!48132 (= res!191786 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5073 arr!308))))))

(assert (=> start!48132 e!156752))

(assert (=> start!48132 true))

(assert (=> start!48132 (array_inv!4814 arr!308)))

(declare-fun inv!12 (BitStream!9242) Bool)

(assert (=> start!48132 (and (inv!12 thiss!1870) e!156753)))

(assert (= (and start!48132 res!191786) b!228651))

(assert (= (and b!228651 res!191787) b!228652))

(assert (= (and b!228652 res!191788) b!228653))

(assert (= start!48132 b!228654))

(declare-fun m!352369 () Bool)

(assert (=> b!228653 m!352369))

(declare-fun m!352371 () Bool)

(assert (=> b!228653 m!352371))

(declare-fun m!352373 () Bool)

(assert (=> b!228653 m!352373))

(declare-fun m!352375 () Bool)

(assert (=> b!228653 m!352375))

(declare-fun m!352377 () Bool)

(assert (=> b!228653 m!352377))

(declare-fun m!352379 () Bool)

(assert (=> b!228654 m!352379))

(declare-fun m!352381 () Bool)

(assert (=> b!228651 m!352381))

(declare-fun m!352383 () Bool)

(assert (=> start!48132 m!352383))

(declare-fun m!352385 () Bool)

(assert (=> start!48132 m!352385))

(push 1)

(assert (not b!228654))

(assert (not b!228653))

(assert (not b!228651))

(assert (not start!48132))

(check-sat)

(pop 1)

(push 1)

(check-sat)

