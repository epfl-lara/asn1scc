; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46684 () Bool)

(assert start!46684)

(declare-fun b!223884 () Bool)

(declare-fun res!187947 () Bool)

(declare-fun e!152425 () Bool)

(assert (=> b!223884 (=> (not res!187947) (not e!152425))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!223884 (= res!187947 (bvslt i!761 to!496))))

(declare-fun b!223885 () Bool)

(assert (=> b!223885 (= e!152425 (not true))))

(declare-datatypes ((array!11000 0))(
  ( (array!11001 (arr!5771 (Array (_ BitVec 32) (_ BitVec 8))) (size!4823 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8748 0))(
  ( (BitStream!8749 (buf!5367 array!11000) (currentByte!10095 (_ BitVec 32)) (currentBit!10090 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!16315 0))(
  ( (Unit!16316) )
))
(declare-datatypes ((tuple3!1172 0))(
  ( (tuple3!1173 (_1!10295 Unit!16315) (_2!10295 BitStream!8748) (_3!728 array!11000)) )
))
(declare-fun lt!354956 () tuple3!1172)

(declare-fun arr!308 () array!11000)

(declare-fun lt!354955 () (_ BitVec 32))

(declare-fun thiss!1870 () BitStream!8748)

(declare-fun lt!354954 () (_ BitVec 64))

(declare-fun lt!354959 () (_ BitVec 64))

(declare-fun lt!354958 () (_ BitVec 64))

(assert (=> b!223885 (and (= (bvadd lt!354959 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!354955))) lt!354958) (= (bvadd lt!354954 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!354958) (= (buf!5367 thiss!1870) (buf!5367 (_2!10295 lt!354956))) (= (size!4823 arr!308) (size!4823 (_3!728 lt!354956))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!223885 (= lt!354958 (bitIndex!0 (size!4823 (buf!5367 (_2!10295 lt!354956))) (currentByte!10095 (_2!10295 lt!354956)) (currentBit!10090 (_2!10295 lt!354956))))))

(assert (=> b!223885 (= lt!354959 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!354954))))

(declare-datatypes ((tuple2!19134 0))(
  ( (tuple2!19135 (_1!10296 (_ BitVec 8)) (_2!10296 BitStream!8748)) )
))
(declare-fun lt!354960 () tuple2!19134)

(assert (=> b!223885 (= lt!354959 (bitIndex!0 (size!4823 (buf!5367 (_2!10296 lt!354960))) (currentByte!10095 (_2!10296 lt!354960)) (currentBit!10090 (_2!10296 lt!354960))))))

(assert (=> b!223885 (= lt!354954 (bitIndex!0 (size!4823 (buf!5367 thiss!1870)) (currentByte!10095 thiss!1870) (currentBit!10090 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8748 array!11000 (_ BitVec 32) (_ BitVec 32)) tuple3!1172)

(assert (=> b!223885 (= lt!354956 (readByteArrayLoop!0 (_2!10296 lt!354960) (array!11001 (store (arr!5771 arr!308) i!761 (_1!10296 lt!354960)) (size!4823 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!223885 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4823 (buf!5367 (_2!10296 lt!354960)))) ((_ sign_extend 32) (currentByte!10095 (_2!10296 lt!354960))) ((_ sign_extend 32) (currentBit!10090 (_2!10296 lt!354960))) lt!354955)))

(assert (=> b!223885 (= lt!354955 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!354957 () Unit!16315)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8748 BitStream!8748 (_ BitVec 64) (_ BitVec 32)) Unit!16315)

(assert (=> b!223885 (= lt!354957 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10296 lt!354960) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!8748) tuple2!19134)

(assert (=> b!223885 (= lt!354960 (readByte!0 thiss!1870))))

(declare-fun b!223883 () Bool)

(declare-fun res!187946 () Bool)

(assert (=> b!223883 (=> (not res!187946) (not e!152425))))

(assert (=> b!223883 (= res!187946 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4823 (buf!5367 thiss!1870))) ((_ sign_extend 32) (currentByte!10095 thiss!1870)) ((_ sign_extend 32) (currentBit!10090 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!187945 () Bool)

(assert (=> start!46684 (=> (not res!187945) (not e!152425))))

(assert (=> start!46684 (= res!187945 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4823 arr!308))))))

(assert (=> start!46684 e!152425))

(assert (=> start!46684 true))

(declare-fun array_inv!4564 (array!11000) Bool)

(assert (=> start!46684 (array_inv!4564 arr!308)))

(declare-fun e!152424 () Bool)

(declare-fun inv!12 (BitStream!8748) Bool)

(assert (=> start!46684 (and (inv!12 thiss!1870) e!152424)))

(declare-fun b!223886 () Bool)

(assert (=> b!223886 (= e!152424 (array_inv!4564 (buf!5367 thiss!1870)))))

(assert (= (and start!46684 res!187945) b!223883))

(assert (= (and b!223883 res!187946) b!223884))

(assert (= (and b!223884 res!187947) b!223885))

(assert (= start!46684 b!223886))

(declare-fun m!343235 () Bool)

(assert (=> b!223885 m!343235))

(declare-fun m!343237 () Bool)

(assert (=> b!223885 m!343237))

(declare-fun m!343239 () Bool)

(assert (=> b!223885 m!343239))

(declare-fun m!343241 () Bool)

(assert (=> b!223885 m!343241))

(declare-fun m!343243 () Bool)

(assert (=> b!223885 m!343243))

(declare-fun m!343245 () Bool)

(assert (=> b!223885 m!343245))

(declare-fun m!343247 () Bool)

(assert (=> b!223885 m!343247))

(declare-fun m!343249 () Bool)

(assert (=> b!223885 m!343249))

(declare-fun m!343251 () Bool)

(assert (=> b!223883 m!343251))

(declare-fun m!343253 () Bool)

(assert (=> start!46684 m!343253))

(declare-fun m!343255 () Bool)

(assert (=> start!46684 m!343255))

(declare-fun m!343257 () Bool)

(assert (=> b!223886 m!343257))

(check-sat (not b!223886) (not start!46684) (not b!223885) (not b!223883))
