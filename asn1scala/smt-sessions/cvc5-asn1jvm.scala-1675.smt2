; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46700 () Bool)

(assert start!46700)

(declare-fun b!223979 () Bool)

(declare-fun res!188018 () Bool)

(declare-fun e!152519 () Bool)

(assert (=> b!223979 (=> (not res!188018) (not e!152519))))

(declare-datatypes ((array!11016 0))(
  ( (array!11017 (arr!5779 (Array (_ BitVec 32) (_ BitVec 8))) (size!4831 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8764 0))(
  ( (BitStream!8765 (buf!5375 array!11016) (currentByte!10103 (_ BitVec 32)) (currentBit!10098 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8764)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!223979 (= res!188018 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4831 (buf!5375 thiss!1870))) ((_ sign_extend 32) (currentByte!10103 thiss!1870)) ((_ sign_extend 32) (currentBit!10098 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!188017 () Bool)

(assert (=> start!46700 (=> (not res!188017) (not e!152519))))

(declare-fun arr!308 () array!11016)

(assert (=> start!46700 (= res!188017 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4831 arr!308))))))

(assert (=> start!46700 e!152519))

(assert (=> start!46700 true))

(declare-fun array_inv!4572 (array!11016) Bool)

(assert (=> start!46700 (array_inv!4572 arr!308)))

(declare-fun e!152521 () Bool)

(declare-fun inv!12 (BitStream!8764) Bool)

(assert (=> start!46700 (and (inv!12 thiss!1870) e!152521)))

(declare-fun b!223980 () Bool)

(declare-fun res!188019 () Bool)

(assert (=> b!223980 (=> (not res!188019) (not e!152519))))

(assert (=> b!223980 (= res!188019 (bvslt i!761 to!496))))

(declare-fun b!223981 () Bool)

(assert (=> b!223981 (= e!152519 (not true))))

(declare-fun lt!355166 () array!11016)

(declare-fun arrayRangesEq!727 (array!11016 array!11016 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!223981 (arrayRangesEq!727 arr!308 lt!355166 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((tuple2!19150 0))(
  ( (tuple2!19151 (_1!10311 (_ BitVec 8)) (_2!10311 BitStream!8764)) )
))
(declare-fun lt!355162 () tuple2!19150)

(declare-datatypes ((Unit!16331 0))(
  ( (Unit!16332) )
))
(declare-fun lt!355167 () Unit!16331)

(declare-fun arrayUpdatedAtPrefixLemma!319 (array!11016 (_ BitVec 32) (_ BitVec 8)) Unit!16331)

(assert (=> b!223981 (= lt!355167 (arrayUpdatedAtPrefixLemma!319 arr!308 i!761 (_1!10311 lt!355162)))))

(declare-datatypes ((tuple3!1188 0))(
  ( (tuple3!1189 (_1!10312 Unit!16331) (_2!10312 BitStream!8764) (_3!736 array!11016)) )
))
(declare-fun lt!355169 () tuple3!1188)

(declare-fun lt!355168 () (_ BitVec 64))

(declare-fun lt!355163 () (_ BitVec 32))

(declare-fun lt!355170 () (_ BitVec 64))

(declare-fun lt!355164 () (_ BitVec 64))

(assert (=> b!223981 (and (= (bvadd lt!355170 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!355163))) lt!355168) (= (bvadd lt!355164 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!355168) (= (buf!5375 thiss!1870) (buf!5375 (_2!10312 lt!355169))) (= (size!4831 arr!308) (size!4831 (_3!736 lt!355169))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!223981 (= lt!355168 (bitIndex!0 (size!4831 (buf!5375 (_2!10312 lt!355169))) (currentByte!10103 (_2!10312 lt!355169)) (currentBit!10098 (_2!10312 lt!355169))))))

(assert (=> b!223981 (= lt!355170 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!355164))))

(assert (=> b!223981 (= lt!355170 (bitIndex!0 (size!4831 (buf!5375 (_2!10311 lt!355162))) (currentByte!10103 (_2!10311 lt!355162)) (currentBit!10098 (_2!10311 lt!355162))))))

(assert (=> b!223981 (= lt!355164 (bitIndex!0 (size!4831 (buf!5375 thiss!1870)) (currentByte!10103 thiss!1870) (currentBit!10098 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8764 array!11016 (_ BitVec 32) (_ BitVec 32)) tuple3!1188)

(assert (=> b!223981 (= lt!355169 (readByteArrayLoop!0 (_2!10311 lt!355162) lt!355166 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!223981 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4831 (buf!5375 (_2!10311 lt!355162)))) ((_ sign_extend 32) (currentByte!10103 (_2!10311 lt!355162))) ((_ sign_extend 32) (currentBit!10098 (_2!10311 lt!355162))) lt!355163)))

(assert (=> b!223981 (= lt!355163 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!355165 () Unit!16331)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8764 BitStream!8764 (_ BitVec 64) (_ BitVec 32)) Unit!16331)

(assert (=> b!223981 (= lt!355165 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10311 lt!355162) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!223981 (= lt!355166 (array!11017 (store (arr!5779 arr!308) i!761 (_1!10311 lt!355162)) (size!4831 arr!308)))))

(declare-fun readByte!0 (BitStream!8764) tuple2!19150)

(assert (=> b!223981 (= lt!355162 (readByte!0 thiss!1870))))

(declare-fun b!223982 () Bool)

(assert (=> b!223982 (= e!152521 (array_inv!4572 (buf!5375 thiss!1870)))))

(assert (= (and start!46700 res!188017) b!223979))

(assert (= (and b!223979 res!188018) b!223980))

(assert (= (and b!223980 res!188019) b!223981))

(assert (= start!46700 b!223982))

(declare-fun m!343451 () Bool)

(assert (=> b!223979 m!343451))

(declare-fun m!343453 () Bool)

(assert (=> start!46700 m!343453))

(declare-fun m!343455 () Bool)

(assert (=> start!46700 m!343455))

(declare-fun m!343457 () Bool)

(assert (=> b!223981 m!343457))

(declare-fun m!343459 () Bool)

(assert (=> b!223981 m!343459))

(declare-fun m!343461 () Bool)

(assert (=> b!223981 m!343461))

(declare-fun m!343463 () Bool)

(assert (=> b!223981 m!343463))

(declare-fun m!343465 () Bool)

(assert (=> b!223981 m!343465))

(declare-fun m!343467 () Bool)

(assert (=> b!223981 m!343467))

(declare-fun m!343469 () Bool)

(assert (=> b!223981 m!343469))

(declare-fun m!343471 () Bool)

(assert (=> b!223981 m!343471))

(declare-fun m!343473 () Bool)

(assert (=> b!223981 m!343473))

(declare-fun m!343475 () Bool)

(assert (=> b!223981 m!343475))

(declare-fun m!343477 () Bool)

(assert (=> b!223982 m!343477))

(push 1)

(assert (not b!223979))

(assert (not b!223981))

(assert (not start!46700))

(assert (not b!223982))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

