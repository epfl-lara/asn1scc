; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46576 () Bool)

(assert start!46576)

(declare-fun b!223594 () Bool)

(declare-fun lt!353834 () (_ BitVec 64))

(declare-fun lt!353838 () (_ BitVec 32))

(declare-datatypes ((array!10982 0))(
  ( (array!10983 (arr!5759 (Array (_ BitVec 32) (_ BitVec 8))) (size!4817 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8736 0))(
  ( (BitStream!8737 (buf!5361 array!10982) (currentByte!10071 (_ BitVec 32)) (currentBit!10066 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!16237 0))(
  ( (Unit!16238) )
))
(declare-datatypes ((tuple3!1160 0))(
  ( (tuple3!1161 (_1!10271 Unit!16237) (_2!10271 BitStream!8736) (_3!722 array!10982)) )
))
(declare-fun lt!353837 () tuple3!1160)

(declare-fun e!152200 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!223594 (= e!152200 (= (bvadd lt!353834 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!353838))) (bitIndex!0 (size!4817 (buf!5361 (_2!10271 lt!353837))) (currentByte!10071 (_2!10271 lt!353837)) (currentBit!10066 (_2!10271 lt!353837)))))))

(declare-fun b!223595 () Bool)

(declare-fun res!187704 () Bool)

(declare-fun e!152204 () Bool)

(assert (=> b!223595 (=> (not res!187704) (not e!152204))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!223595 (= res!187704 (bvslt i!761 to!496))))

(declare-fun res!187705 () Bool)

(assert (=> start!46576 (=> (not res!187705) (not e!152204))))

(declare-fun arr!308 () array!10982)

(assert (=> start!46576 (= res!187705 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4817 arr!308))))))

(assert (=> start!46576 e!152204))

(assert (=> start!46576 true))

(declare-fun array_inv!4558 (array!10982) Bool)

(assert (=> start!46576 (array_inv!4558 arr!308)))

(declare-fun thiss!1870 () BitStream!8736)

(declare-fun e!152201 () Bool)

(declare-fun inv!12 (BitStream!8736) Bool)

(assert (=> start!46576 (and (inv!12 thiss!1870) e!152201)))

(declare-fun b!223596 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!223596 (= e!152204 (not (invariant!0 (currentBit!10066 thiss!1870) (currentByte!10071 thiss!1870) (size!4817 (buf!5361 thiss!1870)))))))

(assert (=> b!223596 e!152200))

(declare-fun res!187706 () Bool)

(assert (=> b!223596 (=> (not res!187706) (not e!152200))))

(declare-fun lt!353835 () (_ BitVec 64))

(assert (=> b!223596 (= res!187706 (= lt!353834 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!353835)))))

(declare-datatypes ((tuple2!19098 0))(
  ( (tuple2!19099 (_1!10272 (_ BitVec 8)) (_2!10272 BitStream!8736)) )
))
(declare-fun lt!353833 () tuple2!19098)

(assert (=> b!223596 (= lt!353834 (bitIndex!0 (size!4817 (buf!5361 (_2!10272 lt!353833))) (currentByte!10071 (_2!10272 lt!353833)) (currentBit!10066 (_2!10272 lt!353833))))))

