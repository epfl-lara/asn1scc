; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46480 () Bool)

(assert start!46480)

(declare-fun b!223384 () Bool)

(declare-fun res!187526 () Bool)

(declare-fun e!152034 () Bool)

(assert (=> b!223384 (=> (not res!187526) (not e!152034))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!223384 (= res!187526 (bvslt i!761 to!496))))

(declare-fun res!187525 () Bool)

(assert (=> start!46480 (=> (not res!187525) (not e!152034))))

(declare-datatypes ((array!10971 0))(
  ( (array!10972 (arr!5752 (Array (_ BitVec 32) (_ BitVec 8))) (size!4813 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!10971)

(assert (=> start!46480 (= res!187525 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4813 arr!308))))))

(assert (=> start!46480 e!152034))

(assert (=> start!46480 true))

(declare-fun array_inv!4554 (array!10971) Bool)

(assert (=> start!46480 (array_inv!4554 arr!308)))

(declare-datatypes ((BitStream!8728 0))(
  ( (BitStream!8729 (buf!5357 array!10971) (currentByte!10054 (_ BitVec 32)) (currentBit!10049 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8728)

(declare-fun e!152032 () Bool)

(declare-fun inv!12 (BitStream!8728) Bool)

(assert (=> start!46480 (and (inv!12 thiss!1870) e!152032)))

(declare-fun b!223385 () Bool)

(declare-datatypes ((Unit!16174 0))(
  ( (Unit!16175) )
))
(declare-datatypes ((tuple3!1152 0))(
  ( (tuple3!1153 (_1!10257 Unit!16174) (_2!10257 BitStream!8728) (_3!718 array!10971)) )
))
(declare-fun lt!353121 () tuple3!1152)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!223385 (= e!152034 (not (invariant!0 (currentBit!10049 (_2!10257 lt!353121)) (currentByte!10054 (_2!10257 lt!353121)) (size!4813 (buf!5357 (_2!10257 lt!353121))))))))

(declare-datatypes ((tuple2!19078 0))(
  ( (tuple2!19079 (_1!10258 (_ BitVec 8)) (_2!10258 BitStream!8728)) )
))
(declare-fun lt!353120 () tuple2!19078)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!223385 (= (bitIndex!0 (size!4813 (buf!5357 (_2!10258 lt!353120))) (currentByte!10054 (_2!10258 lt!353120)) (currentBit!10049 (_2!10258 lt!353120))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!4813 (buf!5357 thiss!1870)) (currentByte!10054 thiss!1870) (currentBit!10049 thiss!1870))))))

(declare-fun readByteArrayLoop!0 (BitStream!8728 array!10971 (_ BitVec 32) (_ BitVec 32)) tuple3!1152)

