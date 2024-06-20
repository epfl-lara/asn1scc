; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47500 () Bool)

(assert start!47500)

(declare-fun b!226387 () Bool)

(declare-fun res!189959 () Bool)

(declare-fun e!154748 () Bool)

(assert (=> b!226387 (=> (not res!189959) (not e!154748))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!226387 (= res!189959 (bvslt i!761 to!496))))

(declare-fun res!189960 () Bool)

(assert (=> start!47500 (=> (not res!189960) (not e!154748))))

(declare-datatypes ((array!11323 0))(
  ( (array!11324 (arr!5930 (Array (_ BitVec 32) (_ BitVec 8))) (size!4967 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11323)

(assert (=> start!47500 (= res!189960 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4967 arr!308))))))

(assert (=> start!47500 e!154748))

(assert (=> start!47500 true))

(declare-fun array_inv!4708 (array!11323) Bool)

(assert (=> start!47500 (array_inv!4708 arr!308)))

(declare-datatypes ((BitStream!9030 0))(
  ( (BitStream!9031 (buf!5508 array!11323) (currentByte!10322 (_ BitVec 32)) (currentBit!10317 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9030)

(declare-fun e!154749 () Bool)

(declare-fun inv!12 (BitStream!9030) Bool)

(assert (=> start!47500 (and (inv!12 thiss!1870) e!154749)))

(declare-fun b!226386 () Bool)

(declare-fun res!189961 () Bool)

(assert (=> b!226386 (=> (not res!189961) (not e!154748))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226386 (= res!189961 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4967 (buf!5508 thiss!1870))) ((_ sign_extend 32) (currentByte!10322 thiss!1870)) ((_ sign_extend 32) (currentBit!10317 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!226389 () Bool)

(assert (=> b!226389 (= e!154749 (array_inv!4708 (buf!5508 thiss!1870)))))

(declare-fun b!226388 () Bool)

(declare-fun lt!360260 () (_ BitVec 64))

(assert (=> b!226388 (= e!154748 (not (or (= lt!360260 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!360260) lt!360260)))))))

(declare-fun lt!360258 () (_ BitVec 32))

(assert (=> b!226388 (= lt!360260 ((_ sign_extend 32) lt!360258))))

(declare-datatypes ((tuple2!19408 0))(
  ( (tuple2!19409 (_1!10504 (_ BitVec 8)) (_2!10504 BitStream!9030)) )
))
(declare-fun lt!360261 () tuple2!19408)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!226388 (= (bitIndex!0 (size!4967 (buf!5508 (_2!10504 lt!360261))) (currentByte!10322 (_2!10504 lt!360261)) (currentBit!10317 (_2!10504 lt!360261))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!4967 (buf!5508 thiss!1870)) (currentByte!10322 thiss!1870) (currentBit!10317 thiss!1870))))))

(declare-datatypes ((Unit!16745 0))(
  ( (Unit!16746) )
))
(declare-datatypes ((tuple3!1316 0))(
  ( (tuple3!1317 (_1!10505 Unit!16745) (_2!10505 BitStream!9030) (_3!800 array!11323)) )
))
(declare-fun lt!360259 () tuple3!1316)

(declare-fun readByteArrayLoop!0 (BitStream!9030 array!11323 (_ BitVec 32) (_ BitVec 32)) tuple3!1316)

(assert (=> b!226388 (= lt!360259 (readByteArrayLoop!0 (_2!10504 lt!360261) (array!11324 (store (arr!5930 arr!308) i!761 (_1!10504 lt!360261)) (size!4967 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!226388 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4967 (buf!5508 (_2!10504 lt!360261)))) ((_ sign_extend 32) (currentByte!10322 (_2!10504 lt!360261))) ((_ sign_extend 32) (currentBit!10317 (_2!10504 lt!360261))) lt!360258)))

(assert (=> b!226388 (= lt!360258 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!360257 () Unit!16745)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9030 BitStream!9030 (_ BitVec 64) (_ BitVec 32)) Unit!16745)

(assert (=> b!226388 (= lt!360257 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10504 lt!360261) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!9030) tuple2!19408)

(assert (=> b!226388 (= lt!360261 (readByte!0 thiss!1870))))

(assert (= (and start!47500 res!189960) b!226386))

(assert (= (and b!226386 res!189961) b!226387))

(assert (= (and b!226387 res!189959) b!226388))

(assert (= start!47500 b!226389))

(declare-fun m!347741 () Bool)

(assert (=> start!47500 m!347741))

(declare-fun m!347743 () Bool)

(assert (=> start!47500 m!347743))

(declare-fun m!347745 () Bool)

(assert (=> b!226386 m!347745))

(declare-fun m!347747 () Bool)

(assert (=> b!226389 m!347747))

(declare-fun m!347749 () Bool)

(assert (=> b!226388 m!347749))

(declare-fun m!347751 () Bool)

(assert (=> b!226388 m!347751))

(declare-fun m!347753 () Bool)

(assert (=> b!226388 m!347753))

(declare-fun m!347755 () Bool)

(assert (=> b!226388 m!347755))

(declare-fun m!347757 () Bool)

(assert (=> b!226388 m!347757))

(declare-fun m!347759 () Bool)

(assert (=> b!226388 m!347759))

(declare-fun m!347761 () Bool)

(assert (=> b!226388 m!347761))

(check-sat (not b!226386) (not b!226389) (not start!47500) (not b!226388))
(check-sat)
