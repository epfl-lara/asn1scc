; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46288 () Bool)

(assert start!46288)

(declare-fun b!222969 () Bool)

(declare-fun res!187185 () Bool)

(declare-fun e!151703 () Bool)

(assert (=> b!222969 (=> (not res!187185) (not e!151703))))

(declare-datatypes ((array!10946 0))(
  ( (array!10947 (arr!5735 (Array (_ BitVec 32) (_ BitVec 8))) (size!4805 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8712 0))(
  ( (BitStream!8713 (buf!5349 array!10946) (currentByte!10019 (_ BitVec 32)) (currentBit!10014 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8712)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!222969 (= res!187185 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4805 (buf!5349 thiss!1870))) ((_ sign_extend 32) (currentByte!10019 thiss!1870)) ((_ sign_extend 32) (currentBit!10014 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!222970 () Bool)

(declare-fun res!187184 () Bool)

(assert (=> b!222970 (=> (not res!187184) (not e!151703))))

(assert (=> b!222970 (= res!187184 (bvslt i!761 to!496))))

(declare-fun res!187183 () Bool)

(assert (=> start!46288 (=> (not res!187183) (not e!151703))))

(declare-fun arr!308 () array!10946)

(assert (=> start!46288 (= res!187183 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4805 arr!308))))))

(assert (=> start!46288 e!151703))

(assert (=> start!46288 true))

(declare-fun array_inv!4546 (array!10946) Bool)

(assert (=> start!46288 (array_inv!4546 arr!308)))

(declare-fun e!151706 () Bool)

(declare-fun inv!12 (BitStream!8712) Bool)

(assert (=> start!46288 (and (inv!12 thiss!1870) e!151706)))

(declare-fun b!222972 () Bool)

(assert (=> b!222972 (= e!151706 (array_inv!4546 (buf!5349 thiss!1870)))))

(declare-fun b!222971 () Bool)

(declare-datatypes ((tuple2!19030 0))(
  ( (tuple2!19031 (_1!10225 (_ BitVec 8)) (_2!10225 BitStream!8712)) )
))
(declare-fun lt!351510 () tuple2!19030)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!222971 (= e!151703 (not (invariant!0 (currentBit!10014 (_2!10225 lt!351510)) (currentByte!10019 (_2!10225 lt!351510)) (size!4805 (buf!5349 (_2!10225 lt!351510))))))))

(declare-datatypes ((Unit!16047 0))(
  ( (Unit!16048) )
))
(declare-datatypes ((tuple3!1136 0))(
  ( (tuple3!1137 (_1!10226 Unit!16047) (_2!10226 BitStream!8712) (_3!710 array!10946)) )
))
(declare-fun lt!351511 () tuple3!1136)

(declare-fun readByteArrayLoop!0 (BitStream!8712 array!10946 (_ BitVec 32) (_ BitVec 32)) tuple3!1136)

(assert (=> b!222971 (= lt!351511 (readByteArrayLoop!0 (_2!10225 lt!351510) (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!222971 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4805 (buf!5349 (_2!10225 lt!351510)))) ((_ sign_extend 32) (currentByte!10019 (_2!10225 lt!351510))) ((_ sign_extend 32) (currentBit!10014 (_2!10225 lt!351510))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!351512 () Unit!16047)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8712 BitStream!8712 (_ BitVec 64) (_ BitVec 32)) Unit!16047)

(assert (=> b!222971 (= lt!351512 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10225 lt!351510) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!8712) tuple2!19030)

(assert (=> b!222971 (= lt!351510 (readByte!0 thiss!1870))))

(assert (= (and start!46288 res!187183) b!222969))

(assert (= (and b!222969 res!187185) b!222970))

(assert (= (and b!222970 res!187184) b!222971))

(assert (= start!46288 b!222972))

(declare-fun m!341229 () Bool)

(assert (=> b!222969 m!341229))

(declare-fun m!341231 () Bool)

(assert (=> start!46288 m!341231))

(declare-fun m!341233 () Bool)

(assert (=> start!46288 m!341233))

(declare-fun m!341235 () Bool)

(assert (=> b!222972 m!341235))

(declare-fun m!341237 () Bool)

(assert (=> b!222971 m!341237))

(declare-fun m!341239 () Bool)

(assert (=> b!222971 m!341239))

(declare-fun m!341241 () Bool)

(assert (=> b!222971 m!341241))

(declare-fun m!341243 () Bool)

(assert (=> b!222971 m!341243))

(declare-fun m!341245 () Bool)

(assert (=> b!222971 m!341245))

(declare-fun m!341247 () Bool)

(assert (=> b!222971 m!341247))

(check-sat (not b!222971) (not b!222969) (not start!46288) (not b!222972))
(check-sat)
(get-model)

(declare-fun d!75400 () Bool)

(assert (=> d!75400 (= (invariant!0 (currentBit!10014 (_2!10225 lt!351510)) (currentByte!10019 (_2!10225 lt!351510)) (size!4805 (buf!5349 (_2!10225 lt!351510)))) (and (bvsge (currentBit!10014 (_2!10225 lt!351510)) #b00000000000000000000000000000000) (bvslt (currentBit!10014 (_2!10225 lt!351510)) #b00000000000000000000000000001000) (bvsge (currentByte!10019 (_2!10225 lt!351510)) #b00000000000000000000000000000000) (or (bvslt (currentByte!10019 (_2!10225 lt!351510)) (size!4805 (buf!5349 (_2!10225 lt!351510)))) (and (= (currentBit!10014 (_2!10225 lt!351510)) #b00000000000000000000000000000000) (= (currentByte!10019 (_2!10225 lt!351510)) (size!4805 (buf!5349 (_2!10225 lt!351510))))))))))

(assert (=> b!222971 d!75400))

(declare-fun d!75402 () Bool)

(declare-fun lt!351567 () (_ BitVec 8))

(declare-fun lt!351571 () (_ BitVec 8))

(assert (=> d!75402 (= lt!351567 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5735 (buf!5349 thiss!1870)) (currentByte!10019 thiss!1870))) ((_ sign_extend 24) lt!351571))))))

(assert (=> d!75402 (= lt!351571 ((_ extract 7 0) (currentBit!10014 thiss!1870)))))

(declare-fun e!151732 () Bool)

(assert (=> d!75402 e!151732))

(declare-fun res!187210 () Bool)

(assert (=> d!75402 (=> (not res!187210) (not e!151732))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!75402 (= res!187210 (validate_offset_bits!1 ((_ sign_extend 32) (size!4805 (buf!5349 thiss!1870))) ((_ sign_extend 32) (currentByte!10019 thiss!1870)) ((_ sign_extend 32) (currentBit!10014 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19040 0))(
  ( (tuple2!19041 (_1!10232 Unit!16047) (_2!10232 (_ BitVec 8))) )
))
(declare-fun Unit!16067 () Unit!16047)

(declare-fun Unit!16068 () Unit!16047)

(assert (=> d!75402 (= (readByte!0 thiss!1870) (tuple2!19031 (_2!10232 (ite (bvsgt ((_ sign_extend 24) lt!351571) #b00000000000000000000000000000000) (tuple2!19041 Unit!16067 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!351567) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5735 (buf!5349 thiss!1870)) (bvadd (currentByte!10019 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!351571)))))))) (tuple2!19041 Unit!16068 lt!351567))) (BitStream!8713 (buf!5349 thiss!1870) (bvadd (currentByte!10019 thiss!1870) #b00000000000000000000000000000001) (currentBit!10014 thiss!1870))))))

(declare-fun b!222998 () Bool)

(declare-fun e!151733 () Bool)

(assert (=> b!222998 (= e!151732 e!151733)))

(declare-fun res!187211 () Bool)

(assert (=> b!222998 (=> (not res!187211) (not e!151733))))

(declare-fun lt!351572 () tuple2!19030)

(assert (=> b!222998 (= res!187211 (= (buf!5349 (_2!10225 lt!351572)) (buf!5349 thiss!1870)))))

(declare-fun lt!351570 () (_ BitVec 8))

(declare-fun lt!351568 () (_ BitVec 8))

(declare-fun Unit!16069 () Unit!16047)

(declare-fun Unit!16070 () Unit!16047)

(assert (=> b!222998 (= lt!351572 (tuple2!19031 (_2!10232 (ite (bvsgt ((_ sign_extend 24) lt!351568) #b00000000000000000000000000000000) (tuple2!19041 Unit!16069 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!351570) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5735 (buf!5349 thiss!1870)) (bvadd (currentByte!10019 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!351568)))))))) (tuple2!19041 Unit!16070 lt!351570))) (BitStream!8713 (buf!5349 thiss!1870) (bvadd (currentByte!10019 thiss!1870) #b00000000000000000000000000000001) (currentBit!10014 thiss!1870))))))

(assert (=> b!222998 (= lt!351570 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5735 (buf!5349 thiss!1870)) (currentByte!10019 thiss!1870))) ((_ sign_extend 24) lt!351568))))))

(assert (=> b!222998 (= lt!351568 ((_ extract 7 0) (currentBit!10014 thiss!1870)))))

(declare-fun b!222999 () Bool)

(declare-fun lt!351569 () (_ BitVec 64))

(declare-fun lt!351566 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!222999 (= e!151733 (= (bitIndex!0 (size!4805 (buf!5349 (_2!10225 lt!351572))) (currentByte!10019 (_2!10225 lt!351572)) (currentBit!10014 (_2!10225 lt!351572))) (bvadd lt!351566 lt!351569)))))

(assert (=> b!222999 (or (not (= (bvand lt!351566 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!351569 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!351566 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!351566 lt!351569) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!222999 (= lt!351569 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!222999 (= lt!351566 (bitIndex!0 (size!4805 (buf!5349 thiss!1870)) (currentByte!10019 thiss!1870) (currentBit!10014 thiss!1870)))))

(assert (= (and d!75402 res!187210) b!222998))

(assert (= (and b!222998 res!187211) b!222999))

(declare-fun m!341289 () Bool)

(assert (=> d!75402 m!341289))

(declare-fun m!341291 () Bool)

(assert (=> d!75402 m!341291))

(declare-fun m!341293 () Bool)

(assert (=> d!75402 m!341293))

(assert (=> b!222998 m!341293))

(assert (=> b!222998 m!341289))

(declare-fun m!341295 () Bool)

(assert (=> b!222999 m!341295))

(declare-fun m!341297 () Bool)

(assert (=> b!222999 m!341297))

(assert (=> b!222971 d!75402))

(declare-fun d!75410 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!75410 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4805 (buf!5349 (_2!10225 lt!351510)))) ((_ sign_extend 32) (currentByte!10019 (_2!10225 lt!351510))) ((_ sign_extend 32) (currentBit!10014 (_2!10225 lt!351510))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4805 (buf!5349 (_2!10225 lt!351510)))) ((_ sign_extend 32) (currentByte!10019 (_2!10225 lt!351510))) ((_ sign_extend 32) (currentBit!10014 (_2!10225 lt!351510)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18412 () Bool)

(assert (= bs!18412 d!75410))

(declare-fun m!341299 () Bool)

(assert (=> bs!18412 m!341299))

(assert (=> b!222971 d!75410))

(declare-fun lt!351906 () (_ BitVec 32))

(declare-fun lt!351895 () array!10946)

(declare-fun call!3436 () Bool)

(declare-fun bm!3433 () Bool)

(declare-fun lt!351915 () array!10946)

(declare-fun c!11073 () Bool)

(declare-fun lt!351900 () (_ BitVec 32))

(declare-fun lt!351921 () tuple2!19030)

(declare-fun arrayRangesEq!706 (array!10946 array!10946 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!3433 (= call!3436 (arrayRangesEq!706 (ite c!11073 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308)) lt!351895) (ite c!11073 (array!10947 (store (arr!5735 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10225 lt!351921)) (size!4805 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308)))) lt!351915) (ite c!11073 #b00000000000000000000000000000000 lt!351900) (ite c!11073 (bvadd #b00000000000000000000000000000001 i!761) lt!351906)))))

(declare-fun bm!3434 () Bool)

(declare-fun call!3438 () (_ BitVec 64))

(assert (=> bm!3434 (= call!3438 (bitIndex!0 (ite c!11073 (size!4805 (buf!5349 (_2!10225 lt!351921))) (size!4805 (buf!5349 (_2!10225 lt!351510)))) (ite c!11073 (currentByte!10019 (_2!10225 lt!351921)) (currentByte!10019 (_2!10225 lt!351510))) (ite c!11073 (currentBit!10014 (_2!10225 lt!351921)) (currentBit!10014 (_2!10225 lt!351510)))))))

(declare-fun e!151767 () tuple3!1136)

(declare-fun b!223049 () Bool)

(declare-fun lt!351924 () Unit!16047)

(assert (=> b!223049 (= e!151767 (tuple3!1137 lt!351924 (_2!10225 lt!351510) (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308))))))

(assert (=> b!223049 (= call!3438 call!3438)))

(declare-fun lt!351907 () Unit!16047)

(declare-fun Unit!16073 () Unit!16047)

(assert (=> b!223049 (= lt!351907 Unit!16073)))

(declare-fun lt!351899 () Unit!16047)

(declare-fun arrayRangesEqReflexiveLemma!58 (array!10946) Unit!16047)

(assert (=> b!223049 (= lt!351899 (arrayRangesEqReflexiveLemma!58 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308))))))

(declare-fun call!3437 () Bool)

(assert (=> b!223049 call!3437))

(declare-fun lt!351904 () Unit!16047)

(assert (=> b!223049 (= lt!351904 lt!351899)))

(assert (=> b!223049 (= lt!351895 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308)))))

(assert (=> b!223049 (= lt!351915 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308)))))

(declare-fun lt!351898 () (_ BitVec 32))

(assert (=> b!223049 (= lt!351898 #b00000000000000000000000000000000)))

(declare-fun lt!351910 () (_ BitVec 32))

(assert (=> b!223049 (= lt!351910 (size!4805 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308))))))

(assert (=> b!223049 (= lt!351900 #b00000000000000000000000000000000)))

(assert (=> b!223049 (= lt!351906 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!58 (array!10946 array!10946 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16047)

(assert (=> b!223049 (= lt!351924 (arrayRangesEqSlicedLemma!58 lt!351895 lt!351915 lt!351898 lt!351910 lt!351900 lt!351906))))

(assert (=> b!223049 call!3436))

(declare-fun b!223050 () Bool)

(declare-fun lt!351926 () tuple3!1136)

(declare-fun e!151769 () Bool)

(declare-datatypes ((tuple2!19044 0))(
  ( (tuple2!19045 (_1!10234 BitStream!8712) (_2!10234 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!8712) tuple2!19044)

(assert (=> b!223050 (= e!151769 (= (select (arr!5735 (_3!710 lt!351926)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10234 (readBytePure!0 (_2!10225 lt!351510)))))))

(assert (=> b!223050 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4805 (_3!710 lt!351926))))))

(declare-fun d!75412 () Bool)

(assert (=> d!75412 e!151769))

(declare-fun res!187248 () Bool)

(assert (=> d!75412 (=> res!187248 e!151769)))

(assert (=> d!75412 (= res!187248 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!351914 () Bool)

(declare-fun e!151768 () Bool)

(assert (=> d!75412 (= lt!351914 e!151768)))

(declare-fun res!187247 () Bool)

(assert (=> d!75412 (=> (not res!187247) (not e!151768))))

(declare-fun lt!351891 () (_ BitVec 64))

(declare-fun lt!351893 () (_ BitVec 64))

(assert (=> d!75412 (= res!187247 (= (bvadd lt!351893 lt!351891) (bitIndex!0 (size!4805 (buf!5349 (_2!10226 lt!351926))) (currentByte!10019 (_2!10226 lt!351926)) (currentBit!10014 (_2!10226 lt!351926)))))))

(assert (=> d!75412 (or (not (= (bvand lt!351893 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!351891 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!351893 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!351893 lt!351891) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!351892 () (_ BitVec 64))

(assert (=> d!75412 (= lt!351891 (bvmul lt!351892 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!75412 (or (= lt!351892 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!351892 #b0000000000000000000000000000000000000000000000000000000000001000) lt!351892)))))

(assert (=> d!75412 (= lt!351892 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!75412 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!75412 (= lt!351893 (bitIndex!0 (size!4805 (buf!5349 (_2!10225 lt!351510))) (currentByte!10019 (_2!10225 lt!351510)) (currentBit!10014 (_2!10225 lt!351510))))))

(assert (=> d!75412 (= lt!351926 e!151767)))

(assert (=> d!75412 (= c!11073 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!75412 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4805 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308)))))))

(assert (=> d!75412 (= (readByteArrayLoop!0 (_2!10225 lt!351510) (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!351926)))

(declare-fun b!223051 () Bool)

(declare-fun res!187246 () Bool)

(assert (=> b!223051 (=> (not res!187246) (not e!151768))))

(assert (=> b!223051 (= res!187246 (and (= (buf!5349 (_2!10225 lt!351510)) (buf!5349 (_2!10226 lt!351926))) (= (size!4805 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308))) (size!4805 (_3!710 lt!351926)))))))

(declare-fun lt!351922 () tuple3!1136)

(declare-fun bm!3435 () Bool)

(assert (=> bm!3435 (= call!3437 (arrayRangesEq!706 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308)) (ite c!11073 (_3!710 lt!351922) (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308))) #b00000000000000000000000000000000 (ite c!11073 (bvadd #b00000000000000000000000000000001 i!761) (size!4805 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308))))))))

(declare-fun b!223052 () Bool)

(assert (=> b!223052 (= e!151768 (arrayRangesEq!706 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308)) (_3!710 lt!351926) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun b!223053 () Bool)

(declare-fun lt!351925 () Unit!16047)

(assert (=> b!223053 (= e!151767 (tuple3!1137 lt!351925 (_2!10226 lt!351922) (_3!710 lt!351922)))))

(assert (=> b!223053 (= lt!351921 (readByte!0 (_2!10225 lt!351510)))))

(declare-fun lt!351908 () array!10946)

(assert (=> b!223053 (= lt!351908 (array!10947 (store (arr!5735 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10225 lt!351921)) (size!4805 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308)))))))

(declare-fun lt!351913 () (_ BitVec 64))

(assert (=> b!223053 (= lt!351913 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!351896 () (_ BitVec 32))

(assert (=> b!223053 (= lt!351896 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!351909 () Unit!16047)

(assert (=> b!223053 (= lt!351909 (validateOffsetBytesFromBitIndexLemma!0 (_2!10225 lt!351510) (_2!10225 lt!351921) lt!351913 lt!351896))))

(assert (=> b!223053 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4805 (buf!5349 (_2!10225 lt!351921)))) ((_ sign_extend 32) (currentByte!10019 (_2!10225 lt!351921))) ((_ sign_extend 32) (currentBit!10014 (_2!10225 lt!351921))) (bvsub lt!351896 ((_ extract 31 0) (bvsdiv (bvadd lt!351913 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!351920 () Unit!16047)

(assert (=> b!223053 (= lt!351920 lt!351909)))

(assert (=> b!223053 (= lt!351922 (readByteArrayLoop!0 (_2!10225 lt!351921) lt!351908 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> b!223053 (= call!3438 (bvadd (bitIndex!0 (size!4805 (buf!5349 (_2!10225 lt!351510))) (currentByte!10019 (_2!10225 lt!351510)) (currentBit!10014 (_2!10225 lt!351510))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!351897 () Unit!16047)

(declare-fun Unit!16078 () Unit!16047)

(assert (=> b!223053 (= lt!351897 Unit!16078)))

(assert (=> b!223053 (= (bvadd call!3438 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4805 (buf!5349 (_2!10226 lt!351922))) (currentByte!10019 (_2!10226 lt!351922)) (currentBit!10014 (_2!10226 lt!351922))))))

(declare-fun lt!351894 () Unit!16047)

(declare-fun Unit!16079 () Unit!16047)

(assert (=> b!223053 (= lt!351894 Unit!16079)))

(assert (=> b!223053 (= (bvadd (bitIndex!0 (size!4805 (buf!5349 (_2!10225 lt!351510))) (currentByte!10019 (_2!10225 lt!351510)) (currentBit!10014 (_2!10225 lt!351510))) (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4805 (buf!5349 (_2!10226 lt!351922))) (currentByte!10019 (_2!10226 lt!351922)) (currentBit!10014 (_2!10226 lt!351922))))))

(declare-fun lt!351912 () Unit!16047)

(declare-fun Unit!16080 () Unit!16047)

(assert (=> b!223053 (= lt!351912 Unit!16080)))

(assert (=> b!223053 (and (= (buf!5349 (_2!10225 lt!351510)) (buf!5349 (_2!10226 lt!351922))) (= (size!4805 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308))) (size!4805 (_3!710 lt!351922))))))

(declare-fun lt!351911 () Unit!16047)

(declare-fun Unit!16081 () Unit!16047)

(assert (=> b!223053 (= lt!351911 Unit!16081)))

(declare-fun lt!351916 () Unit!16047)

(declare-fun arrayUpdatedAtPrefixLemma!298 (array!10946 (_ BitVec 32) (_ BitVec 8)) Unit!16047)

(assert (=> b!223053 (= lt!351916 (arrayUpdatedAtPrefixLemma!298 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10225 lt!351921)))))

(assert (=> b!223053 call!3436))

(declare-fun lt!351917 () Unit!16047)

(assert (=> b!223053 (= lt!351917 lt!351916)))

(declare-fun lt!351918 () (_ BitVec 32))

(assert (=> b!223053 (= lt!351918 #b00000000000000000000000000000000)))

(declare-fun lt!351903 () Unit!16047)

(declare-fun arrayRangesEqTransitive!192 (array!10946 array!10946 array!10946 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16047)

(assert (=> b!223053 (= lt!351903 (arrayRangesEqTransitive!192 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308)) lt!351908 (_3!710 lt!351922) lt!351918 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!223053 (arrayRangesEq!706 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308)) (_3!710 lt!351922) lt!351918 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!351901 () Unit!16047)

(assert (=> b!223053 (= lt!351901 lt!351903)))

(assert (=> b!223053 call!3437))

(declare-fun lt!351919 () Unit!16047)

(declare-fun Unit!16082 () Unit!16047)

(assert (=> b!223053 (= lt!351919 Unit!16082)))

(declare-fun lt!351923 () Unit!16047)

(declare-fun arrayRangesEqImpliesEq!67 (array!10946 array!10946 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16047)

(assert (=> b!223053 (= lt!351923 (arrayRangesEqImpliesEq!67 lt!351908 (_3!710 lt!351922) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!223053 (= (select (store (arr!5735 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10225 lt!351921)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5735 (_3!710 lt!351922)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!351902 () Unit!16047)

(assert (=> b!223053 (= lt!351902 lt!351923)))

(declare-fun lt!351905 () Bool)

(assert (=> b!223053 (= lt!351905 (= (select (arr!5735 (_3!710 lt!351922)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10225 lt!351921)))))

(declare-fun Unit!16083 () Unit!16047)

(assert (=> b!223053 (= lt!351925 Unit!16083)))

(assert (=> b!223053 lt!351905))

(assert (= (and d!75412 c!11073) b!223053))

(assert (= (and d!75412 (not c!11073)) b!223049))

(assert (= (or b!223053 b!223049) bm!3433))

(assert (= (or b!223053 b!223049) bm!3435))

(assert (= (or b!223053 b!223049) bm!3434))

(assert (= (and d!75412 res!187247) b!223051))

(assert (= (and b!223051 res!187246) b!223052))

(assert (= (and d!75412 (not res!187248)) b!223050))

(declare-fun m!341409 () Bool)

(assert (=> b!223053 m!341409))

(declare-fun m!341411 () Bool)

(assert (=> b!223053 m!341411))

(declare-fun m!341413 () Bool)

(assert (=> b!223053 m!341413))

(declare-fun m!341415 () Bool)

(assert (=> b!223053 m!341415))

(declare-fun m!341417 () Bool)

(assert (=> b!223053 m!341417))

(declare-fun m!341419 () Bool)

(assert (=> b!223053 m!341419))

(declare-fun m!341421 () Bool)

(assert (=> b!223053 m!341421))

(declare-fun m!341423 () Bool)

(assert (=> b!223053 m!341423))

(declare-fun m!341425 () Bool)

(assert (=> b!223053 m!341425))

(declare-fun m!341427 () Bool)

(assert (=> b!223053 m!341427))

(declare-fun m!341429 () Bool)

(assert (=> b!223053 m!341429))

(declare-fun m!341431 () Bool)

(assert (=> b!223053 m!341431))

(declare-fun m!341433 () Bool)

(assert (=> b!223053 m!341433))

(declare-fun m!341435 () Bool)

(assert (=> b!223049 m!341435))

(declare-fun m!341437 () Bool)

(assert (=> b!223049 m!341437))

(declare-fun m!341439 () Bool)

(assert (=> b!223052 m!341439))

(declare-fun m!341441 () Bool)

(assert (=> d!75412 m!341441))

(assert (=> d!75412 m!341409))

(declare-fun m!341443 () Bool)

(assert (=> b!223050 m!341443))

(declare-fun m!341445 () Bool)

(assert (=> b!223050 m!341445))

(declare-fun m!341447 () Bool)

(assert (=> bm!3435 m!341447))

(declare-fun m!341449 () Bool)

(assert (=> bm!3434 m!341449))

(assert (=> bm!3433 m!341419))

(declare-fun m!341451 () Bool)

(assert (=> bm!3433 m!341451))

(assert (=> b!222971 d!75412))

(declare-fun d!75431 () Bool)

(declare-fun e!151772 () Bool)

(assert (=> d!75431 e!151772))

(declare-fun res!187251 () Bool)

(assert (=> d!75431 (=> (not res!187251) (not e!151772))))

(assert (=> d!75431 (= res!187251 (and (or (let ((rhs!3620 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3620 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3620) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!75432 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!75432 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!75432 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3619 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3619 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3619) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!351934 () Unit!16047)

(declare-fun choose!57 (BitStream!8712 BitStream!8712 (_ BitVec 64) (_ BitVec 32)) Unit!16047)

(assert (=> d!75431 (= lt!351934 (choose!57 thiss!1870 (_2!10225 lt!351510) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!75431 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10225 lt!351510) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!351934)))

(declare-fun b!223056 () Bool)

(declare-fun lt!351935 () (_ BitVec 32))

(assert (=> b!223056 (= e!151772 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4805 (buf!5349 (_2!10225 lt!351510)))) ((_ sign_extend 32) (currentByte!10019 (_2!10225 lt!351510))) ((_ sign_extend 32) (currentBit!10014 (_2!10225 lt!351510))) (bvsub (bvsub to!496 i!761) lt!351935)))))

(assert (=> b!223056 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!351935 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!351935) #b10000000000000000000000000000000)))))

(declare-fun lt!351933 () (_ BitVec 64))

(assert (=> b!223056 (= lt!351935 ((_ extract 31 0) lt!351933))))

(assert (=> b!223056 (and (bvslt lt!351933 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!351933 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!223056 (= lt!351933 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!75431 res!187251) b!223056))

(declare-fun m!341453 () Bool)

(assert (=> d!75431 m!341453))

(declare-fun m!341455 () Bool)

(assert (=> b!223056 m!341455))

(assert (=> b!222971 d!75431))

(declare-fun d!75434 () Bool)

(assert (=> d!75434 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4805 (buf!5349 thiss!1870))) ((_ sign_extend 32) (currentByte!10019 thiss!1870)) ((_ sign_extend 32) (currentBit!10014 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4805 (buf!5349 thiss!1870))) ((_ sign_extend 32) (currentByte!10019 thiss!1870)) ((_ sign_extend 32) (currentBit!10014 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18416 () Bool)

(assert (= bs!18416 d!75434))

(declare-fun m!341457 () Bool)

(assert (=> bs!18416 m!341457))

(assert (=> b!222969 d!75434))

(declare-fun d!75436 () Bool)

(assert (=> d!75436 (= (array_inv!4546 arr!308) (bvsge (size!4805 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!46288 d!75436))

(declare-fun d!75438 () Bool)

(assert (=> d!75438 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10014 thiss!1870) (currentByte!10019 thiss!1870) (size!4805 (buf!5349 thiss!1870))))))

(declare-fun bs!18417 () Bool)

(assert (= bs!18417 d!75438))

(declare-fun m!341459 () Bool)

(assert (=> bs!18417 m!341459))

(assert (=> start!46288 d!75438))

(declare-fun d!75440 () Bool)

(assert (=> d!75440 (= (array_inv!4546 (buf!5349 thiss!1870)) (bvsge (size!4805 (buf!5349 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!222972 d!75440))

(check-sat (not d!75402) (not b!223049) (not d!75410) (not b!223052) (not d!75434) (not d!75412) (not d!75431) (not d!75438) (not b!223050) (not bm!3434) (not bm!3435) (not b!223056) (not b!222999) (not b!223053) (not bm!3433))
(check-sat)
(get-model)

(declare-fun d!75442 () Bool)

(assert (=> d!75442 (= (remainingBits!0 ((_ sign_extend 32) (size!4805 (buf!5349 thiss!1870))) ((_ sign_extend 32) (currentByte!10019 thiss!1870)) ((_ sign_extend 32) (currentBit!10014 thiss!1870))) (bvsub (bvmul ((_ sign_extend 32) (size!4805 (buf!5349 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10019 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10014 thiss!1870)))))))

(assert (=> d!75434 d!75442))

(declare-fun d!75444 () Bool)

(assert (=> d!75444 (arrayRangesEq!706 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308)) (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308)) #b00000000000000000000000000000000 (size!4805 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308))))))

(declare-fun lt!351938 () Unit!16047)

(declare-fun choose!261 (array!10946) Unit!16047)

(assert (=> d!75444 (= lt!351938 (choose!261 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308))))))

(assert (=> d!75444 (= (arrayRangesEqReflexiveLemma!58 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308))) lt!351938)))

(declare-fun bs!18418 () Bool)

(assert (= bs!18418 d!75444))

(declare-fun m!341461 () Bool)

(assert (=> bs!18418 m!341461))

(declare-fun m!341463 () Bool)

(assert (=> bs!18418 m!341463))

(assert (=> b!223049 d!75444))

(declare-fun d!75446 () Bool)

(assert (=> d!75446 (arrayRangesEq!706 lt!351895 lt!351915 lt!351900 lt!351906)))

(declare-fun lt!351941 () Unit!16047)

(declare-fun choose!262 (array!10946 array!10946 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16047)

(assert (=> d!75446 (= lt!351941 (choose!262 lt!351895 lt!351915 lt!351898 lt!351910 lt!351900 lt!351906))))

(assert (=> d!75446 (and (bvsle #b00000000000000000000000000000000 lt!351898) (bvsle lt!351898 lt!351910))))

(assert (=> d!75446 (= (arrayRangesEqSlicedLemma!58 lt!351895 lt!351915 lt!351898 lt!351910 lt!351900 lt!351906) lt!351941)))

(declare-fun bs!18419 () Bool)

(assert (= bs!18419 d!75446))

(declare-fun m!341465 () Bool)

(assert (=> bs!18419 m!341465))

(declare-fun m!341467 () Bool)

(assert (=> bs!18419 m!341467))

(assert (=> b!223049 d!75446))

(declare-fun d!75448 () Bool)

(assert (=> d!75448 (= (remainingBits!0 ((_ sign_extend 32) (size!4805 (buf!5349 (_2!10225 lt!351510)))) ((_ sign_extend 32) (currentByte!10019 (_2!10225 lt!351510))) ((_ sign_extend 32) (currentBit!10014 (_2!10225 lt!351510)))) (bvsub (bvmul ((_ sign_extend 32) (size!4805 (buf!5349 (_2!10225 lt!351510)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10019 (_2!10225 lt!351510))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10014 (_2!10225 lt!351510))))))))

(assert (=> d!75410 d!75448))

(declare-fun d!75450 () Bool)

(declare-fun lt!351944 () tuple2!19030)

(assert (=> d!75450 (= lt!351944 (readByte!0 (_2!10225 lt!351510)))))

(assert (=> d!75450 (= (readBytePure!0 (_2!10225 lt!351510)) (tuple2!19045 (_2!10225 lt!351944) (_1!10225 lt!351944)))))

(declare-fun bs!18420 () Bool)

(assert (= bs!18420 d!75450))

(assert (=> bs!18420 m!341423))

(assert (=> b!223050 d!75450))

(declare-fun d!75452 () Bool)

(declare-fun e!151775 () Bool)

(assert (=> d!75452 e!151775))

(declare-fun res!187256 () Bool)

(assert (=> d!75452 (=> (not res!187256) (not e!151775))))

(declare-fun lt!351957 () (_ BitVec 64))

(declare-fun lt!351960 () (_ BitVec 64))

(declare-fun lt!351959 () (_ BitVec 64))

(assert (=> d!75452 (= res!187256 (= lt!351957 (bvsub lt!351959 lt!351960)))))

(assert (=> d!75452 (or (= (bvand lt!351959 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!351960 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!351959 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!351959 lt!351960) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75452 (= lt!351960 (remainingBits!0 ((_ sign_extend 32) (size!4805 (buf!5349 (_2!10226 lt!351926)))) ((_ sign_extend 32) (currentByte!10019 (_2!10226 lt!351926))) ((_ sign_extend 32) (currentBit!10014 (_2!10226 lt!351926)))))))

(declare-fun lt!351961 () (_ BitVec 64))

(declare-fun lt!351958 () (_ BitVec 64))

(assert (=> d!75452 (= lt!351959 (bvmul lt!351961 lt!351958))))

(assert (=> d!75452 (or (= lt!351961 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!351958 (bvsdiv (bvmul lt!351961 lt!351958) lt!351961)))))

(assert (=> d!75452 (= lt!351958 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75452 (= lt!351961 ((_ sign_extend 32) (size!4805 (buf!5349 (_2!10226 lt!351926)))))))

(assert (=> d!75452 (= lt!351957 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10019 (_2!10226 lt!351926))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10014 (_2!10226 lt!351926)))))))

(assert (=> d!75452 (invariant!0 (currentBit!10014 (_2!10226 lt!351926)) (currentByte!10019 (_2!10226 lt!351926)) (size!4805 (buf!5349 (_2!10226 lt!351926))))))

(assert (=> d!75452 (= (bitIndex!0 (size!4805 (buf!5349 (_2!10226 lt!351926))) (currentByte!10019 (_2!10226 lt!351926)) (currentBit!10014 (_2!10226 lt!351926))) lt!351957)))

(declare-fun b!223061 () Bool)

(declare-fun res!187257 () Bool)

(assert (=> b!223061 (=> (not res!187257) (not e!151775))))

(assert (=> b!223061 (= res!187257 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!351957))))

(declare-fun b!223062 () Bool)

(declare-fun lt!351962 () (_ BitVec 64))

(assert (=> b!223062 (= e!151775 (bvsle lt!351957 (bvmul lt!351962 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223062 (or (= lt!351962 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!351962 #b0000000000000000000000000000000000000000000000000000000000001000) lt!351962)))))

(assert (=> b!223062 (= lt!351962 ((_ sign_extend 32) (size!4805 (buf!5349 (_2!10226 lt!351926)))))))

(assert (= (and d!75452 res!187256) b!223061))

(assert (= (and b!223061 res!187257) b!223062))

(declare-fun m!341469 () Bool)

(assert (=> d!75452 m!341469))

(declare-fun m!341471 () Bool)

(assert (=> d!75452 m!341471))

(assert (=> d!75412 d!75452))

(declare-fun d!75454 () Bool)

(declare-fun e!151776 () Bool)

(assert (=> d!75454 e!151776))

(declare-fun res!187258 () Bool)

(assert (=> d!75454 (=> (not res!187258) (not e!151776))))

(declare-fun lt!351963 () (_ BitVec 64))

(declare-fun lt!351965 () (_ BitVec 64))

(declare-fun lt!351966 () (_ BitVec 64))

(assert (=> d!75454 (= res!187258 (= lt!351963 (bvsub lt!351965 lt!351966)))))

(assert (=> d!75454 (or (= (bvand lt!351965 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!351966 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!351965 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!351965 lt!351966) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75454 (= lt!351966 (remainingBits!0 ((_ sign_extend 32) (size!4805 (buf!5349 (_2!10225 lt!351510)))) ((_ sign_extend 32) (currentByte!10019 (_2!10225 lt!351510))) ((_ sign_extend 32) (currentBit!10014 (_2!10225 lt!351510)))))))

(declare-fun lt!351967 () (_ BitVec 64))

(declare-fun lt!351964 () (_ BitVec 64))

(assert (=> d!75454 (= lt!351965 (bvmul lt!351967 lt!351964))))

(assert (=> d!75454 (or (= lt!351967 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!351964 (bvsdiv (bvmul lt!351967 lt!351964) lt!351967)))))

(assert (=> d!75454 (= lt!351964 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75454 (= lt!351967 ((_ sign_extend 32) (size!4805 (buf!5349 (_2!10225 lt!351510)))))))

(assert (=> d!75454 (= lt!351963 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10019 (_2!10225 lt!351510))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10014 (_2!10225 lt!351510)))))))

(assert (=> d!75454 (invariant!0 (currentBit!10014 (_2!10225 lt!351510)) (currentByte!10019 (_2!10225 lt!351510)) (size!4805 (buf!5349 (_2!10225 lt!351510))))))

(assert (=> d!75454 (= (bitIndex!0 (size!4805 (buf!5349 (_2!10225 lt!351510))) (currentByte!10019 (_2!10225 lt!351510)) (currentBit!10014 (_2!10225 lt!351510))) lt!351963)))

(declare-fun b!223063 () Bool)

(declare-fun res!187259 () Bool)

(assert (=> b!223063 (=> (not res!187259) (not e!151776))))

(assert (=> b!223063 (= res!187259 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!351963))))

(declare-fun b!223064 () Bool)

(declare-fun lt!351968 () (_ BitVec 64))

(assert (=> b!223064 (= e!151776 (bvsle lt!351963 (bvmul lt!351968 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223064 (or (= lt!351968 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!351968 #b0000000000000000000000000000000000000000000000000000000000001000) lt!351968)))))

(assert (=> b!223064 (= lt!351968 ((_ sign_extend 32) (size!4805 (buf!5349 (_2!10225 lt!351510)))))))

(assert (= (and d!75454 res!187258) b!223063))

(assert (= (and b!223063 res!187259) b!223064))

(assert (=> d!75454 m!341299))

(assert (=> d!75454 m!341245))

(assert (=> d!75412 d!75454))

(declare-fun d!75456 () Bool)

(declare-fun res!187264 () Bool)

(declare-fun e!151781 () Bool)

(assert (=> d!75456 (=> res!187264 e!151781)))

(assert (=> d!75456 (= res!187264 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!75456 (= (arrayRangesEq!706 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308)) (_3!710 lt!351926) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) e!151781)))

(declare-fun b!223069 () Bool)

(declare-fun e!151782 () Bool)

(assert (=> b!223069 (= e!151781 e!151782)))

(declare-fun res!187265 () Bool)

(assert (=> b!223069 (=> (not res!187265) (not e!151782))))

(assert (=> b!223069 (= res!187265 (= (select (arr!5735 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308))) #b00000000000000000000000000000000) (select (arr!5735 (_3!710 lt!351926)) #b00000000000000000000000000000000)))))

(declare-fun b!223070 () Bool)

(assert (=> b!223070 (= e!151782 (arrayRangesEq!706 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308)) (_3!710 lt!351926) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (= (and d!75456 (not res!187264)) b!223069))

(assert (= (and b!223069 res!187265) b!223070))

(declare-fun m!341473 () Bool)

(assert (=> b!223069 m!341473))

(declare-fun m!341475 () Bool)

(assert (=> b!223069 m!341475))

(declare-fun m!341477 () Bool)

(assert (=> b!223070 m!341477))

(assert (=> b!223052 d!75456))

(declare-fun d!75458 () Bool)

(assert (=> d!75458 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4805 (buf!5349 thiss!1870))) ((_ sign_extend 32) (currentByte!10019 thiss!1870)) ((_ sign_extend 32) (currentBit!10014 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4805 (buf!5349 thiss!1870))) ((_ sign_extend 32) (currentByte!10019 thiss!1870)) ((_ sign_extend 32) (currentBit!10014 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!18421 () Bool)

(assert (= bs!18421 d!75458))

(assert (=> bs!18421 m!341457))

(assert (=> d!75402 d!75458))

(declare-fun d!75460 () Bool)

(assert (=> d!75460 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4805 (buf!5349 (_2!10225 lt!351921)))) ((_ sign_extend 32) (currentByte!10019 (_2!10225 lt!351921))) ((_ sign_extend 32) (currentBit!10014 (_2!10225 lt!351921))) (bvsub lt!351896 ((_ extract 31 0) (bvsdiv (bvadd lt!351913 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)))) (bvsle ((_ sign_extend 32) (bvsub lt!351896 ((_ extract 31 0) (bvsdiv (bvadd lt!351913 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)))) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4805 (buf!5349 (_2!10225 lt!351921)))) ((_ sign_extend 32) (currentByte!10019 (_2!10225 lt!351921))) ((_ sign_extend 32) (currentBit!10014 (_2!10225 lt!351921)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18422 () Bool)

(assert (= bs!18422 d!75460))

(declare-fun m!341479 () Bool)

(assert (=> bs!18422 m!341479))

(assert (=> b!223053 d!75460))

(declare-fun d!75462 () Bool)

(declare-fun e!151785 () Bool)

(assert (=> d!75462 e!151785))

(declare-fun res!187268 () Bool)

(assert (=> d!75462 (=> (not res!187268) (not e!151785))))

(assert (=> d!75462 (= res!187268 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4805 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308))))))))

(declare-fun lt!351971 () Unit!16047)

(declare-fun choose!263 (array!10946 (_ BitVec 32) (_ BitVec 8)) Unit!16047)

(assert (=> d!75462 (= lt!351971 (choose!263 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10225 lt!351921)))))

(assert (=> d!75462 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4805 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308)))))))

(assert (=> d!75462 (= (arrayUpdatedAtPrefixLemma!298 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10225 lt!351921)) lt!351971)))

(declare-fun b!223073 () Bool)

(assert (=> b!223073 (= e!151785 (arrayRangesEq!706 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308)) (array!10947 (store (arr!5735 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10225 lt!351921)) (size!4805 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308)))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (= (and d!75462 res!187268) b!223073))

(declare-fun m!341481 () Bool)

(assert (=> d!75462 m!341481))

(assert (=> b!223073 m!341419))

(declare-fun m!341483 () Bool)

(assert (=> b!223073 m!341483))

(assert (=> b!223053 d!75462))

(declare-fun d!75464 () Bool)

(declare-fun lt!351973 () (_ BitVec 8))

(declare-fun lt!351977 () (_ BitVec 8))

(assert (=> d!75464 (= lt!351973 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5735 (buf!5349 (_2!10225 lt!351510))) (currentByte!10019 (_2!10225 lt!351510)))) ((_ sign_extend 24) lt!351977))))))

(assert (=> d!75464 (= lt!351977 ((_ extract 7 0) (currentBit!10014 (_2!10225 lt!351510))))))

(declare-fun e!151786 () Bool)

(assert (=> d!75464 e!151786))

(declare-fun res!187269 () Bool)

(assert (=> d!75464 (=> (not res!187269) (not e!151786))))

(assert (=> d!75464 (= res!187269 (validate_offset_bits!1 ((_ sign_extend 32) (size!4805 (buf!5349 (_2!10225 lt!351510)))) ((_ sign_extend 32) (currentByte!10019 (_2!10225 lt!351510))) ((_ sign_extend 32) (currentBit!10014 (_2!10225 lt!351510))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!16084 () Unit!16047)

(declare-fun Unit!16085 () Unit!16047)

(assert (=> d!75464 (= (readByte!0 (_2!10225 lt!351510)) (tuple2!19031 (_2!10232 (ite (bvsgt ((_ sign_extend 24) lt!351977) #b00000000000000000000000000000000) (tuple2!19041 Unit!16084 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!351973) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5735 (buf!5349 (_2!10225 lt!351510))) (bvadd (currentByte!10019 (_2!10225 lt!351510)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!351977)))))))) (tuple2!19041 Unit!16085 lt!351973))) (BitStream!8713 (buf!5349 (_2!10225 lt!351510)) (bvadd (currentByte!10019 (_2!10225 lt!351510)) #b00000000000000000000000000000001) (currentBit!10014 (_2!10225 lt!351510)))))))

(declare-fun b!223074 () Bool)

(declare-fun e!151787 () Bool)

(assert (=> b!223074 (= e!151786 e!151787)))

(declare-fun res!187270 () Bool)

(assert (=> b!223074 (=> (not res!187270) (not e!151787))))

(declare-fun lt!351978 () tuple2!19030)

(assert (=> b!223074 (= res!187270 (= (buf!5349 (_2!10225 lt!351978)) (buf!5349 (_2!10225 lt!351510))))))

(declare-fun lt!351974 () (_ BitVec 8))

(declare-fun lt!351976 () (_ BitVec 8))

(declare-fun Unit!16086 () Unit!16047)

(declare-fun Unit!16087 () Unit!16047)

(assert (=> b!223074 (= lt!351978 (tuple2!19031 (_2!10232 (ite (bvsgt ((_ sign_extend 24) lt!351974) #b00000000000000000000000000000000) (tuple2!19041 Unit!16086 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!351976) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5735 (buf!5349 (_2!10225 lt!351510))) (bvadd (currentByte!10019 (_2!10225 lt!351510)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!351974)))))))) (tuple2!19041 Unit!16087 lt!351976))) (BitStream!8713 (buf!5349 (_2!10225 lt!351510)) (bvadd (currentByte!10019 (_2!10225 lt!351510)) #b00000000000000000000000000000001) (currentBit!10014 (_2!10225 lt!351510)))))))

(assert (=> b!223074 (= lt!351976 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5735 (buf!5349 (_2!10225 lt!351510))) (currentByte!10019 (_2!10225 lt!351510)))) ((_ sign_extend 24) lt!351974))))))

(assert (=> b!223074 (= lt!351974 ((_ extract 7 0) (currentBit!10014 (_2!10225 lt!351510))))))

(declare-fun b!223075 () Bool)

(declare-fun lt!351972 () (_ BitVec 64))

(declare-fun lt!351975 () (_ BitVec 64))

(assert (=> b!223075 (= e!151787 (= (bitIndex!0 (size!4805 (buf!5349 (_2!10225 lt!351978))) (currentByte!10019 (_2!10225 lt!351978)) (currentBit!10014 (_2!10225 lt!351978))) (bvadd lt!351972 lt!351975)))))

(assert (=> b!223075 (or (not (= (bvand lt!351972 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!351975 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!351972 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!351972 lt!351975) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!223075 (= lt!351975 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!223075 (= lt!351972 (bitIndex!0 (size!4805 (buf!5349 (_2!10225 lt!351510))) (currentByte!10019 (_2!10225 lt!351510)) (currentBit!10014 (_2!10225 lt!351510))))))

(assert (= (and d!75464 res!187269) b!223074))

(assert (= (and b!223074 res!187270) b!223075))

(declare-fun m!341485 () Bool)

(assert (=> d!75464 m!341485))

(declare-fun m!341487 () Bool)

(assert (=> d!75464 m!341487))

(declare-fun m!341489 () Bool)

(assert (=> d!75464 m!341489))

(assert (=> b!223074 m!341489))

(assert (=> b!223074 m!341485))

(declare-fun m!341491 () Bool)

(assert (=> b!223075 m!341491))

(assert (=> b!223075 m!341409))

(assert (=> b!223053 d!75464))

(assert (=> b!223053 d!75454))

(declare-fun d!75466 () Bool)

(assert (=> d!75466 (arrayRangesEq!706 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308)) (_3!710 lt!351922) lt!351918 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!351981 () Unit!16047)

(declare-fun choose!264 (array!10946 array!10946 array!10946 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16047)

(assert (=> d!75466 (= lt!351981 (choose!264 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308)) lt!351908 (_3!710 lt!351922) lt!351918 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> d!75466 (and (bvsle #b00000000000000000000000000000000 lt!351918) (bvsle lt!351918 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> d!75466 (= (arrayRangesEqTransitive!192 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308)) lt!351908 (_3!710 lt!351922) lt!351918 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)) lt!351981)))

(declare-fun bs!18423 () Bool)

(assert (= bs!18423 d!75466))

(assert (=> bs!18423 m!341421))

(declare-fun m!341493 () Bool)

(assert (=> bs!18423 m!341493))

(assert (=> b!223053 d!75466))

(declare-fun lt!351997 () (_ BitVec 32))

(declare-fun lt!351986 () array!10946)

(declare-fun c!11074 () Bool)

(declare-fun lt!352012 () tuple2!19030)

(declare-fun call!3439 () Bool)

(declare-fun lt!352006 () array!10946)

(declare-fun bm!3436 () Bool)

(declare-fun lt!351991 () (_ BitVec 32))

(assert (=> bm!3436 (= call!3439 (arrayRangesEq!706 (ite c!11074 lt!351908 lt!351986) (ite c!11074 (array!10947 (store (arr!5735 lt!351908) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) (_1!10225 lt!352012)) (size!4805 lt!351908)) lt!352006) (ite c!11074 #b00000000000000000000000000000000 lt!351991) (ite c!11074 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) lt!351997)))))

(declare-fun call!3441 () (_ BitVec 64))

(declare-fun bm!3437 () Bool)

(assert (=> bm!3437 (= call!3441 (bitIndex!0 (ite c!11074 (size!4805 (buf!5349 (_2!10225 lt!352012))) (size!4805 (buf!5349 (_2!10225 lt!351921)))) (ite c!11074 (currentByte!10019 (_2!10225 lt!352012)) (currentByte!10019 (_2!10225 lt!351921))) (ite c!11074 (currentBit!10014 (_2!10225 lt!352012)) (currentBit!10014 (_2!10225 lt!351921)))))))

(declare-fun b!223076 () Bool)

(declare-fun e!151788 () tuple3!1136)

(declare-fun lt!352015 () Unit!16047)

(assert (=> b!223076 (= e!151788 (tuple3!1137 lt!352015 (_2!10225 lt!351921) lt!351908))))

(assert (=> b!223076 (= call!3441 call!3441)))

(declare-fun lt!351998 () Unit!16047)

(declare-fun Unit!16088 () Unit!16047)

(assert (=> b!223076 (= lt!351998 Unit!16088)))

(declare-fun lt!351990 () Unit!16047)

(assert (=> b!223076 (= lt!351990 (arrayRangesEqReflexiveLemma!58 lt!351908))))

(declare-fun call!3440 () Bool)

(assert (=> b!223076 call!3440))

(declare-fun lt!351995 () Unit!16047)

(assert (=> b!223076 (= lt!351995 lt!351990)))

(assert (=> b!223076 (= lt!351986 lt!351908)))

(assert (=> b!223076 (= lt!352006 lt!351908)))

(declare-fun lt!351989 () (_ BitVec 32))

(assert (=> b!223076 (= lt!351989 #b00000000000000000000000000000000)))

(declare-fun lt!352001 () (_ BitVec 32))

(assert (=> b!223076 (= lt!352001 (size!4805 lt!351908))))

(assert (=> b!223076 (= lt!351991 #b00000000000000000000000000000000)))

(assert (=> b!223076 (= lt!351997 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001))))

(assert (=> b!223076 (= lt!352015 (arrayRangesEqSlicedLemma!58 lt!351986 lt!352006 lt!351989 lt!352001 lt!351991 lt!351997))))

(assert (=> b!223076 call!3439))

(declare-fun b!223077 () Bool)

(declare-fun e!151790 () Bool)

(declare-fun lt!352017 () tuple3!1136)

(assert (=> b!223077 (= e!151790 (= (select (arr!5735 (_3!710 lt!352017)) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)) (_2!10234 (readBytePure!0 (_2!10225 lt!351921)))))))

(assert (=> b!223077 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) (size!4805 (_3!710 lt!352017))))))

(declare-fun d!75468 () Bool)

(assert (=> d!75468 e!151790))

(declare-fun res!187273 () Bool)

(assert (=> d!75468 (=> res!187273 e!151790)))

(assert (=> d!75468 (= res!187273 (bvsge (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(declare-fun lt!352005 () Bool)

(declare-fun e!151789 () Bool)

(assert (=> d!75468 (= lt!352005 e!151789)))

(declare-fun res!187272 () Bool)

(assert (=> d!75468 (=> (not res!187272) (not e!151789))))

(declare-fun lt!351982 () (_ BitVec 64))

(declare-fun lt!351984 () (_ BitVec 64))

(assert (=> d!75468 (= res!187272 (= (bvadd lt!351984 lt!351982) (bitIndex!0 (size!4805 (buf!5349 (_2!10226 lt!352017))) (currentByte!10019 (_2!10226 lt!352017)) (currentBit!10014 (_2!10226 lt!352017)))))))

(assert (=> d!75468 (or (not (= (bvand lt!351984 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!351982 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!351984 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!351984 lt!351982) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!351983 () (_ BitVec 64))

(assert (=> d!75468 (= lt!351982 (bvmul lt!351983 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!75468 (or (= lt!351983 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!351983 #b0000000000000000000000000000000000000000000000000000000000001000) lt!351983)))))

(assert (=> d!75468 (= lt!351983 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001))))))

(assert (=> d!75468 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> d!75468 (= lt!351984 (bitIndex!0 (size!4805 (buf!5349 (_2!10225 lt!351921))) (currentByte!10019 (_2!10225 lt!351921)) (currentBit!10014 (_2!10225 lt!351921))))))

(assert (=> d!75468 (= lt!352017 e!151788)))

(assert (=> d!75468 (= c!11074 (bvslt (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> d!75468 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496) (bvsle to!496 (size!4805 lt!351908)))))

(assert (=> d!75468 (= (readByteArrayLoop!0 (_2!10225 lt!351921) lt!351908 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496) lt!352017)))

(declare-fun b!223078 () Bool)

(declare-fun res!187271 () Bool)

(assert (=> b!223078 (=> (not res!187271) (not e!151789))))

(assert (=> b!223078 (= res!187271 (and (= (buf!5349 (_2!10225 lt!351921)) (buf!5349 (_2!10226 lt!352017))) (= (size!4805 lt!351908) (size!4805 (_3!710 lt!352017)))))))

(declare-fun bm!3438 () Bool)

(declare-fun lt!352013 () tuple3!1136)

(assert (=> bm!3438 (= call!3440 (arrayRangesEq!706 lt!351908 (ite c!11074 (_3!710 lt!352013) lt!351908) #b00000000000000000000000000000000 (ite c!11074 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) (size!4805 lt!351908))))))

(declare-fun b!223079 () Bool)

(assert (=> b!223079 (= e!151789 (arrayRangesEq!706 lt!351908 (_3!710 lt!352017) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(declare-fun b!223080 () Bool)

(declare-fun lt!352016 () Unit!16047)

(assert (=> b!223080 (= e!151788 (tuple3!1137 lt!352016 (_2!10226 lt!352013) (_3!710 lt!352013)))))

(assert (=> b!223080 (= lt!352012 (readByte!0 (_2!10225 lt!351921)))))

(declare-fun lt!351999 () array!10946)

(assert (=> b!223080 (= lt!351999 (array!10947 (store (arr!5735 lt!351908) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) (_1!10225 lt!352012)) (size!4805 lt!351908)))))

(declare-fun lt!352004 () (_ BitVec 64))

(assert (=> b!223080 (= lt!352004 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!351987 () (_ BitVec 32))

(assert (=> b!223080 (= lt!351987 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(declare-fun lt!352000 () Unit!16047)

(assert (=> b!223080 (= lt!352000 (validateOffsetBytesFromBitIndexLemma!0 (_2!10225 lt!351921) (_2!10225 lt!352012) lt!352004 lt!351987))))

(assert (=> b!223080 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4805 (buf!5349 (_2!10225 lt!352012)))) ((_ sign_extend 32) (currentByte!10019 (_2!10225 lt!352012))) ((_ sign_extend 32) (currentBit!10014 (_2!10225 lt!352012))) (bvsub lt!351987 ((_ extract 31 0) (bvsdiv (bvadd lt!352004 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!352011 () Unit!16047)

(assert (=> b!223080 (= lt!352011 lt!352000)))

(assert (=> b!223080 (= lt!352013 (readByteArrayLoop!0 (_2!10225 lt!352012) lt!351999 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!496))))

(assert (=> b!223080 (= call!3441 (bvadd (bitIndex!0 (size!4805 (buf!5349 (_2!10225 lt!351921))) (currentByte!10019 (_2!10225 lt!351921)) (currentBit!10014 (_2!10225 lt!351921))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!351988 () Unit!16047)

(declare-fun Unit!16089 () Unit!16047)

(assert (=> b!223080 (= lt!351988 Unit!16089)))

(assert (=> b!223080 (= (bvadd call!3441 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4805 (buf!5349 (_2!10226 lt!352013))) (currentByte!10019 (_2!10226 lt!352013)) (currentBit!10014 (_2!10226 lt!352013))))))

(declare-fun lt!351985 () Unit!16047)

(declare-fun Unit!16090 () Unit!16047)

(assert (=> b!223080 (= lt!351985 Unit!16090)))

(assert (=> b!223080 (= (bvadd (bitIndex!0 (size!4805 (buf!5349 (_2!10225 lt!351921))) (currentByte!10019 (_2!10225 lt!351921)) (currentBit!10014 (_2!10225 lt!351921))) (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4805 (buf!5349 (_2!10226 lt!352013))) (currentByte!10019 (_2!10226 lt!352013)) (currentBit!10014 (_2!10226 lt!352013))))))

(declare-fun lt!352003 () Unit!16047)

(declare-fun Unit!16091 () Unit!16047)

(assert (=> b!223080 (= lt!352003 Unit!16091)))

(assert (=> b!223080 (and (= (buf!5349 (_2!10225 lt!351921)) (buf!5349 (_2!10226 lt!352013))) (= (size!4805 lt!351908) (size!4805 (_3!710 lt!352013))))))

(declare-fun lt!352002 () Unit!16047)

(declare-fun Unit!16092 () Unit!16047)

(assert (=> b!223080 (= lt!352002 Unit!16092)))

(declare-fun lt!352007 () Unit!16047)

(assert (=> b!223080 (= lt!352007 (arrayUpdatedAtPrefixLemma!298 lt!351908 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) (_1!10225 lt!352012)))))

(assert (=> b!223080 call!3439))

(declare-fun lt!352008 () Unit!16047)

(assert (=> b!223080 (= lt!352008 lt!352007)))

(declare-fun lt!352009 () (_ BitVec 32))

(assert (=> b!223080 (= lt!352009 #b00000000000000000000000000000000)))

(declare-fun lt!351994 () Unit!16047)

(assert (=> b!223080 (= lt!351994 (arrayRangesEqTransitive!192 lt!351908 lt!351999 (_3!710 lt!352013) lt!352009 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!223080 (arrayRangesEq!706 lt!351908 (_3!710 lt!352013) lt!352009 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001))))

(declare-fun lt!351992 () Unit!16047)

(assert (=> b!223080 (= lt!351992 lt!351994)))

(assert (=> b!223080 call!3440))

(declare-fun lt!352010 () Unit!16047)

(declare-fun Unit!16093 () Unit!16047)

(assert (=> b!223080 (= lt!352010 Unit!16093)))

(declare-fun lt!352014 () Unit!16047)

(assert (=> b!223080 (= lt!352014 (arrayRangesEqImpliesEq!67 lt!351999 (_3!710 lt!352013) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!223080 (= (select (store (arr!5735 lt!351908) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) (_1!10225 lt!352012)) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)) (select (arr!5735 (_3!710 lt!352013)) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(declare-fun lt!351993 () Unit!16047)

(assert (=> b!223080 (= lt!351993 lt!352014)))

(declare-fun lt!351996 () Bool)

(assert (=> b!223080 (= lt!351996 (= (select (arr!5735 (_3!710 lt!352013)) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)) (_1!10225 lt!352012)))))

(declare-fun Unit!16094 () Unit!16047)

(assert (=> b!223080 (= lt!352016 Unit!16094)))

(assert (=> b!223080 lt!351996))

(assert (= (and d!75468 c!11074) b!223080))

(assert (= (and d!75468 (not c!11074)) b!223076))

(assert (= (or b!223080 b!223076) bm!3436))

(assert (= (or b!223080 b!223076) bm!3438))

(assert (= (or b!223080 b!223076) bm!3437))

(assert (= (and d!75468 res!187272) b!223078))

(assert (= (and b!223078 res!187271) b!223079))

(assert (= (and d!75468 (not res!187273)) b!223077))

(declare-fun m!341495 () Bool)

(assert (=> b!223080 m!341495))

(declare-fun m!341497 () Bool)

(assert (=> b!223080 m!341497))

(declare-fun m!341499 () Bool)

(assert (=> b!223080 m!341499))

(declare-fun m!341501 () Bool)

(assert (=> b!223080 m!341501))

(declare-fun m!341503 () Bool)

(assert (=> b!223080 m!341503))

(declare-fun m!341505 () Bool)

(assert (=> b!223080 m!341505))

(declare-fun m!341507 () Bool)

(assert (=> b!223080 m!341507))

(declare-fun m!341509 () Bool)

(assert (=> b!223080 m!341509))

(declare-fun m!341511 () Bool)

(assert (=> b!223080 m!341511))

(declare-fun m!341513 () Bool)

(assert (=> b!223080 m!341513))

(declare-fun m!341515 () Bool)

(assert (=> b!223080 m!341515))

(declare-fun m!341517 () Bool)

(assert (=> b!223080 m!341517))

(declare-fun m!341519 () Bool)

(assert (=> b!223080 m!341519))

(declare-fun m!341521 () Bool)

(assert (=> b!223076 m!341521))

(declare-fun m!341523 () Bool)

(assert (=> b!223076 m!341523))

(declare-fun m!341525 () Bool)

(assert (=> b!223079 m!341525))

(declare-fun m!341527 () Bool)

(assert (=> d!75468 m!341527))

(assert (=> d!75468 m!341495))

(declare-fun m!341529 () Bool)

(assert (=> b!223077 m!341529))

(declare-fun m!341531 () Bool)

(assert (=> b!223077 m!341531))

(declare-fun m!341533 () Bool)

(assert (=> bm!3438 m!341533))

(declare-fun m!341535 () Bool)

(assert (=> bm!3437 m!341535))

(assert (=> bm!3436 m!341505))

(declare-fun m!341537 () Bool)

(assert (=> bm!3436 m!341537))

(assert (=> b!223053 d!75468))

(declare-fun d!75470 () Bool)

(declare-fun e!151791 () Bool)

(assert (=> d!75470 e!151791))

(declare-fun res!187274 () Bool)

(assert (=> d!75470 (=> (not res!187274) (not e!151791))))

(assert (=> d!75470 (= res!187274 (and (or (let ((rhs!3620 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand lt!351913 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3620 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand lt!351913 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!351913 rhs!3620) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!75432 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!75432 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd lt!351913 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!75432 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3619 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand lt!351913 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3619 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!351913 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!351913 rhs!3619) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!352019 () Unit!16047)

(assert (=> d!75470 (= lt!352019 (choose!57 (_2!10225 lt!351510) (_2!10225 lt!351921) lt!351913 lt!351896))))

(assert (=> d!75470 (= (validateOffsetBytesFromBitIndexLemma!0 (_2!10225 lt!351510) (_2!10225 lt!351921) lt!351913 lt!351896) lt!352019)))

(declare-fun b!223081 () Bool)

(declare-fun lt!352020 () (_ BitVec 32))

(assert (=> b!223081 (= e!151791 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4805 (buf!5349 (_2!10225 lt!351921)))) ((_ sign_extend 32) (currentByte!10019 (_2!10225 lt!351921))) ((_ sign_extend 32) (currentBit!10014 (_2!10225 lt!351921))) (bvsub lt!351896 lt!352020)))))

(assert (=> b!223081 (or (= (bvand lt!351896 #b10000000000000000000000000000000) (bvand lt!352020 #b10000000000000000000000000000000)) (= (bvand lt!351896 #b10000000000000000000000000000000) (bvand (bvsub lt!351896 lt!352020) #b10000000000000000000000000000000)))))

(declare-fun lt!352018 () (_ BitVec 64))

(assert (=> b!223081 (= lt!352020 ((_ extract 31 0) lt!352018))))

(assert (=> b!223081 (and (bvslt lt!352018 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!352018 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!223081 (= lt!352018 (bvsdiv (bvadd lt!351913 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!75470 res!187274) b!223081))

(declare-fun m!341539 () Bool)

(assert (=> d!75470 m!341539))

(declare-fun m!341541 () Bool)

(assert (=> b!223081 m!341541))

(assert (=> b!223053 d!75470))

(declare-fun d!75472 () Bool)

(declare-fun e!151792 () Bool)

(assert (=> d!75472 e!151792))

(declare-fun res!187275 () Bool)

(assert (=> d!75472 (=> (not res!187275) (not e!151792))))

(declare-fun lt!352023 () (_ BitVec 64))

(declare-fun lt!352021 () (_ BitVec 64))

(declare-fun lt!352024 () (_ BitVec 64))

(assert (=> d!75472 (= res!187275 (= lt!352021 (bvsub lt!352023 lt!352024)))))

(assert (=> d!75472 (or (= (bvand lt!352023 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!352024 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!352023 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!352023 lt!352024) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75472 (= lt!352024 (remainingBits!0 ((_ sign_extend 32) (size!4805 (buf!5349 (_2!10226 lt!351922)))) ((_ sign_extend 32) (currentByte!10019 (_2!10226 lt!351922))) ((_ sign_extend 32) (currentBit!10014 (_2!10226 lt!351922)))))))

(declare-fun lt!352025 () (_ BitVec 64))

(declare-fun lt!352022 () (_ BitVec 64))

(assert (=> d!75472 (= lt!352023 (bvmul lt!352025 lt!352022))))

(assert (=> d!75472 (or (= lt!352025 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!352022 (bvsdiv (bvmul lt!352025 lt!352022) lt!352025)))))

(assert (=> d!75472 (= lt!352022 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75472 (= lt!352025 ((_ sign_extend 32) (size!4805 (buf!5349 (_2!10226 lt!351922)))))))

(assert (=> d!75472 (= lt!352021 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10019 (_2!10226 lt!351922))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10014 (_2!10226 lt!351922)))))))

(assert (=> d!75472 (invariant!0 (currentBit!10014 (_2!10226 lt!351922)) (currentByte!10019 (_2!10226 lt!351922)) (size!4805 (buf!5349 (_2!10226 lt!351922))))))

(assert (=> d!75472 (= (bitIndex!0 (size!4805 (buf!5349 (_2!10226 lt!351922))) (currentByte!10019 (_2!10226 lt!351922)) (currentBit!10014 (_2!10226 lt!351922))) lt!352021)))

(declare-fun b!223082 () Bool)

(declare-fun res!187276 () Bool)

(assert (=> b!223082 (=> (not res!187276) (not e!151792))))

(assert (=> b!223082 (= res!187276 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!352021))))

(declare-fun b!223083 () Bool)

(declare-fun lt!352026 () (_ BitVec 64))

(assert (=> b!223083 (= e!151792 (bvsle lt!352021 (bvmul lt!352026 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223083 (or (= lt!352026 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!352026 #b0000000000000000000000000000000000000000000000000000000000001000) lt!352026)))))

(assert (=> b!223083 (= lt!352026 ((_ sign_extend 32) (size!4805 (buf!5349 (_2!10226 lt!351922)))))))

(assert (= (and d!75472 res!187275) b!223082))

(assert (= (and b!223082 res!187276) b!223083))

(declare-fun m!341543 () Bool)

(assert (=> d!75472 m!341543))

(declare-fun m!341545 () Bool)

(assert (=> d!75472 m!341545))

(assert (=> b!223053 d!75472))

(declare-fun d!75474 () Bool)

(assert (=> d!75474 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4805 lt!351908)) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4805 (_3!710 lt!351922))) (= (select (arr!5735 lt!351908) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5735 (_3!710 lt!351922)) (bvadd #b00000000000000000000000000000001 i!761))))))

(declare-fun lt!352029 () Unit!16047)

(declare-fun choose!265 (array!10946 array!10946 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16047)

(assert (=> d!75474 (= lt!352029 (choose!265 lt!351908 (_3!710 lt!351922) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> d!75474 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> d!75474 (= (arrayRangesEqImpliesEq!67 lt!351908 (_3!710 lt!351922) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)) lt!352029)))

(declare-fun bs!18424 () Bool)

(assert (= bs!18424 d!75474))

(declare-fun m!341547 () Bool)

(assert (=> bs!18424 m!341547))

(assert (=> bs!18424 m!341411))

(declare-fun m!341549 () Bool)

(assert (=> bs!18424 m!341549))

(assert (=> b!223053 d!75474))

(declare-fun d!75476 () Bool)

(declare-fun res!187277 () Bool)

(declare-fun e!151793 () Bool)

(assert (=> d!75476 (=> res!187277 e!151793)))

(assert (=> d!75476 (= res!187277 (= lt!351918 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!75476 (= (arrayRangesEq!706 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308)) (_3!710 lt!351922) lt!351918 (bvadd #b00000000000000000000000000000001 i!761)) e!151793)))

(declare-fun b!223084 () Bool)

(declare-fun e!151794 () Bool)

(assert (=> b!223084 (= e!151793 e!151794)))

(declare-fun res!187278 () Bool)

(assert (=> b!223084 (=> (not res!187278) (not e!151794))))

(assert (=> b!223084 (= res!187278 (= (select (arr!5735 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308))) lt!351918) (select (arr!5735 (_3!710 lt!351922)) lt!351918)))))

(declare-fun b!223085 () Bool)

(assert (=> b!223085 (= e!151794 (arrayRangesEq!706 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308)) (_3!710 lt!351922) (bvadd lt!351918 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (= (and d!75476 (not res!187277)) b!223084))

(assert (= (and b!223084 res!187278) b!223085))

(declare-fun m!341551 () Bool)

(assert (=> b!223084 m!341551))

(declare-fun m!341553 () Bool)

(assert (=> b!223084 m!341553))

(declare-fun m!341555 () Bool)

(assert (=> b!223085 m!341555))

(assert (=> b!223053 d!75476))

(declare-fun d!75478 () Bool)

(assert (=> d!75478 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4805 (buf!5349 (_2!10225 lt!351510)))) ((_ sign_extend 32) (currentByte!10019 (_2!10225 lt!351510))) ((_ sign_extend 32) (currentBit!10014 (_2!10225 lt!351510))) (bvsub (bvsub to!496 i!761) lt!351935)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!496 i!761) lt!351935)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4805 (buf!5349 (_2!10225 lt!351510)))) ((_ sign_extend 32) (currentByte!10019 (_2!10225 lt!351510))) ((_ sign_extend 32) (currentBit!10014 (_2!10225 lt!351510)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18425 () Bool)

(assert (= bs!18425 d!75478))

(assert (=> bs!18425 m!341299))

(assert (=> b!223056 d!75478))

(declare-fun d!75480 () Bool)

(declare-fun res!187279 () Bool)

(declare-fun e!151795 () Bool)

(assert (=> d!75480 (=> res!187279 e!151795)))

(assert (=> d!75480 (= res!187279 (= #b00000000000000000000000000000000 (ite c!11073 (bvadd #b00000000000000000000000000000001 i!761) (size!4805 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308))))))))

(assert (=> d!75480 (= (arrayRangesEq!706 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308)) (ite c!11073 (_3!710 lt!351922) (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308))) #b00000000000000000000000000000000 (ite c!11073 (bvadd #b00000000000000000000000000000001 i!761) (size!4805 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308))))) e!151795)))

(declare-fun b!223086 () Bool)

(declare-fun e!151796 () Bool)

(assert (=> b!223086 (= e!151795 e!151796)))

(declare-fun res!187280 () Bool)

(assert (=> b!223086 (=> (not res!187280) (not e!151796))))

(assert (=> b!223086 (= res!187280 (= (select (arr!5735 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308))) #b00000000000000000000000000000000) (select (arr!5735 (ite c!11073 (_3!710 lt!351922) (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308)))) #b00000000000000000000000000000000)))))

(declare-fun b!223087 () Bool)

(assert (=> b!223087 (= e!151796 (arrayRangesEq!706 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308)) (ite c!11073 (_3!710 lt!351922) (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!11073 (bvadd #b00000000000000000000000000000001 i!761) (size!4805 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308))))))))

(assert (= (and d!75480 (not res!187279)) b!223086))

(assert (= (and b!223086 res!187280) b!223087))

(assert (=> b!223086 m!341473))

(declare-fun m!341557 () Bool)

(assert (=> b!223086 m!341557))

(declare-fun m!341559 () Bool)

(assert (=> b!223087 m!341559))

(assert (=> bm!3435 d!75480))

(declare-fun d!75482 () Bool)

(assert (=> d!75482 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4805 (buf!5349 (_2!10225 lt!351510)))) ((_ sign_extend 32) (currentByte!10019 (_2!10225 lt!351510))) ((_ sign_extend 32) (currentBit!10014 (_2!10225 lt!351510))) (bvsub (bvsub to!496 i!761) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!75482 true))

(declare-fun _$7!124 () Unit!16047)

(assert (=> d!75482 (= (choose!57 thiss!1870 (_2!10225 lt!351510) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) _$7!124)))

(declare-fun bs!18426 () Bool)

(assert (= bs!18426 d!75482))

(declare-fun m!341561 () Bool)

(assert (=> bs!18426 m!341561))

(assert (=> d!75431 d!75482))

(declare-fun d!75484 () Bool)

(declare-fun e!151797 () Bool)

(assert (=> d!75484 e!151797))

(declare-fun res!187281 () Bool)

(assert (=> d!75484 (=> (not res!187281) (not e!151797))))

(declare-fun lt!352032 () (_ BitVec 64))

(declare-fun lt!352033 () (_ BitVec 64))

(declare-fun lt!352030 () (_ BitVec 64))

(assert (=> d!75484 (= res!187281 (= lt!352030 (bvsub lt!352032 lt!352033)))))

(assert (=> d!75484 (or (= (bvand lt!352032 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!352033 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!352032 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!352032 lt!352033) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75484 (= lt!352033 (remainingBits!0 ((_ sign_extend 32) (ite c!11073 (size!4805 (buf!5349 (_2!10225 lt!351921))) (size!4805 (buf!5349 (_2!10225 lt!351510))))) ((_ sign_extend 32) (ite c!11073 (currentByte!10019 (_2!10225 lt!351921)) (currentByte!10019 (_2!10225 lt!351510)))) ((_ sign_extend 32) (ite c!11073 (currentBit!10014 (_2!10225 lt!351921)) (currentBit!10014 (_2!10225 lt!351510))))))))

(declare-fun lt!352034 () (_ BitVec 64))

(declare-fun lt!352031 () (_ BitVec 64))

(assert (=> d!75484 (= lt!352032 (bvmul lt!352034 lt!352031))))

(assert (=> d!75484 (or (= lt!352034 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!352031 (bvsdiv (bvmul lt!352034 lt!352031) lt!352034)))))

(assert (=> d!75484 (= lt!352031 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75484 (= lt!352034 ((_ sign_extend 32) (ite c!11073 (size!4805 (buf!5349 (_2!10225 lt!351921))) (size!4805 (buf!5349 (_2!10225 lt!351510))))))))

(assert (=> d!75484 (= lt!352030 (bvadd (bvmul ((_ sign_extend 32) (ite c!11073 (currentByte!10019 (_2!10225 lt!351921)) (currentByte!10019 (_2!10225 lt!351510)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite c!11073 (currentBit!10014 (_2!10225 lt!351921)) (currentBit!10014 (_2!10225 lt!351510))))))))

(assert (=> d!75484 (invariant!0 (ite c!11073 (currentBit!10014 (_2!10225 lt!351921)) (currentBit!10014 (_2!10225 lt!351510))) (ite c!11073 (currentByte!10019 (_2!10225 lt!351921)) (currentByte!10019 (_2!10225 lt!351510))) (ite c!11073 (size!4805 (buf!5349 (_2!10225 lt!351921))) (size!4805 (buf!5349 (_2!10225 lt!351510)))))))

(assert (=> d!75484 (= (bitIndex!0 (ite c!11073 (size!4805 (buf!5349 (_2!10225 lt!351921))) (size!4805 (buf!5349 (_2!10225 lt!351510)))) (ite c!11073 (currentByte!10019 (_2!10225 lt!351921)) (currentByte!10019 (_2!10225 lt!351510))) (ite c!11073 (currentBit!10014 (_2!10225 lt!351921)) (currentBit!10014 (_2!10225 lt!351510)))) lt!352030)))

(declare-fun b!223088 () Bool)

(declare-fun res!187282 () Bool)

(assert (=> b!223088 (=> (not res!187282) (not e!151797))))

(assert (=> b!223088 (= res!187282 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!352030))))

(declare-fun b!223089 () Bool)

(declare-fun lt!352035 () (_ BitVec 64))

(assert (=> b!223089 (= e!151797 (bvsle lt!352030 (bvmul lt!352035 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223089 (or (= lt!352035 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!352035 #b0000000000000000000000000000000000000000000000000000000000001000) lt!352035)))))

(assert (=> b!223089 (= lt!352035 ((_ sign_extend 32) (ite c!11073 (size!4805 (buf!5349 (_2!10225 lt!351921))) (size!4805 (buf!5349 (_2!10225 lt!351510))))))))

(assert (= (and d!75484 res!187281) b!223088))

(assert (= (and b!223088 res!187282) b!223089))

(declare-fun m!341563 () Bool)

(assert (=> d!75484 m!341563))

(declare-fun m!341565 () Bool)

(assert (=> d!75484 m!341565))

(assert (=> bm!3434 d!75484))

(declare-fun d!75486 () Bool)

(declare-fun e!151798 () Bool)

(assert (=> d!75486 e!151798))

(declare-fun res!187283 () Bool)

(assert (=> d!75486 (=> (not res!187283) (not e!151798))))

(declare-fun lt!352039 () (_ BitVec 64))

(declare-fun lt!352036 () (_ BitVec 64))

(declare-fun lt!352038 () (_ BitVec 64))

(assert (=> d!75486 (= res!187283 (= lt!352036 (bvsub lt!352038 lt!352039)))))

(assert (=> d!75486 (or (= (bvand lt!352038 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!352039 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!352038 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!352038 lt!352039) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75486 (= lt!352039 (remainingBits!0 ((_ sign_extend 32) (size!4805 (buf!5349 (_2!10225 lt!351572)))) ((_ sign_extend 32) (currentByte!10019 (_2!10225 lt!351572))) ((_ sign_extend 32) (currentBit!10014 (_2!10225 lt!351572)))))))

(declare-fun lt!352040 () (_ BitVec 64))

(declare-fun lt!352037 () (_ BitVec 64))

(assert (=> d!75486 (= lt!352038 (bvmul lt!352040 lt!352037))))

(assert (=> d!75486 (or (= lt!352040 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!352037 (bvsdiv (bvmul lt!352040 lt!352037) lt!352040)))))

(assert (=> d!75486 (= lt!352037 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75486 (= lt!352040 ((_ sign_extend 32) (size!4805 (buf!5349 (_2!10225 lt!351572)))))))

(assert (=> d!75486 (= lt!352036 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10019 (_2!10225 lt!351572))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10014 (_2!10225 lt!351572)))))))

(assert (=> d!75486 (invariant!0 (currentBit!10014 (_2!10225 lt!351572)) (currentByte!10019 (_2!10225 lt!351572)) (size!4805 (buf!5349 (_2!10225 lt!351572))))))

(assert (=> d!75486 (= (bitIndex!0 (size!4805 (buf!5349 (_2!10225 lt!351572))) (currentByte!10019 (_2!10225 lt!351572)) (currentBit!10014 (_2!10225 lt!351572))) lt!352036)))

(declare-fun b!223090 () Bool)

(declare-fun res!187284 () Bool)

(assert (=> b!223090 (=> (not res!187284) (not e!151798))))

(assert (=> b!223090 (= res!187284 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!352036))))

(declare-fun b!223091 () Bool)

(declare-fun lt!352041 () (_ BitVec 64))

(assert (=> b!223091 (= e!151798 (bvsle lt!352036 (bvmul lt!352041 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223091 (or (= lt!352041 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!352041 #b0000000000000000000000000000000000000000000000000000000000001000) lt!352041)))))

(assert (=> b!223091 (= lt!352041 ((_ sign_extend 32) (size!4805 (buf!5349 (_2!10225 lt!351572)))))))

(assert (= (and d!75486 res!187283) b!223090))

(assert (= (and b!223090 res!187284) b!223091))

(declare-fun m!341567 () Bool)

(assert (=> d!75486 m!341567))

(declare-fun m!341569 () Bool)

(assert (=> d!75486 m!341569))

(assert (=> b!222999 d!75486))

(declare-fun d!75488 () Bool)

(declare-fun e!151799 () Bool)

(assert (=> d!75488 e!151799))

(declare-fun res!187285 () Bool)

(assert (=> d!75488 (=> (not res!187285) (not e!151799))))

(declare-fun lt!352044 () (_ BitVec 64))

(declare-fun lt!352045 () (_ BitVec 64))

(declare-fun lt!352042 () (_ BitVec 64))

(assert (=> d!75488 (= res!187285 (= lt!352042 (bvsub lt!352044 lt!352045)))))

(assert (=> d!75488 (or (= (bvand lt!352044 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!352045 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!352044 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!352044 lt!352045) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75488 (= lt!352045 (remainingBits!0 ((_ sign_extend 32) (size!4805 (buf!5349 thiss!1870))) ((_ sign_extend 32) (currentByte!10019 thiss!1870)) ((_ sign_extend 32) (currentBit!10014 thiss!1870))))))

(declare-fun lt!352046 () (_ BitVec 64))

(declare-fun lt!352043 () (_ BitVec 64))

(assert (=> d!75488 (= lt!352044 (bvmul lt!352046 lt!352043))))

(assert (=> d!75488 (or (= lt!352046 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!352043 (bvsdiv (bvmul lt!352046 lt!352043) lt!352046)))))

(assert (=> d!75488 (= lt!352043 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75488 (= lt!352046 ((_ sign_extend 32) (size!4805 (buf!5349 thiss!1870))))))

(assert (=> d!75488 (= lt!352042 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10019 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10014 thiss!1870))))))

(assert (=> d!75488 (invariant!0 (currentBit!10014 thiss!1870) (currentByte!10019 thiss!1870) (size!4805 (buf!5349 thiss!1870)))))

(assert (=> d!75488 (= (bitIndex!0 (size!4805 (buf!5349 thiss!1870)) (currentByte!10019 thiss!1870) (currentBit!10014 thiss!1870)) lt!352042)))

(declare-fun b!223092 () Bool)

(declare-fun res!187286 () Bool)

(assert (=> b!223092 (=> (not res!187286) (not e!151799))))

(assert (=> b!223092 (= res!187286 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!352042))))

(declare-fun b!223093 () Bool)

(declare-fun lt!352047 () (_ BitVec 64))

(assert (=> b!223093 (= e!151799 (bvsle lt!352042 (bvmul lt!352047 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223093 (or (= lt!352047 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!352047 #b0000000000000000000000000000000000000000000000000000000000001000) lt!352047)))))

(assert (=> b!223093 (= lt!352047 ((_ sign_extend 32) (size!4805 (buf!5349 thiss!1870))))))

(assert (= (and d!75488 res!187285) b!223092))

(assert (= (and b!223092 res!187286) b!223093))

(assert (=> d!75488 m!341457))

(assert (=> d!75488 m!341459))

(assert (=> b!222999 d!75488))

(declare-fun d!75490 () Bool)

(assert (=> d!75490 (= (invariant!0 (currentBit!10014 thiss!1870) (currentByte!10019 thiss!1870) (size!4805 (buf!5349 thiss!1870))) (and (bvsge (currentBit!10014 thiss!1870) #b00000000000000000000000000000000) (bvslt (currentBit!10014 thiss!1870) #b00000000000000000000000000001000) (bvsge (currentByte!10019 thiss!1870) #b00000000000000000000000000000000) (or (bvslt (currentByte!10019 thiss!1870) (size!4805 (buf!5349 thiss!1870))) (and (= (currentBit!10014 thiss!1870) #b00000000000000000000000000000000) (= (currentByte!10019 thiss!1870) (size!4805 (buf!5349 thiss!1870)))))))))

(assert (=> d!75438 d!75490))

(declare-fun d!75492 () Bool)

(declare-fun res!187287 () Bool)

(declare-fun e!151800 () Bool)

(assert (=> d!75492 (=> res!187287 e!151800)))

(assert (=> d!75492 (= res!187287 (= (ite c!11073 #b00000000000000000000000000000000 lt!351900) (ite c!11073 (bvadd #b00000000000000000000000000000001 i!761) lt!351906)))))

(assert (=> d!75492 (= (arrayRangesEq!706 (ite c!11073 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308)) lt!351895) (ite c!11073 (array!10947 (store (arr!5735 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10225 lt!351921)) (size!4805 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308)))) lt!351915) (ite c!11073 #b00000000000000000000000000000000 lt!351900) (ite c!11073 (bvadd #b00000000000000000000000000000001 i!761) lt!351906)) e!151800)))

(declare-fun b!223094 () Bool)

(declare-fun e!151801 () Bool)

(assert (=> b!223094 (= e!151800 e!151801)))

(declare-fun res!187288 () Bool)

(assert (=> b!223094 (=> (not res!187288) (not e!151801))))

(assert (=> b!223094 (= res!187288 (= (select (arr!5735 (ite c!11073 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308)) lt!351895)) (ite c!11073 #b00000000000000000000000000000000 lt!351900)) (select (arr!5735 (ite c!11073 (array!10947 (store (arr!5735 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10225 lt!351921)) (size!4805 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308)))) lt!351915)) (ite c!11073 #b00000000000000000000000000000000 lt!351900))))))

(declare-fun b!223095 () Bool)

(assert (=> b!223095 (= e!151801 (arrayRangesEq!706 (ite c!11073 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308)) lt!351895) (ite c!11073 (array!10947 (store (arr!5735 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10225 lt!351921)) (size!4805 (array!10947 (store (arr!5735 arr!308) i!761 (_1!10225 lt!351510)) (size!4805 arr!308)))) lt!351915) (bvadd (ite c!11073 #b00000000000000000000000000000000 lt!351900) #b00000000000000000000000000000001) (ite c!11073 (bvadd #b00000000000000000000000000000001 i!761) lt!351906)))))

(assert (= (and d!75492 (not res!187287)) b!223094))

(assert (= (and b!223094 res!187288) b!223095))

(declare-fun m!341571 () Bool)

(assert (=> b!223094 m!341571))

(declare-fun m!341573 () Bool)

(assert (=> b!223094 m!341573))

(declare-fun m!341575 () Bool)

(assert (=> b!223095 m!341575))

(assert (=> bm!3433 d!75492))

(check-sat (not b!223070) (not d!75482) (not b!223079) (not d!75466) (not d!75470) (not d!75478) (not b!223085) (not b!223081) (not d!75474) (not d!75446) (not b!223095) (not bm!3438) (not d!75462) (not d!75458) (not d!75454) (not d!75484) (not d!75460) (not bm!3436) (not d!75468) (not d!75488) (not b!223080) (not d!75444) (not b!223073) (not b!223077) (not d!75464) (not b!223076) (not d!75452) (not b!223075) (not bm!3437) (not d!75486) (not b!223087) (not d!75450) (not d!75472))
