; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46708 () Bool)

(assert start!46708)

(declare-fun b!224028 () Bool)

(declare-fun res!188053 () Bool)

(declare-fun e!152570 () Bool)

(assert (=> b!224028 (=> (not res!188053) (not e!152570))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!224028 (= res!188053 (bvslt i!761 to!496))))

(declare-fun b!224027 () Bool)

(declare-fun res!188054 () Bool)

(assert (=> b!224027 (=> (not res!188054) (not e!152570))))

(declare-datatypes ((array!11024 0))(
  ( (array!11025 (arr!5783 (Array (_ BitVec 32) (_ BitVec 8))) (size!4835 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8772 0))(
  ( (BitStream!8773 (buf!5379 array!11024) (currentByte!10107 (_ BitVec 32)) (currentBit!10102 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8772)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224027 (= res!188054 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4835 (buf!5379 thiss!1870))) ((_ sign_extend 32) (currentByte!10107 thiss!1870)) ((_ sign_extend 32) (currentBit!10102 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!224030 () Bool)

(declare-fun e!152568 () Bool)

(declare-fun array_inv!4576 (array!11024) Bool)

(assert (=> b!224030 (= e!152568 (array_inv!4576 (buf!5379 thiss!1870)))))

(declare-fun b!224029 () Bool)

(assert (=> b!224029 (= e!152570 (not true))))

(declare-fun arr!308 () array!11024)

(declare-fun lt!355271 () array!11024)

(declare-fun arrayRangesEq!731 (array!11024 array!11024 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224029 (arrayRangesEq!731 arr!308 lt!355271 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!16339 0))(
  ( (Unit!16340) )
))
(declare-fun lt!355278 () Unit!16339)

(declare-datatypes ((tuple2!19158 0))(
  ( (tuple2!19159 (_1!10319 (_ BitVec 8)) (_2!10319 BitStream!8772)) )
))
(declare-fun lt!355276 () tuple2!19158)

(declare-fun arrayUpdatedAtPrefixLemma!323 (array!11024 (_ BitVec 32) (_ BitVec 8)) Unit!16339)

(assert (=> b!224029 (= lt!355278 (arrayUpdatedAtPrefixLemma!323 arr!308 i!761 (_1!10319 lt!355276)))))

(declare-fun lt!355270 () (_ BitVec 64))

(declare-fun lt!355275 () (_ BitVec 32))

(declare-fun lt!355273 () (_ BitVec 64))

(declare-datatypes ((tuple3!1196 0))(
  ( (tuple3!1197 (_1!10320 Unit!16339) (_2!10320 BitStream!8772) (_3!740 array!11024)) )
))
(declare-fun lt!355277 () tuple3!1196)

(declare-fun lt!355272 () (_ BitVec 64))

(assert (=> b!224029 (and (= (bvadd lt!355273 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!355275))) lt!355272) (= (bvadd lt!355270 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!355272) (= (buf!5379 thiss!1870) (buf!5379 (_2!10320 lt!355277))) (= (size!4835 arr!308) (size!4835 (_3!740 lt!355277))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224029 (= lt!355272 (bitIndex!0 (size!4835 (buf!5379 (_2!10320 lt!355277))) (currentByte!10107 (_2!10320 lt!355277)) (currentBit!10102 (_2!10320 lt!355277))))))

(assert (=> b!224029 (= lt!355273 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!355270))))

(assert (=> b!224029 (= lt!355273 (bitIndex!0 (size!4835 (buf!5379 (_2!10319 lt!355276))) (currentByte!10107 (_2!10319 lt!355276)) (currentBit!10102 (_2!10319 lt!355276))))))

(assert (=> b!224029 (= lt!355270 (bitIndex!0 (size!4835 (buf!5379 thiss!1870)) (currentByte!10107 thiss!1870) (currentBit!10102 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8772 array!11024 (_ BitVec 32) (_ BitVec 32)) tuple3!1196)

(assert (=> b!224029 (= lt!355277 (readByteArrayLoop!0 (_2!10319 lt!355276) lt!355271 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!224029 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4835 (buf!5379 (_2!10319 lt!355276)))) ((_ sign_extend 32) (currentByte!10107 (_2!10319 lt!355276))) ((_ sign_extend 32) (currentBit!10102 (_2!10319 lt!355276))) lt!355275)))

(assert (=> b!224029 (= lt!355275 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!355274 () Unit!16339)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8772 BitStream!8772 (_ BitVec 64) (_ BitVec 32)) Unit!16339)

(assert (=> b!224029 (= lt!355274 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10319 lt!355276) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224029 (= lt!355271 (array!11025 (store (arr!5783 arr!308) i!761 (_1!10319 lt!355276)) (size!4835 arr!308)))))

(declare-fun readByte!0 (BitStream!8772) tuple2!19158)

(assert (=> b!224029 (= lt!355276 (readByte!0 thiss!1870))))

(declare-fun res!188055 () Bool)

(assert (=> start!46708 (=> (not res!188055) (not e!152570))))

(assert (=> start!46708 (= res!188055 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4835 arr!308))))))

(assert (=> start!46708 e!152570))

(assert (=> start!46708 true))

(assert (=> start!46708 (array_inv!4576 arr!308)))

(declare-fun inv!12 (BitStream!8772) Bool)

(assert (=> start!46708 (and (inv!12 thiss!1870) e!152568)))

(assert (= (and start!46708 res!188055) b!224027))

(assert (= (and b!224027 res!188054) b!224028))

(assert (= (and b!224028 res!188053) b!224029))

(assert (= start!46708 b!224030))

(declare-fun m!343563 () Bool)

(assert (=> b!224027 m!343563))

(declare-fun m!343565 () Bool)

(assert (=> b!224030 m!343565))

(declare-fun m!343567 () Bool)

(assert (=> b!224029 m!343567))

(declare-fun m!343569 () Bool)

(assert (=> b!224029 m!343569))

(declare-fun m!343571 () Bool)

(assert (=> b!224029 m!343571))

(declare-fun m!343573 () Bool)

(assert (=> b!224029 m!343573))

(declare-fun m!343575 () Bool)

(assert (=> b!224029 m!343575))

(declare-fun m!343577 () Bool)

(assert (=> b!224029 m!343577))

(declare-fun m!343579 () Bool)

(assert (=> b!224029 m!343579))

(declare-fun m!343581 () Bool)

(assert (=> b!224029 m!343581))

(declare-fun m!343583 () Bool)

(assert (=> b!224029 m!343583))

(declare-fun m!343585 () Bool)

(assert (=> b!224029 m!343585))

(declare-fun m!343587 () Bool)

(assert (=> start!46708 m!343587))

(declare-fun m!343589 () Bool)

(assert (=> start!46708 m!343589))

(check-sat (not start!46708) (not b!224029) (not b!224030) (not b!224027))
