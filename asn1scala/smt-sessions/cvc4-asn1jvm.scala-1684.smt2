; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46758 () Bool)

(assert start!46758)

(declare-fun b!224329 () Bool)

(declare-fun e!152868 () Bool)

(assert (=> b!224329 (= e!152868 (not true))))

(declare-datatypes ((array!11074 0))(
  ( (array!11075 (arr!5808 (Array (_ BitVec 32) (_ BitVec 8))) (size!4860 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11074)

(declare-datatypes ((BitStream!8822 0))(
  ( (BitStream!8823 (buf!5404 array!11074) (currentByte!10132 (_ BitVec 32)) (currentBit!10127 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!16389 0))(
  ( (Unit!16390) )
))
(declare-datatypes ((tuple3!1246 0))(
  ( (tuple3!1247 (_1!10369 Unit!16389) (_2!10369 BitStream!8822) (_3!765 array!11074)) )
))
(declare-fun lt!356014 () tuple3!1246)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun arrayRangesEq!756 (array!11074 array!11074 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224329 (arrayRangesEq!756 arr!308 (_3!765 lt!356014) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!356011 () array!11074)

(declare-fun lt!356013 () Unit!16389)

(declare-fun arrayRangesEqTransitive!227 (array!11074 array!11074 array!11074 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16389)

(assert (=> b!224329 (= lt!356013 (arrayRangesEqTransitive!227 arr!308 lt!356011 (_3!765 lt!356014) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224329 (arrayRangesEq!756 arr!308 lt!356011 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((tuple2!19208 0))(
  ( (tuple2!19209 (_1!10370 (_ BitVec 8)) (_2!10370 BitStream!8822)) )
))
(declare-fun lt!356010 () tuple2!19208)

(declare-fun lt!356009 () Unit!16389)

(declare-fun arrayUpdatedAtPrefixLemma!348 (array!11074 (_ BitVec 32) (_ BitVec 8)) Unit!16389)

(assert (=> b!224329 (= lt!356009 (arrayUpdatedAtPrefixLemma!348 arr!308 i!761 (_1!10370 lt!356010)))))

(declare-fun lt!356007 () (_ BitVec 64))

(declare-fun thiss!1870 () BitStream!8822)

(declare-fun to!496 () (_ BitVec 32))

(declare-fun lt!356008 () (_ BitVec 64))

(declare-fun lt!356015 () (_ BitVec 64))

(declare-fun lt!356016 () (_ BitVec 32))

(assert (=> b!224329 (and (= (bvadd lt!356008 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!356016))) lt!356007) (= (bvadd lt!356015 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!356007) (= (buf!5404 thiss!1870) (buf!5404 (_2!10369 lt!356014))) (= (size!4860 arr!308) (size!4860 (_3!765 lt!356014))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224329 (= lt!356007 (bitIndex!0 (size!4860 (buf!5404 (_2!10369 lt!356014))) (currentByte!10132 (_2!10369 lt!356014)) (currentBit!10127 (_2!10369 lt!356014))))))

(assert (=> b!224329 (= lt!356008 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!356015))))

(assert (=> b!224329 (= lt!356008 (bitIndex!0 (size!4860 (buf!5404 (_2!10370 lt!356010))) (currentByte!10132 (_2!10370 lt!356010)) (currentBit!10127 (_2!10370 lt!356010))))))

(assert (=> b!224329 (= lt!356015 (bitIndex!0 (size!4860 (buf!5404 thiss!1870)) (currentByte!10132 thiss!1870) (currentBit!10127 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8822 array!11074 (_ BitVec 32) (_ BitVec 32)) tuple3!1246)

(assert (=> b!224329 (= lt!356014 (readByteArrayLoop!0 (_2!10370 lt!356010) lt!356011 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224329 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4860 (buf!5404 (_2!10370 lt!356010)))) ((_ sign_extend 32) (currentByte!10132 (_2!10370 lt!356010))) ((_ sign_extend 32) (currentBit!10127 (_2!10370 lt!356010))) lt!356016)))

(assert (=> b!224329 (= lt!356016 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!356012 () Unit!16389)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8822 BitStream!8822 (_ BitVec 64) (_ BitVec 32)) Unit!16389)

(assert (=> b!224329 (= lt!356012 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10370 lt!356010) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224329 (= lt!356011 (array!11075 (store (arr!5808 arr!308) i!761 (_1!10370 lt!356010)) (size!4860 arr!308)))))

(declare-fun readByte!0 (BitStream!8822) tuple2!19208)

(assert (=> b!224329 (= lt!356010 (readByte!0 thiss!1870))))

(declare-fun b!224327 () Bool)

(declare-fun res!188278 () Bool)

(assert (=> b!224327 (=> (not res!188278) (not e!152868))))

(assert (=> b!224327 (= res!188278 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4860 (buf!5404 thiss!1870))) ((_ sign_extend 32) (currentByte!10132 thiss!1870)) ((_ sign_extend 32) (currentBit!10127 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!224328 () Bool)

(declare-fun res!188280 () Bool)

(assert (=> b!224328 (=> (not res!188280) (not e!152868))))

(assert (=> b!224328 (= res!188280 (bvslt i!761 to!496))))

(declare-fun b!224330 () Bool)

(declare-fun e!152867 () Bool)

(declare-fun array_inv!4601 (array!11074) Bool)

(assert (=> b!224330 (= e!152867 (array_inv!4601 (buf!5404 thiss!1870)))))

(declare-fun res!188279 () Bool)

(assert (=> start!46758 (=> (not res!188279) (not e!152868))))

(assert (=> start!46758 (= res!188279 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4860 arr!308))))))

(assert (=> start!46758 e!152868))

(assert (=> start!46758 true))

(assert (=> start!46758 (array_inv!4601 arr!308)))

(declare-fun inv!12 (BitStream!8822) Bool)

(assert (=> start!46758 (and (inv!12 thiss!1870) e!152867)))

(assert (= (and start!46758 res!188279) b!224327))

(assert (= (and b!224327 res!188278) b!224328))

(assert (= (and b!224328 res!188280) b!224329))

(assert (= start!46758 b!224330))

(declare-fun m!344343 () Bool)

(assert (=> b!224329 m!344343))

(declare-fun m!344345 () Bool)

(assert (=> b!224329 m!344345))

(declare-fun m!344347 () Bool)

(assert (=> b!224329 m!344347))

(declare-fun m!344349 () Bool)

(assert (=> b!224329 m!344349))

(declare-fun m!344351 () Bool)

(assert (=> b!224329 m!344351))

(declare-fun m!344353 () Bool)

(assert (=> b!224329 m!344353))

(declare-fun m!344355 () Bool)

(assert (=> b!224329 m!344355))

(declare-fun m!344357 () Bool)

(assert (=> b!224329 m!344357))

(declare-fun m!344359 () Bool)

(assert (=> b!224329 m!344359))

(declare-fun m!344361 () Bool)

(assert (=> b!224329 m!344361))

(declare-fun m!344363 () Bool)

(assert (=> b!224329 m!344363))

(declare-fun m!344365 () Bool)

(assert (=> b!224329 m!344365))

(declare-fun m!344367 () Bool)

(assert (=> b!224327 m!344367))

(declare-fun m!344369 () Bool)

(assert (=> b!224330 m!344369))

(declare-fun m!344371 () Bool)

(assert (=> start!46758 m!344371))

(declare-fun m!344373 () Bool)

(assert (=> start!46758 m!344373))

(push 1)

(assert (not b!224327))

(assert (not b!224330))

(assert (not start!46758))

(assert (not b!224329))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

