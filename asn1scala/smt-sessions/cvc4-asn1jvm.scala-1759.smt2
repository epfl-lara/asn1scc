; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48156 () Bool)

(assert start!48156)

(declare-fun b!228796 () Bool)

(declare-fun res!191895 () Bool)

(declare-fun e!156896 () Bool)

(assert (=> b!228796 (=> (not res!191895) (not e!156896))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!228796 (= res!191895 (bvsge i!761 to!496))))

(declare-fun b!228795 () Bool)

(declare-fun res!191896 () Bool)

(assert (=> b!228795 (=> (not res!191896) (not e!156896))))

(declare-datatypes ((array!11583 0))(
  ( (array!11584 (arr!6072 (Array (_ BitVec 32) (_ BitVec 8))) (size!5085 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9266 0))(
  ( (BitStream!9267 (buf!5626 array!11583) (currentByte!10488 (_ BitVec 32)) (currentBit!10483 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9266)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228795 (= res!191896 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5085 (buf!5626 thiss!1870))) ((_ sign_extend 32) (currentByte!10488 thiss!1870)) ((_ sign_extend 32) (currentBit!10483 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!228798 () Bool)

(declare-fun e!156895 () Bool)

(declare-fun array_inv!4826 (array!11583) Bool)

(assert (=> b!228798 (= e!156895 (array_inv!4826 (buf!5626 thiss!1870)))))

(declare-fun b!228797 () Bool)

(assert (=> b!228797 (= e!156896 (not true))))

(declare-fun arr!308 () array!11583)

(declare-fun arrayRangesEq!918 (array!11583 array!11583 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228797 (arrayRangesEq!918 arr!308 arr!308 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!17237 0))(
  ( (Unit!17238) )
))
(declare-fun lt!366981 () Unit!17237)

(declare-fun arrayRangesEqSlicedLemma!144 (array!11583 array!11583 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17237)

(assert (=> b!228797 (= lt!366981 (arrayRangesEqSlicedLemma!144 arr!308 arr!308 #b00000000000000000000000000000000 (size!5085 arr!308) #b00000000000000000000000000000000 i!761))))

(assert (=> b!228797 (arrayRangesEq!918 arr!308 arr!308 #b00000000000000000000000000000000 (size!5085 arr!308))))

(declare-fun lt!366979 () Unit!17237)

(declare-fun arrayRangesEqReflexiveLemma!174 (array!11583) Unit!17237)

(assert (=> b!228797 (= lt!366979 (arrayRangesEqReflexiveLemma!174 arr!308))))

(declare-fun lt!366980 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228797 (= lt!366980 (bitIndex!0 (size!5085 (buf!5626 thiss!1870)) (currentByte!10488 thiss!1870) (currentBit!10483 thiss!1870)))))

(declare-fun res!191894 () Bool)

(assert (=> start!48156 (=> (not res!191894) (not e!156896))))

(assert (=> start!48156 (= res!191894 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5085 arr!308))))))

(assert (=> start!48156 e!156896))

(assert (=> start!48156 true))

(assert (=> start!48156 (array_inv!4826 arr!308)))

(declare-fun inv!12 (BitStream!9266) Bool)

(assert (=> start!48156 (and (inv!12 thiss!1870) e!156895)))

(assert (= (and start!48156 res!191894) b!228795))

(assert (= (and b!228795 res!191896) b!228796))

(assert (= (and b!228796 res!191895) b!228797))

(assert (= start!48156 b!228798))

(declare-fun m!352585 () Bool)

(assert (=> b!228795 m!352585))

(declare-fun m!352587 () Bool)

(assert (=> b!228798 m!352587))

(declare-fun m!352589 () Bool)

(assert (=> b!228797 m!352589))

(declare-fun m!352591 () Bool)

(assert (=> b!228797 m!352591))

(declare-fun m!352593 () Bool)

(assert (=> b!228797 m!352593))

(declare-fun m!352595 () Bool)

(assert (=> b!228797 m!352595))

(declare-fun m!352597 () Bool)

(assert (=> b!228797 m!352597))

(declare-fun m!352599 () Bool)

(assert (=> start!48156 m!352599))

(declare-fun m!352601 () Bool)

(assert (=> start!48156 m!352601))

(push 1)

(assert (not start!48156))

(assert (not b!228798))

(assert (not b!228795))

(assert (not 