; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47736 () Bool)

(assert start!47736)

(declare-fun res!190635 () Bool)

(declare-fun e!155456 () Bool)

(assert (=> start!47736 (=> (not res!190635) (not e!155456))))

(declare-datatypes ((array!11403 0))(
  ( (array!11404 (arr!5976 (Array (_ BitVec 32) (_ BitVec 8))) (size!5001 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11403)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47736 (= res!190635 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5001 arr!308))))))

(assert (=> start!47736 e!155456))

(assert (=> start!47736 true))

(declare-fun array_inv!4742 (array!11403) Bool)

(assert (=> start!47736 (array_inv!4742 arr!308)))

(declare-datatypes ((BitStream!9098 0))(
  ( (BitStream!9099 (buf!5542 array!11403) (currentByte!10380 (_ BitVec 32)) (currentBit!10375 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9098)

(declare-fun e!155455 () Bool)

(declare-fun inv!12 (BitStream!9098) Bool)

(assert (=> start!47736 (and (inv!12 thiss!1870) e!155455)))

(declare-fun b!227224 () Bool)

(declare-fun res!190634 () Bool)

(assert (=> b!227224 (=> (not res!190634) (not e!155456))))

(assert (=> b!227224 (= res!190634 (bvslt i!761 to!496))))

(declare-fun b!227226 () Bool)

(assert (=> b!227226 (= e!155455 (array_inv!4742 (buf!5542 thiss!1870)))))

(declare-fun b!227225 () Bool)

(assert (=> b!227225 (= e!155456 (not true))))

(declare-fun lt!363016 () array!11403)

(declare-fun arrayRangesEq!837 (array!11403 array!11403 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227225 (arrayRangesEq!837 arr!308 lt!363016 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!16945 0))(
  ( (Unit!16946) )
))
(declare-fun lt!363014 () Unit!16945)

(declare-datatypes ((tuple2!19524 0))(
  ( (tuple2!19525 (_1!10596 (_ BitVec 8)) (_2!10596 BitStream!9098)) )
))
(declare-fun lt!363018 () tuple2!19524)

(declare-fun arrayUpdatedAtPrefixLemma!396 (array!11403 (_ BitVec 32) (_ BitVec 8)) Unit!16945)

(assert (=> b!227225 (= lt!363014 (arrayUpdatedAtPrefixLemma!396 arr!308 i!761 (_1!10596 lt!363018)))))

(declare-fun lt!363020 () (_ BitVec 64))

(declare-fun lt!363021 () (_ BitVec 64))

(declare-fun lt!363017 () (_ BitVec 32))

(declare-fun lt!363013 () (_ BitVec 64))

(declare-datatypes ((tuple3!1384 0))(
  ( (tuple3!1385 (_1!10597 Unit!16945) (_2!10597 BitStream!9098) (_3!834 array!11403)) )
))
(declare-fun lt!363019 () tuple3!1384)

(assert (=> b!227225 (and (= (bvadd lt!363020 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!363017))) lt!363021) (= (bvadd lt!363013 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!363021) (= (buf!5542 thiss!1870) (buf!5542 (_2!10597 lt!363019))) (= (size!5001 arr!308) (size!5001 (_3!834 lt!363019))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227225 (= lt!363021 (bitIndex!0 (size!5001 (buf!5542 (_2!10597 lt!363019))) (currentByte!10380 (_2!10597 lt!363019)) (currentBit!10375 (_2!10597 lt!363019))))))

(assert (=> b!227225 (= lt!363020 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!363013))))

(assert (=> b!227225 (= lt!363020 (bitIndex!0 (size!5001 (buf!5542 (_2!10596 lt!363018))) (currentByte!10380 (_2!10596 lt!363018)) (currentBit!10375 (_2!10596 lt!363018))))))

(assert (=> b!227225 (= lt!363013 (bitIndex!0 (size!5001 (buf!5542 thiss!1870)) (currentByte!10380 thiss!1870) (currentBit!10375 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9098 array!11403 (_ BitVec 32) (_ BitVec 32)) tuple3!1384)

(assert (=> b!227225 (= lt!363019 (readByteArrayLoop!0 (_2!10596 lt!363018) lt!363016 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227225 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5001 (buf!5542 (_2!10596 lt!363018)))) ((_ sign_extend 32) (currentByte!10380 (_2!10596 lt!363018))) ((_ sign_extend 32) (currentBit!10375 (_2!10596 lt!363018))) lt!363017)))

(assert (=> b!227225 (= lt!363017 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!363015 () Unit!16945)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9098 BitStream!9098 (_ BitVec 64) (_ BitVec 32)) Unit!16945)

(assert (=> b!227225 (= lt!363015 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10596 lt!363018) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227225 (= lt!363016 (array!11404 (store (arr!5976 arr!308) i!761 (_1!10596 lt!363018)) (size!5001 arr!308)))))

(declare-fun readByte!0 (BitStream!9098) tuple2!19524)

(assert (=> b!227225 (= lt!363018 (readByte!0 thiss!1870))))

(declare-fun b!227223 () Bool)

(declare-fun res!190636 () Bool)

(assert (=> b!227223 (=> (not res!190636) (not e!155456))))

(assert (=> b!227223 (= res!190636 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5001 (buf!5542 thiss!1870))) ((_ sign_extend 32) (currentByte!10380 thiss!1870)) ((_ sign_extend 32) (currentBit!10375 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!47736 res!190635) b!227223))

(assert (= (and b!227223 res!190636) b!227224))

(assert (= (and b!227224 res!190634) b!227225))

(assert (= start!47736 b!227226))

(declare-fun m!349359 () Bool)

(assert (=> start!47736 m!349359))

(declare-fun m!349361 () Bool)

(assert (=> start!47736 m!349361))

(declare-fun m!349363 () Bool)

(assert (=> b!227226 m!349363))

(declare-fun m!349365 () Bool)

(assert (=> b!227225 m!349365))

(declare-fun m!349367 () Bool)

(assert (=> b!227225 m!349367))

(declare-fun m!349369 () Bool)

(assert (=> b!227225 m!349369))

(declare-fun m!349371 () Bool)

(assert (=> b!227225 m!349371))

(declare-fun m!349373 () Bool)

(assert (=> b!227225 m!349373))

(declare-fun m!349375 () Bool)

(assert (=> b!227225 m!349375))

(declare-fun m!349377 () Bool)

(assert (=> b!227225 m!349377))

(declare-fun m!349379 () Bool)

(assert (=> b!227225 m!349379))

(declare-fun m!349381 () Bool)

(assert (=> b!227225 m!349381))

(declare-fun m!349383 () Bool)

(assert (=> b!227225 m!349383))

(declare-fun m!349385 () Bool)

(assert (=> b!227223 m!349385))

(push 1)

(assert (not b!227223))

(assert (not b!227226))

(assert (not b!227225))

(assert (not start!47736))

(check-sat)

(pop 1)

