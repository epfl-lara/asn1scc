; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46630 () Bool)

(assert start!46630)

(declare-fun b!223741 () Bool)

(declare-fun e!152314 () Bool)

(declare-datatypes ((array!10991 0))(
  ( (array!10992 (arr!5765 (Array (_ BitVec 32) (_ BitVec 8))) (size!4820 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8742 0))(
  ( (BitStream!8743 (buf!5364 array!10991) (currentByte!10083 (_ BitVec 32)) (currentBit!10078 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!16276 0))(
  ( (Unit!16277) )
))
(declare-datatypes ((tuple3!1166 0))(
  ( (tuple3!1167 (_1!10283 Unit!16276) (_2!10283 BitStream!8742) (_3!725 array!10991)) )
))
(declare-fun lt!354395 () tuple3!1166)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!223741 (= e!152314 (not (invariant!0 (currentBit!10078 (_2!10283 lt!354395)) (currentByte!10083 (_2!10283 lt!354395)) (size!4820 (buf!5364 (_2!10283 lt!354395))))))))

(declare-fun e!152315 () Bool)

(assert (=> b!223741 e!152315))

(declare-fun res!187828 () Bool)

(assert (=> b!223741 (=> (not res!187828) (not e!152315))))

(declare-fun lt!354396 () (_ BitVec 64))

(declare-fun lt!354393 () (_ BitVec 64))

(assert (=> b!223741 (= res!187828 (= lt!354396 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!354393)))))

(declare-datatypes ((tuple2!19116 0))(
  ( (tuple2!19117 (_1!10284 (_ BitVec 8)) (_2!10284 BitStream!8742)) )
))
(declare-fun lt!354394 () tuple2!19116)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!223741 (= lt!354396 (bitIndex!0 (size!4820 (buf!5364 (_2!10284 lt!354394))) (currentByte!10083 (_2!10284 lt!354394)) (currentBit!10078 (_2!10284 lt!354394))))))

(declare-fun thiss!1870 () BitStream!8742)

(assert (=> b!223741 (= lt!354393 (bitIndex!0 (size!4820 (buf!5364 thiss!1870)) (currentByte!10083 thiss!1870) (currentBit!10078 thiss!1870)))))

(declare-fun arr!308 () array!10991)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun readByteArrayLoop!0 (BitStream!8742 array!10991 (_ BitVec 32) (_ BitVec 32)) tuple3!1166)

(assert (=> b!223741 (= lt!354395 (readByteArrayLoop!0 (_2!10284 lt!354394) (array!10992 (store (arr!5765 arr!308) i!761 (_1!10284 lt!354394)) (size!4820 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!354391 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!223741 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4820 (buf!5364 (_2!10284 lt!354394)))) ((_ sign_extend 32) (currentByte!10083 (_2!10284 lt!354394))) ((_ sign_extend 32) (currentBit!10078 (_2!10284 lt!354394))) lt!354391)))

(assert (=> b!223741 (= lt!354391 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!354392 () Unit!16276)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8742 BitStream!8742 (_ BitVec 64) (_ BitVec 32)) Unit!16276)

(assert (=> b!223741 (= lt!354392 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10284 lt!354394) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!8742) tuple2!19116)

(assert (=> b!223741 (= lt!354394 (readByte!0 thiss!1870))))

(declare-fun b!223742 () Bool)

(declare-fun res!187830 () Bool)

(assert (=> b!223742 (=> (not res!187830) (not e!152314))))

(assert (=> b!223742 (= res!187830 (bvslt i!761 to!496))))

(declare-fun b!223743 () Bool)

(assert (=> b!223743 (= e!152315 (= (bvadd lt!354396 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!354391))) (bitIndex!0 (size!4820 (buf!5364 (_2!10283 lt!354395))) (currentByte!10083 (_2!10283 lt!354395)) (currentBit!10078 (_2!10283 lt!354395)))))))

(declare-fun res!187827 () Bool)

(assert (=> start!46630 (=> (not res!187827) (not e!152314))))

(assert (=> start!46630 (= res!187827 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4820 arr!308))))))

(assert (=> start!46630 e!152314))

(assert (=> start!46630 true))

(declare-fun array_inv!4561 (array!10991) Bool)

(assert (=> start!46630 (array_inv!4561 arr!308)))

(declare-fun e!152316 () Bool)

(declare-fun inv!12 (BitStream!8742) Bool)

(assert (=> start!46630 (and (inv!12 thiss!1870) e!152316)))

(declare-fun b!223744 () Bool)

(declare-fun res!187829 () Bool)

(assert (=> b!223744 (=> (not res!187829) (not e!152314))))

