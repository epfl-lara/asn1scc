; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48130 () Bool)

(assert start!48130)

(declare-fun res!191779 () Bool)

(declare-fun e!156742 () Bool)

(assert (=> start!48130 (=> (not res!191779) (not e!156742))))

(declare-datatypes ((array!11557 0))(
  ( (array!11558 (arr!6059 (Array (_ BitVec 32) (_ BitVec 8))) (size!5072 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11557)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!48130 (= res!191779 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5072 arr!308))))))

(assert (=> start!48130 e!156742))

(assert (=> start!48130 true))

(declare-fun array_inv!4813 (array!11557) Bool)

(assert (=> start!48130 (array_inv!4813 arr!308)))

(declare-datatypes ((BitStream!9240 0))(
  ( (BitStream!9241 (buf!5613 array!11557) (currentByte!10475 (_ BitVec 32)) (currentBit!10470 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9240)

(declare-fun e!156741 () Bool)

(declare-fun inv!12 (BitStream!9240) Bool)

(assert (=> start!48130 (and (inv!12 thiss!1870) e!156741)))

(declare-fun b!228639 () Bool)

(declare-fun res!191777 () Bool)

(assert (=> b!228639 (=> (not res!191777) (not e!156742))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228639 (= res!191777 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5072 (buf!5613 thiss!1870))) ((_ sign_extend 32) (currentByte!10475 thiss!1870)) ((_ sign_extend 32) (currentBit!10470 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!228642 () Bool)

(assert (=> b!228642 (= e!156741 (array_inv!4813 (buf!5613 thiss!1870)))))

(declare-fun b!228641 () Bool)

(assert (=> b!228641 (= e!156742 (not (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand i!761 #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000)))))))

(declare-fun arrayRangesEq!905 (array!11557 array!11557 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228641 (arrayRangesEq!905 arr!308 arr!308 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!17211 0))(
  ( (Unit!17212) )
))
(declare-fun lt!366836 () Unit!17211)

(declare-fun arrayRangesEqSlicedLemma!131 (array!11557 array!11557 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17211)

(assert (=> b!228641 (= lt!366836 (arrayRangesEqSlicedLemma!131 arr!308 arr!308 #b00000000000000000000000000000000 (size!5072 arr!308) #b00000000000000000000000000000000 i!761))))

(assert (=> b!228641 (arrayRangesEq!905 arr!308 arr!308 #b00000000000000000000000000000000 (size!5072 arr!308))))

(declare-fun lt!366835 () Unit!17211)

(declare-fun arrayRangesEqReflexiveLemma!161 (array!11557) Unit!17211)

(assert (=> b!228641 (= lt!366835 (arrayRangesEqReflexiveLemma!161 arr!308))))

(declare-fun lt!366837 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228641 (= lt!366837 (bitIndex!0 (size!5072 (buf!5613 thiss!1870)) (currentByte!10475 thiss!1870) (currentBit!10470 thiss!1870)))))

(declare-fun b!228640 () Bool)

(declare-fun res!191778 () Bool)

(assert (=> b!228640 (=> (not res!191778) (not e!156742))))

(assert (=> b!228640 (= res!191778 (bvsge i!761 to!496))))

(assert (= (and start!48130 res!191779) b!228639))

(assert (= (and b!228639 res!191777) b!228640))

(assert (= (and b!228640 res!191778) b!228641))

(assert (= start!48130 b!228642))

(declare-fun m!352351 () Bool)

(assert (=> start!48130 m!352351))

(declare-fun m!352353 () Bool)

(assert (=> start!48130 m!352353))

(declare-fun m!352355 () Bool)

(assert (=> b!228639 m!352355))

(declare-fun m!352357 () Bool)

(assert (=> b!228642 m!352357))

(declare-fun m!352359 () Bool)

(assert (=> b!228641 m!352359))

(declare-fun m!352361 () Bool)

(assert (=> b!228641 m!352361))

(declare-fun m!352363 () Bool)

(assert (=> b!228641 m!352363))

(declare-fun m!352365 () Bool)

(assert (=> b!228641 m!352365))

(declare-fun m!352367 () Bool)

(assert (=> b!228641 m!352367))

(check-sat (not b!228639) (not start!48130) (not b!228641) (not b!228642))
(check-sat)
