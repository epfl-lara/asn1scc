; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47716 () Bool)

(assert start!47716)

(declare-fun res!190546 () Bool)

(declare-fun e!155336 () Bool)

(assert (=> start!47716 (=> (not res!190546) (not e!155336))))

(declare-datatypes ((array!11383 0))(
  ( (array!11384 (arr!5966 (Array (_ BitVec 32) (_ BitVec 8))) (size!4991 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11383)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47716 (= res!190546 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4991 arr!308))))))

(assert (=> start!47716 e!155336))

(assert (=> start!47716 true))

(declare-fun array_inv!4732 (array!11383) Bool)

(assert (=> start!47716 (array_inv!4732 arr!308)))

(declare-datatypes ((BitStream!9078 0))(
  ( (BitStream!9079 (buf!5532 array!11383) (currentByte!10370 (_ BitVec 32)) (currentBit!10365 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9078)

(declare-fun e!155338 () Bool)

(declare-fun inv!12 (BitStream!9078) Bool)

(assert (=> start!47716 (and (inv!12 thiss!1870) e!155338)))

(declare-fun b!227103 () Bool)

(declare-fun res!190544 () Bool)

(assert (=> b!227103 (=> (not res!190544) (not e!155336))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227103 (= res!190544 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4991 (buf!5532 thiss!1870))) ((_ sign_extend 32) (currentByte!10370 thiss!1870)) ((_ sign_extend 32) (currentBit!10365 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!227106 () Bool)

(assert (=> b!227106 (= e!155338 (array_inv!4732 (buf!5532 thiss!1870)))))

(declare-fun b!227104 () Bool)

(declare-fun res!190545 () Bool)

(assert (=> b!227104 (=> (not res!190545) (not e!155336))))

(assert (=> b!227104 (= res!190545 (bvslt i!761 to!496))))

(declare-fun b!227105 () Bool)

(assert (=> b!227105 (= e!155336 (not (bvslt i!761 (size!4991 arr!308))))))

(declare-fun lt!362755 () (_ BitVec 32))

(declare-datatypes ((Unit!16925 0))(
  ( (Unit!16926) )
))
(declare-datatypes ((tuple3!1364 0))(
  ( (tuple3!1365 (_1!10576 Unit!16925) (_2!10576 BitStream!9078) (_3!824 array!11383)) )
))
(declare-fun lt!362754 () tuple3!1364)

(declare-fun lt!362753 () (_ BitVec 64))

(declare-fun lt!362757 () (_ BitVec 64))

(declare-fun lt!362751 () (_ BitVec 64))

(assert (=> b!227105 (and (= (bvadd lt!362751 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!362755))) lt!362757) (= (bvadd lt!362753 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!362757) (= (buf!5532 thiss!1870) (buf!5532 (_2!10576 lt!362754))) (= (size!4991 arr!308) (size!4991 (_3!824 lt!362754))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227105 (= lt!362757 (bitIndex!0 (size!4991 (buf!5532 (_2!10576 lt!362754))) (currentByte!10370 (_2!10576 lt!362754)) (currentBit!10365 (_2!10576 lt!362754))))))

(assert (=> b!227105 (= lt!362751 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!362753))))

(declare-datatypes ((tuple2!19504 0))(
  ( (tuple2!19505 (_1!10577 (_ BitVec 8)) (_2!10577 BitStream!9078)) )
))
(declare-fun lt!362756 () tuple2!19504)

(assert (=> b!227105 (= lt!362751 (bitIndex!0 (size!4991 (buf!5532 (_2!10577 lt!362756))) (currentByte!10370 (_2!10577 lt!362756)) (currentBit!10365 (_2!10577 lt!362756))))))

(assert (=> b!227105 (= lt!362753 (bitIndex!0 (size!4991 (buf!5532 thiss!1870)) (currentByte!10370 thiss!1870) (currentBit!10365 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9078 array!11383 (_ BitVec 32) (_ BitVec 32)) tuple3!1364)

(assert (=> b!227105 (= lt!362754 (readByteArrayLoop!0 (_2!10577 lt!362756) (array!11384 (store (arr!5966 arr!308) i!761 (_1!10577 lt!362756)) (size!4991 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!227105 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4991 (buf!5532 (_2!10577 lt!362756)))) ((_ sign_extend 32) (currentByte!10370 (_2!10577 lt!362756))) ((_ sign_extend 32) (currentBit!10365 (_2!10577 lt!362756))) lt!362755)))

(assert (=> b!227105 (= lt!362755 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!362752 () Unit!16925)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9078 BitStream!9078 (_ BitVec 64) (_ BitVec 32)) Unit!16925)

(assert (=> b!227105 (= lt!362752 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10577 lt!362756) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!9078) tuple2!19504)

(assert (=> b!227105 (= lt!362756 (readByte!0 thiss!1870))))

(assert (= (and start!47716 res!190546) b!227103))

(assert (= (and b!227103 res!190544) b!227104))

(assert (= (and b!227104 res!190545) b!227105))

(assert (= start!47716 b!227106))

(declare-fun m!349087 () Bool)

(assert (=> start!47716 m!349087))

(declare-fun m!349089 () Bool)

(assert (=> start!47716 m!349089))

(declare-fun m!349091 () Bool)

(assert (=> b!227103 m!349091))

(declare-fun m!349093 () Bool)

(assert (=> b!227106 m!349093))

(declare-fun m!349095 () Bool)

(assert (=> b!227105 m!349095))

(declare-fun m!349097 () Bool)

(assert (=> b!227105 m!349097))

(declare-fun m!349099 () Bool)

(assert (=> b!227105 m!349099))

(declare-fun m!349101 () Bool)

(assert (=> b!227105 m!349101))

(declare-fun m!349103 () Bool)

(assert (=> b!227105 m!349103))

(declare-fun m!349105 () Bool)

(assert (=> b!227105 m!349105))

(declare-fun m!349107 () Bool)

(assert (=> b!227105 m!349107))

(declare-fun m!349109 () Bool)

(assert (=> b!227105 m!349109))

(check-sat (not b!227106) (not start!47716) (not b!227105) (not b!227103))
(check-sat)
