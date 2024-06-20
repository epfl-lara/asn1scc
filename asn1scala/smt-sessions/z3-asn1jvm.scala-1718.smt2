; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47488 () Bool)

(assert start!47488)

(declare-fun b!226315 () Bool)

(declare-fun res!189905 () Bool)

(declare-fun e!154677 () Bool)

(assert (=> b!226315 (=> (not res!189905) (not e!154677))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!226315 (= res!189905 (bvslt i!761 to!496))))

(declare-fun b!226314 () Bool)

(declare-fun res!189907 () Bool)

(assert (=> b!226314 (=> (not res!189907) (not e!154677))))

(declare-datatypes ((array!11311 0))(
  ( (array!11312 (arr!5924 (Array (_ BitVec 32) (_ BitVec 8))) (size!4961 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9018 0))(
  ( (BitStream!9019 (buf!5502 array!11311) (currentByte!10316 (_ BitVec 32)) (currentBit!10311 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9018)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226314 (= res!189907 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4961 (buf!5502 thiss!1870))) ((_ sign_extend 32) (currentByte!10316 thiss!1870)) ((_ sign_extend 32) (currentBit!10311 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!226316 () Bool)

(assert (=> b!226316 (= e!154677 (not (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand i!761 #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!19396 0))(
  ( (tuple2!19397 (_1!10492 (_ BitVec 8)) (_2!10492 BitStream!9018)) )
))
(declare-fun lt!360176 () tuple2!19396)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!226316 (= (bitIndex!0 (size!4961 (buf!5502 (_2!10492 lt!360176))) (currentByte!10316 (_2!10492 lt!360176)) (currentBit!10311 (_2!10492 lt!360176))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!4961 (buf!5502 thiss!1870)) (currentByte!10316 thiss!1870) (currentBit!10311 thiss!1870))))))

(declare-fun arr!308 () array!11311)

(declare-datatypes ((Unit!16733 0))(
  ( (Unit!16734) )
))
(declare-datatypes ((tuple3!1304 0))(
  ( (tuple3!1305 (_1!10493 Unit!16733) (_2!10493 BitStream!9018) (_3!794 array!11311)) )
))
(declare-fun lt!360175 () tuple3!1304)

(declare-fun readByteArrayLoop!0 (BitStream!9018 array!11311 (_ BitVec 32) (_ BitVec 32)) tuple3!1304)

(assert (=> b!226316 (= lt!360175 (readByteArrayLoop!0 (_2!10492 lt!360176) (array!11312 (store (arr!5924 arr!308) i!761 (_1!10492 lt!360176)) (size!4961 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!226316 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4961 (buf!5502 (_2!10492 lt!360176)))) ((_ sign_extend 32) (currentByte!10316 (_2!10492 lt!360176))) ((_ sign_extend 32) (currentBit!10311 (_2!10492 lt!360176))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!360177 () Unit!16733)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9018 BitStream!9018 (_ BitVec 64) (_ BitVec 32)) Unit!16733)

(assert (=> b!226316 (= lt!360177 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10492 lt!360176) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!9018) tuple2!19396)

(assert (=> b!226316 (= lt!360176 (readByte!0 thiss!1870))))

(declare-fun b!226317 () Bool)

(declare-fun e!154678 () Bool)

(declare-fun array_inv!4702 (array!11311) Bool)

(assert (=> b!226317 (= e!154678 (array_inv!4702 (buf!5502 thiss!1870)))))

(declare-fun res!189906 () Bool)

(assert (=> start!47488 (=> (not res!189906) (not e!154677))))

(assert (=> start!47488 (= res!189906 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4961 arr!308))))))

(assert (=> start!47488 e!154677))

(assert (=> start!47488 true))

(assert (=> start!47488 (array_inv!4702 arr!308)))

(declare-fun inv!12 (BitStream!9018) Bool)

(assert (=> start!47488 (and (inv!12 thiss!1870) e!154678)))

(assert (= (and start!47488 res!189906) b!226314))

(assert (= (and b!226314 res!189907) b!226315))

(assert (= (and b!226315 res!189905) b!226316))

(assert (= start!47488 b!226317))

(declare-fun m!347609 () Bool)

(assert (=> b!226314 m!347609))

(declare-fun m!347611 () Bool)

(assert (=> b!226316 m!347611))

(declare-fun m!347613 () Bool)

(assert (=> b!226316 m!347613))

(declare-fun m!347615 () Bool)

(assert (=> b!226316 m!347615))

(declare-fun m!347617 () Bool)

(assert (=> b!226316 m!347617))

(declare-fun m!347619 () Bool)

(assert (=> b!226316 m!347619))

(declare-fun m!347621 () Bool)

(assert (=> b!226316 m!347621))

(declare-fun m!347623 () Bool)

(assert (=> b!226316 m!347623))

(declare-fun m!347625 () Bool)

(assert (=> b!226317 m!347625))

(declare-fun m!347627 () Bool)

(assert (=> start!47488 m!347627))

(declare-fun m!347629 () Bool)

(assert (=> start!47488 m!347629))

(check-sat (not b!226316) (not start!47488) (not b!226314) (not b!226317))
