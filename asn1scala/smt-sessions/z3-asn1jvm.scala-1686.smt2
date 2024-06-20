; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46768 () Bool)

(assert start!46768)

(declare-fun res!188324 () Bool)

(declare-fun e!152930 () Bool)

(assert (=> start!46768 (=> (not res!188324) (not e!152930))))

(declare-datatypes ((array!11084 0))(
  ( (array!11085 (arr!5813 (Array (_ BitVec 32) (_ BitVec 8))) (size!4865 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11084)

(declare-fun to!496 () (_ BitVec 32))

(declare-fun i!761 () (_ BitVec 32))

(assert (=> start!46768 (= res!188324 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4865 arr!308))))))

(assert (=> start!46768 e!152930))

(assert (=> start!46768 true))

(declare-fun array_inv!4606 (array!11084) Bool)

(assert (=> start!46768 (array_inv!4606 arr!308)))

(declare-datatypes ((BitStream!8832 0))(
  ( (BitStream!8833 (buf!5409 array!11084) (currentByte!10137 (_ BitVec 32)) (currentBit!10132 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8832)

(declare-fun e!152928 () Bool)

(declare-fun inv!12 (BitStream!8832) Bool)

(assert (=> start!46768 (and (inv!12 thiss!1870) e!152928)))

(declare-fun b!224390 () Bool)

(assert (=> b!224390 (= e!152928 (array_inv!4606 (buf!5409 thiss!1870)))))

(declare-fun b!224389 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224389 (= e!152930 (not (invariant!0 (currentBit!10132 thiss!1870) (currentByte!10137 thiss!1870) (size!4865 (buf!5409 thiss!1870)))))))

(declare-datatypes ((tuple2!19218 0))(
  ( (tuple2!19219 (_1!10379 (_ BitVec 8)) (_2!10379 BitStream!8832)) )
))
(declare-fun lt!356167 () tuple2!19218)

(declare-datatypes ((Unit!16399 0))(
  ( (Unit!16400) )
))
(declare-datatypes ((tuple3!1256 0))(
  ( (tuple3!1257 (_1!10380 Unit!16399) (_2!10380 BitStream!8832) (_3!770 array!11084)) )
))
(declare-fun lt!356163 () tuple3!1256)

(assert (=> b!224389 (and (= (_1!10379 lt!356167) (select (arr!5813 (_3!770 lt!356163)) i!761)) (= (select (arr!5813 (_3!770 lt!356163)) i!761) (_1!10379 lt!356167)))))

(declare-fun lt!356164 () Unit!16399)

(declare-fun lt!356166 () array!11084)

(declare-fun arrayRangesEqImpliesEq!83 (array!11084 array!11084 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16399)

(assert (=> b!224389 (= lt!356164 (arrayRangesEqImpliesEq!83 lt!356166 (_3!770 lt!356163) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun arrayRangesEq!761 (array!11084 array!11084 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224389 (arrayRangesEq!761 arr!308 (_3!770 lt!356163) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!356169 () Unit!16399)

(declare-fun arrayRangesEqTransitive!232 (array!11084 array!11084 array!11084 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16399)

(assert (=> b!224389 (= lt!356169 (arrayRangesEqTransitive!232 arr!308 lt!356166 (_3!770 lt!356163) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224389 (arrayRangesEq!761 arr!308 lt!356166 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!356168 () Unit!16399)

(declare-fun arrayUpdatedAtPrefixLemma!353 (array!11084 (_ BitVec 32) (_ BitVec 8)) Unit!16399)

(assert (=> b!224389 (= lt!356168 (arrayUpdatedAtPrefixLemma!353 arr!308 i!761 (_1!10379 lt!356167)))))

(declare-fun lt!356172 () (_ BitVec 64))

(declare-fun lt!356165 () (_ BitVec 64))

(declare-fun lt!356162 () (_ BitVec 64))

(declare-fun lt!356171 () (_ BitVec 32))

(assert (=> b!224389 (and (= (bvadd lt!356162 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!356171))) lt!356165) (= (bvadd lt!356172 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!356165) (= (buf!5409 thiss!1870) (buf!5409 (_2!10380 lt!356163))) (= (size!4865 arr!308) (size!4865 (_3!770 lt!356163))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224389 (= lt!356165 (bitIndex!0 (size!4865 (buf!5409 (_2!10380 lt!356163))) (currentByte!10137 (_2!10380 lt!356163)) (currentBit!10132 (_2!10380 lt!356163))))))

(assert (=> b!224389 (= lt!356162 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!356172))))

(assert (=> b!224389 (= lt!356162 (bitIndex!0 (size!4865 (buf!5409 (_2!10379 lt!356167))) (currentByte!10137 (_2!10379 lt!356167)) (currentBit!10132 (_2!10379 lt!356167))))))

(assert (=> b!224389 (= lt!356172 (bitIndex!0 (size!4865 (buf!5409 thiss!1870)) (currentByte!10137 thiss!1870) (currentBit!10132 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8832 array!11084 (_ BitVec 32) (_ BitVec 32)) tuple3!1256)

(assert (=> b!224389 (= lt!356163 (readByteArrayLoop!0 (_2!10379 lt!356167) lt!356166 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224389 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4865 (buf!5409 (_2!10379 lt!356167)))) ((_ sign_extend 32) (currentByte!10137 (_2!10379 lt!356167))) ((_ sign_extend 32) (currentBit!10132 (_2!10379 lt!356167))) lt!356171)))

(assert (=> b!224389 (= lt!356171 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!356170 () Unit!16399)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8832 BitStream!8832 (_ BitVec 64) (_ BitVec 32)) Unit!16399)

(assert (=> b!224389 (= lt!356170 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10379 lt!356167) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224389 (= lt!356166 (array!11085 (store (arr!5813 arr!308) i!761 (_1!10379 lt!356167)) (size!4865 arr!308)))))

(declare-fun readByte!0 (BitStream!8832) tuple2!19218)

(assert (=> b!224389 (= lt!356167 (readByte!0 thiss!1870))))

(declare-fun b!224388 () Bool)

(declare-fun res!188323 () Bool)

(assert (=> b!224388 (=> (not res!188323) (not e!152930))))

(assert (=> b!224388 (= res!188323 (bvslt i!761 to!496))))

(declare-fun b!224387 () Bool)

(declare-fun res!188325 () Bool)

(assert (=> b!224387 (=> (not res!188325) (not e!152930))))

(assert (=> b!224387 (= res!188325 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4865 (buf!5409 thiss!1870))) ((_ sign_extend 32) (currentByte!10137 thiss!1870)) ((_ sign_extend 32) (currentBit!10132 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!46768 res!188324) b!224387))

(assert (= (and b!224387 res!188325) b!224388))

(assert (= (and b!224388 res!188323) b!224389))

(assert (= start!46768 b!224390))

(declare-fun m!344509 () Bool)

(assert (=> start!46768 m!344509))

(declare-fun m!344511 () Bool)

(assert (=> start!46768 m!344511))

(declare-fun m!344513 () Bool)

(assert (=> b!224390 m!344513))

(declare-fun m!344515 () Bool)

(assert (=> b!224389 m!344515))

(declare-fun m!344517 () Bool)

(assert (=> b!224389 m!344517))

(declare-fun m!344519 () Bool)

(assert (=> b!224389 m!344519))

(declare-fun m!344521 () Bool)

(assert (=> b!224389 m!344521))

(declare-fun m!344523 () Bool)

(assert (=> b!224389 m!344523))

(declare-fun m!344525 () Bool)

(assert (=> b!224389 m!344525))

(declare-fun m!344527 () Bool)

(assert (=> b!224389 m!344527))

(declare-fun m!344529 () Bool)

(assert (=> b!224389 m!344529))

(declare-fun m!344531 () Bool)

(assert (=> b!224389 m!344531))

(declare-fun m!344533 () Bool)

(assert (=> b!224389 m!344533))

(declare-fun m!344535 () Bool)

(assert (=> b!224389 m!344535))

(declare-fun m!344537 () Bool)

(assert (=> b!224389 m!344537))

(declare-fun m!344539 () Bool)

(assert (=> b!224389 m!344539))

(declare-fun m!344541 () Bool)

(assert (=> b!224389 m!344541))

(declare-fun m!344543 () Bool)

(assert (=> b!224389 m!344543))

(declare-fun m!344545 () Bool)

(assert (=> b!224387 m!344545))

(check-sat (not start!46768) (not b!224387) (not b!224389) (not b!224390))
(check-sat)
(get-model)

(declare-fun d!76031 () Bool)

(assert (=> d!76031 (= (array_inv!4606 arr!308) (bvsge (size!4865 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!46768 d!76031))

(declare-fun d!76033 () Bool)

(assert (=> d!76033 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10132 thiss!1870) (currentByte!10137 thiss!1870) (size!4865 (buf!5409 thiss!1870))))))

(declare-fun bs!18559 () Bool)

(assert (= bs!18559 d!76033))

(assert (=> bs!18559 m!344527))

(assert (=> start!46768 d!76033))

(declare-fun d!76035 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76035 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4865 (buf!5409 thiss!1870))) ((_ sign_extend 32) (currentByte!10137 thiss!1870)) ((_ sign_extend 32) (currentBit!10132 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4865 (buf!5409 thiss!1870))) ((_ sign_extend 32) (currentByte!10137 thiss!1870)) ((_ sign_extend 32) (currentBit!10132 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18560 () Bool)

(assert (= bs!18560 d!76035))

(declare-fun m!344585 () Bool)

(assert (=> bs!18560 m!344585))

(assert (=> b!224387 d!76035))

(declare-fun lt!356366 () tuple3!1256)

(declare-fun b!224446 () Bool)

(declare-fun e!152977 () Bool)

(assert (=> b!224446 (= e!152977 (arrayRangesEq!761 lt!356166 (_3!770 lt!356366) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun b!224447 () Bool)

(declare-fun e!152979 () tuple3!1256)

(declare-fun lt!356361 () Unit!16399)

(declare-fun lt!356369 () tuple3!1256)

(assert (=> b!224447 (= e!152979 (tuple3!1257 lt!356361 (_2!10380 lt!356369) (_3!770 lt!356369)))))

(declare-fun lt!356359 () tuple2!19218)

(assert (=> b!224447 (= lt!356359 (readByte!0 (_2!10379 lt!356167)))))

(declare-fun lt!356354 () array!11084)

(assert (=> b!224447 (= lt!356354 (array!11085 (store (arr!5813 lt!356166) (bvadd #b00000000000000000000000000000001 i!761) (_1!10379 lt!356359)) (size!4865 lt!356166)))))

(declare-fun lt!356383 () (_ BitVec 64))

(assert (=> b!224447 (= lt!356383 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!356358 () (_ BitVec 32))

(assert (=> b!224447 (= lt!356358 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!356373 () Unit!16399)

(assert (=> b!224447 (= lt!356373 (validateOffsetBytesFromBitIndexLemma!0 (_2!10379 lt!356167) (_2!10379 lt!356359) lt!356383 lt!356358))))

(assert (=> b!224447 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4865 (buf!5409 (_2!10379 lt!356359)))) ((_ sign_extend 32) (currentByte!10137 (_2!10379 lt!356359))) ((_ sign_extend 32) (currentBit!10132 (_2!10379 lt!356359))) (bvsub lt!356358 ((_ extract 31 0) (bvsdiv (bvadd lt!356383 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!356367 () Unit!16399)

(assert (=> b!224447 (= lt!356367 lt!356373)))

(assert (=> b!224447 (= lt!356369 (readByteArrayLoop!0 (_2!10379 lt!356359) lt!356354 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(declare-fun call!3592 () (_ BitVec 64))

(assert (=> b!224447 (= call!3592 (bvadd (bitIndex!0 (size!4865 (buf!5409 (_2!10379 lt!356167))) (currentByte!10137 (_2!10379 lt!356167)) (currentBit!10132 (_2!10379 lt!356167))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!356356 () Unit!16399)

(declare-fun Unit!16403 () Unit!16399)

(assert (=> b!224447 (= lt!356356 Unit!16403)))

(assert (=> b!224447 (= (bvadd call!3592 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4865 (buf!5409 (_2!10380 lt!356369))) (currentByte!10137 (_2!10380 lt!356369)) (currentBit!10132 (_2!10380 lt!356369))))))

(declare-fun lt!356375 () Unit!16399)

(declare-fun Unit!16404 () Unit!16399)

(assert (=> b!224447 (= lt!356375 Unit!16404)))

(assert (=> b!224447 (= (bvadd (bitIndex!0 (size!4865 (buf!5409 (_2!10379 lt!356167))) (currentByte!10137 (_2!10379 lt!356167)) (currentBit!10132 (_2!10379 lt!356167))) (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4865 (buf!5409 (_2!10380 lt!356369))) (currentByte!10137 (_2!10380 lt!356369)) (currentBit!10132 (_2!10380 lt!356369))))))

(declare-fun lt!356380 () Unit!16399)

(declare-fun Unit!16405 () Unit!16399)

(assert (=> b!224447 (= lt!356380 Unit!16405)))

(assert (=> b!224447 (and (= (buf!5409 (_2!10379 lt!356167)) (buf!5409 (_2!10380 lt!356369))) (= (size!4865 lt!356166) (size!4865 (_3!770 lt!356369))))))

(declare-fun lt!356364 () Unit!16399)

(declare-fun Unit!16406 () Unit!16399)

(assert (=> b!224447 (= lt!356364 Unit!16406)))

(declare-fun lt!356377 () Unit!16399)

(assert (=> b!224447 (= lt!356377 (arrayUpdatedAtPrefixLemma!353 lt!356166 (bvadd #b00000000000000000000000000000001 i!761) (_1!10379 lt!356359)))))

(declare-fun call!3593 () Bool)

(assert (=> b!224447 call!3593))

(declare-fun lt!356355 () Unit!16399)

(assert (=> b!224447 (= lt!356355 lt!356377)))

(declare-fun lt!356374 () (_ BitVec 32))

(assert (=> b!224447 (= lt!356374 #b00000000000000000000000000000000)))

(declare-fun lt!356385 () Unit!16399)

(assert (=> b!224447 (= lt!356385 (arrayRangesEqTransitive!232 lt!356166 lt!356354 (_3!770 lt!356369) lt!356374 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!224447 (arrayRangesEq!761 lt!356166 (_3!770 lt!356369) lt!356374 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!356365 () Unit!16399)

(assert (=> b!224447 (= lt!356365 lt!356385)))

(declare-fun call!3594 () Bool)

(assert (=> b!224447 call!3594))

(declare-fun lt!356384 () Unit!16399)

(declare-fun Unit!16407 () Unit!16399)

(assert (=> b!224447 (= lt!356384 Unit!16407)))

(declare-fun lt!356370 () Unit!16399)

(assert (=> b!224447 (= lt!356370 (arrayRangesEqImpliesEq!83 lt!356354 (_3!770 lt!356369) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!224447 (= (select (store (arr!5813 lt!356166) (bvadd #b00000000000000000000000000000001 i!761) (_1!10379 lt!356359)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5813 (_3!770 lt!356369)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!356382 () Unit!16399)

(assert (=> b!224447 (= lt!356382 lt!356370)))

(declare-fun lt!356371 () Bool)

(assert (=> b!224447 (= lt!356371 (= (select (arr!5813 (_3!770 lt!356369)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10379 lt!356359)))))

(declare-fun Unit!16408 () Unit!16399)

(assert (=> b!224447 (= lt!356361 Unit!16408)))

(assert (=> b!224447 lt!356371))

(declare-fun c!11125 () Bool)

(declare-fun bm!3589 () Bool)

(assert (=> bm!3589 (= call!3592 (bitIndex!0 (ite c!11125 (size!4865 (buf!5409 (_2!10379 lt!356359))) (size!4865 (buf!5409 (_2!10379 lt!356167)))) (ite c!11125 (currentByte!10137 (_2!10379 lt!356359)) (currentByte!10137 (_2!10379 lt!356167))) (ite c!11125 (currentBit!10132 (_2!10379 lt!356359)) (currentBit!10132 (_2!10379 lt!356167)))))))

(declare-fun lt!356351 () array!11084)

(declare-fun bm!3590 () Bool)

(declare-fun lt!356350 () (_ BitVec 32))

(declare-fun lt!356352 () (_ BitVec 32))

(declare-fun lt!356378 () array!11084)

(assert (=> bm!3590 (= call!3593 (arrayRangesEq!761 (ite c!11125 lt!356166 lt!356378) (ite c!11125 (array!11085 (store (arr!5813 lt!356166) (bvadd #b00000000000000000000000000000001 i!761) (_1!10379 lt!356359)) (size!4865 lt!356166)) lt!356351) (ite c!11125 #b00000000000000000000000000000000 lt!356352) (ite c!11125 (bvadd #b00000000000000000000000000000001 i!761) lt!356350)))))

(declare-fun bm!3591 () Bool)

(assert (=> bm!3591 (= call!3594 (arrayRangesEq!761 lt!356166 (ite c!11125 (_3!770 lt!356369) lt!356166) #b00000000000000000000000000000000 (ite c!11125 (bvadd #b00000000000000000000000000000001 i!761) (size!4865 lt!356166))))))

(declare-fun b!224449 () Bool)

(declare-fun e!152978 () Bool)

(declare-datatypes ((tuple2!19222 0))(
  ( (tuple2!19223 (_1!10383 BitStream!8832) (_2!10383 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!8832) tuple2!19222)

(assert (=> b!224449 (= e!152978 (= (select (arr!5813 (_3!770 lt!356366)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10383 (readBytePure!0 (_2!10379 lt!356167)))))))

(assert (=> b!224449 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4865 (_3!770 lt!356366))))))

(declare-fun b!224450 () Bool)

(declare-fun lt!356357 () Unit!16399)

(assert (=> b!224450 (= e!152979 (tuple3!1257 lt!356357 (_2!10379 lt!356167) lt!356166))))

(assert (=> b!224450 (= call!3592 call!3592)))

(declare-fun lt!356372 () Unit!16399)

(declare-fun Unit!16409 () Unit!16399)

(assert (=> b!224450 (= lt!356372 Unit!16409)))

(declare-fun lt!356379 () Unit!16399)

(declare-fun arrayRangesEqReflexiveLemma!74 (array!11084) Unit!16399)

(assert (=> b!224450 (= lt!356379 (arrayRangesEqReflexiveLemma!74 lt!356166))))

(assert (=> b!224450 call!3594))

(declare-fun lt!356376 () Unit!16399)

(assert (=> b!224450 (= lt!356376 lt!356379)))

(assert (=> b!224450 (= lt!356378 lt!356166)))

(assert (=> b!224450 (= lt!356351 lt!356166)))

(declare-fun lt!356360 () (_ BitVec 32))

(assert (=> b!224450 (= lt!356360 #b00000000000000000000000000000000)))

(declare-fun lt!356353 () (_ BitVec 32))

(assert (=> b!224450 (= lt!356353 (size!4865 lt!356166))))

(assert (=> b!224450 (= lt!356352 #b00000000000000000000000000000000)))

(assert (=> b!224450 (= lt!356350 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!74 (array!11084 array!11084 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16399)

(assert (=> b!224450 (= lt!356357 (arrayRangesEqSlicedLemma!74 lt!356378 lt!356351 lt!356360 lt!356353 lt!356352 lt!356350))))

(assert (=> b!224450 call!3593))

(declare-fun b!224448 () Bool)

(declare-fun res!188377 () Bool)

(assert (=> b!224448 (=> (not res!188377) (not e!152977))))

(assert (=> b!224448 (= res!188377 (and (= (buf!5409 (_2!10379 lt!356167)) (buf!5409 (_2!10380 lt!356366))) (= (size!4865 lt!356166) (size!4865 (_3!770 lt!356366)))))))

(declare-fun d!76037 () Bool)

(assert (=> d!76037 e!152978))

(declare-fun res!188376 () Bool)

(assert (=> d!76037 (=> res!188376 e!152978)))

(assert (=> d!76037 (= res!188376 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!356362 () Bool)

(assert (=> d!76037 (= lt!356362 e!152977)))

(declare-fun res!188375 () Bool)

(assert (=> d!76037 (=> (not res!188375) (not e!152977))))

(declare-fun lt!356363 () (_ BitVec 64))

(declare-fun lt!356368 () (_ BitVec 64))

(assert (=> d!76037 (= res!188375 (= (bvadd lt!356363 lt!356368) (bitIndex!0 (size!4865 (buf!5409 (_2!10380 lt!356366))) (currentByte!10137 (_2!10380 lt!356366)) (currentBit!10132 (_2!10380 lt!356366)))))))

(assert (=> d!76037 (or (not (= (bvand lt!356363 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!356368 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!356363 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!356363 lt!356368) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!356381 () (_ BitVec 64))

(assert (=> d!76037 (= lt!356368 (bvmul lt!356381 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!76037 (or (= lt!356381 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!356381 #b0000000000000000000000000000000000000000000000000000000000001000) lt!356381)))))

(assert (=> d!76037 (= lt!356381 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!76037 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!76037 (= lt!356363 (bitIndex!0 (size!4865 (buf!5409 (_2!10379 lt!356167))) (currentByte!10137 (_2!10379 lt!356167)) (currentBit!10132 (_2!10379 lt!356167))))))

(assert (=> d!76037 (= lt!356366 e!152979)))

(assert (=> d!76037 (= c!11125 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!76037 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4865 lt!356166)))))

(assert (=> d!76037 (= (readByteArrayLoop!0 (_2!10379 lt!356167) lt!356166 (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!356366)))

(assert (= (and d!76037 c!11125) b!224447))

(assert (= (and d!76037 (not c!11125)) b!224450))

(assert (= (or b!224447 b!224450) bm!3591))

(assert (= (or b!224447 b!224450) bm!3590))

(assert (= (or b!224447 b!224450) bm!3589))

(assert (= (and d!76037 res!188375) b!224448))

(assert (= (and b!224448 res!188377) b!224446))

(assert (= (and d!76037 (not res!188376)) b!224449))

(declare-fun m!344633 () Bool)

(assert (=> d!76037 m!344633))

(assert (=> d!76037 m!344519))

(declare-fun m!344635 () Bool)

(assert (=> bm!3590 m!344635))

(declare-fun m!344637 () Bool)

(assert (=> bm!3590 m!344637))

(declare-fun m!344639 () Bool)

(assert (=> b!224447 m!344639))

(declare-fun m!344641 () Bool)

(assert (=> b!224447 m!344641))

(declare-fun m!344643 () Bool)

(assert (=> b!224447 m!344643))

(declare-fun m!344645 () Bool)

(assert (=> b!224447 m!344645))

(assert (=> b!224447 m!344519))

(declare-fun m!344647 () Bool)

(assert (=> b!224447 m!344647))

(declare-fun m!344649 () Bool)

(assert (=> b!224447 m!344649))

(assert (=> b!224447 m!344635))

(declare-fun m!344651 () Bool)

(assert (=> b!224447 m!344651))

(declare-fun m!344653 () Bool)

(assert (=> b!224447 m!344653))

(declare-fun m!344655 () Bool)

(assert (=> b!224447 m!344655))

(declare-fun m!344657 () Bool)

(assert (=> b!224447 m!344657))

(declare-fun m!344659 () Bool)

(assert (=> b!224447 m!344659))

(declare-fun m!344661 () Bool)

(assert (=> b!224450 m!344661))

(declare-fun m!344663 () Bool)

(assert (=> b!224450 m!344663))

(declare-fun m!344665 () Bool)

(assert (=> bm!3589 m!344665))

(declare-fun m!344667 () Bool)

(assert (=> b!224449 m!344667))

(declare-fun m!344669 () Bool)

(assert (=> b!224449 m!344669))

(declare-fun m!344671 () Bool)

(assert (=> bm!3591 m!344671))

(declare-fun m!344673 () Bool)

(assert (=> b!224446 m!344673))

(assert (=> b!224389 d!76037))

(declare-fun d!76078 () Bool)

(assert (=> d!76078 (and (bvsge i!761 #b00000000000000000000000000000000) (bvslt i!761 (size!4865 lt!356166)) (bvslt i!761 (size!4865 (_3!770 lt!356163))) (= (select (arr!5813 lt!356166) i!761) (select (arr!5813 (_3!770 lt!356163)) i!761)))))

(declare-fun lt!356388 () Unit!16399)

(declare-fun choose!281 (array!11084 array!11084 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16399)

(assert (=> d!76078 (= lt!356388 (choose!281 lt!356166 (_3!770 lt!356163) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!76078 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!76078 (= (arrayRangesEqImpliesEq!83 lt!356166 (_3!770 lt!356163) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)) lt!356388)))

(declare-fun bs!18565 () Bool)

(assert (= bs!18565 d!76078))

(declare-fun m!344675 () Bool)

(assert (=> bs!18565 m!344675))

(assert (=> bs!18565 m!344517))

(declare-fun m!344677 () Bool)

(assert (=> bs!18565 m!344677))

(assert (=> b!224389 d!76078))

(declare-fun d!76080 () Bool)

(declare-fun lt!356477 () (_ BitVec 8))

(declare-fun lt!356478 () (_ BitVec 8))

(assert (=> d!76080 (= lt!356477 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5813 (buf!5409 thiss!1870)) (currentByte!10137 thiss!1870))) ((_ sign_extend 24) lt!356478))))))

(assert (=> d!76080 (= lt!356478 ((_ extract 7 0) (currentBit!10132 thiss!1870)))))

(declare-fun e!152991 () Bool)

(assert (=> d!76080 e!152991))

(declare-fun res!188389 () Bool)

(assert (=> d!76080 (=> (not res!188389) (not e!152991))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!76080 (= res!188389 (validate_offset_bits!1 ((_ sign_extend 32) (size!4865 (buf!5409 thiss!1870))) ((_ sign_extend 32) (currentByte!10137 thiss!1870)) ((_ sign_extend 32) (currentBit!10132 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19226 0))(
  ( (tuple2!19227 (_1!10385 Unit!16399) (_2!10385 (_ BitVec 8))) )
))
(declare-fun Unit!16414 () Unit!16399)

(declare-fun Unit!16415 () Unit!16399)

(assert (=> d!76080 (= (readByte!0 thiss!1870) (tuple2!19219 (_2!10385 (ite (bvsgt ((_ sign_extend 24) lt!356478) #b00000000000000000000000000000000) (tuple2!19227 Unit!16414 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!356477) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5813 (buf!5409 thiss!1870)) (bvadd (currentByte!10137 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!356478)))))))) (tuple2!19227 Unit!16415 lt!356477))) (BitStream!8833 (buf!5409 thiss!1870) (bvadd (currentByte!10137 thiss!1870) #b00000000000000000000000000000001) (currentBit!10132 thiss!1870))))))

(declare-fun b!224465 () Bool)

(declare-fun e!152990 () Bool)

(assert (=> b!224465 (= e!152991 e!152990)))

(declare-fun res!188390 () Bool)

(assert (=> b!224465 (=> (not res!188390) (not e!152990))))

(declare-fun lt!356475 () tuple2!19218)

(assert (=> b!224465 (= res!188390 (= (buf!5409 (_2!10379 lt!356475)) (buf!5409 thiss!1870)))))

(declare-fun lt!356476 () (_ BitVec 8))

(declare-fun lt!356481 () (_ BitVec 8))

(declare-fun Unit!16416 () Unit!16399)

(declare-fun Unit!16417 () Unit!16399)

(assert (=> b!224465 (= lt!356475 (tuple2!19219 (_2!10385 (ite (bvsgt ((_ sign_extend 24) lt!356481) #b00000000000000000000000000000000) (tuple2!19227 Unit!16416 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!356476) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5813 (buf!5409 thiss!1870)) (bvadd (currentByte!10137 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!356481)))))))) (tuple2!19227 Unit!16417 lt!356476))) (BitStream!8833 (buf!5409 thiss!1870) (bvadd (currentByte!10137 thiss!1870) #b00000000000000000000000000000001) (currentBit!10132 thiss!1870))))))

(assert (=> b!224465 (= lt!356476 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5813 (buf!5409 thiss!1870)) (currentByte!10137 thiss!1870))) ((_ sign_extend 24) lt!356481))))))

(assert (=> b!224465 (= lt!356481 ((_ extract 7 0) (currentBit!10132 thiss!1870)))))

(declare-fun b!224466 () Bool)

(declare-fun lt!356480 () (_ BitVec 64))

(declare-fun lt!356479 () (_ BitVec 64))

(assert (=> b!224466 (= e!152990 (= (bitIndex!0 (size!4865 (buf!5409 (_2!10379 lt!356475))) (currentByte!10137 (_2!10379 lt!356475)) (currentBit!10132 (_2!10379 lt!356475))) (bvadd lt!356480 lt!356479)))))

(assert (=> b!224466 (or (not (= (bvand lt!356480 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!356479 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!356480 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!356480 lt!356479) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!224466 (= lt!356479 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!224466 (= lt!356480 (bitIndex!0 (size!4865 (buf!5409 thiss!1870)) (currentByte!10137 thiss!1870) (currentBit!10132 thiss!1870)))))

(assert (= (and d!76080 res!188389) b!224465))

(assert (= (and b!224465 res!188390) b!224466))

(declare-fun m!344679 () Bool)

(assert (=> d!76080 m!344679))

(declare-fun m!344681 () Bool)

(assert (=> d!76080 m!344681))

(declare-fun m!344683 () Bool)

(assert (=> d!76080 m!344683))

(assert (=> b!224465 m!344683))

(assert (=> b!224465 m!344679))

(declare-fun m!344685 () Bool)

(assert (=> b!224466 m!344685))

(assert (=> b!224466 m!344523))

(assert (=> b!224389 d!76080))

(declare-fun d!76082 () Bool)

(assert (=> d!76082 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4865 (buf!5409 (_2!10379 lt!356167)))) ((_ sign_extend 32) (currentByte!10137 (_2!10379 lt!356167))) ((_ sign_extend 32) (currentBit!10132 (_2!10379 lt!356167))) lt!356171) (bvsle ((_ sign_extend 32) lt!356171) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4865 (buf!5409 (_2!10379 lt!356167)))) ((_ sign_extend 32) (currentByte!10137 (_2!10379 lt!356167))) ((_ sign_extend 32) (currentBit!10132 (_2!10379 lt!356167)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18566 () Bool)

(assert (= bs!18566 d!76082))

(declare-fun m!344687 () Bool)

(assert (=> bs!18566 m!344687))

(assert (=> b!224389 d!76082))

(declare-fun d!76084 () Bool)

(declare-fun e!152997 () Bool)

(assert (=> d!76084 e!152997))

(declare-fun res!188396 () Bool)

(assert (=> d!76084 (=> (not res!188396) (not e!152997))))

(assert (=> d!76084 (= res!188396 (and (bvsge i!761 #b00000000000000000000000000000000) (bvslt i!761 (size!4865 arr!308))))))

(declare-fun lt!356520 () Unit!16399)

(declare-fun choose!285 (array!11084 (_ BitVec 32) (_ BitVec 8)) Unit!16399)

(assert (=> d!76084 (= lt!356520 (choose!285 arr!308 i!761 (_1!10379 lt!356167)))))

(assert (=> d!76084 (and (bvsle #b00000000000000000000000000000000 i!761) (bvslt i!761 (size!4865 arr!308)))))

(assert (=> d!76084 (= (arrayUpdatedAtPrefixLemma!353 arr!308 i!761 (_1!10379 lt!356167)) lt!356520)))

(declare-fun b!224474 () Bool)

(assert (=> b!224474 (= e!152997 (arrayRangesEq!761 arr!308 (array!11085 (store (arr!5813 arr!308) i!761 (_1!10379 lt!356167)) (size!4865 arr!308)) #b00000000000000000000000000000000 i!761))))

(assert (= (and d!76084 res!188396) b!224474))

(declare-fun m!344731 () Bool)

(assert (=> d!76084 m!344731))

(assert (=> b!224474 m!344543))

(declare-fun m!344733 () Bool)

(assert (=> b!224474 m!344733))

(assert (=> b!224389 d!76084))

(declare-fun d!76088 () Bool)

(assert (=> d!76088 (= (invariant!0 (currentBit!10132 thiss!1870) (currentByte!10137 thiss!1870) (size!4865 (buf!5409 thiss!1870))) (and (bvsge (currentBit!10132 thiss!1870) #b00000000000000000000000000000000) (bvslt (currentBit!10132 thiss!1870) #b00000000000000000000000000001000) (bvsge (currentByte!10137 thiss!1870) #b00000000000000000000000000000000) (or (bvslt (currentByte!10137 thiss!1870) (size!4865 (buf!5409 thiss!1870))) (and (= (currentBit!10132 thiss!1870) #b00000000000000000000000000000000) (= (currentByte!10137 thiss!1870) (size!4865 (buf!5409 thiss!1870)))))))))

(assert (=> b!224389 d!76088))

(declare-fun d!76090 () Bool)

(declare-fun e!153000 () Bool)

(assert (=> d!76090 e!153000))

(declare-fun res!188403 () Bool)

(assert (=> d!76090 (=> (not res!188403) (not e!153000))))

(declare-fun lt!356539 () (_ BitVec 64))

(declare-fun lt!356540 () (_ BitVec 64))

(declare-fun lt!356536 () (_ BitVec 64))

(assert (=> d!76090 (= res!188403 (= lt!356536 (bvsub lt!356540 lt!356539)))))

(assert (=> d!76090 (or (= (bvand lt!356540 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!356539 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!356540 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!356540 lt!356539) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76090 (= lt!356539 (remainingBits!0 ((_ sign_extend 32) (size!4865 (buf!5409 thiss!1870))) ((_ sign_extend 32) (currentByte!10137 thiss!1870)) ((_ sign_extend 32) (currentBit!10132 thiss!1870))))))

(declare-fun lt!356537 () (_ BitVec 64))

(declare-fun lt!356541 () (_ BitVec 64))

(assert (=> d!76090 (= lt!356540 (bvmul lt!356537 lt!356541))))

(assert (=> d!76090 (or (= lt!356537 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!356541 (bvsdiv (bvmul lt!356537 lt!356541) lt!356537)))))

(assert (=> d!76090 (= lt!356541 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76090 (= lt!356537 ((_ sign_extend 32) (size!4865 (buf!5409 thiss!1870))))))

(assert (=> d!76090 (= lt!356536 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10137 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10132 thiss!1870))))))

(assert (=> d!76090 (invariant!0 (currentBit!10132 thiss!1870) (currentByte!10137 thiss!1870) (size!4865 (buf!5409 thiss!1870)))))

(assert (=> d!76090 (= (bitIndex!0 (size!4865 (buf!5409 thiss!1870)) (currentByte!10137 thiss!1870) (currentBit!10132 thiss!1870)) lt!356536)))

(declare-fun b!224479 () Bool)

(declare-fun res!188402 () Bool)

(assert (=> b!224479 (=> (not res!188402) (not e!153000))))

(assert (=> b!224479 (= res!188402 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!356536))))

(declare-fun b!224480 () Bool)

(declare-fun lt!356538 () (_ BitVec 64))

(assert (=> b!224480 (= e!153000 (bvsle lt!356536 (bvmul lt!356538 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!224480 (or (= lt!356538 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!356538 #b0000000000000000000000000000000000000000000000000000000000001000) lt!356538)))))

(assert (=> b!224480 (= lt!356538 ((_ sign_extend 32) (size!4865 (buf!5409 thiss!1870))))))

(assert (= (and d!76090 res!188403) b!224479))

(assert (= (and b!224479 res!188402) b!224480))

(assert (=> d!76090 m!344585))

(assert (=> d!76090 m!344527))

(assert (=> b!224389 d!76090))

(declare-fun d!76094 () Bool)

(assert (=> d!76094 (arrayRangesEq!761 arr!308 (_3!770 lt!356163) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!356544 () Unit!16399)

(declare-fun choose!286 (array!11084 array!11084 array!11084 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16399)

(assert (=> d!76094 (= lt!356544 (choose!286 arr!308 lt!356166 (_3!770 lt!356163) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!76094 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!76094 (= (arrayRangesEqTransitive!232 arr!308 lt!356166 (_3!770 lt!356163) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)) lt!356544)))

(declare-fun bs!18568 () Bool)

(assert (= bs!18568 d!76094))

(assert (=> bs!18568 m!344531))

(declare-fun m!344737 () Bool)

(assert (=> bs!18568 m!344737))

(assert (=> b!224389 d!76094))

(declare-fun d!76096 () Bool)

(declare-fun res!188408 () Bool)

(declare-fun e!153005 () Bool)

(assert (=> d!76096 (=> res!188408 e!153005)))

(assert (=> d!76096 (= res!188408 (= #b00000000000000000000000000000000 i!761))))

(assert (=> d!76096 (= (arrayRangesEq!761 arr!308 lt!356166 #b00000000000000000000000000000000 i!761) e!153005)))

(declare-fun b!224485 () Bool)

(declare-fun e!153006 () Bool)

(assert (=> b!224485 (= e!153005 e!153006)))

(declare-fun res!188409 () Bool)

(assert (=> b!224485 (=> (not res!188409) (not e!153006))))

(assert (=> b!224485 (= res!188409 (= (select (arr!5813 arr!308) #b00000000000000000000000000000000) (select (arr!5813 lt!356166) #b00000000000000000000000000000000)))))

(declare-fun b!224486 () Bool)

(assert (=> b!224486 (= e!153006 (arrayRangesEq!761 arr!308 lt!356166 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) i!761))))

(assert (= (and d!76096 (not res!188408)) b!224485))

(assert (= (and b!224485 res!188409) b!224486))

(declare-fun m!344739 () Bool)

(assert (=> b!224485 m!344739))

(declare-fun m!344741 () Bool)

(assert (=> b!224485 m!344741))

(declare-fun m!344743 () Bool)

(assert (=> b!224486 m!344743))

(assert (=> b!224389 d!76096))

(declare-fun d!76098 () Bool)

(declare-fun e!153007 () Bool)

(assert (=> d!76098 e!153007))

(declare-fun res!188411 () Bool)

(assert (=> d!76098 (=> (not res!188411) (not e!153007))))

(declare-fun lt!356548 () (_ BitVec 64))

(declare-fun lt!356545 () (_ BitVec 64))

(declare-fun lt!356549 () (_ BitVec 64))

(assert (=> d!76098 (= res!188411 (= lt!356545 (bvsub lt!356549 lt!356548)))))

(assert (=> d!76098 (or (= (bvand lt!356549 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!356548 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!356549 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!356549 lt!356548) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76098 (= lt!356548 (remainingBits!0 ((_ sign_extend 32) (size!4865 (buf!5409 (_2!10379 lt!356167)))) ((_ sign_extend 32) (currentByte!10137 (_2!10379 lt!356167))) ((_ sign_extend 32) (currentBit!10132 (_2!10379 lt!356167)))))))

(declare-fun lt!356546 () (_ BitVec 64))

(declare-fun lt!356550 () (_ BitVec 64))

(assert (=> d!76098 (= lt!356549 (bvmul lt!356546 lt!356550))))

(assert (=> d!76098 (or (= lt!356546 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!356550 (bvsdiv (bvmul lt!356546 lt!356550) lt!356546)))))

(assert (=> d!76098 (= lt!356550 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76098 (= lt!356546 ((_ sign_extend 32) (size!4865 (buf!5409 (_2!10379 lt!356167)))))))

(assert (=> d!76098 (= lt!356545 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10137 (_2!10379 lt!356167))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10132 (_2!10379 lt!356167)))))))

(assert (=> d!76098 (invariant!0 (currentBit!10132 (_2!10379 lt!356167)) (currentByte!10137 (_2!10379 lt!356167)) (size!4865 (buf!5409 (_2!10379 lt!356167))))))

(assert (=> d!76098 (= (bitIndex!0 (size!4865 (buf!5409 (_2!10379 lt!356167))) (currentByte!10137 (_2!10379 lt!356167)) (currentBit!10132 (_2!10379 lt!356167))) lt!356545)))

(declare-fun b!224487 () Bool)

(declare-fun res!188410 () Bool)

(assert (=> b!224487 (=> (not res!188410) (not e!153007))))

(assert (=> b!224487 (= res!188410 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!356545))))

(declare-fun b!224488 () Bool)

(declare-fun lt!356547 () (_ BitVec 64))

(assert (=> b!224488 (= e!153007 (bvsle lt!356545 (bvmul lt!356547 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!224488 (or (= lt!356547 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!356547 #b0000000000000000000000000000000000000000000000000000000000001000) lt!356547)))))

(assert (=> b!224488 (= lt!356547 ((_ sign_extend 32) (size!4865 (buf!5409 (_2!10379 lt!356167)))))))

(assert (= (and d!76098 res!188411) b!224487))

(assert (= (and b!224487 res!188410) b!224488))

(assert (=> d!76098 m!344687))

(declare-fun m!344745 () Bool)

(assert (=> d!76098 m!344745))

(assert (=> b!224389 d!76098))

(declare-fun d!76100 () Bool)

(declare-fun e!153022 () Bool)

(assert (=> d!76100 e!153022))

(declare-fun res!188426 () Bool)

(assert (=> d!76100 (=> (not res!188426) (not e!153022))))

(assert (=> d!76100 (= res!188426 (and (or (let ((rhs!3743 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3743 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3743) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!76101 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!76101 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!76101 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3742 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3742 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3742) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!356652 () Unit!16399)

(declare-fun choose!57 (BitStream!8832 BitStream!8832 (_ BitVec 64) (_ BitVec 32)) Unit!16399)

(assert (=> d!76100 (= lt!356652 (choose!57 thiss!1870 (_2!10379 lt!356167) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!76100 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10379 lt!356167) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!356652)))

(declare-fun b!224507 () Bool)

(declare-fun lt!356651 () (_ BitVec 32))

(assert (=> b!224507 (= e!153022 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4865 (buf!5409 (_2!10379 lt!356167)))) ((_ sign_extend 32) (currentByte!10137 (_2!10379 lt!356167))) ((_ sign_extend 32) (currentBit!10132 (_2!10379 lt!356167))) (bvsub (bvsub to!496 i!761) lt!356651)))))

(assert (=> b!224507 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!356651 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!356651) #b10000000000000000000000000000000)))))

(declare-fun lt!356650 () (_ BitVec 64))

(assert (=> b!224507 (= lt!356651 ((_ extract 31 0) lt!356650))))

(assert (=> b!224507 (and (bvslt lt!356650 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!356650 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!224507 (= lt!356650 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!76100 res!188426) b!224507))

(declare-fun m!344755 () Bool)

(assert (=> d!76100 m!344755))

(declare-fun m!344757 () Bool)

(assert (=> b!224507 m!344757))

(assert (=> b!224389 d!76100))

(declare-fun d!76105 () Bool)

(declare-fun e!153023 () Bool)

(assert (=> d!76105 e!153023))

(declare-fun res!188428 () Bool)

(assert (=> d!76105 (=> (not res!188428) (not e!153023))))

(declare-fun lt!356653 () (_ BitVec 64))

(declare-fun lt!356657 () (_ BitVec 64))

(declare-fun lt!356656 () (_ BitVec 64))

(assert (=> d!76105 (= res!188428 (= lt!356653 (bvsub lt!356657 lt!356656)))))

(assert (=> d!76105 (or (= (bvand lt!356657 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!356656 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!356657 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!356657 lt!356656) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76105 (= lt!356656 (remainingBits!0 ((_ sign_extend 32) (size!4865 (buf!5409 (_2!10380 lt!356163)))) ((_ sign_extend 32) (currentByte!10137 (_2!10380 lt!356163))) ((_ sign_extend 32) (currentBit!10132 (_2!10380 lt!356163)))))))

(declare-fun lt!356654 () (_ BitVec 64))

(declare-fun lt!356658 () (_ BitVec 64))

(assert (=> d!76105 (= lt!356657 (bvmul lt!356654 lt!356658))))

(assert (=> d!76105 (or (= lt!356654 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!356658 (bvsdiv (bvmul lt!356654 lt!356658) lt!356654)))))

(assert (=> d!76105 (= lt!356658 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76105 (= lt!356654 ((_ sign_extend 32) (size!4865 (buf!5409 (_2!10380 lt!356163)))))))

(assert (=> d!76105 (= lt!356653 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10137 (_2!10380 lt!356163))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10132 (_2!10380 lt!356163)))))))

(assert (=> d!76105 (invariant!0 (currentBit!10132 (_2!10380 lt!356163)) (currentByte!10137 (_2!10380 lt!356163)) (size!4865 (buf!5409 (_2!10380 lt!356163))))))

(assert (=> d!76105 (= (bitIndex!0 (size!4865 (buf!5409 (_2!10380 lt!356163))) (currentByte!10137 (_2!10380 lt!356163)) (currentBit!10132 (_2!10380 lt!356163))) lt!356653)))

(declare-fun b!224508 () Bool)

(declare-fun res!188427 () Bool)

(assert (=> b!224508 (=> (not res!188427) (not e!153023))))

(assert (=> b!224508 (= res!188427 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!356653))))

(declare-fun b!224509 () Bool)

(declare-fun lt!356655 () (_ BitVec 64))

(assert (=> b!224509 (= e!153023 (bvsle lt!356653 (bvmul lt!356655 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!224509 (or (= lt!356655 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!356655 #b0000000000000000000000000000000000000000000000000000000000001000) lt!356655)))))

(assert (=> b!224509 (= lt!356655 ((_ sign_extend 32) (size!4865 (buf!5409 (_2!10380 lt!356163)))))))

(assert (= (and d!76105 res!188428) b!224508))

(assert (= (and b!224508 res!188427) b!224509))

(declare-fun m!344759 () Bool)

(assert (=> d!76105 m!344759))

(declare-fun m!344761 () Bool)

(assert (=> d!76105 m!344761))

(assert (=> b!224389 d!76105))

(declare-fun d!76107 () Bool)

(declare-fun res!188429 () Bool)

(declare-fun e!153024 () Bool)

(assert (=> d!76107 (=> res!188429 e!153024)))

(assert (=> d!76107 (= res!188429 (= #b00000000000000000000000000000000 i!761))))

(assert (=> d!76107 (= (arrayRangesEq!761 arr!308 (_3!770 lt!356163) #b00000000000000000000000000000000 i!761) e!153024)))

(declare-fun b!224510 () Bool)

(declare-fun e!153025 () Bool)

(assert (=> b!224510 (= e!153024 e!153025)))

(declare-fun res!188430 () Bool)

(assert (=> b!224510 (=> (not res!188430) (not e!153025))))

(assert (=> b!224510 (= res!188430 (= (select (arr!5813 arr!308) #b00000000000000000000000000000000) (select (arr!5813 (_3!770 lt!356163)) #b00000000000000000000000000000000)))))

(declare-fun b!224511 () Bool)

(assert (=> b!224511 (= e!153025 (arrayRangesEq!761 arr!308 (_3!770 lt!356163) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) i!761))))

(assert (= (and d!76107 (not res!188429)) b!224510))

(assert (= (and b!224510 res!188430) b!224511))

(assert (=> b!224510 m!344739))

(declare-fun m!344763 () Bool)

(assert (=> b!224510 m!344763))

(declare-fun m!344765 () Bool)

(assert (=> b!224511 m!344765))

(assert (=> b!224389 d!76107))

(declare-fun d!76109 () Bool)

(assert (=> d!76109 (= (array_inv!4606 (buf!5409 thiss!1870)) (bvsge (size!4865 (buf!5409 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!224390 d!76109))

(check-sat (not d!76035) (not d!76098) (not d!76080) (not d!76090) (not b!224466) (not bm!3590) (not d!76094) (not d!76078) (not d!76100) (not d!76033) (not b!224511) (not bm!3591) (not b!224474) (not d!76084) (not d!76105) (not b!224450) (not b!224449) (not d!76037) (not b!224446) (not bm!3589) (not b!224447) (not b!224486) (not d!76082) (not b!224507))
