; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46696 () Bool)

(assert start!46696)

(declare-fun res!188001 () Bool)

(declare-fun e!152496 () Bool)

(assert (=> start!46696 (=> (not res!188001) (not e!152496))))

(declare-datatypes ((array!11012 0))(
  ( (array!11013 (arr!5777 (Array (_ BitVec 32) (_ BitVec 8))) (size!4829 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11012)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!46696 (= res!188001 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4829 arr!308))))))

(assert (=> start!46696 e!152496))

(assert (=> start!46696 true))

(declare-fun array_inv!4570 (array!11012) Bool)

(assert (=> start!46696 (array_inv!4570 arr!308)))

(declare-datatypes ((BitStream!8760 0))(
  ( (BitStream!8761 (buf!5373 array!11012) (currentByte!10101 (_ BitVec 32)) (currentBit!10096 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8760)

(declare-fun e!152498 () Bool)

(declare-fun inv!12 (BitStream!8760) Bool)

(assert (=> start!46696 (and (inv!12 thiss!1870) e!152498)))

(declare-fun b!223956 () Bool)

(declare-fun res!187999 () Bool)

(assert (=> b!223956 (=> (not res!187999) (not e!152496))))

(assert (=> b!223956 (= res!187999 (bvslt i!761 to!496))))

(declare-fun b!223957 () Bool)

(assert (=> b!223957 (= e!152496 (not true))))

(declare-fun lt!355114 () array!11012)

(declare-fun arrayRangesEq!725 (array!11012 array!11012 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!223957 (arrayRangesEq!725 arr!308 lt!355114 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((tuple2!19146 0))(
  ( (tuple2!19147 (_1!10307 (_ BitVec 8)) (_2!10307 BitStream!8760)) )
))
(declare-fun lt!355109 () tuple2!19146)

(declare-datatypes ((Unit!16327 0))(
  ( (Unit!16328) )
))
(declare-fun lt!355116 () Unit!16327)

(declare-fun arrayUpdatedAtPrefixLemma!317 (array!11012 (_ BitVec 32) (_ BitVec 8)) Unit!16327)

(assert (=> b!223957 (= lt!355116 (arrayUpdatedAtPrefixLemma!317 arr!308 i!761 (_1!10307 lt!355109)))))

(declare-fun lt!355110 () (_ BitVec 32))

(declare-datatypes ((tuple3!1184 0))(
  ( (tuple3!1185 (_1!10308 Unit!16327) (_2!10308 BitStream!8760) (_3!734 array!11012)) )
))
(declare-fun lt!355111 () tuple3!1184)

(declare-fun lt!355112 () (_ BitVec 64))

(declare-fun lt!355108 () (_ BitVec 64))

(declare-fun lt!355115 () (_ BitVec 64))

(assert (=> b!223957 (and (= (bvadd lt!355108 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!355110))) lt!355115) (= (bvadd lt!355112 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!355115) (= (buf!5373 thiss!1870) (buf!5373 (_2!10308 lt!355111))) (= (size!4829 arr!308) (size!4829 (_3!734 lt!355111))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!223957 (= lt!355115 (bitIndex!0 (size!4829 (buf!5373 (_2!10308 lt!355111))) (currentByte!10101 (_2!10308 lt!355111)) (currentBit!10096 (_2!10308 lt!355111))))))

(assert (=> b!223957 (= lt!355108 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!355112))))

(assert (=> b!223957 (= lt!355108 (bitIndex!0 (size!4829 (buf!5373 (_2!10307 lt!355109))) (currentByte!10101 (_2!10307 lt!355109)) (currentBit!10096 (_2!10307 lt!355109))))))

(assert (=> b!223957 (= lt!355112 (bitIndex!0 (size!4829 (buf!5373 thiss!1870)) (currentByte!10101 thiss!1870) (currentBit!10096 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8760 array!11012 (_ BitVec 32) (_ BitVec 32)) tuple3!1184)

(assert (=> b!223957 (= lt!355111 (readByteArrayLoop!0 (_2!10307 lt!355109) lt!355114 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!223957 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4829 (buf!5373 (_2!10307 lt!355109)))) ((_ sign_extend 32) (currentByte!10101 (_2!10307 lt!355109))) ((_ sign_extend 32) (currentBit!10096 (_2!10307 lt!355109))) lt!355110)))

(assert (=> b!223957 (= lt!355110 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!355113 () Unit!16327)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8760 BitStream!8760 (_ BitVec 64) (_ BitVec 32)) Unit!16327)

(assert (=> b!223957 (= lt!355113 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10307 lt!355109) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!223957 (= lt!355114 (array!11013 (store (arr!5777 arr!308) i!761 (_1!10307 lt!355109)) (size!4829 arr!308)))))

(declare-fun readByte!0 (BitStream!8760) tuple2!19146)

(assert (=> b!223957 (= lt!355109 (readByte!0 thiss!1870))))

(declare-fun b!223955 () Bool)

(declare-fun res!188000 () Bool)

(assert (=> b!223955 (=> (not res!188000) (not e!152496))))

(assert (=> b!223955 (= res!188000 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4829 (buf!5373 thiss!1870))) ((_ sign_extend 32) (currentByte!10101 thiss!1870)) ((_ sign_extend 32) (currentBit!10096 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!223958 () Bool)

(assert (=> b!223958 (= e!152498 (array_inv!4570 (buf!5373 thiss!1870)))))

(assert (= (and start!46696 res!188001) b!223955))

(assert (= (and b!223955 res!188000) b!223956))

(assert (= (and b!223956 res!187999) b!223957))

(assert (= start!46696 b!223958))

(declare-fun m!343395 () Bool)

(assert (=> start!46696 m!343395))

(declare-fun m!343397 () Bool)

(assert (=> start!46696 m!343397))

(declare-fun m!343399 () Bool)

(assert (=> b!223957 m!343399))

(declare-fun m!343401 () Bool)

(assert (=> b!223957 m!343401))

(declare-fun m!343403 () Bool)

(assert (=> b!223957 m!343403))

(declare-fun m!343405 () Bool)

(assert (=> b!223957 m!343405))

(declare-fun m!343407 () Bool)

(assert (=> b!223957 m!343407))

(declare-fun m!343409 () Bool)

(assert (=> b!223957 m!343409))

(declare-fun m!343411 () Bool)

(assert (=> b!223957 m!343411))

(declare-fun m!343413 () Bool)

(assert (=> b!223957 m!343413))

(declare-fun m!343415 () Bool)

(assert (=> b!223957 m!343415))

(declare-fun m!343417 () Bool)

(assert (=> b!223957 m!343417))

(declare-fun m!343419 () Bool)

(assert (=> b!223955 m!343419))

(declare-fun m!343421 () Bool)

(assert (=> b!223958 m!343421))

(check-sat (not b!223955) (not start!46696) (not b!223958) (not b!223957))
