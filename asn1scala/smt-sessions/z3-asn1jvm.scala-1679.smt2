; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46726 () Bool)

(assert start!46726)

(declare-fun b!224135 () Bool)

(declare-fun res!188135 () Bool)

(declare-fun e!152675 () Bool)

(assert (=> b!224135 (=> (not res!188135) (not e!152675))))

(declare-datatypes ((array!11042 0))(
  ( (array!11043 (arr!5792 (Array (_ BitVec 32) (_ BitVec 8))) (size!4844 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8790 0))(
  ( (BitStream!8791 (buf!5388 array!11042) (currentByte!10116 (_ BitVec 32)) (currentBit!10111 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8790)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224135 (= res!188135 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4844 (buf!5388 thiss!1870))) ((_ sign_extend 32) (currentByte!10116 thiss!1870)) ((_ sign_extend 32) (currentBit!10111 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!188136 () Bool)

(assert (=> start!46726 (=> (not res!188136) (not e!152675))))

(declare-fun arr!308 () array!11042)

(assert (=> start!46726 (= res!188136 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4844 arr!308))))))

(assert (=> start!46726 e!152675))

(assert (=> start!46726 true))

(declare-fun array_inv!4585 (array!11042) Bool)

(assert (=> start!46726 (array_inv!4585 arr!308)))

(declare-fun e!152678 () Bool)

(declare-fun inv!12 (BitStream!8790) Bool)

(assert (=> start!46726 (and (inv!12 thiss!1870) e!152678)))

(declare-fun b!224137 () Bool)

(assert (=> b!224137 (= e!152675 (not true))))

(declare-datatypes ((Unit!16357 0))(
  ( (Unit!16358) )
))
(declare-datatypes ((tuple3!1214 0))(
  ( (tuple3!1215 (_1!10337 Unit!16357) (_2!10337 BitStream!8790) (_3!749 array!11042)) )
))
(declare-fun lt!355533 () tuple3!1214)

(declare-fun arrayRangesEq!740 (array!11042 array!11042 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224137 (arrayRangesEq!740 arr!308 (_3!749 lt!355533) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!355530 () Unit!16357)

(declare-fun lt!355528 () array!11042)

(declare-fun arrayRangesEqTransitive!211 (array!11042 array!11042 array!11042 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16357)

(assert (=> b!224137 (= lt!355530 (arrayRangesEqTransitive!211 arr!308 lt!355528 (_3!749 lt!355533) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224137 (arrayRangesEq!740 arr!308 lt!355528 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((tuple2!19176 0))(
  ( (tuple2!19177 (_1!10338 (_ BitVec 8)) (_2!10338 BitStream!8790)) )
))
(declare-fun lt!355536 () tuple2!19176)

(declare-fun lt!355529 () Unit!16357)

(declare-fun arrayUpdatedAtPrefixLemma!332 (array!11042 (_ BitVec 32) (_ BitVec 8)) Unit!16357)

(assert (=> b!224137 (= lt!355529 (arrayUpdatedAtPrefixLemma!332 arr!308 i!761 (_1!10338 lt!355536)))))

(declare-fun lt!355535 () (_ BitVec 64))

(declare-fun lt!355527 () (_ BitVec 32))

(declare-fun lt!355534 () (_ BitVec 64))

(declare-fun lt!355532 () (_ BitVec 64))

(assert (=> b!224137 (and (= (bvadd lt!355535 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!355527))) lt!355534) (= (bvadd lt!355532 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!355534) (= (buf!5388 thiss!1870) (buf!5388 (_2!10337 lt!355533))) (= (size!4844 arr!308) (size!4844 (_3!749 lt!355533))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224137 (= lt!355534 (bitIndex!0 (size!4844 (buf!5388 (_2!10337 lt!355533))) (currentByte!10116 (_2!10337 lt!355533)) (currentBit!10111 (_2!10337 lt!355533))))))

(assert (=> b!224137 (= lt!355535 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!355532))))

(assert (=> b!224137 (= lt!355535 (bitIndex!0 (size!4844 (buf!5388 (_2!10338 lt!355536))) (currentByte!10116 (_2!10338 lt!355536)) (currentBit!10111 (_2!10338 lt!355536))))))

(assert (=> b!224137 (= lt!355532 (bitIndex!0 (size!4844 (buf!5388 thiss!1870)) (currentByte!10116 thiss!1870) (currentBit!10111 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8790 array!11042 (_ BitVec 32) (_ BitVec 32)) tuple3!1214)

(assert (=> b!224137 (= lt!355533 (readByteArrayLoop!0 (_2!10338 lt!355536) lt!355528 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!224137 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4844 (buf!5388 (_2!10338 lt!355536)))) ((_ sign_extend 32) (currentByte!10116 (_2!10338 lt!355536))) ((_ sign_extend 32) (currentBit!10111 (_2!10338 lt!355536))) lt!355527)))

(assert (=> b!224137 (= lt!355527 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!355531 () Unit!16357)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8790 BitStream!8790 (_ BitVec 64) (_ BitVec 32)) Unit!16357)

(assert (=> b!224137 (= lt!355531 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10338 lt!355536) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224137 (= lt!355528 (array!11043 (store (arr!5792 arr!308) i!761 (_1!10338 lt!355536)) (size!4844 arr!308)))))

(declare-fun readByte!0 (BitStream!8790) tuple2!19176)

(assert (=> b!224137 (= lt!355536 (readByte!0 thiss!1870))))

(declare-fun b!224138 () Bool)

(assert (=> b!224138 (= e!152678 (array_inv!4585 (buf!5388 thiss!1870)))))

(declare-fun b!224136 () Bool)

(declare-fun res!188134 () Bool)

(assert (=> b!224136 (=> (not res!188134) (not e!152675))))

(assert (=> b!224136 (= res!188134 (bvslt i!761 to!496))))

(assert (= (and start!46726 res!188136) b!224135))

(assert (= (and b!224135 res!188135) b!224136))

(assert (= (and b!224136 res!188134) b!224137))

(assert (= start!46726 b!224138))

(declare-fun m!343831 () Bool)

(assert (=> b!224135 m!343831))

(declare-fun m!343833 () Bool)

(assert (=> start!46726 m!343833))

(declare-fun m!343835 () Bool)

(assert (=> start!46726 m!343835))

(declare-fun m!343837 () Bool)

(assert (=> b!224137 m!343837))

(declare-fun m!343839 () Bool)

(assert (=> b!224137 m!343839))

(declare-fun m!343841 () Bool)

(assert (=> b!224137 m!343841))

(declare-fun m!343843 () Bool)

(assert (=> b!224137 m!343843))

(declare-fun m!343845 () Bool)

(assert (=> b!224137 m!343845))

(declare-fun m!343847 () Bool)

(assert (=> b!224137 m!343847))

(declare-fun m!343849 () Bool)

(assert (=> b!224137 m!343849))

(declare-fun m!343851 () Bool)

(assert (=> b!224137 m!343851))

(declare-fun m!343853 () Bool)

(assert (=> b!224137 m!343853))

(declare-fun m!343855 () Bool)

(assert (=> b!224137 m!343855))

(declare-fun m!343857 () Bool)

(assert (=> b!224137 m!343857))

(declare-fun m!343859 () Bool)

(assert (=> b!224137 m!343859))

(declare-fun m!343861 () Bool)

(assert (=> b!224138 m!343861))

(check-sat (not start!46726) (not b!224135) (not b!224137) (not b!224138))
