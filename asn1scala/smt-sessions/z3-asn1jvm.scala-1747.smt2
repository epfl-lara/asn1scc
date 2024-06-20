; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48010 () Bool)

(assert start!48010)

(declare-fun b!228216 () Bool)

(declare-fun res!191442 () Bool)

(declare-fun e!156352 () Bool)

(assert (=> b!228216 (=> (not res!191442) (not e!156352))))

(declare-datatypes ((array!11506 0))(
  ( (array!11507 (arr!6032 (Array (_ BitVec 32) (_ BitVec 8))) (size!5048 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9192 0))(
  ( (BitStream!9193 (buf!5589 array!11506) (currentByte!10445 (_ BitVec 32)) (currentBit!10440 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9192)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228216 (= res!191442 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5048 (buf!5589 thiss!1870))) ((_ sign_extend 32) (currentByte!10445 thiss!1870)) ((_ sign_extend 32) (currentBit!10440 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!228218 () Bool)

(declare-datatypes ((Unit!17136 0))(
  ( (Unit!17137) )
))
(declare-datatypes ((tuple3!1478 0))(
  ( (tuple3!1479 (_1!10708 Unit!17136) (_2!10708 BitStream!9192) (_3!881 array!11506)) )
))
(declare-fun lt!366043 () tuple3!1478)

(assert (=> b!228218 (= e!156352 (not (bvslt i!761 (size!5048 (_3!881 lt!366043)))))))

(declare-datatypes ((tuple2!19654 0))(
  ( (tuple2!19655 (_1!10709 (_ BitVec 8)) (_2!10709 BitStream!9192)) )
))
(declare-fun lt!366046 () tuple2!19654)

(assert (=> b!228218 (and (= (_1!10709 lt!366046) (select (arr!6032 (_3!881 lt!366043)) i!761)) (= (select (arr!6032 (_3!881 lt!366043)) i!761) (_1!10709 lt!366046)))))

(declare-fun lt!366047 () array!11506)

(declare-fun lt!366045 () Unit!17136)

(declare-fun arrayRangesEqImpliesEq!140 (array!11506 array!11506 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17136)

(assert (=> b!228218 (= lt!366045 (arrayRangesEqImpliesEq!140 lt!366047 (_3!881 lt!366043) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun arr!308 () array!11506)

(declare-fun arrayRangesEq!884 (array!11506 array!11506 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228218 (arrayRangesEq!884 arr!308 (_3!881 lt!366043) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!366042 () Unit!17136)

(declare-fun arrayRangesEqTransitive!307 (array!11506 array!11506 array!11506 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17136)

(assert (=> b!228218 (= lt!366042 (arrayRangesEqTransitive!307 arr!308 lt!366047 (_3!881 lt!366043) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!228218 (arrayRangesEq!884 arr!308 lt!366047 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!366040 () Unit!17136)

(declare-fun arrayUpdatedAtPrefixLemma!443 (array!11506 (_ BitVec 32) (_ BitVec 8)) Unit!17136)

(assert (=> b!228218 (= lt!366040 (arrayUpdatedAtPrefixLemma!443 arr!308 i!761 (_1!10709 lt!366046)))))

(declare-fun lt!366048 () (_ BitVec 64))

(declare-fun lt!366039 () (_ BitVec 32))

(declare-fun lt!366041 () (_ BitVec 64))

(declare-fun lt!366044 () (_ BitVec 64))

(assert (=> b!228218 (and (= (bvadd lt!366048 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!366039))) lt!366041) (= (bvadd lt!366044 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!366041) (= (buf!5589 thiss!1870) (buf!5589 (_2!10708 lt!366043))) (= (size!5048 arr!308) (size!5048 (_3!881 lt!366043))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228218 (= lt!366041 (bitIndex!0 (size!5048 (buf!5589 (_2!10708 lt!366043))) (currentByte!10445 (_2!10708 lt!366043)) (currentBit!10440 (_2!10708 lt!366043))))))

(assert (=> b!228218 (= lt!366048 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!366044))))

(assert (=> b!228218 (= lt!366048 (bitIndex!0 (size!5048 (buf!5589 (_2!10709 lt!366046))) (currentByte!10445 (_2!10709 lt!366046)) (currentBit!10440 (_2!10709 lt!366046))))))

(assert (=> b!228218 (= lt!366044 (bitIndex!0 (size!5048 (buf!5589 thiss!1870)) (currentByte!10445 thiss!1870) (currentBit!10440 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9192 array!11506 (_ BitVec 32) (_ BitVec 32)) tuple3!1478)

(assert (=> b!228218 (= lt!366043 (readByteArrayLoop!0 (_2!10709 lt!366046) lt!366047 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!228218 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5048 (buf!5589 (_2!10709 lt!366046)))) ((_ sign_extend 32) (currentByte!10445 (_2!10709 lt!366046))) ((_ sign_extend 32) (currentBit!10440 (_2!10709 lt!366046))) lt!366039)))

(assert (=> b!228218 (= lt!366039 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!366038 () Unit!17136)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9192 BitStream!9192 (_ BitVec 64) (_ BitVec 32)) Unit!17136)

(assert (=> b!228218 (= lt!366038 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10709 lt!366046) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!228218 (= lt!366047 (array!11507 (store (arr!6032 arr!308) i!761 (_1!10709 lt!366046)) (size!5048 arr!308)))))

(declare-fun readByte!0 (BitStream!9192) tuple2!19654)

(assert (=> b!228218 (= lt!366046 (readByte!0 thiss!1870))))

(declare-fun b!228219 () Bool)

(declare-fun e!156351 () Bool)

(declare-fun array_inv!4789 (array!11506) Bool)

(assert (=> b!228219 (= e!156351 (array_inv!4789 (buf!5589 thiss!1870)))))

(declare-fun res!191443 () Bool)

(assert (=> start!48010 (=> (not res!191443) (not e!156352))))

(assert (=> start!48010 (= res!191443 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5048 arr!308))))))

(assert (=> start!48010 e!156352))

(assert (=> start!48010 true))

(assert (=> start!48010 (array_inv!4789 arr!308)))

(declare-fun inv!12 (BitStream!9192) Bool)

(assert (=> start!48010 (and (inv!12 thiss!1870) e!156351)))

(declare-fun b!228217 () Bool)

(declare-fun res!191441 () Bool)

(assert (=> b!228217 (=> (not res!191441) (not e!156352))))

(assert (=> b!228217 (= res!191441 (bvslt i!761 to!496))))

(assert (= (and start!48010 res!191443) b!228216))

(assert (= (and b!228216 res!191442) b!228217))

(assert (= (and b!228217 res!191441) b!228218))

(assert (= start!48010 b!228219))

(declare-fun m!351649 () Bool)

(assert (=> b!228216 m!351649))

(declare-fun m!351651 () Bool)

(assert (=> b!228218 m!351651))

(declare-fun m!351653 () Bool)

(assert (=> b!228218 m!351653))

(declare-fun m!351655 () Bool)

(assert (=> b!228218 m!351655))

(declare-fun m!351657 () Bool)

(assert (=> b!228218 m!351657))

(declare-fun m!351659 () Bool)

(assert (=> b!228218 m!351659))

(declare-fun m!351661 () Bool)

(assert (=> b!228218 m!351661))

(declare-fun m!351663 () Bool)

(assert (=> b!228218 m!351663))

(declare-fun m!351665 () Bool)

(assert (=> b!228218 m!351665))

(declare-fun m!351667 () Bool)

(assert (=> b!228218 m!351667))

(declare-fun m!351669 () Bool)

(assert (=> b!228218 m!351669))

(declare-fun m!351671 () Bool)

(assert (=> b!228218 m!351671))

(declare-fun m!351673 () Bool)

(assert (=> b!228218 m!351673))

(declare-fun m!351675 () Bool)

(assert (=> b!228218 m!351675))

(declare-fun m!351677 () Bool)

(assert (=> b!228218 m!351677))

(declare-fun m!351679 () Bool)

(assert (=> b!228219 m!351679))

(declare-fun m!351681 () Bool)

(assert (=> start!48010 m!351681))

(declare-fun m!351683 () Bool)

(assert (=> start!48010 m!351683))

(check-sat (not b!228219) (not b!228216) (not start!48010) (not b!228218))
(check-sat)