(assert (=> b!223744 (= res!187829 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4820 (buf!5364 thiss!1870))) ((_ sign_extend 32) (currentByte!10083 thiss!1870)) ((_ sign_extend 32) (currentBit!10078 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!223745 () Bool)

(assert (=> b!223745 (= e!152316 (array_inv!4561 (buf!5364 thiss!1870)))))

(assert (= (and start!46630 res!187827) b!223744))

(assert (= (and b!223744 res!187829) b!223742))

(assert (= (and b!223742 res!187830) b!223741))

(assert (= (and b!223741 res!187828) b!223743))

(assert (= start!46630 b!223745))

(declare-fun m!342967 () Bool)

(assert (=> b!223743 m!342967))

(declare-fun m!342969 () Bool)

(assert (=> start!46630 m!342969))

(declare-fun m!342971 () Bool)

(assert (=> start!46630 m!342971))

(declare-fun m!342973 () Bool)

(assert (=> b!223744 m!342973))

(declare-fun m!342975 () Bool)

(assert (=> b!223745 m!342975))

(declare-fun m!342977 () Bool)

(assert (=> b!223741 m!342977))

(declare-fun m!342979 () Bool)

(assert (=> b!223741 m!342979))

(declare-fun m!342981 () Bool)

(assert (=> b!223741 m!342981))

(declare-fun m!342983 () Bool)

(assert (=> b!223741 m!342983))

(declare-fun m!342985 () Bool)

(assert (=> b!223741 m!342985))

(declare-fun m!342987 () Bool)

(assert (=> b!223741 m!342987))

(declare-fun m!342989 () Bool)

(assert (=> b!223741 m!342989))

(declare-fun m!342991 () Bool)

(assert (=> b!223741 m!342991))

(check-sat (not b!223745) (not b!223741) (not b!223744) (not b!223743) (not start!46630))
(check-sat)
(get-model)

(declare-fun d!75929 () Bool)

(declare-fun e!152339 () Bool)

(assert (=> d!75929 e!152339))

(declare-fun res!187852 () Bool)

(assert (=> d!75929 (=> (not res!187852) (not e!152339))))

(declare-fun lt!354440 () (_ BitVec 64))

(declare-fun lt!354441 () (_ BitVec 64))

(declare-fun lt!354438 () (_ BitVec 64))

(assert (=> d!75929 (= res!187852 (= lt!354440 (bvsub lt!354438 lt!354441)))))

(assert (=> d!75929 (or (= (bvand lt!354438 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!354441 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!354438 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!354438 lt!354441) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!75929 (= lt!354441 (remainingBits!0 ((_ sign_extend 32) (size!4820 (buf!5364 (_2!10283 lt!354395)))) ((_ sign_extend 32) (currentByte!10083 (_2!10283 lt!354395))) ((_ sign_extend 32) (currentBit!10078 (_2!10283 lt!354395)))))))

(declare-fun lt!354436 () (_ BitVec 64))

(declare-fun lt!354439 () (_ BitVec 64))

(assert (=> d!75929 (= lt!354438 (bvmul lt!354436 lt!354439))))

(assert (=> d!75929 (or (= lt!354436 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!354439 (bvsdiv (bvmul lt!354436 lt!354439) lt!354436)))))

(assert (=> d!75929 (= lt!354439 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75929 (= lt!354436 ((_ sign_extend 32) (size!4820 (buf!5364 (_2!10283 lt!354395)))))))

(assert (=> d!75929 (= lt!354440 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10083 (_2!10283 lt!354395))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10078 (_2!10283 lt!354395)))))))

(assert (=> d!75929 (invariant!0 (currentBit!10078 (_2!10283 lt!354395)) (currentByte!10083 (_2!10283 lt!354395)) (size!4820 (buf!5364 (_2!10283 lt!354395))))))

(assert (=> d!75929 (= (bitIndex!0 (size!4820 (buf!5364 (_2!10283 lt!354395))) (currentByte!10083 (_2!10283 lt!354395)) (currentBit!10078 (_2!10283 lt!354395))) lt!354440)))

(declare-fun b!223768 () Bool)

(declare-fun res!187851 () Bool)

(assert (=> b!223768 (=> (not res!187851) (not e!152339))))

(assert (=> b!223768 (= res!187851 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!354440))))

(declare-fun b!223769 () Bool)

(declare-fun lt!354437 () (_ BitVec 64))

