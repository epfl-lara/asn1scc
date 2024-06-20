; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46688 () Bool)

(assert start!46688)

(declare-fun b!223908 () Bool)

(declare-fun res!187965 () Bool)

(declare-fun e!152447 () Bool)

(assert (=> b!223908 (=> (not res!187965) (not e!152447))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!223908 (= res!187965 (bvslt i!761 to!496))))

(declare-fun b!223907 () Bool)

(declare-fun res!187963 () Bool)

(assert (=> b!223907 (=> (not res!187963) (not e!152447))))

(declare-datatypes ((array!11004 0))(
  ( (array!11005 (arr!5773 (Array (_ BitVec 32) (_ BitVec 8))) (size!4825 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8752 0))(
  ( (BitStream!8753 (buf!5369 array!11004) (currentByte!10097 (_ BitVec 32)) (currentBit!10092 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8752)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!223907 (= res!187963 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4825 (buf!5369 thiss!1870))) ((_ sign_extend 32) (currentByte!10097 thiss!1870)) ((_ sign_extend 32) (currentBit!10092 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!223910 () Bool)

(declare-fun e!152448 () Bool)

(declare-fun array_inv!4566 (array!11004) Bool)

(assert (=> b!223910 (= e!152448 (array_inv!4566 (buf!5369 thiss!1870)))))

(declare-fun res!187964 () Bool)

(assert (=> start!46688 (=> (not res!187964) (not e!152447))))

(declare-fun arr!308 () array!11004)

(assert (=> start!46688 (= res!187964 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4825 arr!308))))))

(assert (=> start!46688 e!152447))

(assert (=> start!46688 true))

(assert (=> start!46688 (array_inv!4566 arr!308)))

(declare-fun inv!12 (BitStream!8752) Bool)

(assert (=> start!46688 (and (inv!12 thiss!1870) e!152448)))

(declare-fun b!223909 () Bool)

(assert (=> b!223909 (= e!152447 (not true))))

(declare-fun lt!355005 () array!11004)

(declare-fun arrayRangesEq!721 (array!11004 array!11004 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!223909 (arrayRangesEq!721 arr!308 lt!355005 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((tuple2!19138 0))(
  ( (tuple2!19139 (_1!10299 (_ BitVec 8)) (_2!10299 BitStream!8752)) )
))
(declare-fun lt!355008 () tuple2!19138)

(declare-datatypes ((Unit!16319 0))(
  ( (Unit!16320) )
))
(declare-fun lt!355007 () Unit!16319)

(declare-fun arrayUpdatedAtPrefixLemma!313 (array!11004 (_ BitVec 32) (_ BitVec 8)) Unit!16319)

(assert (=> b!223909 (= lt!355007 (arrayUpdatedAtPrefixLemma!313 arr!308 i!761 (_1!10299 lt!355008)))))

(declare-fun lt!355000 () (_ BitVec 32))

(declare-fun lt!355001 () (_ BitVec 64))

(declare-fun lt!355004 () (_ BitVec 64))

(declare-fun lt!355003 () (_ BitVec 64))

(declare-datatypes ((tuple3!1176 0))(
  ( (tuple3!1177 (_1!10300 Unit!16319) (_2!10300 BitStream!8752) (_3!730 array!11004)) )
))
(declare-fun lt!355002 () tuple3!1176)

(assert (=> b!223909 (and (= (bvadd lt!355003 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!355000))) lt!355004) (= (bvadd lt!355001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!355004) (= (buf!5369 thiss!1870) (buf!5369 (_2!10300 lt!355002))) (= (size!4825 arr!308) (size!4825 (_3!730 lt!355002))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!223909 (= lt!355004 (bitIndex!0 (size!4825 (buf!5369 (_2!10300 lt!355002))) (currentByte!10097 (_2!10300 lt!355002)) (currentBit!10092 (_2!10300 lt!355002))))))

(assert (=> b!223909 (= lt!355003 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!355001))))

(assert (=> b!223909 (= lt!355003 (bitIndex!0 (size!4825 (buf!5369 (_2!10299 lt!355008))) (currentByte!10097 (_2!10299 lt!355008)) (currentBit!10092 (_2!10299 lt!355008))))))

(assert (=> b!223909 (= lt!355001 (bitIndex!0 (size!4825 (buf!5369 thiss!1870)) (currentByte!10097 thiss!1870) (currentBit!10092 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8752 array!11004 (_ BitVec 32) (_ BitVec 32)) tuple3!1176)

(assert (=> b!223909 (= lt!355002 (readByteArrayLoop!0 (_2!10299 lt!355008) lt!355005 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!223909 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4825 (buf!5369 (_2!10299 lt!355008)))) ((_ sign_extend 32) (currentByte!10097 (_2!10299 lt!355008))) ((_ sign_extend 32) (currentBit!10092 (_2!10299 lt!355008))) lt!355000)))

(assert (=> b!223909 (= lt!355000 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!355006 () Unit!16319)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8752 BitStream!8752 (_ BitVec 64) (_ BitVec 32)) Unit!16319)

(assert (=> b!223909 (= lt!355006 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10299 lt!355008) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!223909 (= lt!355005 (array!11005 (store (arr!5773 arr!308) i!761 (_1!10299 lt!355008)) (size!4825 arr!308)))))

(declare-fun readByte!0 (BitStream!8752) tuple2!19138)

(assert (=> b!223909 (= lt!355008 (readByte!0 thiss!1870))))

(assert (= (and start!46688 res!187964) b!223907))

(assert (= (and b!223907 res!187963) b!223908))

(assert (= (and b!223908 res!187965) b!223909))

(assert (= start!46688 b!223910))

(declare-fun m!343283 () Bool)

(assert (=> b!223907 m!343283))

(declare-fun m!343285 () Bool)

(assert (=> b!223910 m!343285))

(declare-fun m!343287 () Bool)

(assert (=> start!46688 m!343287))

(declare-fun m!343289 () Bool)

(assert (=> start!46688 m!343289))

(declare-fun m!343291 () Bool)

(assert (=> b!223909 m!343291))

(declare-fun m!343293 () Bool)

(assert (=> b!223909 m!343293))

(declare-fun m!343295 () Bool)

(assert (=> b!223909 m!343295))

(declare-fun m!343297 () Bool)

(assert (=> b!223909 m!343297))

(declare-fun m!343299 () Bool)

(assert (=> b!223909 m!343299))

(declare-fun m!343301 () Bool)

(assert (=> b!223909 m!343301))

(declare-fun m!343303 () Bool)

(assert (=> b!223909 m!343303))

(declare-fun m!343305 () Bool)

(assert (=> b!223909 m!343305))

(declare-fun m!343307 () Bool)

(assert (=> b!223909 m!343307))

(declare-fun m!343309 () Bool)

(assert (=> b!223909 m!343309))

(push 1)

(assert (not b!223910))

(assert (not b!223909))

(assert (not b!223907))

(assert (not start!46688))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