(assert (=> b!223385 (= lt!353121 (readByteArrayLoop!0 (_2!10258 lt!353120) (array!10972 (store (arr!5752 arr!308) i!761 (_1!10258 lt!353120)) (size!4813 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!223385 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4813 (buf!5357 (_2!10258 lt!353120)))) ((_ sign_extend 32) (currentByte!10054 (_2!10258 lt!353120))) ((_ sign_extend 32) (currentBit!10049 (_2!10258 lt!353120))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!353122 () Unit!16174)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8728 BitStream!8728 (_ BitVec 64) (_ BitVec 32)) Unit!16174)

(assert (=> b!223385 (= lt!353122 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10258 lt!353120) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!8728) tuple2!19078)

(assert (=> b!223385 (= lt!353120 (readByte!0 thiss!1870))))

(declare-fun b!223386 () Bool)

(assert (=> b!223386 (= e!152032 (array_inv!4554 (buf!5357 thiss!1870)))))

(declare-fun b!223383 () Bool)

(declare-fun res!187524 () Bool)

(assert (=> b!223383 (=> (not res!187524) (not e!152034))))

(assert (=> b!223383 (= res!187524 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4813 (buf!5357 thiss!1870))) ((_ sign_extend 32) (currentByte!10054 thiss!1870)) ((_ sign_extend 32) (currentBit!10049 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!46480 res!187525) b!223383))

(assert (= (and b!223383 res!187524) b!223384))

(assert (= (and b!223384 res!187526) b!223385))

(assert (= start!46480 b!223386))

(declare-fun m!342191 () Bool)

(assert (=> start!46480 m!342191))

(declare-fun m!342193 () Bool)

(assert (=> start!46480 m!342193))

(declare-fun m!342195 () Bool)

(assert (=> b!223385 m!342195))

(declare-fun m!342197 () Bool)

(assert (=> b!223385 m!342197))

(declare-fun m!342199 () Bool)

(assert (=> b!223385 m!342199))

(declare-fun m!342201 () Bool)

(assert (=> b!223385 m!342201))

(declare-fun m!342203 () Bool)

(assert (=> b!223385 m!342203))

(declare-fun m!342205 () Bool)

(assert (=> b!223385 m!342205))

(declare-fun m!342207 () Bool)

(assert (=> b!223385 m!342207))

(declare-fun m!342209 () Bool)

(assert (=> b!223385 m!342209))

(declare-fun m!342211 () Bool)

(assert (=> b!223386 m!342211))

(declare-fun m!342213 () Bool)

(assert (=> b!223383 m!342213))

(push 1)

(assert (not b!223383))

(assert (not b!223385))

(assert (not b!223386))

(assert (not start!46480))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!75678 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!75678 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4813 (buf!5357 thiss!1870))) ((_ sign_extend 32) (currentByte!10054 thiss!1870)) ((_ sign_extend 32) (currentBit!10049 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4813 (buf!5357 thiss!1870))) ((_ sign_extend 32) (currentByte!10054 thiss!1870)) ((_ sign_extend 32) (currentBit!10049 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18463 () Bool)

(assert (= bs!18463 d!75678))

(declare-fun m!342263 () Bool)

(assert (=> bs!18463 m!342263))

(assert (=> b!223383 d!75678))

(declare-fun d!75680 () Bool)

(assert (=> d!75680 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4813 (buf!5357 (_2!10258 lt!353120)))) ((_ sign_extend 32) (currentByte!10054 (_2!10258 lt!353120))) ((_ sign_extend 32) (currentBit!10049 (_2!10258 lt!353120))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4813 (buf!5357 (_2!10258 lt!353120)))) ((_ sign_extend 32) (currentByte!10054 (_2!10258 lt!353120))) ((_ sign_extend 32) (currentBit!10049 (_2!10258 lt!353120)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18464 () Bool)

(assert (= bs!18464 d!75680))

(declare-fun m!342265 () Bool)

(assert (=> bs!18464 m!342265))

(assert (=> b!223385 d!75680))

(declare-fun d!75682 () Bool)

(declare-fun lt!353184 () (_ BitVec 8))

(declare-fun lt!353180 () (_ BitVec 8))

(assert (=> d!75682 (= lt!353184 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5752 (buf!5357 thiss!1870)) (currentByte!10054 thiss!1870))) ((_ sign_extend 24) lt!353180))))))

(assert (=> d!75682 (= lt!353180 ((_ extract 7 0) (currentBit!10049 thiss!1870)))))

(declare-fun e!152067 () Bool)

(assert (=> d!75682 e!152067))

(declare-fun res!187559 () Bool)

