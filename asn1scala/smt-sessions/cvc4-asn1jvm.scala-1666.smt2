; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46290 () Bool)

(assert start!46290)

(declare-fun b!222983 () Bool)

(declare-fun e!151716 () Bool)

(declare-datatypes ((array!10948 0))(
  ( (array!10949 (arr!5736 (Array (_ BitVec 32) (_ BitVec 8))) (size!4806 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8714 0))(
  ( (BitStream!8715 (buf!5350 array!10948) (currentByte!10020 (_ BitVec 32)) (currentBit!10015 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!19032 0))(
  ( (tuple2!19033 (_1!10227 (_ BitVec 8)) (_2!10227 BitStream!8714)) )
))
(declare-fun lt!351519 () tuple2!19032)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!222983 (= e!151716 (not (invariant!0 (currentBit!10015 (_2!10227 lt!351519)) (currentByte!10020 (_2!10227 lt!351519)) (size!4806 (buf!5350 (_2!10227 lt!351519))))))))

(declare-fun arr!308 () array!10948)

(declare-datatypes ((Unit!16049 0))(
  ( (Unit!16050) )
))
(declare-datatypes ((tuple3!1138 0))(
  ( (tuple3!1139 (_1!10228 Unit!16049) (_2!10228 BitStream!8714) (_3!711 array!10948)) )
))
(declare-fun lt!351520 () tuple3!1138)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun readByteArrayLoop!0 (BitStream!8714 array!10948 (_ BitVec 32) (_ BitVec 32)) tuple3!1138)

(assert (=> b!222983 (= lt!351520 (readByteArrayLoop!0 (_2!10227 lt!351519) (array!10949 (store (arr!5736 arr!308) i!761 (_1!10227 lt!351519)) (size!4806 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!222983 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4806 (buf!5350 (_2!10227 lt!351519)))) ((_ sign_extend 32) (currentByte!10020 (_2!10227 lt!351519))) ((_ sign_extend 32) (currentBit!10015 (_2!10227 lt!351519))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun thiss!1870 () BitStream!8714)

(declare-fun lt!351521 () Unit!16049)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8714 BitStream!8714 (_ BitVec 64) (_ BitVec 32)) Unit!16049)

(assert (=> b!222983 (= lt!351521 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10227 lt!351519) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!8714) tuple2!19032)

(assert (=> b!222983 (= lt!351519 (readByte!0 thiss!1870))))

(declare-fun b!222982 () Bool)

(declare-fun res!187193 () Bool)

(assert (=> b!222982 (=> (not res!187193) (not e!151716))))

(assert (=> b!222982 (= res!187193 (bvslt i!761 to!496))))

(declare-fun res!187192 () Bool)

(assert (=> start!46290 (=> (not res!187192) (not e!151716))))

(assert (=> start!46290 (= res!187192 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4806 arr!308))))))

(assert (=> start!46290 e!151716))

(assert (=> start!46290 true))

(declare-fun array_inv!4547 (array!10948) Bool)

(assert (=> start!46290 (array_inv!4547 arr!308)))

(declare-fun e!151718 () Bool)

(declare-fun inv!12 (BitStream!8714) Bool)

(assert (=> start!46290 (and (inv!12 thiss!1870) e!151718)))

(declare-fun b!222981 () Bool)

(declare-fun res!187194 () Bool)

(assert (=> b!222981 (=> (not res!187194) (not e!151716))))

