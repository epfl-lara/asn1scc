; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47830 () Bool)

(assert start!47830)

(declare-fun b!227608 () Bool)

(declare-fun res!190943 () Bool)

(declare-fun e!155809 () Bool)

(assert (=> b!227608 (=> (not res!190943) (not e!155809))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!227608 (= res!190943 (bvslt i!761 to!496))))

(declare-fun res!190944 () Bool)

(assert (=> start!47830 (=> (not res!190944) (not e!155809))))

(declare-datatypes ((array!11446 0))(
  ( (array!11447 (arr!5999 (Array (_ BitVec 32) (_ BitVec 8))) (size!5021 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11446)

(assert (=> start!47830 (= res!190944 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5021 arr!308))))))

(assert (=> start!47830 e!155809))

(assert (=> start!47830 true))

(declare-fun array_inv!4762 (array!11446) Bool)

(assert (=> start!47830 (array_inv!4762 arr!308)))

(declare-datatypes ((BitStream!9138 0))(
  ( (BitStream!9139 (buf!5562 array!11446) (currentByte!10406 (_ BitVec 32)) (currentBit!10401 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9138)

(declare-fun e!155807 () Bool)

(declare-fun inv!12 (BitStream!9138) Bool)

(assert (=> start!47830 (and (inv!12 thiss!1870) e!155807)))

(declare-fun b!227610 () Bool)

(assert (=> b!227610 (= e!155807 (array_inv!4762 (buf!5562 thiss!1870)))))

(declare-fun b!227609 () Bool)

(assert (=> b!227609 (= e!155809 (not true))))

(declare-datatypes ((Unit!17016 0))(
  ( (Unit!17017) )
))
(declare-datatypes ((tuple3!1424 0))(
  ( (tuple3!1425 (_1!10642 Unit!17016) (_2!10642 BitStream!9138) (_3!854 array!11446)) )
))
(declare-fun lt!364098 () tuple3!1424)

(declare-fun arrayRangesEq!857 (array!11446 array!11446 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227609 (arrayRangesEq!857 arr!308 (_3!854 lt!364098) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!364099 () array!11446)

(declare-fun lt!364103 () Unit!17016)

(declare-fun arrayRangesEqTransitive!280 (array!11446 array!11446 array!11446 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17016)

(assert (=> b!227609 (= lt!364103 (arrayRangesEqTransitive!280 arr!308 lt!364099 (_3!854 lt!364098) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!227609 (arrayRangesEq!857 arr!308 lt!364099 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((tuple2!19576 0))(
  ( (tuple2!19577 (_1!10643 (_ BitVec 8)) (_2!10643 BitStream!9138)) )
))
(declare-fun lt!364106 () tuple2!19576)

(declare-fun lt!364100 () Unit!17016)

(declare-fun arrayUpdatedAtPrefixLemma!416 (array!11446 (_ BitVec 32) (_ BitVec 8)) Unit!17016)

(assert (=> b!227609 (= lt!364100 (arrayUpdatedAtPrefixLemma!416 arr!308 i!761 (_1!10643 lt!364106)))))

(declare-fun lt!364102 () (_ BitVec 64))

(declare-fun lt!364105 () (_ BitVec 64))

(declare-fun lt!364107 () (_ BitVec 64))

(declare-fun lt!364101 () (_ BitVec 32))

(assert (=> b!227609 (and (= (bvadd lt!364102 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!364101))) lt!364107) (= (bvadd lt!364105 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!364107) (= (buf!5562 thiss!1870) (buf!5562 (_2!10642 lt!364098))) (= (size!5021 arr!308) (size!5021 (_3!854 lt!364098))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227609 (= lt!364107 (bitIndex!0 (size!5021 (buf!5562 (_2!10642 lt!364098))) (currentByte!10406 (_2!10642 lt!364098)) (currentBit!10401 (_2!10642 lt!364098))))))

(assert (=> b!227609 (= lt!364102 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!364105))))

(assert (=> b!227609 (= lt!364102 (bitIndex!0 (size!5021 (buf!5562 (_2!10643 lt!364106))) (currentByte!10406 (_2!10643 lt!364106)) (currentBit!10401 (_2!10643 lt!364106))))))

(assert (=> b!227609 (= lt!364105 (bitIndex!0 (size!5021 (buf!5562 thiss!1870)) (currentByte!10406 thiss!1870) (currentBit!10401 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9138 array!11446 (_ BitVec 32) (_ BitVec 32)) tuple3!1424)

(assert (=> b!227609 (= lt!364098 (readByteArrayLoop!0 (_2!10643 lt!364106) lt!364099 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227609 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5021 (buf!5562 (_2!10643 lt!364106)))) ((_ sign_extend 32) (currentByte!10406 (_2!10643 lt!364106))) ((_ sign_extend 32) (currentBit!10401 (_2!10643 lt!364106))) lt!364101)))

(assert (=> b!227609 (= lt!364101 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!364104 () Unit!17016)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9138 BitStream!9138 (_ BitVec 64) (_ BitVec 32)) Unit!17016)

(assert (=> b!227609 (= lt!364104 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10643 lt!364106) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227609 (= lt!364099 (array!11447 (store (arr!5999 arr!308) i!761 (_1!10643 lt!364106)) (size!5021 arr!308)))))

(declare-fun readByte!0 (BitStream!9138) tuple2!19576)

(assert (=> b!227609 (= lt!364106 (readByte!0 thiss!1870))))

(declare-fun b!227607 () Bool)

(declare-fun res!190945 () Bool)

(assert (=> b!227607 (=> (not res!190945) (not e!155809))))

(assert (=> b!227607 (= res!190945 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5021 (buf!5562 thiss!1870))) ((_ sign_extend 32) (currentByte!10406 thiss!1870)) ((_ sign_extend 32) (currentBit!10401 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!47830 res!190944) b!227607))

(assert (= (and b!227607 res!190945) b!227608))

(assert (= (and b!227608 res!190943) b!227609))

(assert (= start!47830 b!227610))

(declare-fun m!350205 () Bool)

(assert (=> start!47830 m!350205))

(declare-fun m!350207 () Bool)

(assert (=> start!47830 m!350207))

(declare-fun m!350209 () Bool)

(assert (=> b!227610 m!350209))

(declare-fun m!350211 () Bool)

(assert (=> b!227609 m!350211))

(declare-fun m!350213 () Bool)

(assert (=> b!227609 m!350213))

(declare-fun m!350215 () Bool)

(assert (=> b!227609 m!350215))

(declare-fun m!350217 () Bool)

(assert (=> b!227609 m!350217))

(declare-fun m!350219 () Bool)

(assert (=> b!227609 m!350219))

(declare-fun m!350221 () Bool)

(assert (=> b!227609 m!350221))

(declare-fun m!350223 () Bool)

(assert (=> b!227609 m!350223))

(declare-fun m!350225 () Bool)

(assert (=> b!227609 m!350225))

(declare-fun m!350227 () Bool)

(assert (=> b!227609 m!350227))

(declare-fun m!350229 () Bool)

(assert (=> b!227609 m!350229))

(declare-fun m!350231 () Bool)

(assert (=> b!227609 m!350231))

(declare-fun m!350233 () Bool)

(assert (=> b!227609 m!350233))

(declare-fun m!350235 () Bool)

(assert (=> b!227607 m!350235))

(check-sat (not b!227609) (not b!227610) (not start!47830) (not b!227607))
