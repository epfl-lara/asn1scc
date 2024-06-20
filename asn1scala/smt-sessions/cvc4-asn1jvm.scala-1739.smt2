; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47838 () Bool)

(assert start!47838)

(declare-fun res!190981 () Bool)

(declare-fun e!155857 () Bool)

(assert (=> start!47838 (=> (not res!190981) (not e!155857))))

(declare-datatypes ((array!11454 0))(
  ( (array!11455 (arr!6003 (Array (_ BitVec 32) (_ BitVec 8))) (size!5025 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11454)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47838 (= res!190981 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5025 arr!308))))))

(assert (=> start!47838 e!155857))

(assert (=> start!47838 true))

(declare-fun array_inv!4766 (array!11454) Bool)

(assert (=> start!47838 (array_inv!4766 arr!308)))

(declare-datatypes ((BitStream!9146 0))(
  ( (BitStream!9147 (buf!5566 array!11454) (currentByte!10410 (_ BitVec 32)) (currentBit!10405 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9146)

(declare-fun e!155854 () Bool)

(declare-fun inv!12 (BitStream!9146) Bool)

(assert (=> start!47838 (and (inv!12 thiss!1870) e!155854)))

(declare-fun b!227658 () Bool)

(assert (=> b!227658 (= e!155854 (array_inv!4766 (buf!5566 thiss!1870)))))

(declare-fun b!227657 () Bool)

(assert (=> b!227657 (= e!155857 (not (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) (size!5025 arr!308)))))))

(declare-datatypes ((Unit!17024 0))(
  ( (Unit!17025) )
))
(declare-datatypes ((tuple3!1432 0))(
  ( (tuple3!1433 (_1!10650 Unit!17024) (_2!10650 BitStream!9146) (_3!858 array!11454)) )
))
(declare-fun lt!364222 () tuple3!1432)

(declare-fun arrayRangesEq!861 (array!11454 array!11454 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227657 (arrayRangesEq!861 arr!308 (_3!858 lt!364222) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!364227 () array!11454)

(declare-fun lt!364220 () Unit!17024)

(declare-fun arrayRangesEqTransitive!284 (array!11454 array!11454 array!11454 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17024)

(assert (=> b!227657 (= lt!364220 (arrayRangesEqTransitive!284 arr!308 lt!364227 (_3!858 lt!364222) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!227657 (arrayRangesEq!861 arr!308 lt!364227 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((tuple2!19584 0))(
  ( (tuple2!19585 (_1!10651 (_ BitVec 8)) (_2!10651 BitStream!9146)) )
))
(declare-fun lt!364221 () tuple2!19584)

(declare-fun lt!364225 () Unit!17024)

(declare-fun arrayUpdatedAtPrefixLemma!420 (array!11454 (_ BitVec 32) (_ BitVec 8)) Unit!17024)

(assert (=> b!227657 (= lt!364225 (arrayUpdatedAtPrefixLemma!420 arr!308 i!761 (_1!10651 lt!364221)))))

(declare-fun lt!364224 () (_ BitVec 64))

(declare-fun lt!364223 () (_ BitVec 64))

(declare-fun lt!364218 () (_ BitVec 32))

(declare-fun lt!364226 () (_ BitVec 64))

(assert (=> b!227657 (and (= (bvadd lt!364224 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!364218))) lt!364226) (= (bvadd lt!364223 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!364226) (= (buf!5566 thiss!1870) (buf!5566 (_2!10650 lt!364222))) (= (size!5025 arr!308) (size!5025 (_3!858 lt!364222))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227657 (= lt!364226 (bitIndex!0 (size!5025 (buf!5566 (_2!10650 lt!364222))) (currentByte!10410 (_2!10650 lt!364222)) (currentBit!10405 (_2!10650 lt!364222))))))

(assert (=> b!227657 (= lt!364224 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!364223))))

(assert (=> b!227657 (= lt!364224 (bitIndex!0 (size!5025 (buf!5566 (_2!10651 lt!364221))) (currentByte!10410 (_2!10651 lt!364221)) (currentBit!10405 (_2!10651 lt!364221))))))

(assert (=> b!227657 (= lt!364223 (bitIndex!0 (size!5025 (buf!5566 thiss!1870)) (currentByte!10410 thiss!1870) (currentBit!10405 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9146 array!11454 (_ BitVec 32) (_ BitVec 32)) tuple3!1432)

(assert (=> b!227657 (= lt!364222 (readByteArrayLoop!0 (_2!10651 lt!364221) lt!364227 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227657 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5025 (buf!5566 (_2!10651 lt!364221)))) ((_ sign_extend 32) (currentByte!10410 (_2!10651 lt!364221))) ((_ sign_extend 32) (currentBit!10405 (_2!10651 lt!364221))) lt!364218)))

(assert (=> b!227657 (= lt!364218 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!364219 () Unit!17024)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9146 BitStream!9146 (_ BitVec 64) (_ BitVec 32)) Unit!17024)

(assert (=> b!227657 (= lt!364219 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10651 lt!364221) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227657 (= lt!364227 (array!11455 (store (arr!6003 arr!308) i!761 (_1!10651 lt!364221)) (size!5025 arr!308)))))

(declare-fun readByte!0 (BitStream!9146) tuple2!19584)

(assert (=> b!227657 (= lt!364221 (readByte!0 thiss!1870))))

(declare-fun b!227655 () Bool)

(declare-fun res!190979 () Bool)

(assert (=> b!227655 (=> (not res!190979) (not e!155857))))

(assert (=> b!227655 (= res!190979 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5025 (buf!5566 thiss!1870))) ((_ sign_extend 32) (currentByte!10410 thiss!1870)) ((_ sign_extend 32) (currentBit!10405 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!227656 () Bool)

(declare-fun res!190980 () Bool)

(assert (=> b!227656 (=> (not res!190980) (not e!155857))))

(assert (=> b!227656 (= res!190980 (bvslt i!761 to!496))))

(assert (= (and start!47838 res!190981) b!227655))

(assert (= (and b!227655 res!190979) b!227656))

(assert (= (and b!227656 res!190980) b!227657))

(assert (= start!47838 b!227658))

(declare-fun m!350333 () Bool)

(assert (=> start!47838 m!350333))

(declare-fun m!350335 () Bool)

(assert (=> start!47838 m!350335))

(declare-fun m!350337 () Bool)

(assert (=> b!227658 m!350337))

(declare-fun m!350339 () Bool)

(assert (=> b!227657 m!350339))

(declare-fun m!350341 () Bool)

(assert (=> b!227657 m!350341))

(declare-fun m!350343 () Bool)

(assert (=> b!227657 m!350343))

(declare-fun m!350345 () Bool)

(assert (=> b!227657 m!350345))

(declare-fun m!350347 () Bool)

(assert (=> b!227657 m!350347))

(declare-fun m!350349 () Bool)

(assert (=> b!227657 m!350349))

(declare-fun m!350351 () Bool)

(assert (=> b!227657 m!350351))

(declare-fun m!350353 () Bool)

(assert (=> b!227657 m!350353))

(declare-fun m!350355 () Bool)

(assert (=> b!227657 m!350355))

(declare-fun m!350357 () Bool)

(assert (=> b!227657 m!350357))

(declare-fun m!350359 () Bool)

(assert (=> b!227657 m!350359))

(declare-fun m!350361 () Bool)

(assert (=> b!227657 m!350361))

(declare-fun m!350363 () Bool)

(assert (=> b!227655 m!350363))

(push 1)

(assert (not b!227657))

(assert (not b!227658))

(assert (not start!47838))

(assert (not b!227655))

(check-sat)

(pop 1)

(push 1)

(check-sat)

