; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46752 () Bool)

(assert start!46752)

(declare-fun res!188251 () Bool)

(declare-fun e!152831 () Bool)

(assert (=> start!46752 (=> (not res!188251) (not e!152831))))

(declare-datatypes ((array!11068 0))(
  ( (array!11069 (arr!5805 (Array (_ BitVec 32) (_ BitVec 8))) (size!4857 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11068)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!46752 (= res!188251 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4857 arr!308))))))

(assert (=> start!46752 e!152831))

(assert (=> start!46752 true))

(declare-fun array_inv!4598 (array!11068) Bool)

(assert (=> start!46752 (array_inv!4598 arr!308)))

(declare-datatypes ((BitStream!8816 0))(
  ( (BitStream!8817 (buf!5401 array!11068) (currentByte!10129 (_ BitVec 32)) (currentBit!10124 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8816)

(declare-fun e!152833 () Bool)

(declare-fun inv!12 (BitStream!8816) Bool)

(assert (=> start!46752 (and (inv!12 thiss!1870) e!152833)))

(declare-fun b!224291 () Bool)

(declare-fun res!188253 () Bool)

(assert (=> b!224291 (=> (not res!188253) (not e!152831))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224291 (= res!188253 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4857 (buf!5401 thiss!1870))) ((_ sign_extend 32) (currentByte!10129 thiss!1870)) ((_ sign_extend 32) (currentBit!10124 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!224294 () Bool)

(assert (=> b!224294 (= e!152833 (array_inv!4598 (buf!5401 thiss!1870)))))

(declare-fun b!224292 () Bool)

(declare-fun res!188252 () Bool)

(assert (=> b!224292 (=> (not res!188252) (not e!152831))))

(assert (=> b!224292 (= res!188252 (bvslt i!761 to!496))))

(declare-fun b!224293 () Bool)

(assert (=> b!224293 (= e!152831 (not true))))

(declare-datatypes ((Unit!16383 0))(
  ( (Unit!16384) )
))
(declare-datatypes ((tuple3!1240 0))(
  ( (tuple3!1241 (_1!10363 Unit!16383) (_2!10363 BitStream!8816) (_3!762 array!11068)) )
))
(declare-fun lt!355918 () tuple3!1240)

(declare-fun arrayRangesEq!753 (array!11068 array!11068 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224293 (arrayRangesEq!753 arr!308 (_3!762 lt!355918) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!355923 () array!11068)

(declare-fun lt!355919 () Unit!16383)

(declare-fun arrayRangesEqTransitive!224 (array!11068 array!11068 array!11068 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16383)

(assert (=> b!224293 (= lt!355919 (arrayRangesEqTransitive!224 arr!308 lt!355923 (_3!762 lt!355918) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224293 (arrayRangesEq!753 arr!308 lt!355923 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((tuple2!19202 0))(
  ( (tuple2!19203 (_1!10364 (_ BitVec 8)) (_2!10364 BitStream!8816)) )
))
(declare-fun lt!355921 () tuple2!19202)

(declare-fun lt!355922 () Unit!16383)

(declare-fun arrayUpdatedAtPrefixLemma!345 (array!11068 (_ BitVec 32) (_ BitVec 8)) Unit!16383)

(assert (=> b!224293 (= lt!355922 (arrayUpdatedAtPrefixLemma!345 arr!308 i!761 (_1!10364 lt!355921)))))

(declare-fun lt!355917 () (_ BitVec 64))

(declare-fun lt!355926 () (_ BitVec 32))

(declare-fun lt!355920 () (_ BitVec 64))

(declare-fun lt!355925 () (_ BitVec 64))

(assert (=> b!224293 (and (= (bvadd lt!355917 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!355926))) lt!355925) (= (bvadd lt!355920 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!355925) (= (buf!5401 thiss!1870) (buf!5401 (_2!10363 lt!355918))) (= (size!4857 arr!308) (size!4857 (_3!762 lt!355918))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224293 (= lt!355925 (bitIndex!0 (size!4857 (buf!5401 (_2!10363 lt!355918))) (currentByte!10129 (_2!10363 lt!355918)) (currentBit!10124 (_2!10363 lt!355918))))))

(assert (=> b!224293 (= lt!355917 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!355920))))

(assert (=> b!224293 (= lt!355917 (bitIndex!0 (size!4857 (buf!5401 (_2!10364 lt!355921))) (currentByte!10129 (_2!10364 lt!355921)) (currentBit!10124 (_2!10364 lt!355921))))))

(assert (=> b!224293 (= lt!355920 (bitIndex!0 (size!4857 (buf!5401 thiss!1870)) (currentByte!10129 thiss!1870) (currentBit!10124 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8816 array!11068 (_ BitVec 32) (_ BitVec 32)) tuple3!1240)

(assert (=> b!224293 (= lt!355918 (readByteArrayLoop!0 (_2!10364 lt!355921) lt!355923 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!224293 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4857 (buf!5401 (_2!10364 lt!355921)))) ((_ sign_extend 32) (currentByte!10129 (_2!10364 lt!355921))) ((_ sign_extend 32) (currentBit!10124 (_2!10364 lt!355921))) lt!355926)))

(assert (=> b!224293 (= lt!355926 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!355924 () Unit!16383)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8816 BitStream!8816 (_ BitVec 64) (_ BitVec 32)) Unit!16383)

(assert (=> b!224293 (= lt!355924 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10364 lt!355921) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224293 (= lt!355923 (array!11069 (store (arr!5805 arr!308) i!761 (_1!10364 lt!355921)) (size!4857 arr!308)))))

(declare-fun readByte!0 (BitStream!8816) tuple2!19202)

(assert (=> b!224293 (= lt!355921 (readByte!0 thiss!1870))))

(assert (= (and start!46752 res!188251) b!224291))

(assert (= (and b!224291 res!188253) b!224292))

(assert (= (and b!224292 res!188252) b!224293))

(assert (= start!46752 b!224294))

(declare-fun m!344247 () Bool)

(assert (=> start!46752 m!344247))

(declare-fun m!344249 () Bool)

(assert (=> start!46752 m!344249))

(declare-fun m!344251 () Bool)

(assert (=> b!224291 m!344251))

(declare-fun m!344253 () Bool)

(assert (=> b!224294 m!344253))

(declare-fun m!344255 () Bool)

(assert (=> b!224293 m!344255))

(declare-fun m!344257 () Bool)

(assert (=> b!224293 m!344257))

(declare-fun m!344259 () Bool)

(assert (=> b!224293 m!344259))

(declare-fun m!344261 () Bool)

(assert (=> b!224293 m!344261))

(declare-fun m!344263 () Bool)

(assert (=> b!224293 m!344263))

(declare-fun m!344265 () Bool)

(assert (=> b!224293 m!344265))

(declare-fun m!344267 () Bool)

(assert (=> b!224293 m!344267))

(declare-fun m!344269 () Bool)

(assert (=> b!224293 m!344269))

(declare-fun m!344271 () Bool)

(assert (=> b!224293 m!344271))

(declare-fun m!344273 () Bool)

(assert (=> b!224293 m!344273))

(declare-fun m!344275 () Bool)

(assert (=> b!224293 m!344275))

(declare-fun m!344277 () Bool)

(assert (=> b!224293 m!344277))

(push 1)

(assert (not b!224293))

(assert (not b!224291))

(assert (not start!46752))

(assert (not b!224294))

(check-sat)

(pop 1)