(assert (=> b!223596 (= lt!353835 (bitIndex!0 (size!4817 (buf!5361 thiss!1870)) (currentByte!10071 thiss!1870) (currentBit!10066 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8736 array!10982 (_ BitVec 32) (_ BitVec 32)) tuple3!1160)

(assert (=> b!223596 (= lt!353837 (readByteArrayLoop!0 (_2!10272 lt!353833) (array!10983 (store (arr!5759 arr!308) i!761 (_1!10272 lt!353833)) (size!4817 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!223596 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4817 (buf!5361 (_2!10272 lt!353833)))) ((_ sign_extend 32) (currentByte!10071 (_2!10272 lt!353833))) ((_ sign_extend 32) (currentBit!10066 (_2!10272 lt!353833))) lt!353838)))

(assert (=> b!223596 (= lt!353838 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!353836 () Unit!16237)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8736 BitStream!8736 (_ BitVec 64) (_ BitVec 32)) Unit!16237)

(assert (=> b!223596 (= lt!353836 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10272 lt!353833) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!8736) tuple2!19098)

(assert (=> b!223596 (= lt!353833 (readByte!0 thiss!1870))))

(declare-fun b!223597 () Bool)

(declare-fun res!187707 () Bool)

(assert (=> b!223597 (=> (not res!187707) (not e!152204))))

(assert (=> b!223597 (= res!187707 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4817 (buf!5361 thiss!1870))) ((_ sign_extend 32) (currentByte!10071 thiss!1870)) ((_ sign_extend 32) (currentBit!10066 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!223598 () Bool)

(assert (=> b!223598 (= e!152201 (array_inv!4558 (buf!5361 thiss!1870)))))

(assert (= (and start!46576 res!187705) b!223597))

(assert (= (and b!223597 res!187707) b!223595))

(assert (= (and b!223595 res!187704) b!223596))

(assert (= (and b!223596 res!187706) b!223594))

(assert (= start!46576 b!223598))

(declare-fun m!342697 () Bool)

(assert (=> b!223597 m!342697))

(declare-fun m!342699 () Bool)

(assert (=> b!223598 m!342699))

(declare-fun m!342701 () Bool)

(assert (=> start!46576 m!342701))

(declare-fun m!342703 () Bool)

(assert (=> start!46576 m!342703))

(declare-fun m!342705 () Bool)

(assert (=> b!223594 m!342705))

(declare-fun m!342707 () Bool)

(assert (=> b!223596 m!342707))

(declare-fun m!342709 () Bool)

(assert (=> b!223596 m!342709))

(declare-fun m!342711 () Bool)

(assert (=> b!223596 m!342711))

(declare-fun m!342713 () Bool)

(assert (=> b!223596 m!342713))

(declare-fun m!342715 () Bool)

(assert (=> b!223596 m!342715))

(declare-fun m!342717 () Bool)

(assert (=> b!223596 m!342717))

(declare-fun m!342719 () Bool)

(assert (=> b!223596 m!342719))

(declare-fun m!342721 () Bool)

(assert (=> b!223596 m!342721))

(check-sat (not b!223594) (not start!46576) (not b!223596) (not b!223598) (not b!223597))
(check-sat)
(get-model)

(declare-fun d!75849 () Bool)

(assert (=> d!75849 (= (array_inv!4558 arr!308) (bvsge (size!4817 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!46576 d!75849))

(declare-fun d!75851 () Bool)

(assert (=> d!75851 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10066 thiss!1870) (currentByte!10071 thiss!1870) (size!4817 (buf!5361 thiss!1870))))))

(declare-fun bs!18493 () Bool)

(assert (= bs!18493 d!75851))

(assert (=> bs!18493 m!342717))

(assert (=> start!46576 d!75851))

(declare-fun d!75853 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!75853 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4817 (buf!5361 thiss!1870))) ((_ sign_extend 32) (currentByte!10071 thiss!1870)) ((_ sign_extend 32) (currentBit!10066 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4817 (buf!5361 thiss!1870))) ((_ sign_extend 32) (currentByte!10071 thiss!1870)) ((_ sign_extend 32) (currentBit!10066 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18494 () Bool)

(assert (= bs!18494 d!75853))

(declare-fun m!342749 () Bool)

(assert (=> bs!18494 m!342749))

(assert (=> b!223597 d!75853))

(declare-fun d!75855 () Bool)

(declare-fun lt!353875 () (_ BitVec 8))

(declare-fun lt!353874 () (_ BitVec 8))

(assert (=> d!75855 (= lt!353875 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5759 (buf!5361 thiss!1870)) (currentByte!10071 thiss!1870))) ((_ sign_extend 24) lt!353874))))))

(assert (=> d!75855 (= lt!353874 ((_ extract 7 0) (currentBit!10066 thiss!1870)))))

(declare-fun e!152225 () Bool)

(assert (=> d!75855 e!152225))

(declare-fun res!187726 () Bool)

(assert (=> d!75855 (=> (not res!187726) (not e!152225))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!75855 (= res!187726 (validate_offset_bits!1 ((_ sign_extend 32) (size!4817 (buf!5361 thiss!1870))) ((_ sign_extend 32) (currentByte!10071 thiss!1870)) ((_ sign_extend 32) (currentBit!10066 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19102 0))(
  ( (tuple2!19103 (_1!10275 Unit!16237) (_2!10275 (_ BitVec 8))) )
))
(declare-fun Unit!16241 () Unit!16237)

(declare-fun Unit!16242 () Unit!16237)

(assert (=> d!75855 (= (readByte!0 thiss!1870) (tuple2!19099 (_2!10275 (ite (bvsgt ((_ sign_extend 24) lt!353874) #b00000000000000000000000000000000) (tuple2!19103 Unit!16241 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!353875) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5759 (buf!5361 thiss!1870)) (bvadd (currentByte!10071 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!353874)))))))) (tuple2!19103 Unit!16242 lt!353875))) (BitStream!8737 (buf!5361 thiss!1870) (bvadd (currentByte!10071 thiss!1870) #b00000000000000000000000000000001) (currentBit!10066 thiss!1870))))))

(declare-fun b!223618 () Bool)

(declare-fun e!152224 () Bool)

(assert (=> b!223618 (= e!152225 e!152224)))

(declare-fun res!187725 () Bool)

(assert (=> b!223618 (=> (not res!187725) (not e!152224))))

(declare-fun lt!353871 () tuple2!19098)

(assert (=> b!223618 (= res!187725 (= (buf!5361 (_2!10272 lt!353871)) (buf!5361 thiss!1870)))))

(declare-fun lt!353872 () (_ BitVec 8))

(declare-fun lt!353873 () (_ BitVec 8))

(declare-fun Unit!16243 () Unit!16237)

(declare-fun Unit!16244 () Unit!16237)

(assert (=> b!223618 (= lt!353871 (tuple2!19099 (_2!10275 (ite (bvsgt ((_ sign_extend 24) lt!353873) #b00000000000000000000000000000000) (tuple2!19103 Unit!16243 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!353872) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5759 (buf!5361 thiss!1870)) (bvadd (currentByte!10071 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!353873)))))))) (tuple2!19103 Unit!16244 lt!353872))) (BitStream!8737 (buf!5361 thiss!1870) (bvadd (currentByte!10071 thiss!1870) #b00000000000000000000000000000001) (currentBit!10066 thiss!1870))))))

(assert (=> b!223618 (= lt!353872 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5759 (buf!5361 thiss!1870)) (currentByte!10071 thiss!1870))) ((_ sign_extend 24) lt!353873))))))

(assert (=> b!223618 (= lt!353873 ((_ extract 7 0) (currentBit!10066 thiss!1870)))))

(declare-fun lt!353877 () (_ BitVec 64))

(declare-fun lt!353876 () (_ BitVec 64))

(declare-fun b!223619 () Bool)

(assert (=> b!223619 (= e!152224 (= (bitIndex!0 (size!4817 (buf!5361 (_2!10272 lt!353871))) (currentByte!10071 (_2!10272 lt!353871)) (currentBit!10066 (_2!10272 lt!353871))) (bvadd lt!353876 lt!353877)))))

(assert (=> b!223619 (or (not (= (bvand lt!353876 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!353877 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!353876 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!353876 lt!353877) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!223619 (= lt!353877 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!223619 (= lt!353876 (bitIndex!0 (size!4817 (buf!5361 thiss!1870)) (currentByte!10071 thiss!1870) (currentBit!10066 thiss!1870)))))

(assert (= (and d!75855 res!187726) b!223618))

(assert (= (and b!223618 res!187725) b!223619))

(declare-fun m!342751 () Bool)

(assert (=> d!75855 m!342751))

(declare-fun m!342753 () Bool)

(assert (=> d!75855 m!342753))

(declare-fun m!342755 () Bool)

(assert (=> d!75855 m!342755))

(assert (=> b!223618 m!342755))

(assert (=> b!223618 m!342751))

(declare-fun m!342757 () Bool)

(assert (=> b!223619 m!342757))

(assert (=> b!223619 m!342713))

(assert (=> b!223596 d!75855))

(declare-fun lt!353993 () (_ BitVec 32))

(declare-fun bm!3535 () Bool)

(declare-fun call!3538 () Bool)

(declare-fun c!11107 () Bool)

(declare-fun lt!353991 () tuple3!1160)

(declare-fun arrayRangesEq!715 (array!10982 array!10982 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!3535 (= call!3538 (arrayRangesEq!715 (array!10983 (store (arr!5759 arr!308) i!761 (_1!10272 lt!353833)) (size!4817 arr!308)) (ite c!11107 (_3!722 lt!353991) (array!10983 (store (arr!5759 arr!308) i!761 (_1!10272 lt!353833)) (size!4817 arr!308))) (ite c!11107 lt!353993 #b00000000000000000000000000000000) (ite c!11107 (bvadd #b00000000000000000000000000000001 i!761) (size!4817 (array!10983 (store (arr!5759 arr!308) i!761 (_1!10272 lt!353833)) (size!4817 arr!308))))))))

(declare-fun b!223639 () Bool)

(declare-fun e!152242 () tuple3!1160)

(declare-fun lt!353996 () Unit!16237)

(assert (=> b!223639 (= e!152242 (tuple3!1161 lt!353996 (_2!10271 lt!353991) (_3!722 lt!353991)))))

(declare-fun lt!353990 () tuple2!19098)

(assert (=> b!223639 (= lt!353990 (readByte!0 (_2!10272 lt!353833)))))

(declare-fun lt!353985 () array!10982)

(assert (=> b!223639 (= lt!353985 (array!10983 (store (arr!5759 (array!10983 (store (arr!5759 arr!308) i!761 (_1!10272 lt!353833)) (size!4817 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10272 lt!353990)) (size!4817 (array!10983 (store (arr!5759 arr!308) i!761 (_1!10272 lt!353833)) (size!4817 arr!308)))))))

(declare-fun lt!353992 () (_ BitVec 64))

(assert (=> b!223639 (= lt!353992 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!354012 () (_ BitVec 32))

(assert (=> b!223639 (= lt!354012 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!353983 () Unit!16237)

(assert (=> b!223639 (= lt!353983 (validateOffsetBytesFromBitIndexLemma!0 (_2!10272 lt!353833) (_2!10272 lt!353990) lt!353992 lt!354012))))

(assert (=> b!223639 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4817 (buf!5361 (_2!10272 lt!353990)))) ((_ sign_extend 32) (currentByte!10071 (_2!10272 lt!353990))) ((_ sign_extend 32) (currentBit!10066 (_2!10272 lt!353990))) (bvsub lt!354012 ((_ extract 31 0) (bvsdiv (bvadd lt!353992 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!354010 () Unit!16237)

(assert (=> b!223639 (= lt!354010 lt!353983)))

(assert (=> b!223639 (= lt!353991 (readByteArrayLoop!0 (_2!10272 lt!353990) lt!353985 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> b!223639 (= (bitIndex!0 (size!4817 (buf!5361 (_2!10272 lt!353990))) (currentByte!10071 (_2!10272 lt!353990)) (currentBit!10066 (_2!10272 lt!353990))) (bvadd (bitIndex!0 (size!4817 (buf!5361 (_2!10272 lt!353833))) (currentByte!10071 (_2!10272 lt!353833)) (currentBit!10066 (_2!10272 lt!353833))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!354014 () Unit!16237)

(declare-fun Unit!16245 () Unit!16237)

(assert (=> b!223639 (= lt!354014 Unit!16245)))

(declare-fun call!3540 () (_ BitVec 64))

(assert (=> b!223639 (= (bvadd (bitIndex!0 (size!4817 (buf!5361 (_2!10272 lt!353990))) (currentByte!10071 (_2!10272 lt!353990)) (currentBit!10066 (_2!10272 lt!353990))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!3540)))

(declare-fun lt!354008 () Unit!16237)

(declare-fun Unit!16246 () Unit!16237)

(assert (=> b!223639 (= lt!354008 Unit!16246)))

(assert (=> b!223639 (= (bvadd (bitIndex!0 (size!4817 (buf!5361 (_2!10272 lt!353833))) (currentByte!10071 (_2!10272 lt!353833)) (currentBit!10066 (_2!10272 lt!353833))) (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) call!3540)))

(declare-fun lt!353999 () Unit!16237)

(declare-fun Unit!16247 () Unit!16237)

(assert (=> b!223639 (= lt!353999 Unit!16247)))

(assert (=> b!223639 (and (= (buf!5361 (_2!10272 lt!353833)) (buf!5361 (_2!10271 lt!353991))) (= (size!4817 (array!10983 (store (arr!5759 arr!308) i!761 (_1!10272 lt!353833)) (size!4817 arr!308))) (size!4817 (_3!722 lt!353991))))))

(declare-fun lt!353998 () Unit!16237)

(declare-fun Unit!16248 () Unit!16237)

(assert (=> b!223639 (= lt!353998 Unit!16248)))

(declare-fun lt!353981 () Unit!16237)

(declare-fun arrayUpdatedAtPrefixLemma!307 (array!10982 (_ BitVec 32) (_ BitVec 8)) Unit!16237)

(assert (=> b!223639 (= lt!353981 (arrayUpdatedAtPrefixLemma!307 (array!10983 (store (arr!5759 arr!308) i!761 (_1!10272 lt!353833)) (size!4817 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10272 lt!353990)))))

(declare-fun call!3539 () Bool)

(assert (=> b!223639 call!3539))

(declare-fun lt!353995 () Unit!16237)

(assert (=> b!223639 (= lt!353995 lt!353981)))

(assert (=> b!223639 (= lt!353993 #b00000000000000000000000000000000)))

(declare-fun lt!354001 () Unit!16237)

(declare-fun arrayRangesEqTransitive!201 (array!10982 array!10982 array!10982 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16237)

(assert (=> b!223639 (= lt!354001 (arrayRangesEqTransitive!201 (array!10983 (store (arr!5759 arr!308) i!761 (_1!10272 lt!353833)) (size!4817 arr!308)) lt!353985 (_3!722 lt!353991) lt!353993 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!223639 call!3538))

(declare-fun lt!354009 () Unit!16237)

(assert (=> b!223639 (= lt!354009 lt!354001)))

(assert (=> b!223639 (arrayRangesEq!715 (array!10983 (store (arr!5759 arr!308) i!761 (_1!10272 lt!353833)) (size!4817 arr!308)) (_3!722 lt!353991) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!354005 () Unit!16237)

(declare-fun Unit!16249 () Unit!16237)

(assert (=> b!223639 (= lt!354005 Unit!16249)))

(declare-fun lt!354013 () Unit!16237)

(declare-fun arrayRangesEqImpliesEq!76 (array!10982 array!10982 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16237)

(assert (=> b!223639 (= lt!354013 (arrayRangesEqImpliesEq!76 lt!353985 (_3!722 lt!353991) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!223639 (= (select (store (arr!5759 (array!10983 (store (arr!5759 arr!308) i!761 (_1!10272 lt!353833)) (size!4817 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10272 lt!353990)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5759 (_3!722 lt!353991)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!354004 () Unit!16237)

(assert (=> b!223639 (= lt!354004 lt!354013)))

(declare-fun lt!354011 () Bool)

(assert (=> b!223639 (= lt!354011 (= (select (arr!5759 (_3!722 lt!353991)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10272 lt!353990)))))

(declare-fun Unit!16250 () Unit!16237)

(assert (=> b!223639 (= lt!353996 Unit!16250)))

(assert (=> b!223639 lt!354011))

(declare-fun b!223640 () Bool)

(declare-fun lt!353982 () Unit!16237)

(assert (=> b!223640 (= e!152242 (tuple3!1161 lt!353982 (_2!10272 lt!353833) (array!10983 (store (arr!5759 arr!308) i!761 (_1!10272 lt!353833)) (size!4817 arr!308))))))

(assert (=> b!223640 (= call!3540 call!3540)))

(declare-fun lt!353986 () Unit!16237)

(declare-fun Unit!16251 () Unit!16237)

(assert (=> b!223640 (= lt!353986 Unit!16251)))

(declare-fun lt!353988 () Unit!16237)

(declare-fun arrayRangesEqReflexiveLemma!68 (array!10982) Unit!16237)

(assert (=> b!223640 (= lt!353988 (arrayRangesEqReflexiveLemma!68 (array!10983 (store (arr!5759 arr!308) i!761 (_1!10272 lt!353833)) (size!4817 arr!308))))))

(assert (=> b!223640 call!3538))

(declare-fun lt!354007 () Unit!16237)

(assert (=> b!223640 (= lt!354007 lt!353988)))

(declare-fun lt!354003 () array!10982)

(assert (=> b!223640 (= lt!354003 (array!10983 (store (arr!5759 arr!308) i!761 (_1!10272 lt!353833)) (size!4817 arr!308)))))

(declare-fun lt!354002 () array!10982)

(assert (=> b!223640 (= lt!354002 (array!10983 (store (arr!5759 arr!308) i!761 (_1!10272 lt!353833)) (size!4817 arr!308)))))

(declare-fun lt!353984 () (_ BitVec 32))

(assert (=> b!223640 (= lt!353984 #b00000000000000000000000000000000)))

(declare-fun lt!353987 () (_ BitVec 32))

(assert (=> b!223640 (= lt!353987 (size!4817 (array!10983 (store (arr!5759 arr!308) i!761 (_1!10272 lt!353833)) (size!4817 arr!308))))))

(declare-fun lt!354015 () (_ BitVec 32))

(assert (=> b!223640 (= lt!354015 #b00000000000000000000000000000000)))

(declare-fun lt!354006 () (_ BitVec 32))

(assert (=> b!223640 (= lt!354006 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!68 (array!10982 array!10982 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16237)

(assert (=> b!223640 (= lt!353982 (arrayRangesEqSlicedLemma!68 lt!354003 lt!354002 lt!353984 lt!353987 lt!354015 lt!354006))))

(assert (=> b!223640 call!3539))

(declare-fun d!75857 () Bool)

(declare-fun e!152241 () Bool)

(assert (=> d!75857 e!152241))

(declare-fun res!187744 () Bool)

(assert (=> d!75857 (=> res!187744 e!152241)))

(assert (=> d!75857 (= res!187744 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!353997 () Bool)

(declare-fun e!152243 () Bool)

(assert (=> d!75857 (= lt!353997 e!152243)))

(declare-fun res!187743 () Bool)

(assert (=> d!75857 (=> (not res!187743) (not e!152243))))

(declare-fun lt!353994 () tuple3!1160)

(declare-fun lt!353980 () (_ BitVec 64))

(declare-fun lt!354000 () (_ BitVec 64))

(assert (=> d!75857 (= res!187743 (= (bvadd lt!353980 lt!354000) (bitIndex!0 (size!4817 (buf!5361 (_2!10271 lt!353994))) (currentByte!10071 (_2!10271 lt!353994)) (currentBit!10066 (_2!10271 lt!353994)))))))

(assert (=> d!75857 (or (not (= (bvand lt!353980 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!354000 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!353980 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!353980 lt!354000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!353989 () (_ BitVec 64))

(assert (=> d!75857 (= lt!354000 (bvmul lt!353989 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!75857 (or (= lt!353989 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!353989 #b0000000000000000000000000000000000000000000000000000000000001000) lt!353989)))))

(assert (=> d!75857 (= lt!353989 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!75857 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!75857 (= lt!353980 (bitIndex!0 (size!4817 (buf!5361 (_2!10272 lt!353833))) (currentByte!10071 (_2!10272 lt!353833)) (currentBit!10066 (_2!10272 lt!353833))))))

(assert (=> d!75857 (= lt!353994 e!152242)))

(assert (=> d!75857 (= c!11107 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!75857 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4817 (array!10983 (store (arr!5759 arr!308) i!761 (_1!10272 lt!353833)) (size!4817 arr!308)))))))

(assert (=> d!75857 (= (readByteArrayLoop!0 (_2!10272 lt!353833) (array!10983 (store (arr!5759 arr!308) i!761 (_1!10272 lt!353833)) (size!4817 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!353994)))

(declare-fun bm!3536 () Bool)

(assert (=> bm!3536 (= call!3539 (arrayRangesEq!715 (ite c!11107 (array!10983 (store (arr!5759 arr!308) i!761 (_1!10272 lt!353833)) (size!4817 arr!308)) lt!354003) (ite c!11107 (array!10983 (store (arr!5759 (array!10983 (store (arr!5759 arr!308) i!761 (_1!10272 lt!353833)) (size!4817 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10272 lt!353990)) (size!4817 (array!10983 (store (arr!5759 arr!308) i!761 (_1!10272 lt!353833)) (size!4817 arr!308)))) lt!354002) (ite c!11107 #b00000000000000000000000000000000 lt!354015) (ite c!11107 (bvadd #b00000000000000000000000000000001 i!761) lt!354006)))))

(declare-fun b!223641 () Bool)

(declare-fun res!187745 () Bool)

(assert (=> b!223641 (=> (not res!187745) (not e!152243))))

(assert (=> b!223641 (= res!187745 (and (= (buf!5361 (_2!10272 lt!353833)) (buf!5361 (_2!10271 lt!353994))) (= (size!4817 (array!10983 (store (arr!5759 arr!308) i!761 (_1!10272 lt!353833)) (size!4817 arr!308))) (size!4817 (_3!722 lt!353994)))))))

(declare-fun b!223642 () Bool)

(declare-datatypes ((tuple2!19104 0))(
  ( (tuple2!19105 (_1!10276 BitStream!8736) (_2!10276 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!8736) tuple2!19104)

(assert (=> b!223642 (= e!152241 (= (select (arr!5759 (_3!722 lt!353994)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10276 (readBytePure!0 (_2!10272 lt!353833)))))))

(assert (=> b!223642 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4817 (_3!722 lt!353994))))))

(declare-fun bm!3537 () Bool)

(assert (=> bm!3537 (= call!3540 (bitIndex!0 (ite c!11107 (size!4817 (buf!5361 (_2!10271 lt!353991))) (size!4817 (buf!5361 (_2!10272 lt!353833)))) (ite c!11107 (currentByte!10071 (_2!10271 lt!353991)) (currentByte!10071 (_2!10272 lt!353833))) (ite c!11107 (currentBit!10066 (_2!10271 lt!353991)) (currentBit!10066 (_2!10272 lt!353833)))))))

(declare-fun b!223643 () Bool)

(assert (=> b!223643 (= e!152243 (arrayRangesEq!715 (array!10983 (store (arr!5759 arr!308) i!761 (_1!10272 lt!353833)) (size!4817 arr!308)) (_3!722 lt!353994) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (= (and d!75857 c!11107) b!223639))

(assert (= (and d!75857 (not c!11107)) b!223640))

(assert (= (or b!223639 b!223640) bm!3536))

(assert (= (or b!223639 b!223640) bm!3535))

(assert (= (or b!223639 b!223640) bm!3537))

(assert (= (and d!75857 res!187743) b!223641))

(assert (= (and b!223641 res!187745) b!223643))

(assert (= (and d!75857 (not res!187744)) b!223642))

(declare-fun m!342771 () Bool)

(assert (=> b!223639 m!342771))

(declare-fun m!342773 () Bool)

(assert (=> b!223639 m!342773))

(declare-fun m!342775 () Bool)

(assert (=> b!223639 m!342775))

(declare-fun m!342777 () Bool)

(assert (=> b!223639 m!342777))

(declare-fun m!342779 () Bool)

(assert (=> b!223639 m!342779))

(assert (=> b!223639 m!342719))

(declare-fun m!342781 () Bool)

(assert (=> b!223639 m!342781))

(declare-fun m!342783 () Bool)

(assert (=> b!223639 m!342783))

(declare-fun m!342785 () Bool)

(assert (=> b!223639 m!342785))

(declare-fun m!342787 () Bool)

(assert (=> b!223639 m!342787))

(declare-fun m!342789 () Bool)

(assert (=> b!223639 m!342789))

(declare-fun m!342791 () Bool)

(assert (=> b!223639 m!342791))

(declare-fun m!342793 () Bool)

(assert (=> b!223639 m!342793))

(declare-fun m!342795 () Bool)

(assert (=> b!223643 m!342795))

(declare-fun m!342797 () Bool)

(assert (=> bm!3535 m!342797))

(assert (=> bm!3536 m!342793))

(declare-fun m!342799 () Bool)

(assert (=> bm!3536 m!342799))

(declare-fun m!342801 () Bool)

(assert (=> b!223640 m!342801))

(declare-fun m!342803 () Bool)

(assert (=> b!223640 m!342803))

(declare-fun m!342805 () Bool)

(assert (=> bm!3537 m!342805))

(declare-fun m!342807 () Bool)

(assert (=> d!75857 m!342807))

(assert (=> d!75857 m!342719))

(declare-fun m!342809 () Bool)

(assert (=> b!223642 m!342809))

(declare-fun m!342811 () Bool)

(assert (=> b!223642 m!342811))

(assert (=> b!223596 d!75857))

(declare-fun d!75868 () Bool)

(declare-fun e!152246 () Bool)

(assert (=> d!75868 e!152246))

(declare-fun res!187748 () Bool)

(assert (=> d!75868 (=> (not res!187748) (not e!152246))))

(assert (=> d!75868 (= res!187748 (and (or (let ((rhs!3697 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3697 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3697) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!75869 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!75869 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!75869 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3696 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3696 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3696) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!354023 () Unit!16237)

(declare-fun choose!57 (BitStream!8736 BitStream!8736 (_ BitVec 64) (_ BitVec 32)) Unit!16237)

(assert (=> d!75868 (= lt!354023 (choose!57 thiss!1870 (_2!10272 lt!353833) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!75868 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10272 lt!353833) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!354023)))

(declare-fun b!223646 () Bool)

(declare-fun lt!354024 () (_ BitVec 32))

(assert (=> b!223646 (= e!152246 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4817 (buf!5361 (_2!10272 lt!353833)))) ((_ sign_extend 32) (currentByte!10071 (_2!10272 lt!353833))) ((_ sign_extend 32) (currentBit!10066 (_2!10272 lt!353833))) (bvsub (bvsub to!496 i!761) lt!354024)))))

(assert (=> b!223646 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!354024 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!354024) #b10000000000000000000000000000000)))))

(declare-fun lt!354022 () (_ BitVec 64))

(assert (=> b!223646 (= lt!354024 ((_ extract 31 0) lt!354022))))

(assert (=> b!223646 (and (bvslt lt!354022 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!354022 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!223646 (= lt!354022 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!75868 res!187748) b!223646))

(declare-fun m!342813 () Bool)

(assert (=> d!75868 m!342813))

(declare-fun m!342815 () Bool)

(assert (=> b!223646 m!342815))

(assert (=> b!223596 d!75868))

(declare-fun d!75871 () Bool)

(assert (=> d!75871 (= (invariant!0 (currentBit!10066 thiss!1870) (currentByte!10071 thiss!1870) (size!4817 (buf!5361 thiss!1870))) (and (bvsge (currentBit!10066 thiss!1870) #b00000000000000000000000000000000) (bvslt (currentBit!10066 thiss!1870) #b00000000000000000000000000001000) (bvsge (currentByte!10071 thiss!1870) #b00000000000000000000000000000000) (or (bvslt (currentByte!10071 thiss!1870) (size!4817 (buf!5361 thiss!1870))) (and (= (currentBit!10066 thiss!1870) #b00000000000000000000000000000000) (= (currentByte!10071 thiss!1870) (size!4817 (buf!5361 thiss!1870)))))))))

(assert (=> b!223596 d!75871))

(declare-fun d!75873 () Bool)

(declare-fun e!152251 () Bool)

(assert (=> d!75873 e!152251))

(declare-fun res!187754 () Bool)

(assert (=> d!75873 (=> (not res!187754) (not e!152251))))

(declare-fun lt!354063 () (_ BitVec 64))

(declare-fun lt!354062 () (_ BitVec 64))

(declare-fun lt!354061 () (_ BitVec 64))

(assert (=> d!75873 (= res!187754 (= lt!354063 (bvsub lt!354062 lt!354061)))))

(assert (=> d!75873 (or (= (bvand lt!354062 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!354061 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!354062 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!354062 lt!354061) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75873 (= lt!354061 (remainingBits!0 ((_ sign_extend 32) (size!4817 (buf!5361 thiss!1870))) ((_ sign_extend 32) (currentByte!10071 thiss!1870)) ((_ sign_extend 32) (currentBit!10066 thiss!1870))))))

(declare-fun lt!354060 () (_ BitVec 64))

(declare-fun lt!354059 () (_ BitVec 64))

(assert (=> d!75873 (= lt!354062 (bvmul lt!354060 lt!354059))))

(assert (=> d!75873 (or (= lt!354060 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!354059 (bvsdiv (bvmul lt!354060 lt!354059) lt!354060)))))

(assert (=> d!75873 (= lt!354059 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75873 (= lt!354060 ((_ sign_extend 32) (size!4817 (buf!5361 thiss!1870))))))

(assert (=> d!75873 (= lt!354063 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10071 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10066 thiss!1870))))))

(assert (=> d!75873 (invariant!0 (currentBit!10066 thiss!1870) (currentByte!10071 thiss!1870) (size!4817 (buf!5361 thiss!1870)))))

(assert (=> d!75873 (= (bitIndex!0 (size!4817 (buf!5361 thiss!1870)) (currentByte!10071 thiss!1870) (currentBit!10066 thiss!1870)) lt!354063)))

(declare-fun b!223655 () Bool)

(declare-fun res!187753 () Bool)

(assert (=> b!223655 (=> (not res!187753) (not e!152251))))

(assert (=> b!223655 (= res!187753 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!354063))))

(declare-fun b!223656 () Bool)

(declare-fun lt!354064 () (_ BitVec 64))

(assert (=> b!223656 (= e!152251 (bvsle lt!354063 (bvmul lt!354064 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223656 (or (= lt!354064 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!354064 #b0000000000000000000000000000000000000000000000000000000000001000) lt!354064)))))

(assert (=> b!223656 (= lt!354064 ((_ sign_extend 32) (size!4817 (buf!5361 thiss!1870))))))

(assert (= (and d!75873 res!187754) b!223655))

(assert (= (and b!223655 res!187753) b!223656))

(assert (=> d!75873 m!342749))

(assert (=> d!75873 m!342717))

(assert (=> b!223596 d!75873))

(declare-fun d!75875 () Bool)

(assert (=> d!75875 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4817 (buf!5361 (_2!10272 lt!353833)))) ((_ sign_extend 32) (currentByte!10071 (_2!10272 lt!353833))) ((_ sign_extend 32) (currentBit!10066 (_2!10272 lt!353833))) lt!353838) (bvsle ((_ sign_extend 32) lt!353838) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4817 (buf!5361 (_2!10272 lt!353833)))) ((_ sign_extend 32) (currentByte!10071 (_2!10272 lt!353833))) ((_ sign_extend 32) (currentBit!10066 (_2!10272 lt!353833)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18495 () Bool)

(assert (= bs!18495 d!75875))

(declare-fun m!342817 () Bool)

(assert (=> bs!18495 m!342817))

(assert (=> b!223596 d!75875))

(declare-fun d!75877 () Bool)

(declare-fun e!152252 () Bool)

(assert (=> d!75877 e!152252))

(declare-fun res!187756 () Bool)

(assert (=> d!75877 (=> (not res!187756) (not e!152252))))

(declare-fun lt!354093 () (_ BitVec 64))

(declare-fun lt!354092 () (_ BitVec 64))

(declare-fun lt!354091 () (_ BitVec 64))

(assert (=> d!75877 (= res!187756 (= lt!354093 (bvsub lt!354092 lt!354091)))))

(assert (=> d!75877 (or (= (bvand lt!354092 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!354091 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!354092 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!354092 lt!354091) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75877 (= lt!354091 (remainingBits!0 ((_ sign_extend 32) (size!4817 (buf!5361 (_2!10272 lt!353833)))) ((_ sign_extend 32) (currentByte!10071 (_2!10272 lt!353833))) ((_ sign_extend 32) (currentBit!10066 (_2!10272 lt!353833)))))))

(declare-fun lt!354090 () (_ BitVec 64))

(declare-fun lt!354089 () (_ BitVec 64))

(assert (=> d!75877 (= lt!354092 (bvmul lt!354090 lt!354089))))

(assert (=> d!75877 (or (= lt!354090 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!354089 (bvsdiv (bvmul lt!354090 lt!354089) lt!354090)))))

(assert (=> d!75877 (= lt!354089 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75877 (= lt!354090 ((_ sign_extend 32) (size!4817 (buf!5361 (_2!10272 lt!353833)))))))

(assert (=> d!75877 (= lt!354093 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10071 (_2!10272 lt!353833))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10066 (_2!10272 lt!353833)))))))

(assert (=> d!75877 (invariant!0 (currentBit!10066 (_2!10272 lt!353833)) (currentByte!10071 (_2!10272 lt!353833)) (size!4817 (buf!5361 (_2!10272 lt!353833))))))

(assert (=> d!75877 (= (bitIndex!0 (size!4817 (buf!5361 (_2!10272 lt!353833))) (currentByte!10071 (_2!10272 lt!353833)) (currentBit!10066 (_2!10272 lt!353833))) lt!354093)))

(declare-fun b!223657 () Bool)

(declare-fun res!187755 () Bool)

(assert (=> b!223657 (=> (not res!187755) (not e!152252))))

(assert (=> b!223657 (= res!187755 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!354093))))

(declare-fun b!223658 () Bool)

(declare-fun lt!354094 () (_ BitVec 64))

(assert (=> b!223658 (= e!152252 (bvsle lt!354093 (bvmul lt!354094 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223658 (or (= lt!354094 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!354094 #b0000000000000000000000000000000000000000000000000000000000001000) lt!354094)))))

(assert (=> b!223658 (= lt!354094 ((_ sign_extend 32) (size!4817 (buf!5361 (_2!10272 lt!353833)))))))

(assert (= (and d!75877 res!187756) b!223657))

(assert (= (and b!223657 res!187755) b!223658))

(assert (=> d!75877 m!342817))

(declare-fun m!342819 () Bool)

(assert (=> d!75877 m!342819))

(assert (=> b!223596 d!75877))

(declare-fun d!75879 () Bool)

(declare-fun e!152253 () Bool)

(assert (=> d!75879 e!152253))

(declare-fun res!187758 () Bool)

(assert (=> d!75879 (=> (not res!187758) (not e!152253))))

(declare-fun lt!354117 () (_ BitVec 64))

(declare-fun lt!354116 () (_ BitVec 64))

(declare-fun lt!354115 () (_ BitVec 64))

(assert (=> d!75879 (= res!187758 (= lt!354117 (bvsub lt!354116 lt!354115)))))

(assert (=> d!75879 (or (= (bvand lt!354116 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!354115 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!354116 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!354116 lt!354115) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75879 (= lt!354115 (remainingBits!0 ((_ sign_extend 32) (size!4817 (buf!5361 (_2!10271 lt!353837)))) ((_ sign_extend 32) (currentByte!10071 (_2!10271 lt!353837))) ((_ sign_extend 32) (currentBit!10066 (_2!10271 lt!353837)))))))

(declare-fun lt!354114 () (_ BitVec 64))

(declare-fun lt!354113 () (_ BitVec 64))

(assert (=> d!75879 (= lt!354116 (bvmul lt!354114 lt!354113))))

(assert (=> d!75879 (or (= lt!354114 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!354113 (bvsdiv (bvmul lt!354114 lt!354113) lt!354114)))))

(assert (=> d!75879 (= lt!354113 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75879 (= lt!354114 ((_ sign_extend 32) (size!4817 (buf!5361 (_2!10271 lt!353837)))))))

(assert (=> d!75879 (= lt!354117 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10071 (_2!10271 lt!353837))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10066 (_2!10271 lt!353837)))))))

(assert (=> d!75879 (invariant!0 (currentBit!10066 (_2!10271 lt!353837)) (currentByte!10071 (_2!10271 lt!353837)) (size!4817 (buf!5361 (_2!10271 lt!353837))))))

(assert (=> d!75879 (= (bitIndex!0 (size!4817 (buf!5361 (_2!10271 lt!353837))) (currentByte!10071 (_2!10271 lt!353837)) (currentBit!10066 (_2!10271 lt!353837))) lt!354117)))

(declare-fun b!223659 () Bool)

(declare-fun res!187757 () Bool)

(assert (=> b!223659 (=> (not res!187757) (not e!152253))))

(assert (=> b!223659 (= res!187757 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!354117))))

(declare-fun b!223660 () Bool)

(declare-fun lt!354118 () (_ BitVec 64))

(assert (=> b!223660 (= e!152253 (bvsle lt!354117 (bvmul lt!354118 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223660 (or (= lt!354118 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!354118 #b0000000000000000000000000000000000000000000000000000000000001000) lt!354118)))))

(assert (=> b!223660 (= lt!354118 ((_ sign_extend 32) (size!4817 (buf!5361 (_2!10271 lt!353837)))))))

(assert (= (and d!75879 res!187758) b!223659))

(assert (= (and b!223659 res!187757) b!223660))

(declare-fun m!342821 () Bool)

(assert (=> d!75879 m!342821))

(declare-fun m!342823 () Bool)

(assert (=> d!75879 m!342823))

(assert (=> b!223594 d!75879))

(declare-fun d!75881 () Bool)

(assert (=> d!75881 (= (array_inv!4558 (buf!5361 thiss!1870)) (bvsge (size!4817 (buf!5361 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!223598 d!75881))

(check-sat (not bm!3535) (not d!75873) (not bm!3536) (not b!223619) (not d!75879) (not d!75868) (not b!223639) (not b!223642) (not d!75851) (not d!75855) (not b!223646) (not d!75875) (not b!223640) (not bm!3537) (not d!75877) (not d!75853) (not b!223643) (not d!75857))