(assert (=> b!223769 (= e!152339 (bvsle lt!354440 (bvmul lt!354437 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223769 (or (= lt!354437 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!354437 #b0000000000000000000000000000000000000000000000000000000000001000) lt!354437)))))

(assert (=> b!223769 (= lt!354437 ((_ sign_extend 32) (size!4820 (buf!5364 (_2!10283 lt!354395)))))))

(assert (= (and d!75929 res!187852) b!223768))

(assert (= (and b!223768 res!187851) b!223769))

(declare-fun m!343023 () Bool)

(assert (=> d!75929 m!343023))

(assert (=> d!75929 m!342981))

(assert (=> b!223743 d!75929))

(declare-fun d!75933 () Bool)

(assert (=> d!75933 (= (array_inv!4561 arr!308) (bvsge (size!4820 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!46630 d!75933))

(declare-fun d!75935 () Bool)

(assert (=> d!75935 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10078 thiss!1870) (currentByte!10083 thiss!1870) (size!4820 (buf!5364 thiss!1870))))))

(declare-fun bs!18505 () Bool)

(assert (= bs!18505 d!75935))

(declare-fun m!343025 () Bool)

(assert (=> bs!18505 m!343025))

(assert (=> start!46630 d!75935))

(declare-fun d!75937 () Bool)

(declare-fun lt!354480 () (_ BitVec 8))

(declare-fun lt!354477 () (_ BitVec 8))

(assert (=> d!75937 (= lt!354480 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5765 (buf!5364 thiss!1870)) (currentByte!10083 thiss!1870))) ((_ sign_extend 24) lt!354477))))))

(assert (=> d!75937 (= lt!354477 ((_ extract 7 0) (currentBit!10078 thiss!1870)))))

(declare-fun e!152350 () Bool)

(assert (=> d!75937 e!152350))

(declare-fun res!187865 () Bool)

(assert (=> d!75937 (=> (not res!187865) (not e!152350))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!75937 (= res!187865 (validate_offset_bits!1 ((_ sign_extend 32) (size!4820 (buf!5364 thiss!1870))) ((_ sign_extend 32) (currentByte!10083 thiss!1870)) ((_ sign_extend 32) (currentBit!10078 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19124 0))(
  ( (tuple2!19125 (_1!10289 Unit!16276) (_2!10289 (_ BitVec 8))) )
))
(declare-fun Unit!16287 () Unit!16276)

(declare-fun Unit!16288 () Unit!16276)

(assert (=> d!75937 (= (readByte!0 thiss!1870) (tuple2!19117 (_2!10289 (ite (bvsgt ((_ sign_extend 24) lt!354477) #b00000000000000000000000000000000) (tuple2!19125 Unit!16287 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!354480) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5765 (buf!5364 thiss!1870)) (bvadd (currentByte!10083 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!354477)))))))) (tuple2!19125 Unit!16288 lt!354480))) (BitStream!8743 (buf!5364 thiss!1870) (bvadd (currentByte!10083 thiss!1870) #b00000000000000000000000000000001) (currentBit!10078 thiss!1870))))))

(declare-fun b!223780 () Bool)

(declare-fun e!152351 () Bool)

(assert (=> b!223780 (= e!152350 e!152351)))

(declare-fun res!187864 () Bool)

(assert (=> b!223780 (=> (not res!187864) (not e!152351))))

(declare-fun lt!354479 () tuple2!19116)

(assert (=> b!223780 (= res!187864 (= (buf!5364 (_2!10284 lt!354479)) (buf!5364 thiss!1870)))))

(declare-fun lt!354483 () (_ BitVec 8))

(declare-fun lt!354478 () (_ BitVec 8))

(declare-fun Unit!16290 () Unit!16276)

(declare-fun Unit!16291 () Unit!16276)

(assert (=> b!223780 (= lt!354479 (tuple2!19117 (_2!10289 (ite (bvsgt ((_ sign_extend 24) lt!354478) #b00000000000000000000000000000000) (tuple2!19125 Unit!16290 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!354483) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5765 (buf!5364 thiss!1870)) (bvadd (currentByte!10083 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!354478)))))))) (tuple2!19125 Unit!16291 lt!354483))) (BitStream!8743 (buf!5364 thiss!1870) (bvadd (currentByte!10083 thiss!1870) #b00000000000000000000000000000001) (currentBit!10078 thiss!1870))))))

(assert (=> b!223780 (= lt!354483 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5765 (buf!5364 thiss!1870)) (currentByte!10083 thiss!1870))) ((_ sign_extend 24) lt!354478))))))

(assert (=> b!223780 (= lt!354478 ((_ extract 7 0) (currentBit!10078 thiss!1870)))))

(declare-fun b!223781 () Bool)

(declare-fun lt!354481 () (_ BitVec 64))

(declare-fun lt!354482 () (_ BitVec 64))

(assert (=> b!223781 (= e!152351 (= (bitIndex!0 (size!4820 (buf!5364 (_2!10284 lt!354479))) (currentByte!10083 (_2!10284 lt!354479)) (currentBit!10078 (_2!10284 lt!354479))) (bvadd lt!354482 lt!354481)))))

(assert (=> b!223781 (or (not (= (bvand lt!354482 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!354481 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!354482 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!354482 lt!354481) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!223781 (= lt!354481 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!223781 (= lt!354482 (bitIndex!0 (size!4820 (buf!5364 thiss!1870)) (currentByte!10083 thiss!1870) (currentBit!10078 thiss!1870)))))

(assert (= (and d!75937 res!187865) b!223780))

(assert (= (and b!223780 res!187864) b!223781))

(declare-fun m!343039 () Bool)

(assert (=> d!75937 m!343039))

(declare-fun m!343041 () Bool)

(assert (=> d!75937 m!343041))

(declare-fun m!343043 () Bool)

(assert (=> d!75937 m!343043))

(assert (=> b!223780 m!343043))

(assert (=> b!223780 m!343039))

(declare-fun m!343045 () Bool)

(assert (=> b!223781 m!343045))

(assert (=> b!223781 m!342989))

(assert (=> b!223741 d!75937))

(declare-fun d!75951 () Bool)

(assert (=> d!75951 (= (invariant!0 (currentBit!10078 (_2!10283 lt!354395)) (currentByte!10083 (_2!10283 lt!354395)) (size!4820 (buf!5364 (_2!10283 lt!354395)))) (and (bvsge (currentBit!10078 (_2!10283 lt!354395)) #b00000000000000000000000000000000) (bvslt (currentBit!10078 (_2!10283 lt!354395)) #b00000000000000000000000000001000) (bvsge (currentByte!10083 (_2!10283 lt!354395)) #b00000000000000000000000000000000) (or (bvslt (currentByte!10083 (_2!10283 lt!354395)) (size!4820 (buf!5364 (_2!10283 lt!354395)))) (and (= (currentBit!10078 (_2!10283 lt!354395)) #b00000000000000000000000000000000) (= (currentByte!10083 (_2!10283 lt!354395)) (size!4820 (buf!5364 (_2!10283 lt!354395))))))))))

(assert (=> b!223741 d!75951))

(declare-fun d!75953 () Bool)

(declare-fun e!152352 () Bool)

(assert (=> d!75953 e!152352))

(declare-fun res!187867 () Bool)

(assert (=> d!75953 (=> (not res!187867) (not e!152352))))

(declare-fun lt!354489 () (_ BitVec 64))

(declare-fun lt!354486 () (_ BitVec 64))

(declare-fun lt!354488 () (_ BitVec 64))

(assert (=> d!75953 (= res!187867 (= lt!354488 (bvsub lt!354486 lt!354489)))))

(assert (=> d!75953 (or (= (bvand lt!354486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!354489 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!354486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!354486 lt!354489) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75953 (= lt!354489 (remainingBits!0 ((_ sign_extend 32) (size!4820 (buf!5364 (_2!10284 lt!354394)))) ((_ sign_extend 32) (currentByte!10083 (_2!10284 lt!354394))) ((_ sign_extend 32) (currentBit!10078 (_2!10284 lt!354394)))))))

(declare-fun lt!354484 () (_ BitVec 64))

(declare-fun lt!354487 () (_ BitVec 64))

(assert (=> d!75953 (= lt!354486 (bvmul lt!354484 lt!354487))))

(assert (=> d!75953 (or (= lt!354484 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!354487 (bvsdiv (bvmul lt!354484 lt!354487) lt!354484)))))

(assert (=> d!75953 (= lt!354487 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75953 (= lt!354484 ((_ sign_extend 32) (size!4820 (buf!5364 (_2!10284 lt!354394)))))))

(assert (=> d!75953 (= lt!354488 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10083 (_2!10284 lt!354394))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10078 (_2!10284 lt!354394)))))))

(assert (=> d!75953 (invariant!0 (currentBit!10078 (_2!10284 lt!354394)) (currentByte!10083 (_2!10284 lt!354394)) (size!4820 (buf!5364 (_2!10284 lt!354394))))))

(assert (=> d!75953 (= (bitIndex!0 (size!4820 (buf!5364 (_2!10284 lt!354394))) (currentByte!10083 (_2!10284 lt!354394)) (currentBit!10078 (_2!10284 lt!354394))) lt!354488)))

(declare-fun b!223782 () Bool)

(declare-fun res!187866 () Bool)

(assert (=> b!223782 (=> (not res!187866) (not e!152352))))

(assert (=> b!223782 (= res!187866 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!354488))))

(declare-fun b!223783 () Bool)

(declare-fun lt!354485 () (_ BitVec 64))

(assert (=> b!223783 (= e!152352 (bvsle lt!354488 (bvmul lt!354485 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223783 (or (= lt!354485 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!354485 #b0000000000000000000000000000000000000000000000000000000000001000) lt!354485)))))

(assert (=> b!223783 (= lt!354485 ((_ sign_extend 32) (size!4820 (buf!5364 (_2!10284 lt!354394)))))))

(assert (= (and d!75953 res!187867) b!223782))

(assert (= (and b!223782 res!187866) b!223783))

(declare-fun m!343047 () Bool)

(assert (=> d!75953 m!343047))

(declare-fun m!343049 () Bool)

(assert (=> d!75953 m!343049))

(assert (=> b!223741 d!75953))

(declare-fun d!75955 () Bool)

(assert (=> d!75955 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4820 (buf!5364 (_2!10284 lt!354394)))) ((_ sign_extend 32) (currentByte!10083 (_2!10284 lt!354394))) ((_ sign_extend 32) (currentBit!10078 (_2!10284 lt!354394))) lt!354391) (bvsle ((_ sign_extend 32) lt!354391) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4820 (buf!5364 (_2!10284 lt!354394)))) ((_ sign_extend 32) (currentByte!10083 (_2!10284 lt!354394))) ((_ sign_extend 32) (currentBit!10078 (_2!10284 lt!354394)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18508 () Bool)

(assert (= bs!18508 d!75955))

(assert (=> bs!18508 m!343047))

(assert (=> b!223741 d!75955))

(declare-fun d!75957 () Bool)

(declare-fun e!152353 () Bool)

(assert (=> d!75957 e!152353))

(declare-fun res!187869 () Bool)

(assert (=> d!75957 (=> (not res!187869) (not e!152353))))

(declare-fun lt!354492 () (_ BitVec 64))

(declare-fun lt!354495 () (_ BitVec 64))

(declare-fun lt!354494 () (_ BitVec 64))

(assert (=> d!75957 (= res!187869 (= lt!354494 (bvsub lt!354492 lt!354495)))))

(assert (=> d!75957 (or (= (bvand lt!354492 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!354495 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!354492 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!354492 lt!354495) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75957 (= lt!354495 (remainingBits!0 ((_ sign_extend 32) (size!4820 (buf!5364 thiss!1870))) ((_ sign_extend 32) (currentByte!10083 thiss!1870)) ((_ sign_extend 32) (currentBit!10078 thiss!1870))))))

(declare-fun lt!354490 () (_ BitVec 64))

(declare-fun lt!354493 () (_ BitVec 64))

(assert (=> d!75957 (= lt!354492 (bvmul lt!354490 lt!354493))))

(assert (=> d!75957 (or (= lt!354490 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!354493 (bvsdiv (bvmul lt!354490 lt!354493) lt!354490)))))

(assert (=> d!75957 (= lt!354493 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75957 (= lt!354490 ((_ sign_extend 32) (size!4820 (buf!5364 thiss!1870))))))

(assert (=> d!75957 (= lt!354494 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10083 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10078 thiss!1870))))))

(assert (=> d!75957 (invariant!0 (currentBit!10078 thiss!1870) (currentByte!10083 thiss!1870) (size!4820 (buf!5364 thiss!1870)))))

(assert (=> d!75957 (= (bitIndex!0 (size!4820 (buf!5364 thiss!1870)) (currentByte!10083 thiss!1870) (currentBit!10078 thiss!1870)) lt!354494)))

(declare-fun b!223784 () Bool)

(declare-fun res!187868 () Bool)

(assert (=> b!223784 (=> (not res!187868) (not e!152353))))

(assert (=> b!223784 (= res!187868 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!354494))))

(declare-fun b!223785 () Bool)

(declare-fun lt!354491 () (_ BitVec 64))

(assert (=> b!223785 (= e!152353 (bvsle lt!354494 (bvmul lt!354491 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223785 (or (= lt!354491 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!354491 #b0000000000000000000000000000000000000000000000000000000000001000) lt!354491)))))

(assert (=> b!223785 (= lt!354491 ((_ sign_extend 32) (size!4820 (buf!5364 thiss!1870))))))

(assert (= (and d!75957 res!187869) b!223784))

(assert (= (and b!223784 res!187868) b!223785))

(declare-fun m!343051 () Bool)

(assert (=> d!75957 m!343051))

(assert (=> d!75957 m!343025))

(assert (=> b!223741 d!75957))

(declare-fun bm!3571 () Bool)

(declare-fun call!3575 () (_ BitVec 64))

(assert (=> bm!3571 (= call!3575 (bitIndex!0 (size!4820 (buf!5364 (_2!10284 lt!354394))) (currentByte!10083 (_2!10284 lt!354394)) (currentBit!10078 (_2!10284 lt!354394))))))

(declare-fun b!223839 () Bool)

(declare-fun res!187914 () Bool)

(declare-fun e!152388 () Bool)

(assert (=> b!223839 (=> (not res!187914) (not e!152388))))

(declare-fun lt!354777 () tuple3!1166)

(assert (=> b!223839 (= res!187914 (and (= (buf!5364 (_2!10284 lt!354394)) (buf!5364 (_2!10283 lt!354777))) (= (size!4820 (array!10992 (store (arr!5765 arr!308) i!761 (_1!10284 lt!354394)) (size!4820 arr!308))) (size!4820 (_3!725 lt!354777)))))))

(declare-fun b!223840 () Bool)

(declare-fun e!152387 () tuple3!1166)

(declare-fun lt!354794 () Unit!16276)

(declare-fun lt!354763 () tuple3!1166)

(assert (=> b!223840 (= e!152387 (tuple3!1167 lt!354794 (_2!10283 lt!354763) (_3!725 lt!354763)))))

(declare-fun lt!354770 () tuple2!19116)

(assert (=> b!223840 (= lt!354770 (readByte!0 (_2!10284 lt!354394)))))

(declare-fun lt!354790 () array!10991)

(assert (=> b!223840 (= lt!354790 (array!10992 (store (arr!5765 (array!10992 (store (arr!5765 arr!308) i!761 (_1!10284 lt!354394)) (size!4820 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10284 lt!354770)) (size!4820 (array!10992 (store (arr!5765 arr!308) i!761 (_1!10284 lt!354394)) (size!4820 arr!308)))))))

(declare-fun lt!354785 () (_ BitVec 64))

(assert (=> b!223840 (= lt!354785 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!354793 () (_ BitVec 32))

(assert (=> b!223840 (= lt!354793 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!354764 () Unit!16276)

(assert (=> b!223840 (= lt!354764 (validateOffsetBytesFromBitIndexLemma!0 (_2!10284 lt!354394) (_2!10284 lt!354770) lt!354785 lt!354793))))

(assert (=> b!223840 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4820 (buf!5364 (_2!10284 lt!354770)))) ((_ sign_extend 32) (currentByte!10083 (_2!10284 lt!354770))) ((_ sign_extend 32) (currentBit!10078 (_2!10284 lt!354770))) (bvsub lt!354793 ((_ extract 31 0) (bvsdiv (bvadd lt!354785 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!354760 () Unit!16276)

(assert (=> b!223840 (= lt!354760 lt!354764)))

(assert (=> b!223840 (= lt!354763 (readByteArrayLoop!0 (_2!10284 lt!354770) lt!354790 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> b!223840 (= (bitIndex!0 (size!4820 (buf!5364 (_2!10284 lt!354770))) (currentByte!10083 (_2!10284 lt!354770)) (currentBit!10078 (_2!10284 lt!354770))) (bvadd call!3575 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!354761 () Unit!16276)

(declare-fun Unit!16295 () Unit!16276)

(assert (=> b!223840 (= lt!354761 Unit!16295)))

(assert (=> b!223840 (= (bvadd (bitIndex!0 (size!4820 (buf!5364 (_2!10284 lt!354770))) (currentByte!10083 (_2!10284 lt!354770)) (currentBit!10078 (_2!10284 lt!354770))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4820 (buf!5364 (_2!10283 lt!354763))) (currentByte!10083 (_2!10283 lt!354763)) (currentBit!10078 (_2!10283 lt!354763))))))

(declare-fun lt!354768 () Unit!16276)

(declare-fun Unit!16296 () Unit!16276)

(assert (=> b!223840 (= lt!354768 Unit!16296)))

(assert (=> b!223840 (= (bvadd call!3575 (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4820 (buf!5364 (_2!10283 lt!354763))) (currentByte!10083 (_2!10283 lt!354763)) (currentBit!10078 (_2!10283 lt!354763))))))

(declare-fun lt!354776 () Unit!16276)

(declare-fun Unit!16297 () Unit!16276)

(assert (=> b!223840 (= lt!354776 Unit!16297)))

(assert (=> b!223840 (and (= (buf!5364 (_2!10284 lt!354394)) (buf!5364 (_2!10283 lt!354763))) (= (size!4820 (array!10992 (store (arr!5765 arr!308) i!761 (_1!10284 lt!354394)) (size!4820 arr!308))) (size!4820 (_3!725 lt!354763))))))

(declare-fun lt!354781 () Unit!16276)

(declare-fun Unit!16298 () Unit!16276)

(assert (=> b!223840 (= lt!354781 Unit!16298)))

(declare-fun lt!354789 () Unit!16276)

(declare-fun arrayUpdatedAtPrefixLemma!311 (array!10991 (_ BitVec 32) (_ BitVec 8)) Unit!16276)

(assert (=> b!223840 (= lt!354789 (arrayUpdatedAtPrefixLemma!311 (array!10992 (store (arr!5765 arr!308) i!761 (_1!10284 lt!354394)) (size!4820 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10284 lt!354770)))))

(declare-fun arrayRangesEq!719 (array!10991 array!10991 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!223840 (arrayRangesEq!719 (array!10992 (store (arr!5765 arr!308) i!761 (_1!10284 lt!354394)) (size!4820 arr!308)) (array!10992 (store (arr!5765 (array!10992 (store (arr!5765 arr!308) i!761 (_1!10284 lt!354394)) (size!4820 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10284 lt!354770)) (size!4820 (array!10992 (store (arr!5765 arr!308) i!761 (_1!10284 lt!354394)) (size!4820 arr!308)))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!354772 () Unit!16276)

(assert (=> b!223840 (= lt!354772 lt!354789)))

(declare-fun lt!354784 () (_ BitVec 32))

(assert (=> b!223840 (= lt!354784 #b00000000000000000000000000000000)))

(declare-fun lt!354778 () Unit!16276)

(declare-fun arrayRangesEqTransitive!205 (array!10991 array!10991 array!10991 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16276)

(assert (=> b!223840 (= lt!354778 (arrayRangesEqTransitive!205 (array!10992 (store (arr!5765 arr!308) i!761 (_1!10284 lt!354394)) (size!4820 arr!308)) lt!354790 (_3!725 lt!354763) lt!354784 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(declare-fun call!3576 () Bool)

(assert (=> b!223840 call!3576))

(declare-fun lt!354782 () Unit!16276)

(assert (=> b!223840 (= lt!354782 lt!354778)))

(declare-fun call!3574 () Bool)

(assert (=> b!223840 call!3574))

(declare-fun lt!354788 () Unit!16276)

(declare-fun Unit!16299 () Unit!16276)

(assert (=> b!223840 (= lt!354788 Unit!16299)))

(declare-fun lt!354767 () Unit!16276)

(declare-fun arrayRangesEqImpliesEq!80 (array!10991 array!10991 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16276)

(assert (=> b!223840 (= lt!354767 (arrayRangesEqImpliesEq!80 lt!354790 (_3!725 lt!354763) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!223840 (= (select (store (arr!5765 (array!10992 (store (arr!5765 arr!308) i!761 (_1!10284 lt!354394)) (size!4820 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10284 lt!354770)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5765 (_3!725 lt!354763)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!354762 () Unit!16276)

(assert (=> b!223840 (= lt!354762 lt!354767)))

(declare-fun lt!354787 () Bool)

(assert (=> b!223840 (= lt!354787 (= (select (arr!5765 (_3!725 lt!354763)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10284 lt!354770)))))

(declare-fun Unit!16300 () Unit!16276)

(assert (=> b!223840 (= lt!354794 Unit!16300)))

(assert (=> b!223840 lt!354787))

(declare-fun e!152389 () Bool)

(declare-fun b!223841 () Bool)

(declare-datatypes ((tuple2!19126 0))(
  ( (tuple2!19127 (_1!10290 BitStream!8742) (_2!10290 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!8742) tuple2!19126)

(assert (=> b!223841 (= e!152389 (= (select (arr!5765 (_3!725 lt!354777)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10290 (readBytePure!0 (_2!10284 lt!354394)))))))

(assert (=> b!223841 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4820 (_3!725 lt!354777))))))

(declare-fun bm!3572 () Bool)

(declare-fun c!11119 () Bool)

(assert (=> bm!3572 (= call!3574 (arrayRangesEq!719 (array!10992 (store (arr!5765 arr!308) i!761 (_1!10284 lt!354394)) (size!4820 arr!308)) (ite c!11119 (_3!725 lt!354763) (array!10992 (store (arr!5765 arr!308) i!761 (_1!10284 lt!354394)) (size!4820 arr!308))) #b00000000000000000000000000000000 (ite c!11119 (bvadd #b00000000000000000000000000000001 i!761) (size!4820 (array!10992 (store (arr!5765 arr!308) i!761 (_1!10284 lt!354394)) (size!4820 arr!308))))))))

(declare-fun b!223838 () Bool)

(assert (=> b!223838 (= e!152388 (arrayRangesEq!719 (array!10992 (store (arr!5765 arr!308) i!761 (_1!10284 lt!354394)) (size!4820 arr!308)) (_3!725 lt!354777) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun d!75959 () Bool)

(assert (=> d!75959 e!152389))

(declare-fun res!187913 () Bool)

(assert (=> d!75959 (=> res!187913 e!152389)))

(assert (=> d!75959 (= res!187913 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!354765 () Bool)

(assert (=> d!75959 (= lt!354765 e!152388)))

(declare-fun res!187915 () Bool)

(assert (=> d!75959 (=> (not res!187915) (not e!152388))))

(declare-fun lt!354780 () (_ BitVec 64))

(declare-fun lt!354783 () (_ BitVec 64))

(assert (=> d!75959 (= res!187915 (= (bvadd lt!354780 lt!354783) (bitIndex!0 (size!4820 (buf!5364 (_2!10283 lt!354777))) (currentByte!10083 (_2!10283 lt!354777)) (currentBit!10078 (_2!10283 lt!354777)))))))

(assert (=> d!75959 (or (not (= (bvand lt!354780 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!354783 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!354780 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!354780 lt!354783) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!354766 () (_ BitVec 64))

(assert (=> d!75959 (= lt!354783 (bvmul lt!354766 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!75959 (or (= lt!354766 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!354766 #b0000000000000000000000000000000000000000000000000000000000001000) lt!354766)))))

(assert (=> d!75959 (= lt!354766 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!75959 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!75959 (= lt!354780 (bitIndex!0 (size!4820 (buf!5364 (_2!10284 lt!354394))) (currentByte!10083 (_2!10284 lt!354394)) (currentBit!10078 (_2!10284 lt!354394))))))

(assert (=> d!75959 (= lt!354777 e!152387)))

(assert (=> d!75959 (= c!11119 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!75959 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4820 (array!10992 (store (arr!5765 arr!308) i!761 (_1!10284 lt!354394)) (size!4820 arr!308)))))))

(assert (=> d!75959 (= (readByteArrayLoop!0 (_2!10284 lt!354394) (array!10992 (store (arr!5765 arr!308) i!761 (_1!10284 lt!354394)) (size!4820 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!354777)))

(declare-fun lt!354771 () Unit!16276)

(declare-fun b!223842 () Bool)

(assert (=> b!223842 (= e!152387 (tuple3!1167 lt!354771 (_2!10284 lt!354394) (array!10992 (store (arr!5765 arr!308) i!761 (_1!10284 lt!354394)) (size!4820 arr!308))))))

(assert (=> b!223842 (= call!3575 call!3575)))

(declare-fun lt!354791 () Unit!16276)

(declare-fun Unit!16301 () Unit!16276)

(assert (=> b!223842 (= lt!354791 Unit!16301)))

(declare-fun lt!354779 () Unit!16276)

(declare-fun arrayRangesEqReflexiveLemma!72 (array!10991) Unit!16276)

(assert (=> b!223842 (= lt!354779 (arrayRangesEqReflexiveLemma!72 (array!10992 (store (arr!5765 arr!308) i!761 (_1!10284 lt!354394)) (size!4820 arr!308))))))

(assert (=> b!223842 call!3574))

(declare-fun lt!354795 () Unit!16276)

(assert (=> b!223842 (= lt!354795 lt!354779)))

(declare-fun lt!354775 () array!10991)

(assert (=> b!223842 (= lt!354775 (array!10992 (store (arr!5765 arr!308) i!761 (_1!10284 lt!354394)) (size!4820 arr!308)))))

(declare-fun lt!354769 () array!10991)

(assert (=> b!223842 (= lt!354769 (array!10992 (store (arr!5765 arr!308) i!761 (_1!10284 lt!354394)) (size!4820 arr!308)))))

(declare-fun lt!354774 () (_ BitVec 32))

(assert (=> b!223842 (= lt!354774 #b00000000000000000000000000000000)))

(declare-fun lt!354786 () (_ BitVec 32))

(assert (=> b!223842 (= lt!354786 (size!4820 (array!10992 (store (arr!5765 arr!308) i!761 (_1!10284 lt!354394)) (size!4820 arr!308))))))

(declare-fun lt!354792 () (_ BitVec 32))

(assert (=> b!223842 (= lt!354792 #b00000000000000000000000000000000)))

(declare-fun lt!354773 () (_ BitVec 32))

(assert (=> b!223842 (= lt!354773 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!72 (array!10991 array!10991 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16276)

(assert (=> b!223842 (= lt!354771 (arrayRangesEqSlicedLemma!72 lt!354775 lt!354769 lt!354774 lt!354786 lt!354792 lt!354773))))

(assert (=> b!223842 call!3576))

(declare-fun bm!3573 () Bool)

(assert (=> bm!3573 (= call!3576 (arrayRangesEq!719 (ite c!11119 (array!10992 (store (arr!5765 arr!308) i!761 (_1!10284 lt!354394)) (size!4820 arr!308)) lt!354775) (ite c!11119 (_3!725 lt!354763) lt!354769) (ite c!11119 lt!354784 lt!354792) (ite c!11119 (bvadd #b00000000000000000000000000000001 i!761) lt!354773)))))

(assert (= (and d!75959 c!11119) b!223840))

(assert (= (and d!75959 (not c!11119)) b!223842))

(assert (= (or b!223840 b!223842) bm!3573))

(assert (= (or b!223840 b!223842) bm!3572))

(assert (= (or b!223840 b!223842) bm!3571))

(assert (= (and d!75959 res!187915) b!223839))

(assert (= (and b!223839 res!187914) b!223838))

(assert (= (and d!75959 (not res!187913)) b!223841))

(declare-fun m!343123 () Bool)

(assert (=> b!223840 m!343123))

(declare-fun m!343125 () Bool)

(assert (=> b!223840 m!343125))

(declare-fun m!343127 () Bool)

(assert (=> b!223840 m!343127))

(declare-fun m!343129 () Bool)

(assert (=> b!223840 m!343129))

(declare-fun m!343131 () Bool)

(assert (=> b!223840 m!343131))

(declare-fun m!343133 () Bool)

(assert (=> b!223840 m!343133))

(declare-fun m!343135 () Bool)

(assert (=> b!223840 m!343135))

(declare-fun m!343137 () Bool)

(assert (=> b!223840 m!343137))

(declare-fun m!343139 () Bool)

(assert (=> b!223840 m!343139))

(declare-fun m!343141 () Bool)

(assert (=> b!223840 m!343141))

(declare-fun m!343143 () Bool)

(assert (=> b!223840 m!343143))

(declare-fun m!343145 () Bool)

(assert (=> b!223840 m!343145))

(declare-fun m!343147 () Bool)

(assert (=> b!223840 m!343147))

(declare-fun m!343149 () Bool)

(assert (=> b!223842 m!343149))

(declare-fun m!343151 () Bool)

(assert (=> b!223842 m!343151))

(declare-fun m!343153 () Bool)

(assert (=> bm!3573 m!343153))

(declare-fun m!343155 () Bool)

(assert (=> bm!3572 m!343155))

(declare-fun m!343157 () Bool)

(assert (=> b!223838 m!343157))

(declare-fun m!343159 () Bool)

(assert (=> b!223841 m!343159))

(declare-fun m!343161 () Bool)

(assert (=> b!223841 m!343161))

(declare-fun m!343163 () Bool)

(assert (=> d!75959 m!343163))

(assert (=> d!75959 m!342987))

(assert (=> bm!3571 m!342987))

(assert (=> b!223741 d!75959))

(declare-fun d!75988 () Bool)

(declare-fun e!152394 () Bool)

(assert (=> d!75988 e!152394))

(declare-fun res!187918 () Bool)

(assert (=> d!75988 (=> (not res!187918) (not e!152394))))

(assert (=> d!75988 (= res!187918 (and (or (let ((rhs!3725 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3725 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3725) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!75989 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!75989 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!75989 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3724 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3724 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3724) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!354822 () Unit!16276)

(declare-fun choose!57 (BitStream!8742 BitStream!8742 (_ BitVec 64) (_ BitVec 32)) Unit!16276)

(assert (=> d!75988 (= lt!354822 (choose!57 thiss!1870 (_2!10284 lt!354394) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!75988 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10284 lt!354394) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!354822)))

(declare-fun b!223849 () Bool)

(declare-fun lt!354824 () (_ BitVec 32))

(assert (=> b!223849 (= e!152394 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4820 (buf!5364 (_2!10284 lt!354394)))) ((_ sign_extend 32) (currentByte!10083 (_2!10284 lt!354394))) ((_ sign_extend 32) (currentBit!10078 (_2!10284 lt!354394))) (bvsub (bvsub to!496 i!761) lt!354824)))))

(assert (=> b!223849 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!354824 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!354824) #b10000000000000000000000000000000)))))

(declare-fun lt!354823 () (_ BitVec 64))

(assert (=> b!223849 (= lt!354824 ((_ extract 31 0) lt!354823))))

(assert (=> b!223849 (and (bvslt lt!354823 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!354823 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!223849 (= lt!354823 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!75988 res!187918) b!223849))

(declare-fun m!343165 () Bool)

(assert (=> d!75988 m!343165))

(declare-fun m!343167 () Bool)

(assert (=> b!223849 m!343167))

(assert (=> b!223741 d!75988))

(declare-fun d!75991 () Bool)

(assert (=> d!75991 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4820 (buf!5364 thiss!1870))) ((_ sign_extend 32) (currentByte!10083 thiss!1870)) ((_ sign_extend 32) (currentBit!10078 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4820 (buf!5364 thiss!1870))) ((_ sign_extend 32) (currentByte!10083 thiss!1870)) ((_ sign_extend 32) (currentBit!10078 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18512 () Bool)

(assert (= bs!18512 d!75991))

(assert (=> bs!18512 m!343051))

(assert (=> b!223744 d!75991))

(declare-fun d!75993 () Bool)

(assert (=> d!75993 (= (array_inv!4561 (buf!5364 thiss!1870)) (bvsge (size!4820 (buf!5364 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!223745 d!75993))

(check-sat (not d!75937) (not d!75957) (not d!75959) (not bm!3572) (not d!75991) (not bm!3573) (not d!75935) (not d!75988) (not d!75929) (not bm!3571) (not b!223842) (not b!223781) (not d!75955) (not b!223849) (not b!223838) (not b!223841) (not b!223840) (not d!75953))