(assert (=> b!222981 (= res!187194 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4806 (buf!5350 thiss!1870))) ((_ sign_extend 32) (currentByte!10020 thiss!1870)) ((_ sign_extend 32) (currentBit!10015 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!222984 () Bool)

(assert (=> b!222984 (= e!151718 (array_inv!4547 (buf!5350 thiss!1870)))))

(assert (= (and start!46290 res!187192) b!222981))

(assert (= (and b!222981 res!187194) b!222982))

(assert (= (and b!222982 res!187193) b!222983))

(assert (= start!46290 b!222984))

(declare-fun m!341249 () Bool)

(assert (=> b!222983 m!341249))

(declare-fun m!341251 () Bool)

(assert (=> b!222983 m!341251))

(declare-fun m!341253 () Bool)

(assert (=> b!222983 m!341253))

(declare-fun m!341255 () Bool)

(assert (=> b!222983 m!341255))

(declare-fun m!341257 () Bool)

(assert (=> b!222983 m!341257))

(declare-fun m!341259 () Bool)

(assert (=> b!222983 m!341259))

(declare-fun m!341261 () Bool)

(assert (=> start!46290 m!341261))

(declare-fun m!341263 () Bool)

(assert (=> start!46290 m!341263))

(declare-fun m!341265 () Bool)

(assert (=> b!222981 m!341265))

(declare-fun m!341267 () Bool)

(assert (=> b!222984 m!341267))

(push 1)

(assert (not b!222983))

(assert (not b!222981))

(assert (not start!46290))

(assert (not b!222984))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!75387 () Bool)

(declare-fun e!151721 () Bool)

(assert (=> d!75387 e!151721))

(declare-fun res!187197 () Bool)

(assert (=> d!75387 (=> (not res!187197) (not e!151721))))

(assert (=> d!75387 (= res!187197 (and (or (let ((rhs!3602 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3602 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3602) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!75396 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!75396 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!75396 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3601 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3601 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3601) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!351530 () Unit!16049)

(declare-fun choose!57 (BitStream!8714 BitStream!8714 (_ BitVec 64) (_ BitVec 32)) Unit!16049)

(assert (=> d!75387 (= lt!351530 (choose!57 thiss!1870 (_2!10227 lt!351519) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!75387 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10227 lt!351519) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!351530)))

(declare-fun lt!351528 () (_ BitVec 32))

(declare-fun b!222987 () Bool)

(assert (=> b!222987 (= e!151721 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4806 (buf!5350 (_2!10227 lt!351519)))) ((_ sign_extend 32) (currentByte!10020 (_2!10227 lt!351519))) ((_ sign_extend 32) (currentBit!10015 (_2!10227 lt!351519))) (bvsub (bvsub to!496 i!761) lt!351528)))))

(assert (=> b!222987 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!351528 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!351528) #b10000000000000000000000000000000)))))

(declare-fun lt!351529 () (_ BitVec 64))

(assert (=> b!222987 (= lt!351528 ((_ extract 31 0) lt!351529))))

(assert (=> b!222987 (and (bvslt lt!351529 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!351529 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!222987 (= lt!351529 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!75387 res!187197) b!222987))

(declare-fun m!341273 () Bool)

(assert (=> d!75387 m!341273))

(declare-fun m!341275 () Bool)

(assert (=> b!222987 m!341275))

(assert (=> b!222983 d!75387))

(declare-fun d!75398 () Bool)

(declare-fun lt!351550 () (_ BitVec 8))

(declare-fun lt!351548 () (_ BitVec 8))

(assert (=> d!75398 (= lt!351550 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5736 (buf!5350 thiss!1870)) (currentByte!10020 thiss!1870))) ((_ sign_extend 24) lt!351548))))))

(assert (=> d!75398 (= lt!351548 ((_ extract 7 0) (currentBit!10015 thiss!1870)))))

(declare-fun e!151726 () Bool)

(assert (=> d!75398 e!151726))

(declare-fun res!187205 () Bool)

(assert (=> d!75398 (=> (not res!187205) (not e!151726))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!75398 (= res!187205 (validate_offset_bits!1 ((_ sign_extend 32) (size!4806 (buf!5350 thiss!1870))) ((_ sign_extend 32) (currentByte!10020 thiss!1870)) ((_ sign_extend 32) (currentBit!10015 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19036 0))(
  ( (tuple2!19037 (_1!10230 Unit!16049) (_2!10230 (_ BitVec 8))) )
))
(declare-fun Unit!16051 () Unit!16049)

(declare-fun Unit!16052 () Unit!16049)

(assert (=> d!75398 (= (readByte!0 thiss!1870) (tuple2!19033 (_2!10230 (ite (bvsgt ((_ sign_extend 24) lt!351548) #b00000000000000000000000000000000) (tuple2!19037 Unit!16051 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!351550) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5736 (buf!5350 thiss!1870)) (bvadd (currentByte!10020 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!351548)))))))) (tuple2!19037 Unit!16052 lt!351550))) (BitStream!8715 (buf!5350 thiss!1870) (bvadd (currentByte!10020 thiss!1870) #b00000000000000000000000000000001) (currentBit!10015 thiss!1870))))))

(declare-fun b!222992 () Bool)

(declare-fun e!151727 () Bool)

(assert (=> b!222992 (= e!151726 e!151727)))

(declare-fun res!187204 () Bool)

(assert (=> b!222992 (=> (not res!187204) (not e!151727))))

(declare-fun lt!351545 () tuple2!19032)

(assert (=> b!222992 (= res!187204 (= (buf!5350 (_2!10227 lt!351545)) (buf!5350 thiss!1870)))))

(declare-fun lt!351549 () (_ BitVec 8))

(declare-fun lt!351547 () (_ BitVec 8))

(declare-fun Unit!16054 () Unit!16049)

(declare-fun Unit!16055 () Unit!16049)

(assert (=> b!222992 (= lt!351545 (tuple2!19033 (_2!10230 (ite (bvsgt ((_ sign_extend 24) lt!351549) #b00000000000000000000000000000000) (tuple2!19037 Unit!16054 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!351547) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5736 (buf!5350 thiss!1870)) (bvadd (currentByte!10020 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!351549)))))))) (tuple2!19037 Unit!16055 lt!351547))) (BitStream!8715 (buf!5350 thiss!1870) (bvadd (currentByte!10020 thiss!1870) #b00000000000000000000000000000001) (currentBit!10015 thiss!1870))))))

(assert (=> b!222992 (= lt!351547 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5736 (buf!5350 thiss!1870)) (currentByte!10020 thiss!1870))) ((_ sign_extend 24) lt!351549))))))

(assert (=> b!222992 (= lt!351549 ((_ extract 7 0) (currentBit!10015 thiss!1870)))))

(declare-fun lt!351551 () (_ BitVec 64))

(declare-fun b!222993 () Bool)

(declare-fun lt!351546 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!222993 (= e!151727 (= (bitIndex!0 (size!4806 (buf!5350 (_2!10227 lt!351545))) (currentByte!10020 (_2!10227 lt!351545)) (currentBit!10015 (_2!10227 lt!351545))) (bvadd lt!351551 lt!351546)))))

(assert (=> b!222993 (or (not (= (bvand lt!351551 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!351546 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!351551 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!351551 lt!351546) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!222993 (= lt!351546 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!222993 (= lt!351551 (bitIndex!0 (size!4806 (buf!5350 thiss!1870)) (currentByte!10020 thiss!1870) (currentBit!10015 thiss!1870)))))

(assert (= (and d!75398 res!187205) b!222992))

(assert (= (and b!222992 res!187204) b!222993))

(declare-fun m!341277 () Bool)

(assert (=> d!75398 m!341277))

(declare-fun m!341279 () Bool)

(assert (=> d!75398 m!341279))

(declare-fun m!341281 () Bool)

(assert (=> d!75398 m!341281))

(assert (=> b!222992 m!341281))

(assert (=> b!222992 m!341277))

(declare-fun m!341283 () Bool)

(assert (=> b!222993 m!341283))

(declare-fun m!341285 () Bool)

(assert (=> b!222993 m!341285))

(assert (=> b!222983 d!75398))

(declare-fun d!75404 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!75404 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4806 (buf!5350 (_2!10227 lt!351519)))) ((_ sign_extend 32) (currentByte!10020 (_2!10227 lt!351519))) ((_ sign_extend 32) (currentBit!10015 (_2!10227 lt!351519))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4806 (buf!5350 (_2!10227 lt!351519)))) ((_ sign_extend 32) (currentByte!10020 (_2!10227 lt!351519))) ((_ sign_extend 32) (currentBit!10015 (_2!10227 lt!351519)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18411 () Bool)

(assert (= bs!18411 d!75404))

(declare-fun m!341287 () Bool)

(assert (=> bs!18411 m!341287))

(assert (=> b!222983 d!75404))

(declare-fun d!75406 () Bool)

(assert (=> d!75406 (= (invariant!0 (currentBit!10015 (_2!10227 lt!351519)) (currentByte!10020 (_2!10227 lt!351519)) (size!4806 (buf!5350 (_2!10227 lt!351519)))) (and (bvsge (currentBit!10015 (_2!10227 lt!351519)) #b00000000000000000000000000000000) (bvslt (currentBit!10015 (_2!10227 lt!351519)) #b00000000000000000000000000001000) (bvsge (currentByte!10020 (_2!10227 lt!351519)) #b00000000000000000000000000000000) (or (bvslt (currentByte!10020 (_2!10227 lt!351519)) (size!4806 (buf!5350 (_2!10227 lt!351519)))) (and (= (currentBit!10015 (_2!10227 lt!351519)) #b00000000000000000000000000000000) (= (currentByte!10020 (_2!10227 lt!351519)) (size!4806 (buf!5350 (_2!10227 lt!351519))))))))))

(assert (=> b!222983 d!75406))

(declare-fun lt!351788 () tuple3!1138)

(declare-fun e!151756 () Bool)

(declare-fun b!223031 () Bool)

(declare-fun arrayRangesEq!705 (array!10948 array!10948 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!223031 (= e!151756 (arrayRangesEq!705 (array!10949 (store (arr!5736 arr!308) i!761 (_1!10227 lt!351519)) (size!4806 arr!308)) (_3!711 lt!351788) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!351806 () Unit!16049)

(declare-fun b!223032 () Bool)

(declare-fun e!151757 () tuple3!1138)

(assert (=> b!223032 (= e!151757 (tuple3!1139 lt!351806 (_2!10227 lt!351519) (array!10949 (store (arr!5736 arr!308) i!761 (_1!10227 lt!351519)) (size!4806 arr!308))))))

(declare-fun call!3428 () (_ BitVec 64))

(assert (=> b!223032 (= call!3428 call!3428)))

(declare-fun lt!351774 () Unit!16049)

(declare-fun Unit!16062 () Unit!16049)

(assert (=> b!223032 (= lt!351774 Unit!16062)))

(declare-fun lt!351787 () Unit!16049)

(declare-fun arrayRangesEqReflexiveLemma!57 (array!10948) Unit!16049)

(assert (=> b!223032 (= lt!351787 (arrayRangesEqReflexiveLemma!57 (array!10949 (store (arr!5736 arr!308) i!761 (_1!10227 lt!351519)) (size!4806 arr!308))))))

(declare-fun call!3429 () Bool)

(assert (=> b!223032 call!3429))

(declare-fun lt!351775 () Unit!16049)

(assert (=> b!223032 (= lt!351775 lt!351787)))

(declare-fun lt!351791 () array!10948)

(assert (=> b!223032 (= lt!351791 (array!10949 (store (arr!5736 arr!308) i!761 (_1!10227 lt!351519)) (size!4806 arr!308)))))

(declare-fun lt!351802 () array!10948)

(assert (=> b!223032 (= lt!351802 (array!10949 (store (arr!5736 arr!308) i!761 (_1!10227 lt!351519)) (size!4806 arr!308)))))

(declare-fun lt!351781 () (_ BitVec 32))

(assert (=> b!223032 (= lt!351781 #b00000000000000000000000000000000)))

(declare-fun lt!351789 () (_ BitVec 32))

(assert (=> b!223032 (= lt!351789 (size!4806 (array!10949 (store (arr!5736 arr!308) i!761 (_1!10227 lt!351519)) (size!4806 arr!308))))))

(declare-fun lt!351792 () (_ BitVec 32))

(assert (=> b!223032 (= lt!351792 #b00000000000000000000000000000000)))

(declare-fun lt!351795 () (_ BitVec 32))

(assert (=> b!223032 (= lt!351795 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!57 (array!10948 array!10948 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16049)

(assert (=> b!223032 (= lt!351806 (arrayRangesEqSlicedLemma!57 lt!351791 lt!351802 lt!351781 lt!351789 lt!351792 lt!351795))))

(declare-fun call!3427 () Bool)

(assert (=> b!223032 call!3427))

(declare-fun bm!3424 () Bool)

(declare-fun lt!351796 () tuple3!1138)

(declare-fun c!11070 () Bool)

(assert (=> bm!3424 (= call!3428 (bitIndex!0 (ite c!11070 (size!4806 (buf!5350 (_2!10228 lt!351796))) (size!4806 (buf!5350 (_2!10227 lt!351519)))) (ite c!11070 (currentByte!10020 (_2!10228 lt!351796)) (currentByte!10020 (_2!10227 lt!351519))) (ite c!11070 (currentBit!10015 (_2!10228 lt!351796)) (currentBit!10015 (_2!10227 lt!351519)))))))

(declare-fun b!223033 () Bool)

(declare-fun res!187236 () Bool)

(assert (=> b!223033 (=> (not res!187236) (not e!151756))))

(assert (=> b!223033 (= res!187236 (and (= (buf!5350 (_2!10227 lt!351519)) (buf!5350 (_2!10228 lt!351788))) (= (size!4806 (array!10949 (store (arr!5736 arr!308) i!761 (_1!10227 lt!351519)) (size!4806 arr!308))) (size!4806 (_3!711 lt!351788)))))))

(declare-fun d!75408 () Bool)

(declare-fun e!151755 () Bool)

(assert (=> d!75408 e!151755))

(declare-fun res!187234 () Bool)

(assert (=> d!75408 (=> res!187234 e!151755)))

(assert (=> d!75408 (= res!187234 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!351784 () Bool)

(assert (=> d!75408 (= lt!351784 e!151756)))

(declare-fun res!187235 () Bool)

(assert (=> d!75408 (=> (not res!187235) (not e!151756))))

(declare-fun lt!351807 () (_ BitVec 64))

(declare-fun lt!351776 () (_ BitVec 64))

(assert (=> d!75408 (= res!187235 (= (bvadd lt!351776 lt!351807) (bitIndex!0 (size!4806 (buf!5350 (_2!10228 lt!351788))) (currentByte!10020 (_2!10228 lt!351788)) (currentBit!10015 (_2!10228 lt!351788)))))))

(assert (=> d!75408 (or (not (= (bvand lt!351776 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!351807 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!351776 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!351776 lt!351807) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!351809 () (_ BitVec 64))

(assert (=> d!75408 (= lt!351807 (bvmul lt!351809 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!75408 (or (= lt!351809 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!351809 #b0000000000000000000000000000000000000000000000000000000000001000) lt!351809)))))

(assert (=> d!75408 (= lt!351809 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!75408 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!75408 (= lt!351776 (bitIndex!0 (size!4806 (buf!5350 (_2!10227 lt!351519))) (currentByte!10020 (_2!10227 lt!351519)) (currentBit!10015 (_2!10227 lt!351519))))))

(assert (=> d!75408 (= lt!351788 e!151757)))

(assert (=> d!75408 (= c!11070 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!75408 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4806 (array!10949 (store (arr!5736 arr!308) i!761 (_1!10227 lt!351519)) (size!4806 arr!308)))))))

(assert (=> d!75408 (= (readByteArrayLoop!0 (_2!10227 lt!351519) (array!10949 (store (arr!5736 arr!308) i!761 (_1!10227 lt!351519)) (size!4806 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!351788)))

(declare-fun bm!3425 () Bool)

(declare-fun lt!351782 () (_ BitVec 32))

(assert (=> bm!3425 (= call!3427 (arrayRangesEq!705 (ite c!11070 (array!10949 (store (arr!5736 arr!308) i!761 (_1!10227 lt!351519)) (size!4806 arr!308)) lt!351791) (ite c!11070 (_3!711 lt!351796) lt!351802) (ite c!11070 lt!351782 lt!351792) (ite c!11070 (bvadd #b00000000000000000000000000000001 i!761) lt!351795)))))

(declare-fun bm!3426 () Bool)

(declare-fun lt!351786 () tuple2!19032)

(assert (=> bm!3426 (= call!3429 (arrayRangesEq!705 (array!10949 (store (arr!5736 arr!308) i!761 (_1!10227 lt!351519)) (size!4806 arr!308)) (ite c!11070 (array!10949 (store (arr!5736 (array!10949 (store (arr!5736 arr!308) i!761 (_1!10227 lt!351519)) (size!4806 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10227 lt!351786)) (size!4806 (array!10949 (store (arr!5736 arr!308) i!761 (_1!10227 lt!351519)) (size!4806 arr!308)))) (array!10949 (store (arr!5736 arr!308) i!761 (_1!10227 lt!351519)) (size!4806 arr!308))) #b00000000000000000000000000000000 (ite c!11070 (bvadd #b00000000000000000000000000000001 i!761) (size!4806 (array!10949 (store (arr!5736 arr!308) i!761 (_1!10227 lt!351519)) (size!4806 arr!308))))))))

(declare-fun b!223034 () Bool)

(declare-datatypes ((tuple2!19042 0))(
  ( (tuple2!19043 (_1!10233 BitStream!8714) (_2!10233 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!8714) tuple2!19042)

(assert (=> b!223034 (= e!151755 (= (select (arr!5736 (_3!711 lt!351788)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10233 (readBytePure!0 (_2!10227 lt!351519)))))))

(assert (=> b!223034 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4806 (_3!711 lt!351788))))))

(declare-fun b!223035 () Bool)

(declare-fun lt!351778 () Unit!16049)

(assert (=> b!223035 (= e!151757 (tuple3!1139 lt!351778 (_2!10228 lt!351796) (_3!711 lt!351796)))))

(assert (=> b!223035 (= lt!351786 (readByte!0 (_2!10227 lt!351519)))))

(declare-fun lt!351783 () array!10948)

(assert (=> b!223035 (= lt!351783 (array!10949 (store (arr!5736 (array!10949 (store (arr!5736 arr!308) i!761 (_1!10227 lt!351519)) (size!4806 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10227 lt!351786)) (size!4806 (array!10949 (store (arr!5736 arr!308) i!761 (_1!10227 lt!351519)) (size!4806 arr!308)))))))

(declare-fun lt!351804 () (_ BitVec 64))

(assert (=> b!223035 (= lt!351804 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!351800 () (_ BitVec 32))

(assert (=> b!223035 (= lt!351800 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!351794 () Unit!16049)

(assert (=> b!223035 (= lt!351794 (validateOffsetBytesFromBitIndexLemma!0 (_2!10227 lt!351519) (_2!10227 lt!351786) lt!351804 lt!351800))))

(assert (=> b!223035 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4806 (buf!5350 (_2!10227 lt!351786)))) ((_ sign_extend 32) (currentByte!10020 (_2!10227 lt!351786))) ((_ sign_extend 32) (currentBit!10015 (_2!10227 lt!351786))) (bvsub lt!351800 ((_ extract 31 0) (bvsdiv (bvadd lt!351804 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!351805 () Unit!16049)

(assert (=> b!223035 (= lt!351805 lt!351794)))

(assert (=> b!223035 (= lt!351796 (readByteArrayLoop!0 (_2!10227 lt!351786) lt!351783 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> b!223035 (= (bitIndex!0 (size!4806 (buf!5350 (_2!10227 lt!351786))) (currentByte!10020 (_2!10227 lt!351786)) (currentBit!10015 (_2!10227 lt!351786))) (bvadd (bitIndex!0 (size!4806 (buf!5350 (_2!10227 lt!351519))) (currentByte!10020 (_2!10227 lt!351519)) (currentBit!10015 (_2!10227 lt!351519))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!351808 () Unit!16049)

(declare-fun Unit!16071 () Unit!16049)

(assert (=> b!223035 (= lt!351808 Unit!16071)))

(assert (=> b!223035 (= (bvadd (bitIndex!0 (size!4806 (buf!5350 (_2!10227 lt!351786))) (currentByte!10020 (_2!10227 lt!351786)) (currentBit!10015 (_2!10227 lt!351786))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!3428)))

(declare-fun lt!351801 () Unit!16049)

(declare-fun Unit!16072 () Unit!16049)

(assert (=> b!223035 (= lt!351801 Unit!16072)))

(assert (=> b!223035 (= (bvadd (bitIndex!0 (size!4806 (buf!5350 (_2!10227 lt!351519))) (currentByte!10020 (_2!10227 lt!351519)) (currentBit!10015 (_2!10227 lt!351519))) (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) call!3428)))

(declare-fun lt!351779 () Unit!16049)

(declare-fun Unit!16074 () Unit!16049)

(assert (=> b!223035 (= lt!351779 Unit!16074)))

(assert (=> b!223035 (and (= (buf!5350 (_2!10227 lt!351519)) (buf!5350 (_2!10228 lt!351796))) (= (size!4806 (array!10949 (store (arr!5736 arr!308) i!761 (_1!10227 lt!351519)) (size!4806 arr!308))) (size!4806 (_3!711 lt!351796))))))

(declare-fun lt!351785 () Unit!16049)

(declare-fun Unit!16075 () Unit!16049)

(assert (=> b!223035 (= lt!351785 Unit!16075)))

(declare-fun lt!351798 () Unit!16049)

(declare-fun arrayUpdatedAtPrefixLemma!297 (array!10948 (_ BitVec 32) (_ BitVec 8)) Unit!16049)

(assert (=> b!223035 (= lt!351798 (arrayUpdatedAtPrefixLemma!297 (array!10949 (store (arr!5736 arr!308) i!761 (_1!10227 lt!351519)) (size!4806 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10227 lt!351786)))))

(assert (=> b!223035 call!3429))

(declare-fun lt!351780 () Unit!16049)

(assert (=> b!223035 (= lt!351780 lt!351798)))

(assert (=> b!223035 (= lt!351782 #b00000000000000000000000000000000)))

(declare-fun lt!351790 () Unit!16049)

(declare-fun arrayRangesEqTransitive!191 (array!10948 array!10948 array!10948 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16049)

(assert (=> b!223035 (= lt!351790 (arrayRangesEqTransitive!191 (array!10949 (store (arr!5736 arr!308) i!761 (_1!10227 lt!351519)) (size!4806 arr!308)) lt!351783 (_3!711 lt!351796) lt!351782 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!223035 call!3427))

(declare-fun lt!351797 () Unit!16049)

(assert (=> b!223035 (= lt!351797 lt!351790)))

(assert (=> b!223035 (arrayRangesEq!705 (array!10949 (store (arr!5736 arr!308) i!761 (_1!10227 lt!351519)) (size!4806 arr!308)) (_3!711 lt!351796) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!351803 () Unit!16049)

(declare-fun Unit!16076 () Unit!16049)

(assert (=> b!223035 (= lt!351803 Unit!16076)))

(declare-fun lt!351799 () Unit!16049)

(declare-fun arrayRangesEqImpliesEq!66 (array!10948 array!10948 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16049)

(assert (=> b!223035 (= lt!351799 (arrayRangesEqImpliesEq!66 lt!351783 (_3!711 lt!351796) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!223035 (= (select (store (arr!5736 (array!10949 (store (arr!5736 arr!308) i!761 (_1!10227 lt!351519)) (size!4806 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10227 lt!351786)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5736 (_3!711 lt!351796)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!351793 () Unit!16049)

(assert (=> b!223035 (= lt!351793 lt!351799)))

(declare-fun lt!351777 () Bool)

(assert (=> b!223035 (= lt!351777 (= (select (arr!5736 (_3!711 lt!351796)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10227 lt!351786)))))

(declare-fun Unit!16077 () Unit!16049)

(assert (=> b!223035 (= lt!351778 Unit!16077)))

(assert (=> b!223035 lt!351777))

(assert (= (and d!75408 c!11070) b!223035))

(assert (= (and d!75408 (not c!11070)) b!223032))

(assert (= (or b!223035 b!223032) bm!3425))

(assert (= (or b!223035 b!223032) bm!3426))

(assert (= (or b!223035 b!223032) bm!3424))

(assert (= (and d!75408 res!187235) b!223033))

(assert (= (and b!223033 res!187236) b!223031))

(assert (= (and d!75408 (not res!187234)) b!223034))

(declare-fun m!341355 () Bool)

(assert (=> d!75408 m!341355))

(declare-fun m!341357 () Bool)

(assert (=> d!75408 m!341357))

(declare-fun m!341359 () Bool)

(assert (=> b!223031 m!341359))

(declare-fun m!341361 () Bool)

(assert (=> bm!3425 m!341361))

(declare-fun m!341363 () Bool)

(assert (=> b!223032 m!341363))

(declare-fun m!341365 () Bool)

(assert (=> b!223032 m!341365))

(declare-fun m!341367 () Bool)

(assert (=> bm!3426 m!341367))

(declare-fun m!341369 () Bool)

(assert (=> bm!3426 m!341369))

(declare-fun m!341371 () Bool)

(assert (=> b!223034 m!341371))

(declare-fun m!341373 () Bool)

(assert (=> b!223034 m!341373))

(declare-fun m!341375 () Bool)

(assert (=> b!223035 m!341375))

(declare-fun m!341377 () Bool)

(assert (=> b!223035 m!341377))

(assert (=> b!223035 m!341367))

(declare-fun m!341379 () Bool)

(assert (=> b!223035 m!341379))

(declare-fun m!341381 () Bool)

(assert (=> b!223035 m!341381))

(declare-fun m!341383 () Bool)

(assert (=> b!223035 m!341383))

(declare-fun m!341385 () Bool)

(assert (=> b!223035 m!341385))

(declare-fun m!341387 () Bool)

(assert (=> b!223035 m!341387))

(assert (=> b!223035 m!341357))

(declare-fun m!341389 () Bool)

(assert (=> b!223035 m!341389))

(declare-fun m!341391 () Bool)

(assert (=> b!223035 m!341391))

(declare-fun m!341393 () Bool)

(assert (=> b!223035 m!341393))

(declare-fun m!341395 () Bool)

(assert (=> b!223035 m!341395))

(declare-fun m!341397 () Bool)

(assert (=> bm!3424 m!341397))

(assert (=> b!222983 d!75408))

(declare-fun d!75421 () Bool)

(assert (=> d!75421 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4806 (buf!5350 thiss!1870))) ((_ sign_extend 32) (currentByte!10020 thiss!1870)) ((_ sign_extend 32) (currentBit!10015 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4806 (buf!5350 thiss!1870))) ((_ sign_extend 32) (currentByte!10020 thiss!1870)) ((_ sign_extend 32) (currentBit!10015 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18413 () Bool)

(assert (= bs!18413 d!75421))

(declare-fun m!341399 () Bool)

(assert (=> bs!18413 m!341399))

(assert (=> b!222981 d!75421))

(declare-fun d!75423 () Bool)

(assert (=> d!75423 (= (array_inv!4547 arr!308) (bvsge (size!4806 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!46290 d!75423))

(declare-fun d!75425 () Bool)

(assert (=> d!75425 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10015 thiss!1870) (currentByte!10020 thiss!1870) (size!4806 (buf!5350 thiss!1870))))))

(declare-fun bs!18414 () Bool)

(assert (= bs!18414 d!75425))

(declare-fun m!341401 () Bool)

(assert (=> bs!18414 m!341401))

(assert (=> start!46290 d!75425))

(declare-fun d!75427 () Bool)

(assert (=> d!75427 (= (array_inv!4547 (buf!5350 thiss!1870)) (bvsge (size!4806 (buf!5350 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!222984 d!75427))

(push 1)

(assert (not d!75421))

(assert (not b!222987))

(assert (not d!75425))

(assert (not b!223031))

(assert (not d!75398))

(assert (not b!223035))

(assert (not bm!3424))

(assert (not bm!3426))

(assert (not d!75404))

(assert (not bm!3425))

(assert (not b!223034))

(assert (not b!223032))

(assert (not d!75408))

(assert (not b!222993))

(assert (not d!75387))

(check-sat)

(pop 1)

(push 1)

(check-sat)

