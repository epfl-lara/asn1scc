; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48142 () Bool)

(assert start!48142)

(declare-fun b!228714 () Bool)

(declare-fun e!156812 () Bool)

(declare-datatypes ((array!11569 0))(
  ( (array!11570 (arr!6065 (Array (_ BitVec 32) (_ BitVec 8))) (size!5078 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9252 0))(
  ( (BitStream!9253 (buf!5619 array!11569) (currentByte!10481 (_ BitVec 32)) (currentBit!10476 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9252)

(declare-fun array_inv!4819 (array!11569) Bool)

(assert (=> b!228714 (= e!156812 (array_inv!4819 (buf!5619 thiss!1870)))))

(declare-fun b!228712 () Bool)

(declare-fun res!191832 () Bool)

(declare-fun e!156814 () Bool)

(assert (=> b!228712 (=> (not res!191832) (not e!156814))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!228712 (= res!191832 (bvsge i!761 to!496))))

(declare-fun b!228711 () Bool)

(declare-fun res!191833 () Bool)

(assert (=> b!228711 (=> (not res!191833) (not e!156814))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228711 (= res!191833 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5078 (buf!5619 thiss!1870))) ((_ sign_extend 32) (currentByte!10481 thiss!1870)) ((_ sign_extend 32) (currentBit!10476 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!191831 () Bool)

(assert (=> start!48142 (=> (not res!191831) (not e!156814))))

(declare-fun arr!308 () array!11569)

(assert (=> start!48142 (= res!191831 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5078 arr!308))))))

(assert (=> start!48142 e!156814))

(assert (=> start!48142 true))

(assert (=> start!48142 (array_inv!4819 arr!308)))

(declare-fun inv!12 (BitStream!9252) Bool)

(assert (=> start!48142 (and (inv!12 thiss!1870) e!156812)))

(declare-fun lt!366911 () (_ BitVec 64))

(declare-fun lt!366912 () (_ BitVec 64))

(declare-fun lt!366909 () (_ BitVec 64))

(declare-fun b!228713 () Bool)

(assert (=> b!228713 (= e!156814 (not (or (not (= lt!366911 (bvand lt!366912 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!366911 (bvand (bvadd lt!366909 lt!366912) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!228713 (= lt!366911 (bvand lt!366909 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!228713 (= lt!366912 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761))))))

(declare-fun arrayRangesEq!911 (array!11569 array!11569 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228713 (arrayRangesEq!911 arr!308 arr!308 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!17223 0))(
  ( (Unit!17224) )
))
(declare-fun lt!366910 () Unit!17223)

(declare-fun arrayRangesEqSlicedLemma!137 (array!11569 array!11569 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17223)

(assert (=> b!228713 (= lt!366910 (arrayRangesEqSlicedLemma!137 arr!308 arr!308 #b00000000000000000000000000000000 (size!5078 arr!308) #b00000000000000000000000000000000 i!761))))

(assert (=> b!228713 (arrayRangesEq!911 arr!308 arr!308 #b00000000000000000000000000000000 (size!5078 arr!308))))

(declare-fun lt!366908 () Unit!17223)

(declare-fun arrayRangesEqReflexiveLemma!167 (array!11569) Unit!17223)

(assert (=> b!228713 (= lt!366908 (arrayRangesEqReflexiveLemma!167 arr!308))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228713 (= lt!366909 (bitIndex!0 (size!5078 (buf!5619 thiss!1870)) (currentByte!10481 thiss!1870) (currentBit!10476 thiss!1870)))))

(assert (= (and start!48142 res!191831) b!228711))

(assert (= (and b!228711 res!191833) b!228712))

(assert (= (and b!228712 res!191832) b!228713))

(assert (= start!48142 b!228714))

(declare-fun m!352459 () Bool)

(assert (=> b!228714 m!352459))

(declare-fun m!352461 () Bool)

(assert (=> b!228711 m!352461))

(declare-fun m!352463 () Bool)

(assert (=> start!48142 m!352463))

(declare-fun m!352465 () Bool)

(assert (=> start!48142 m!352465))

(declare-fun m!352467 () Bool)

(assert (=> b!228713 m!352467))

(declare-fun m!352469 () Bool)

(assert (=> b!228713 m!352469))

(declare-fun m!352471 () Bool)

(assert (=> b!228713 m!352471))

(declare-fun m!352473 () Bool)

(assert (=> b!228713 m!352473))

(declare-fun m!352475 () Bool)

(assert (=> b!228713 m!352475))

(check-sat (not b!228711) (not start!48142) (not b!228714) (not b!228713))
(check-sat)