(assert (=> d!75682 (=> (not res!187559) (not e!152067))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!75682 (= res!187559 (validate_offset_bits!1 ((_ sign_extend 32) (size!4813 (buf!5357 thiss!1870))) ((_ sign_extend 32) (currentByte!10054 thiss!1870)) ((_ sign_extend 32) (currentBit!10049 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19084 0))(
  ( (tuple2!19085 (_1!10263 Unit!16174) (_2!10263 (_ BitVec 8))) )
))
(declare-fun Unit!16180 () Unit!16174)

(declare-fun Unit!16181 () Unit!16174)

(assert (=> d!75682 (= (readByte!0 thiss!1870) (tuple2!19079 (_2!10263 (ite (bvsgt ((_ sign_extend 24) lt!353180) #b00000000000000000000000000000000) (tuple2!19085 Unit!16180 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!353184) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5752 (buf!5357 thiss!1870)) (bvadd (currentByte!10054 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!353180)))))))) (tuple2!19085 Unit!16181 lt!353184))) (BitStream!8729 (buf!5357 thiss!1870) (bvadd (currentByte!10054 thiss!1870) #b00000000000000000000000000000001) (currentBit!10049 thiss!1870))))))

(declare-fun b!223423 () Bool)

(declare-fun e!152068 () Bool)

(assert (=> b!223423 (= e!152067 e!152068)))

(declare-fun res!187558 () Bool)

(assert (=> b!223423 (=> (not res!187558) (not e!152068))))

(declare-fun lt!353183 () tuple2!19078)

(assert (=> b!223423 (= res!187558 (= (buf!5357 (_2!10258 lt!353183)) (buf!5357 thiss!1870)))))

(declare-fun lt!353185 () (_ BitVec 8))

(declare-fun lt!353182 () (_ BitVec 8))

(declare-fun Unit!16182 () Unit!16174)

(declare-fun Unit!16183 () Unit!16174)

(assert (=> b!223423 (= lt!353183 (tuple2!19079 (_2!10263 (ite (bvsgt ((_ sign_extend 24) lt!353185) #b00000000000000000000000000000000) (tuple2!19085 Unit!16182 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!353182) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5752 (buf!5357 thiss!1870)) (bvadd (currentByte!10054 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!353185)))))))) (tuple2!19085 Unit!16183 lt!353182))) (BitStream!8729 (buf!5357 thiss!1870) (bvadd (currentByte!10054 thiss!1870) #b00000000000000000000000000000001) (currentBit!10049 thiss!1870))))))

(assert (=> b!223423 (= lt!353182 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5752 (buf!5357 thiss!1870)) (currentByte!10054 thiss!1870))) ((_ sign_extend 24) lt!353185))))))

(assert (=> b!223423 (= lt!353185 ((_ extract 7 0) (currentBit!10049 thiss!1870)))))

(declare-fun lt!353179 () (_ BitVec 64))

(declare-fun lt!353181 () (_ BitVec 64))

(declare-fun b!223424 () Bool)

(assert (=> b!223424 (= e!152068 (= (bitIndex!0 (size!4813 (buf!5357 (_2!10258 lt!353183))) (currentByte!10054 (_2!10258 lt!353183)) (currentBit!10049 (_2!10258 lt!353183))) (bvadd lt!353179 lt!353181)))))

(assert (=> b!223424 (or (not (= (bvand lt!353179 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!353181 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!353179 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!353179 lt!353181) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!223424 (= lt!353181 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!223424 (= lt!353179 (bitIndex!0 (size!4813 (buf!5357 thiss!1870)) (currentByte!10054 thiss!1870) (currentBit!10049 thiss!1870)))))

(assert (= (and d!75682 res!187559) b!223423))

(assert (= (and b!223423 res!187558) b!223424))

(declare-fun m!342275 () Bool)

(assert (=> d!75682 m!342275))

(declare-fun m!342277 () Bool)

(assert (=> d!75682 m!342277))

(declare-fun m!342279 () Bool)

(assert (=> d!75682 m!342279))

(assert (=> b!223423 m!342279))

(assert (=> b!223423 m!342275))

(declare-fun m!342281 () Bool)

(assert (=> b!223424 m!342281))

(assert (=> b!223424 m!342205))

(assert (=> b!223385 d!75682))

(declare-fun b!223460 () Bool)

(declare-fun res!187583 () Bool)

(declare-fun e!152090 () Bool)

(assert (=> b!223460 (=> (not res!187583) (not e!152090))))

(declare-fun lt!353471 () tuple3!1152)

(assert (=> b!223460 (= res!187583 (and (= (buf!5357 (_2!10258 lt!353120)) (buf!5357 (_2!10257 lt!353471))) (= (size!4813 (array!10972 (store (arr!5752 arr!308) i!761 (_1!10258 lt!353120)) (size!4813 arr!308))) (size!4813 (_3!718 lt!353471)))))))

(declare-fun call!3522 () Bool)

(declare-fun lt!353470 () (_ BitVec 32))

(declare-fun bm!3517 () Bool)

(declare-fun c!11101 () Bool)

(declare-fun lt!353468 () tuple3!1152)

(declare-fun arrayRangesEq!712 (array!10971 array!10971 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!3517 (= call!3522 (arrayRangesEq!712 (array!10972 (store (arr!5752 arr!308) i!761 (_1!10258 lt!353120)) (size!4813 arr!308)) (ite c!11101 (_3!718 lt!353468) (array!10972 (store (arr!5752 arr!308) i!761 (_1!10258 lt!353120)) (size!4813 arr!308))) (ite c!11101 lt!353470 #b00000000000000000000000000000000) (ite c!11101 (bvadd #b00000000000000000000000000000001 i!761) (size!4813 (array!10972 (store (arr!5752 arr!308) i!761 (_1!10258 lt!353120)) (size!4813 arr!308))))))))

(declare-fun b!223461 () Bool)

(assert (=> b!223461 (= e!152090 (arrayRangesEq!712 (array!10972 (store (arr!5752 arr!308) i!761 (_1!10258 lt!353120)) (size!4813 arr!308)) (_3!718 lt!353471) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun bm!3518 () Bool)

(declare-fun call!3521 () (_ BitVec 64))

(assert (=> bm!3518 (= call!3521 (bitIndex!0 (size!4813 (buf!5357 (_2!10258 lt!353120))) (currentByte!10054 (_2!10258 lt!353120)) (currentBit!10049 (_2!10258 lt!353120))))))

(declare-fun b!223462 () Bool)

(declare-fun e!152091 () tuple3!1152)

(declare-fun lt!353469 () Unit!16174)

(assert (=> b!223462 (= e!152091 (tuple3!1153 lt!353469 (_2!10257 lt!353468) (_3!718 lt!353468)))))

(declare-fun lt!353439 () tuple2!19078)

(assert (=> b!223462 (= lt!353439 (readByte!0 (_2!10258 lt!353120)))))

(declare-fun lt!353465 () array!10971)

(assert (=> b!223462 (= lt!353465 (array!10972 (store (arr!5752 (array!10972 (store (arr!5752 arr!308) i!761 (_1!10258 lt!353120)) (size!4813 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10258 lt!353439)) (size!4813 (array!10972 (store (arr!5752 arr!308) i!761 (_1!10258 lt!353120)) (size!4813 arr!308)))))))

(declare-fun lt!353452 () (_ BitVec 64))

(assert (=> b!223462 (= lt!353452 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!353464 () (_ BitVec 32))

(assert (=> b!223462 (= lt!353464 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!353472 () Unit!16174)

(assert (=> b!223462 (= lt!353472 (validateOffsetBytesFromBitIndexLemma!0 (_2!10258 lt!353120) (_2!10258 lt!353439) lt!353452 lt!353464))))

(assert (=> b!223462 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4813 (buf!5357 (_2!10258 lt!353439)))) ((_ sign_extend 32) (currentByte!10054 (_2!10258 lt!353439))) ((_ sign_extend 32) (currentBit!10049 (_2!10258 lt!353439))) (bvsub lt!353464 ((_ extract 31 0) (bvsdiv (bvadd lt!353452 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!353467 () Unit!16174)

(assert (=> b!223462 (= lt!353467 lt!353472)))

(assert (=> b!223462 (= lt!353468 (readByteArrayLoop!0 (_2!10258 lt!353439) lt!353465 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> b!223462 (= (bitIndex!0 (size!4813 (buf!5357 (_2!10258 lt!353439))) (currentByte!10054 (_2!10258 lt!353439)) (currentBit!10049 (_2!10258 lt!353439))) (bvadd call!3521 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!353442 () Unit!16174)

(declare-fun Unit!16184 () Unit!16174)

(assert (=> b!223462 (= lt!353442 Unit!16184)))

(assert (=> b!223462 (= (bvadd (bitIndex!0 (size!4813 (buf!5357 (_2!10258 lt!353439))) (currentByte!10054 (_2!10258 lt!353439)) (currentBit!10049 (_2!10258 lt!353439))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4813 (buf!5357 (_2!10257 lt!353468))) (currentByte!10054 (_2!10257 lt!353468)) (currentBit!10049 (_2!10257 lt!353468))))))

(declare-fun lt!353446 () Unit!16174)

(declare-fun Unit!16185 () Unit!16174)

(assert (=> b!223462 (= lt!353446 Unit!16185)))

(assert (=> b!223462 (= (bvadd call!3521 (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4813 (buf!5357 (_2!10257 lt!353468))) (currentByte!10054 (_2!10257 lt!353468)) (currentBit!10049 (_2!10257 lt!353468))))))

(declare-fun lt!353456 () Unit!16174)

(declare-fun Unit!16186 () Unit!16174)

(assert (=> b!223462 (= lt!353456 Unit!16186)))

(assert (=> b!223462 (and (= (buf!5357 (_2!10258 lt!353120)) (buf!5357 (_2!10257 lt!353468))) (= (size!4813 (array!10972 (store (arr!5752 arr!308) i!761 (_1!10258 lt!353120)) (size!4813 arr!308))) (size!4813 (_3!718 lt!353468))))))

(declare-fun lt!353448 () Unit!16174)

(declare-fun Unit!16187 () Unit!16174)

(assert (=> b!223462 (= lt!353448 Unit!16187)))

(declare-fun lt!353443 () Unit!16174)

(declare-fun arrayUpdatedAtPrefixLemma!304 (array!10971 (_ BitVec 32) (_ BitVec 8)) Unit!16174)

(assert (=> b!223462 (= lt!353443 (arrayUpdatedAtPrefixLemma!304 (array!10972 (store (arr!5752 arr!308) i!761 (_1!10258 lt!353120)) (size!4813 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10258 lt!353439)))))

(declare-fun call!3520 () Bool)

(assert (=> b!223462 call!3520))

(declare-fun lt!353441 () Unit!16174)

(assert (=> b!223462 (= lt!353441 lt!353443)))

(assert (=> b!223462 (= lt!353470 #b00000000000000000000000000000000)))

(declare-fun lt!353451 () Unit!16174)

(declare-fun arrayRangesEqTransitive!198 (array!10971 array!10971 array!10971 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16174)

(assert (=> b!223462 (= lt!353451 (arrayRangesEqTransitive!198 (array!10972 (store (arr!5752 arr!308) i!761 (_1!10258 lt!353120)) (size!4813 arr!308)) lt!353465 (_3!718 lt!353468) lt!353470 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!223462 call!3522))

(declare-fun lt!353450 () Unit!16174)

(assert (=> b!223462 (= lt!353450 lt!353451)))

(assert (=> b!223462 (arrayRangesEq!712 (array!10972 (store (arr!5752 arr!308) i!761 (_1!10258 lt!353120)) (size!4813 arr!308)) (_3!718 lt!353468) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!353459 () Unit!16174)

(declare-fun Unit!16188 () Unit!16174)

(assert (=> b!223462 (= lt!353459 Unit!16188)))

(declare-fun lt!353455 () Unit!16174)

(declare-fun arrayRangesEqImpliesEq!73 (array!10971 array!10971 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16174)

(assert (=> b!223462 (= lt!353455 (arrayRangesEqImpliesEq!73 lt!353465 (_3!718 lt!353468) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!223462 (= (select (store (arr!5752 (array!10972 (store (arr!5752 arr!308) i!761 (_1!10258 lt!353120)) (size!4813 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10258 lt!353439)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5752 (_3!718 lt!353468)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!353447 () Unit!16174)

(assert (=> b!223462 (= lt!353447 lt!353455)))

(declare-fun lt!353473 () Bool)

(assert (=> b!223462 (= lt!353473 (= (select (arr!5752 (_3!718 lt!353468)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10258 lt!353439)))))

(declare-fun Unit!16189 () Unit!16174)

(assert (=> b!223462 (= lt!353469 Unit!16189)))

(assert (=> b!223462 lt!353473))

(declare-fun b!223463 () Bool)

(declare-fun lt!353453 () Unit!16174)

(assert (=> b!223463 (= e!152091 (tuple3!1153 lt!353453 (_2!10258 lt!353120) (array!10972 (store (arr!5752 arr!308) i!761 (_1!10258 lt!353120)) (size!4813 arr!308))))))

(assert (=> b!223463 (= call!3521 call!3521)))

(declare-fun lt!353454 () Unit!16174)

(declare-fun Unit!16190 () Unit!16174)

(assert (=> b!223463 (= lt!353454 Unit!16190)))

(declare-fun lt!353462 () Unit!16174)

(declare-fun arrayRangesEqReflexiveLemma!65 (array!10971) Unit!16174)

(assert (=> b!223463 (= lt!353462 (arrayRangesEqReflexiveLemma!65 (array!10972 (store (arr!5752 arr!308) i!761 (_1!10258 lt!353120)) (size!4813 arr!308))))))

(assert (=> b!223463 call!3522))

(declare-fun lt!353445 () Unit!16174)

(assert (=> b!223463 (= lt!353445 lt!353462)))

(declare-fun lt!353463 () array!10971)

(assert (=> b!223463 (= lt!353463 (array!10972 (store (arr!5752 arr!308) i!761 (_1!10258 lt!353120)) (size!4813 arr!308)))))

(declare-fun lt!353449 () array!10971)

(assert (=> b!223463 (= lt!353449 (array!10972 (store (arr!5752 arr!308) i!761 (_1!10258 lt!353120)) (size!4813 arr!308)))))

(declare-fun lt!353458 () (_ BitVec 32))

(assert (=> b!223463 (= lt!353458 #b00000000000000000000000000000000)))

(declare-fun lt!353444 () (_ BitVec 32))

(assert (=> b!223463 (= lt!353444 (size!4813 (array!10972 (store (arr!5752 arr!308) i!761 (_1!10258 lt!353120)) (size!4813 arr!308))))))

(declare-fun lt!353457 () (_ BitVec 32))

(assert (=> b!223463 (= lt!353457 #b00000000000000000000000000000000)))

(declare-fun lt!353466 () (_ BitVec 32))

(assert (=> b!223463 (= lt!353466 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!65 (array!10971 array!10971 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16174)

(assert (=> b!223463 (= lt!353453 (arrayRangesEqSlicedLemma!65 lt!353463 lt!353449 lt!353458 lt!353444 lt!353457 lt!353466))))

(assert (=> b!223463 call!3520))

(declare-fun e!152092 () Bool)

(declare-fun b!223464 () Bool)

(declare-datatypes ((tuple2!19086 0))(
  ( (tuple2!19087 (_1!10264 BitStream!8728) (_2!10264 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!8728) tuple2!19086)

(assert (=> b!223464 (= e!152092 (= (select (arr!5752 (_3!718 lt!353471)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10264 (readBytePure!0 (_2!10258 lt!353120)))))))

(assert (=> b!223464 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4813 (_3!718 lt!353471))))))

(declare-fun bm!3519 () Bool)

(assert (=> bm!3519 (= call!3520 (arrayRangesEq!712 (ite c!11101 (array!10972 (store (arr!5752 arr!308) i!761 (_1!10258 lt!353120)) (size!4813 arr!308)) lt!353463) (ite c!11101 (array!10972 (store (arr!5752 (array!10972 (store (arr!5752 arr!308) i!761 (_1!10258 lt!353120)) (size!4813 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10258 lt!353439)) (size!4813 (array!10972 (store (arr!5752 arr!308) i!761 (_1!10258 lt!353120)) (size!4813 arr!308)))) lt!353449) (ite c!11101 #b00000000000000000000000000000000 lt!353457) (ite c!11101 (bvadd #b00000000000000000000000000000001 i!761) lt!353466)))))

(declare-fun d!75702 () Bool)

(assert (=> d!75702 e!152092))

(declare-fun res!187582 () Bool)

(assert (=> d!75702 (=> res!187582 e!152092)))

(assert (=> d!75702 (= res!187582 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!353438 () Bool)

(assert (=> d!75702 (= lt!353438 e!152090)))

(declare-fun res!187581 () Bool)

(assert (=> d!75702 (=> (not res!187581) (not e!152090))))

(declare-fun lt!353460 () (_ BitVec 64))

(declare-fun lt!353440 () (_ BitVec 64))

(assert (=> d!75702 (= res!187581 (= (bvadd lt!353460 lt!353440) (bitIndex!0 (size!4813 (buf!5357 (_2!10257 lt!353471))) (currentByte!10054 (_2!10257 lt!353471)) (currentBit!10049 (_2!10257 lt!353471)))))))

(assert (=> d!75702 (or (not (= (bvand lt!353460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!353440 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!353460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!353460 lt!353440) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!353461 () (_ BitVec 64))

(assert (=> d!75702 (= lt!353440 (bvmul lt!353461 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!75702 (or (= lt!353461 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!353461 #b0000000000000000000000000000000000000000000000000000000000001000) lt!353461)))))

(assert (=> d!75702 (= lt!353461 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!75702 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!75702 (= lt!353460 (bitIndex!0 (size!4813 (buf!5357 (_2!10258 lt!353120))) (currentByte!10054 (_2!10258 lt!353120)) (currentBit!10049 (_2!10258 lt!353120))))))

(assert (=> d!75702 (= lt!353471 e!152091)))

(assert (=> d!75702 (= c!11101 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!75702 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4813 (array!10972 (store (arr!5752 arr!308) i!761 (_1!10258 lt!353120)) (size!4813 arr!308)))))))

(assert (=> d!75702 (= (readByteArrayLoop!0 (_2!10258 lt!353120) (array!10972 (store (arr!5752 arr!308) i!761 (_1!10258 lt!353120)) (size!4813 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!353471)))

(assert (= (and d!75702 c!11101) b!223462))

(assert (= (and d!75702 (not c!11101)) b!223463))

(assert (= (or b!223462 b!223463) bm!3517))

(assert (= (or b!223462 b!223463) bm!3519))

(assert (= (or b!223462 b!223463) bm!3518))

(assert (= (and d!75702 res!187581) b!223460))

(assert (= (and b!223460 res!187583) b!223461))

(assert (= (and d!75702 (not res!187582)) b!223464))

(declare-fun m!342325 () Bool)

(assert (=> b!223463 m!342325))

(declare-fun m!342327 () Bool)

(assert (=> b!223463 m!342327))

(declare-fun m!342329 () Bool)

(assert (=> b!223464 m!342329))

(declare-fun m!342331 () Bool)

(assert (=> b!223464 m!342331))

(declare-fun m!342333 () Bool)

(assert (=> b!223462 m!342333))

(declare-fun m!342335 () Bool)

(assert (=> b!223462 m!342335))

(declare-fun m!342337 () Bool)

(assert (=> b!223462 m!342337))

(declare-fun m!342339 () Bool)

(assert (=> b!223462 m!342339))

(declare-fun m!342341 () Bool)

(assert (=> b!223462 m!342341))

(declare-fun m!342343 () Bool)

(assert (=> b!223462 m!342343))

(declare-fun m!342345 () Bool)

(assert (=> b!223462 m!342345))

(declare-fun m!342347 () Bool)

(assert (=> b!223462 m!342347))

(declare-fun m!342349 () Bool)

(assert (=> b!223462 m!342349))

(declare-fun m!342351 () Bool)

(assert (=> b!223462 m!342351))

(declare-fun m!342353 () Bool)

(assert (=> b!223462 m!342353))

(declare-fun m!342355 () Bool)

(assert (=> b!223462 m!342355))

(declare-fun m!342357 () Bool)

(assert (=> b!223462 m!342357))

(assert (=> bm!3518 m!342209))

(declare-fun m!342359 () Bool)

(assert (=> b!223461 m!342359))

(declare-fun m!342361 () Bool)

(assert (=> bm!3517 m!342361))

(declare-fun m!342363 () Bool)

(assert (=> d!75702 m!342363))

(assert (=> d!75702 m!342209))

(assert (=> bm!3519 m!342349))

(declare-fun m!342365 () Bool)

(assert (=> bm!3519 m!342365))

(assert (=> b!223385 d!75702))

(declare-fun d!75706 () Bool)

(assert (=> d!75706 (= (invariant!0 (currentBit!10049 (_2!10257 lt!353121)) (currentByte!10054 (_2!10257 lt!353121)) (size!4813 (buf!5357 (_2!10257 lt!353121)))) (and (bvsge (currentBit!10049 (_2!10257 lt!353121)) #b00000000000000000000000000000000) (bvslt (currentBit!10049 (_2!10257 lt!353121)) #b00000000000000000000000000001000) (bvsge (currentByte!10054 (_2!10257 lt!353121)) #b00000000000000000000000000000000) (or (bvslt (currentByte!10054 (_2!10257 lt!353121)) (size!4813 (buf!5357 (_2!10257 lt!353121)))) (and (= (currentBit!10049 (_2!10257 lt!353121)) #b00000000000000000000000000000000) (= (currentByte!10054 (_2!10257 lt!353121)) (size!4813 (buf!5357 (_2!10257 lt!353121))))))))))

(assert (=> b!223385 d!75706))

(declare-fun d!75708 () Bool)

(declare-fun e!152098 () Bool)

(assert (=> d!75708 e!152098))

(declare-fun res!187594 () Bool)

(assert (=> d!75708 (=> (not res!187594) (not e!152098))))

(declare-fun lt!353525 () (_ BitVec 64))

(declare-fun lt!353522 () (_ BitVec 64))

(declare-fun lt!353527 () (_ BitVec 64))

(assert (=> d!75708 (= res!187594 (= lt!353525 (bvsub lt!353522 lt!353527)))))

(assert (=> d!75708 (or (= (bvand lt!353522 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!353527 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!353522 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!353522 lt!353527) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75708 (= lt!353527 (remainingBits!0 ((_ sign_extend 32) (size!4813 (buf!5357 (_2!10258 lt!353120)))) ((_ sign_extend 32) (currentByte!10054 (_2!10258 lt!353120))) ((_ sign_extend 32) (currentBit!10049 (_2!10258 lt!353120)))))))

(declare-fun lt!353524 () (_ BitVec 64))

(declare-fun lt!353523 () (_ BitVec 64))

(assert (=> d!75708 (= lt!353522 (bvmul lt!353524 lt!353523))))

(assert (=> d!75708 (or (= lt!353524 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!353523 (bvsdiv (bvmul lt!353524 lt!353523) lt!353524)))))

(assert (=> d!75708 (= lt!353523 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75708 (= lt!353524 ((_ sign_extend 32) (size!4813 (buf!5357 (_2!10258 lt!353120)))))))

(assert (=> d!75708 (= lt!353525 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10054 (_2!10258 lt!353120))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10049 (_2!10258 lt!353120)))))))

(assert (=> d!75708 (invariant!0 (currentBit!10049 (_2!10258 lt!353120)) (currentByte!10054 (_2!10258 lt!353120)) (size!4813 (buf!5357 (_2!10258 lt!353120))))))

(assert (=> d!75708 (= (bitIndex!0 (size!4813 (buf!5357 (_2!10258 lt!353120))) (currentByte!10054 (_2!10258 lt!353120)) (currentBit!10049 (_2!10258 lt!353120))) lt!353525)))

(declare-fun b!223474 () Bool)

(declare-fun res!187593 () Bool)

(assert (=> b!223474 (=> (not res!187593) (not e!152098))))

(assert (=> b!223474 (= res!187593 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!353525))))

(declare-fun b!223475 () Bool)

(declare-fun lt!353526 () (_ BitVec 64))

(assert (=> b!223475 (= e!152098 (bvsle lt!353525 (bvmul lt!353526 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223475 (or (= lt!353526 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!353526 #b0000000000000000000000000000000000000000000000000000000000001000) lt!353526)))))

(assert (=> b!223475 (= lt!353526 ((_ sign_extend 32) (size!4813 (buf!5357 (_2!10258 lt!353120)))))))

(assert (= (and d!75708 res!187594) b!223474))

(assert (= (and b!223474 res!187593) b!223475))

(assert (=> d!75708 m!342265))

(declare-fun m!342409 () Bool)

(assert (=> d!75708 m!342409))

(assert (=> b!223385 d!75708))

(declare-fun d!75712 () Bool)

(declare-fun e!152099 () Bool)

(assert (=> d!75712 e!152099))

(declare-fun res!187596 () Bool)

(assert (=> d!75712 (=> (not res!187596) (not e!152099))))

(declare-fun lt!353533 () (_ BitVec 64))

(declare-fun lt!353531 () (_ BitVec 64))

(declare-fun lt!353528 () (_ BitVec 64))

(assert (=> d!75712 (= res!187596 (= lt!353531 (bvsub lt!353528 lt!353533)))))

(assert (=> d!75712 (or (= (bvand lt!353528 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!353533 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!353528 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!353528 lt!353533) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75712 (= lt!353533 (remainingBits!0 ((_ sign_extend 32) (size!4813 (buf!5357 thiss!1870))) ((_ sign_extend 32) (currentByte!10054 thiss!1870)) ((_ sign_extend 32) (currentBit!10049 thiss!1870))))))

(declare-fun lt!353530 () (_ BitVec 64))

(declare-fun lt!353529 () (_ BitVec 64))

(assert (=> d!75712 (= lt!353528 (bvmul lt!353530 lt!353529))))

(assert (=> d!75712 (or (= lt!353530 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!353529 (bvsdiv (bvmul lt!353530 lt!353529) lt!353530)))))

(assert (=> d!75712 (= lt!353529 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75712 (= lt!353530 ((_ sign_extend 32) (size!4813 (buf!5357 thiss!1870))))))

(assert (=> d!75712 (= lt!353531 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10054 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10049 thiss!1870))))))

(assert (=> d!75712 (invariant!0 (currentBit!10049 thiss!1870) (currentByte!10054 thiss!1870) (size!4813 (buf!5357 thiss!1870)))))

(assert (=> d!75712 (= (bitIndex!0 (size!4813 (buf!5357 thiss!1870)) (currentByte!10054 thiss!1870) (currentBit!10049 thiss!1870)) lt!353531)))

(declare-fun b!223476 () Bool)

(declare-fun res!187595 () Bool)

(assert (=> b!223476 (=> (not res!187595) (not e!152099))))

(assert (=> b!223476 (= res!187595 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!353531))))

(declare-fun b!223477 () Bool)

(declare-fun lt!353532 () (_ BitVec 64))

(assert (=> b!223477 (= e!152099 (bvsle lt!353531 (bvmul lt!353532 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223477 (or (= lt!353532 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!353532 #b0000000000000000000000000000000000000000000000000000000000001000) lt!353532)))))

(assert (=> b!223477 (= lt!353532 ((_ sign_extend 32) (size!4813 (buf!5357 thiss!1870))))))

(assert (= (and d!75712 res!187596) b!223476))

(assert (= (and b!223476 res!187595) b!223477))

(assert (=> d!75712 m!342263))

(declare-fun m!342411 () Bool)

(assert (=> d!75712 m!342411))

(assert (=> b!223385 d!75712))

(declare-fun d!75714 () Bool)

(declare-fun e!152108 () Bool)

(assert (=> d!75714 e!152108))

(declare-fun res!187605 () Bool)

(assert (=> d!75714 (=> (not res!187605) (not e!152108))))

(assert (=> d!75714 (= res!187605 (and (or (let ((rhs!3677 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3677 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3677) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!75715 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!75715 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!75715 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3676 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3676 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3676) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!353562 () Unit!16174)

(declare-fun choose!57 (BitStream!8728 BitStream!8728 (_ BitVec 64) (_ BitVec 32)) Unit!16174)

(assert (=> d!75714 (= lt!353562 (choose!57 thiss!1870 (_2!10258 lt!353120) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!75714 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10258 lt!353120) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!353562)))

(declare-fun b!223486 () Bool)

(declare-fun lt!353563 () (_ BitVec 32))

(assert (=> b!223486 (= e!152108 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4813 (buf!5357 (_2!10258 lt!353120)))) ((_ sign_extend 32) (currentByte!10054 (_2!10258 lt!353120))) ((_ sign_extend 32) (currentBit!10049 (_2!10258 lt!353120))) (bvsub (bvsub to!496 i!761) lt!353563)))))

(assert (=> b!223486 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!353563 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!353563) #b10000000000000000000000000000000)))))

(declare-fun lt!353561 () (_ BitVec 64))

(assert (=> b!223486 (= lt!353563 ((_ extract 31 0) lt!353561))))

(assert (=> b!223486 (and (bvslt lt!353561 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!353561 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!223486 (= lt!353561 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!75714 res!187605) b!223486))

(declare-fun m!342421 () Bool)

(assert (=> d!75714 m!342421))

(declare-fun m!342423 () Bool)

(assert (=> b!223486 m!342423))

(assert (=> b!223385 d!75714))

(declare-fun d!75719 () Bool)

(assert (=> d!75719 (= (array_inv!4554 (buf!5357 thiss!1870)) (bvsge (size!4813 (buf!5357 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!223386 d!75719))

(declare-fun d!75721 () Bool)

(assert (=> d!75721 (= (array_inv!4554 arr!308) (bvsge (size!4813 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!46480 d!75721))

(declare-fun d!75723 () Bool)

(assert (=> d!75723 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10049 thiss!1870) (currentByte!10054 thiss!1870) (size!4813 (buf!5357 thiss!1870))))))

(declare-fun bs!18468 () Bool)

(assert (= bs!18468 d!75723))

(assert (=> bs!18468 m!342411))

(assert (=> start!46480 d!75723))

(push 1)

(assert (not bm!3518))

(assert (not d!75682))

(assert (not b!223463))

(assert (not d!75678))

(assert (not b!223424))

(assert (not d!75723))

(assert (not d!75712))

(assert (not d!75702))

(assert (not b!223461))

(assert (not d!75680))

(assert (not b!223464))

(assert (not b!223486))

(assert (not b!223462))

(assert (not bm!3517))

(assert (not bm!3519))

(assert (not d!75708))

(assert (not d!75714))

(check-sat)

(pop 1)

(push 1)

(check-sat)

