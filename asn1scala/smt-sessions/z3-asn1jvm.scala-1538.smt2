; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42908 () Bool)

(assert start!42908)

(declare-fun b!202230 () Bool)

(declare-fun res!169379 () Bool)

(declare-fun e!138676 () Bool)

(assert (=> b!202230 (=> (not res!169379) (not e!138676))))

(declare-datatypes ((array!10282 0))(
  ( (array!10283 (arr!5456 (Array (_ BitVec 32) (_ BitVec 8))) (size!4526 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8160 0))(
  ( (BitStream!8161 (buf!5031 array!10282) (currentByte!9462 (_ BitVec 32)) (currentBit!9457 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8160)

(declare-datatypes ((Unit!14345 0))(
  ( (Unit!14346) )
))
(declare-datatypes ((tuple2!17304 0))(
  ( (tuple2!17305 (_1!9304 Unit!14345) (_2!9304 BitStream!8160)) )
))
(declare-fun lt!314936 () tuple2!17304)

(declare-fun isPrefixOf!0 (BitStream!8160 BitStream!8160) Bool)

(assert (=> b!202230 (= res!169379 (isPrefixOf!0 thiss!1204 (_2!9304 lt!314936)))))

(declare-fun b!202231 () Bool)

(declare-fun e!138681 () Bool)

(declare-fun e!138680 () Bool)

(assert (=> b!202231 (= e!138681 (not e!138680))))

(declare-fun res!169377 () Bool)

(assert (=> b!202231 (=> res!169377 e!138680)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!202231 (= res!169377 (not (= (bitIndex!0 (size!4526 (buf!5031 (_2!9304 lt!314936))) (currentByte!9462 (_2!9304 lt!314936)) (currentBit!9457 (_2!9304 lt!314936))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4526 (buf!5031 thiss!1204)) (currentByte!9462 thiss!1204) (currentBit!9457 thiss!1204))))))))

(declare-fun e!138678 () Bool)

(assert (=> b!202231 e!138678))

(declare-fun res!169382 () Bool)

(assert (=> b!202231 (=> (not res!169382) (not e!138678))))

(assert (=> b!202231 (= res!169382 (= (size!4526 (buf!5031 thiss!1204)) (size!4526 (buf!5031 (_2!9304 lt!314936)))))))

(declare-fun lt!314934 () Bool)

(declare-fun appendBit!0 (BitStream!8160 Bool) tuple2!17304)

(assert (=> b!202231 (= lt!314936 (appendBit!0 thiss!1204 lt!314934))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!202231 (= lt!314934 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!202232 () Bool)

(declare-fun res!169380 () Bool)

(assert (=> b!202232 (=> (not res!169380) (not e!138681))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!202232 (= res!169380 (validate_offset_bits!1 ((_ sign_extend 32) (size!4526 (buf!5031 thiss!1204))) ((_ sign_extend 32) (currentByte!9462 thiss!1204)) ((_ sign_extend 32) (currentBit!9457 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!202233 () Bool)

(declare-fun res!169381 () Bool)

(assert (=> b!202233 (=> (not res!169381) (not e!138681))))

(assert (=> b!202233 (= res!169381 (not (= i!590 nBits!348)))))

(declare-fun b!202234 () Bool)

(declare-fun e!138677 () Bool)

(assert (=> b!202234 (= e!138680 e!138677)))

(declare-fun res!169375 () Bool)

(assert (=> b!202234 (=> res!169375 e!138677)))

(assert (=> b!202234 (= res!169375 (not (isPrefixOf!0 thiss!1204 (_2!9304 lt!314936))))))

(declare-fun lt!314931 () tuple2!17304)

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8160 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17304)

(assert (=> b!202234 (= lt!314931 (appendBitsLSBFirstLoopTR!0 (_2!9304 lt!314936) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!202235 () Bool)

(assert (=> b!202235 (= e!138678 e!138676)))

(declare-fun res!169378 () Bool)

(assert (=> b!202235 (=> (not res!169378) (not e!138676))))

(declare-fun lt!314935 () (_ BitVec 64))

(declare-fun lt!314933 () (_ BitVec 64))

(assert (=> b!202235 (= res!169378 (= lt!314935 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!314933)))))

(assert (=> b!202235 (= lt!314935 (bitIndex!0 (size!4526 (buf!5031 (_2!9304 lt!314936))) (currentByte!9462 (_2!9304 lt!314936)) (currentBit!9457 (_2!9304 lt!314936))))))

(assert (=> b!202235 (= lt!314933 (bitIndex!0 (size!4526 (buf!5031 thiss!1204)) (currentByte!9462 thiss!1204) (currentBit!9457 thiss!1204)))))

(declare-fun res!169373 () Bool)

(assert (=> start!42908 (=> (not res!169373) (not e!138681))))

(assert (=> start!42908 (= res!169373 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42908 e!138681))

(assert (=> start!42908 true))

(declare-fun e!138674 () Bool)

(declare-fun inv!12 (BitStream!8160) Bool)

(assert (=> start!42908 (and (inv!12 thiss!1204) e!138674)))

(declare-fun b!202229 () Bool)

(assert (=> b!202229 (= e!138677 (isPrefixOf!0 (_2!9304 lt!314936) (_2!9304 lt!314931)))))

(declare-fun b!202236 () Bool)

(declare-fun res!169376 () Bool)

(assert (=> b!202236 (=> (not res!169376) (not e!138681))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!202236 (= res!169376 (invariant!0 (currentBit!9457 thiss!1204) (currentByte!9462 thiss!1204) (size!4526 (buf!5031 thiss!1204))))))

(declare-fun b!202237 () Bool)

(declare-fun e!138675 () Bool)

(declare-datatypes ((tuple2!17306 0))(
  ( (tuple2!17307 (_1!9305 BitStream!8160) (_2!9305 Bool)) )
))
(declare-fun lt!314932 () tuple2!17306)

(assert (=> b!202237 (= e!138675 (= (bitIndex!0 (size!4526 (buf!5031 (_1!9305 lt!314932))) (currentByte!9462 (_1!9305 lt!314932)) (currentBit!9457 (_1!9305 lt!314932))) lt!314935))))

(declare-fun b!202238 () Bool)

(declare-fun array_inv!4267 (array!10282) Bool)

(assert (=> b!202238 (= e!138674 (array_inv!4267 (buf!5031 thiss!1204)))))

(declare-fun b!202239 () Bool)

(assert (=> b!202239 (= e!138676 e!138675)))

(declare-fun res!169374 () Bool)

(assert (=> b!202239 (=> (not res!169374) (not e!138675))))

(assert (=> b!202239 (= res!169374 (and (= (_2!9305 lt!314932) lt!314934) (= (_1!9305 lt!314932) (_2!9304 lt!314936))))))

(declare-fun readBitPure!0 (BitStream!8160) tuple2!17306)

(declare-fun readerFrom!0 (BitStream!8160 (_ BitVec 32) (_ BitVec 32)) BitStream!8160)

(assert (=> b!202239 (= lt!314932 (readBitPure!0 (readerFrom!0 (_2!9304 lt!314936) (currentBit!9457 thiss!1204) (currentByte!9462 thiss!1204))))))

(assert (= (and start!42908 res!169373) b!202232))

(assert (= (and b!202232 res!169380) b!202236))

(assert (= (and b!202236 res!169376) b!202233))

(assert (= (and b!202233 res!169381) b!202231))

(assert (= (and b!202231 res!169382) b!202235))

(assert (= (and b!202235 res!169378) b!202230))

(assert (= (and b!202230 res!169379) b!202239))

(assert (= (and b!202239 res!169374) b!202237))

(assert (= (and b!202231 (not res!169377)) b!202234))

(assert (= (and b!202234 (not res!169375)) b!202229))

(assert (= start!42908 b!202238))

(declare-fun m!312665 () Bool)

(assert (=> b!202229 m!312665))

(declare-fun m!312667 () Bool)

(assert (=> b!202231 m!312667))

(declare-fun m!312669 () Bool)

(assert (=> b!202231 m!312669))

(declare-fun m!312671 () Bool)

(assert (=> b!202231 m!312671))

(declare-fun m!312673 () Bool)

(assert (=> b!202236 m!312673))

(declare-fun m!312675 () Bool)

(assert (=> b!202230 m!312675))

(declare-fun m!312677 () Bool)

(assert (=> b!202239 m!312677))

(assert (=> b!202239 m!312677))

(declare-fun m!312679 () Bool)

(assert (=> b!202239 m!312679))

(declare-fun m!312681 () Bool)

(assert (=> b!202232 m!312681))

(declare-fun m!312683 () Bool)

(assert (=> b!202238 m!312683))

(assert (=> b!202234 m!312675))

(declare-fun m!312685 () Bool)

(assert (=> b!202234 m!312685))

(declare-fun m!312687 () Bool)

(assert (=> start!42908 m!312687))

(declare-fun m!312689 () Bool)

(assert (=> b!202237 m!312689))

(assert (=> b!202235 m!312667))

(assert (=> b!202235 m!312669))

(check-sat (not b!202239) (not b!202230) (not b!202229) (not b!202237) (not b!202234) (not b!202232) (not b!202238) (not b!202236) (not start!42908) (not b!202231) (not b!202235))
(check-sat)
(get-model)

(declare-fun d!69209 () Bool)

(declare-datatypes ((tuple2!17318 0))(
  ( (tuple2!17319 (_1!9311 Bool) (_2!9311 BitStream!8160)) )
))
(declare-fun lt!314957 () tuple2!17318)

(declare-fun readBit!0 (BitStream!8160) tuple2!17318)

(assert (=> d!69209 (= lt!314957 (readBit!0 (readerFrom!0 (_2!9304 lt!314936) (currentBit!9457 thiss!1204) (currentByte!9462 thiss!1204))))))

(assert (=> d!69209 (= (readBitPure!0 (readerFrom!0 (_2!9304 lt!314936) (currentBit!9457 thiss!1204) (currentByte!9462 thiss!1204))) (tuple2!17307 (_2!9311 lt!314957) (_1!9311 lt!314957)))))

(declare-fun bs!17082 () Bool)

(assert (= bs!17082 d!69209))

(assert (=> bs!17082 m!312677))

(declare-fun m!312717 () Bool)

(assert (=> bs!17082 m!312717))

(assert (=> b!202239 d!69209))

(declare-fun d!69211 () Bool)

(declare-fun e!138708 () Bool)

(assert (=> d!69211 e!138708))

(declare-fun res!169416 () Bool)

(assert (=> d!69211 (=> (not res!169416) (not e!138708))))

(assert (=> d!69211 (= res!169416 (invariant!0 (currentBit!9457 (_2!9304 lt!314936)) (currentByte!9462 (_2!9304 lt!314936)) (size!4526 (buf!5031 (_2!9304 lt!314936)))))))

(assert (=> d!69211 (= (readerFrom!0 (_2!9304 lt!314936) (currentBit!9457 thiss!1204) (currentByte!9462 thiss!1204)) (BitStream!8161 (buf!5031 (_2!9304 lt!314936)) (currentByte!9462 thiss!1204) (currentBit!9457 thiss!1204)))))

(declare-fun b!202275 () Bool)

(assert (=> b!202275 (= e!138708 (invariant!0 (currentBit!9457 thiss!1204) (currentByte!9462 thiss!1204) (size!4526 (buf!5031 (_2!9304 lt!314936)))))))

(assert (= (and d!69211 res!169416) b!202275))

(declare-fun m!312719 () Bool)

(assert (=> d!69211 m!312719))

(declare-fun m!312721 () Bool)

(assert (=> b!202275 m!312721))

(assert (=> b!202239 d!69211))

(declare-fun d!69213 () Bool)

(assert (=> d!69213 (= (array_inv!4267 (buf!5031 thiss!1204)) (bvsge (size!4526 (buf!5031 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!202238 d!69213))

(declare-fun d!69215 () Bool)

(declare-fun e!138711 () Bool)

(assert (=> d!69215 e!138711))

(declare-fun res!169422 () Bool)

(assert (=> d!69215 (=> (not res!169422) (not e!138711))))

(declare-fun lt!314973 () (_ BitVec 64))

(declare-fun lt!314970 () (_ BitVec 64))

(declare-fun lt!314971 () (_ BitVec 64))

(assert (=> d!69215 (= res!169422 (= lt!314971 (bvsub lt!314970 lt!314973)))))

(assert (=> d!69215 (or (= (bvand lt!314970 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!314973 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!314970 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!314970 lt!314973) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!69215 (= lt!314973 (remainingBits!0 ((_ sign_extend 32) (size!4526 (buf!5031 (_2!9304 lt!314936)))) ((_ sign_extend 32) (currentByte!9462 (_2!9304 lt!314936))) ((_ sign_extend 32) (currentBit!9457 (_2!9304 lt!314936)))))))

(declare-fun lt!314974 () (_ BitVec 64))

(declare-fun lt!314975 () (_ BitVec 64))

(assert (=> d!69215 (= lt!314970 (bvmul lt!314974 lt!314975))))

(assert (=> d!69215 (or (= lt!314974 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!314975 (bvsdiv (bvmul lt!314974 lt!314975) lt!314974)))))

(assert (=> d!69215 (= lt!314975 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69215 (= lt!314974 ((_ sign_extend 32) (size!4526 (buf!5031 (_2!9304 lt!314936)))))))

(assert (=> d!69215 (= lt!314971 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9462 (_2!9304 lt!314936))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9457 (_2!9304 lt!314936)))))))

(assert (=> d!69215 (invariant!0 (currentBit!9457 (_2!9304 lt!314936)) (currentByte!9462 (_2!9304 lt!314936)) (size!4526 (buf!5031 (_2!9304 lt!314936))))))

(assert (=> d!69215 (= (bitIndex!0 (size!4526 (buf!5031 (_2!9304 lt!314936))) (currentByte!9462 (_2!9304 lt!314936)) (currentBit!9457 (_2!9304 lt!314936))) lt!314971)))

(declare-fun b!202280 () Bool)

(declare-fun res!169421 () Bool)

(assert (=> b!202280 (=> (not res!169421) (not e!138711))))

(assert (=> b!202280 (= res!169421 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!314971))))

(declare-fun b!202281 () Bool)

(declare-fun lt!314972 () (_ BitVec 64))

(assert (=> b!202281 (= e!138711 (bvsle lt!314971 (bvmul lt!314972 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!202281 (or (= lt!314972 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!314972 #b0000000000000000000000000000000000000000000000000000000000001000) lt!314972)))))

(assert (=> b!202281 (= lt!314972 ((_ sign_extend 32) (size!4526 (buf!5031 (_2!9304 lt!314936)))))))

(assert (= (and d!69215 res!169422) b!202280))

(assert (= (and b!202280 res!169421) b!202281))

(declare-fun m!312723 () Bool)

(assert (=> d!69215 m!312723))

(assert (=> d!69215 m!312719))

(assert (=> b!202235 d!69215))

(declare-fun d!69217 () Bool)

(declare-fun e!138712 () Bool)

(assert (=> d!69217 e!138712))

(declare-fun res!169424 () Bool)

(assert (=> d!69217 (=> (not res!169424) (not e!138712))))

(declare-fun lt!314976 () (_ BitVec 64))

(declare-fun lt!314979 () (_ BitVec 64))

(declare-fun lt!314977 () (_ BitVec 64))

(assert (=> d!69217 (= res!169424 (= lt!314977 (bvsub lt!314976 lt!314979)))))

(assert (=> d!69217 (or (= (bvand lt!314976 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!314979 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!314976 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!314976 lt!314979) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69217 (= lt!314979 (remainingBits!0 ((_ sign_extend 32) (size!4526 (buf!5031 thiss!1204))) ((_ sign_extend 32) (currentByte!9462 thiss!1204)) ((_ sign_extend 32) (currentBit!9457 thiss!1204))))))

(declare-fun lt!314980 () (_ BitVec 64))

(declare-fun lt!314981 () (_ BitVec 64))

(assert (=> d!69217 (= lt!314976 (bvmul lt!314980 lt!314981))))

(assert (=> d!69217 (or (= lt!314980 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!314981 (bvsdiv (bvmul lt!314980 lt!314981) lt!314980)))))

(assert (=> d!69217 (= lt!314981 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69217 (= lt!314980 ((_ sign_extend 32) (size!4526 (buf!5031 thiss!1204))))))

(assert (=> d!69217 (= lt!314977 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9462 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9457 thiss!1204))))))

(assert (=> d!69217 (invariant!0 (currentBit!9457 thiss!1204) (currentByte!9462 thiss!1204) (size!4526 (buf!5031 thiss!1204)))))

(assert (=> d!69217 (= (bitIndex!0 (size!4526 (buf!5031 thiss!1204)) (currentByte!9462 thiss!1204) (currentBit!9457 thiss!1204)) lt!314977)))

(declare-fun b!202282 () Bool)

(declare-fun res!169423 () Bool)

(assert (=> b!202282 (=> (not res!169423) (not e!138712))))

(assert (=> b!202282 (= res!169423 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!314977))))

(declare-fun b!202283 () Bool)

(declare-fun lt!314978 () (_ BitVec 64))

(assert (=> b!202283 (= e!138712 (bvsle lt!314977 (bvmul lt!314978 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!202283 (or (= lt!314978 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!314978 #b0000000000000000000000000000000000000000000000000000000000001000) lt!314978)))))

(assert (=> b!202283 (= lt!314978 ((_ sign_extend 32) (size!4526 (buf!5031 thiss!1204))))))

(assert (= (and d!69217 res!169424) b!202282))

(assert (= (and b!202282 res!169423) b!202283))

(declare-fun m!312725 () Bool)

(assert (=> d!69217 m!312725))

(assert (=> d!69217 m!312673))

(assert (=> b!202235 d!69217))

(declare-fun d!69219 () Bool)

(declare-fun res!169432 () Bool)

(declare-fun e!138718 () Bool)

(assert (=> d!69219 (=> (not res!169432) (not e!138718))))

(assert (=> d!69219 (= res!169432 (= (size!4526 (buf!5031 (_2!9304 lt!314936))) (size!4526 (buf!5031 (_2!9304 lt!314931)))))))

(assert (=> d!69219 (= (isPrefixOf!0 (_2!9304 lt!314936) (_2!9304 lt!314931)) e!138718)))

(declare-fun b!202290 () Bool)

(declare-fun res!169431 () Bool)

(assert (=> b!202290 (=> (not res!169431) (not e!138718))))

(assert (=> b!202290 (= res!169431 (bvsle (bitIndex!0 (size!4526 (buf!5031 (_2!9304 lt!314936))) (currentByte!9462 (_2!9304 lt!314936)) (currentBit!9457 (_2!9304 lt!314936))) (bitIndex!0 (size!4526 (buf!5031 (_2!9304 lt!314931))) (currentByte!9462 (_2!9304 lt!314931)) (currentBit!9457 (_2!9304 lt!314931)))))))

(declare-fun b!202291 () Bool)

(declare-fun e!138717 () Bool)

(assert (=> b!202291 (= e!138718 e!138717)))

(declare-fun res!169433 () Bool)

(assert (=> b!202291 (=> res!169433 e!138717)))

(assert (=> b!202291 (= res!169433 (= (size!4526 (buf!5031 (_2!9304 lt!314936))) #b00000000000000000000000000000000))))

(declare-fun b!202292 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10282 array!10282 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!202292 (= e!138717 (arrayBitRangesEq!0 (buf!5031 (_2!9304 lt!314936)) (buf!5031 (_2!9304 lt!314931)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4526 (buf!5031 (_2!9304 lt!314936))) (currentByte!9462 (_2!9304 lt!314936)) (currentBit!9457 (_2!9304 lt!314936)))))))

(assert (= (and d!69219 res!169432) b!202290))

(assert (= (and b!202290 res!169431) b!202291))

(assert (= (and b!202291 (not res!169433)) b!202292))

(assert (=> b!202290 m!312667))

(declare-fun m!312727 () Bool)

(assert (=> b!202290 m!312727))

(assert (=> b!202292 m!312667))

(assert (=> b!202292 m!312667))

(declare-fun m!312729 () Bool)

(assert (=> b!202292 m!312729))

(assert (=> b!202229 d!69219))

(declare-fun d!69221 () Bool)

(declare-fun res!169435 () Bool)

(declare-fun e!138720 () Bool)

(assert (=> d!69221 (=> (not res!169435) (not e!138720))))

(assert (=> d!69221 (= res!169435 (= (size!4526 (buf!5031 thiss!1204)) (size!4526 (buf!5031 (_2!9304 lt!314936)))))))

(assert (=> d!69221 (= (isPrefixOf!0 thiss!1204 (_2!9304 lt!314936)) e!138720)))

(declare-fun b!202293 () Bool)

(declare-fun res!169434 () Bool)

(assert (=> b!202293 (=> (not res!169434) (not e!138720))))

(assert (=> b!202293 (= res!169434 (bvsle (bitIndex!0 (size!4526 (buf!5031 thiss!1204)) (currentByte!9462 thiss!1204) (currentBit!9457 thiss!1204)) (bitIndex!0 (size!4526 (buf!5031 (_2!9304 lt!314936))) (currentByte!9462 (_2!9304 lt!314936)) (currentBit!9457 (_2!9304 lt!314936)))))))

(declare-fun b!202294 () Bool)

(declare-fun e!138719 () Bool)

(assert (=> b!202294 (= e!138720 e!138719)))

(declare-fun res!169436 () Bool)

(assert (=> b!202294 (=> res!169436 e!138719)))

(assert (=> b!202294 (= res!169436 (= (size!4526 (buf!5031 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!202295 () Bool)

(assert (=> b!202295 (= e!138719 (arrayBitRangesEq!0 (buf!5031 thiss!1204) (buf!5031 (_2!9304 lt!314936)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4526 (buf!5031 thiss!1204)) (currentByte!9462 thiss!1204) (currentBit!9457 thiss!1204))))))

(assert (= (and d!69221 res!169435) b!202293))

(assert (= (and b!202293 res!169434) b!202294))

(assert (= (and b!202294 (not res!169436)) b!202295))

(assert (=> b!202293 m!312669))

(assert (=> b!202293 m!312667))

(assert (=> b!202295 m!312669))

(assert (=> b!202295 m!312669))

(declare-fun m!312731 () Bool)

(assert (=> b!202295 m!312731))

(assert (=> b!202234 d!69221))

(declare-fun bm!3186 () Bool)

(declare-fun c!10042 () Bool)

(declare-fun call!3189 () Bool)

(declare-fun lt!315563 () tuple2!17304)

(assert (=> bm!3186 (= call!3189 (isPrefixOf!0 (_2!9304 lt!314936) (ite c!10042 (_2!9304 lt!314936) (_2!9304 lt!315563))))))

(declare-fun b!202498 () Bool)

(declare-fun e!138837 () tuple2!17304)

(assert (=> b!202498 (= e!138837 (tuple2!17305 (_1!9304 lt!315563) (_2!9304 lt!315563)))))

(declare-fun lt!315541 () Bool)

(assert (=> b!202498 (= lt!315541 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!315565 () tuple2!17304)

(assert (=> b!202498 (= lt!315565 (appendBit!0 (_2!9304 lt!314936) lt!315541))))

(declare-fun res!169610 () Bool)

(assert (=> b!202498 (= res!169610 (= (size!4526 (buf!5031 (_2!9304 lt!314936))) (size!4526 (buf!5031 (_2!9304 lt!315565)))))))

(declare-fun e!138836 () Bool)

(assert (=> b!202498 (=> (not res!169610) (not e!138836))))

(assert (=> b!202498 e!138836))

(declare-fun lt!315522 () tuple2!17304)

(assert (=> b!202498 (= lt!315522 lt!315565)))

(assert (=> b!202498 (= lt!315563 (appendBitsLSBFirstLoopTR!0 (_2!9304 lt!315522) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!315539 () Unit!14345)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8160 BitStream!8160 BitStream!8160) Unit!14345)

(assert (=> b!202498 (= lt!315539 (lemmaIsPrefixTransitive!0 (_2!9304 lt!314936) (_2!9304 lt!315522) (_2!9304 lt!315563)))))

(assert (=> b!202498 call!3189))

(declare-fun lt!315515 () Unit!14345)

(assert (=> b!202498 (= lt!315515 lt!315539)))

(assert (=> b!202498 (invariant!0 (currentBit!9457 (_2!9304 lt!314936)) (currentByte!9462 (_2!9304 lt!314936)) (size!4526 (buf!5031 (_2!9304 lt!315522))))))

(declare-fun lt!315524 () BitStream!8160)

(assert (=> b!202498 (= lt!315524 (BitStream!8161 (buf!5031 (_2!9304 lt!315522)) (currentByte!9462 (_2!9304 lt!314936)) (currentBit!9457 (_2!9304 lt!314936))))))

(assert (=> b!202498 (invariant!0 (currentBit!9457 lt!315524) (currentByte!9462 lt!315524) (size!4526 (buf!5031 (_2!9304 lt!315563))))))

(declare-fun lt!315552 () BitStream!8160)

(assert (=> b!202498 (= lt!315552 (BitStream!8161 (buf!5031 (_2!9304 lt!315563)) (currentByte!9462 lt!315524) (currentBit!9457 lt!315524)))))

(declare-fun lt!315554 () tuple2!17306)

(assert (=> b!202498 (= lt!315554 (readBitPure!0 lt!315524))))

(declare-fun lt!315555 () tuple2!17306)

(assert (=> b!202498 (= lt!315555 (readBitPure!0 lt!315552))))

(declare-fun lt!315517 () Unit!14345)

(declare-fun readBitPrefixLemma!0 (BitStream!8160 BitStream!8160) Unit!14345)

(assert (=> b!202498 (= lt!315517 (readBitPrefixLemma!0 lt!315524 (_2!9304 lt!315563)))))

(declare-fun res!169612 () Bool)

(assert (=> b!202498 (= res!169612 (= (bitIndex!0 (size!4526 (buf!5031 (_1!9305 lt!315554))) (currentByte!9462 (_1!9305 lt!315554)) (currentBit!9457 (_1!9305 lt!315554))) (bitIndex!0 (size!4526 (buf!5031 (_1!9305 lt!315555))) (currentByte!9462 (_1!9305 lt!315555)) (currentBit!9457 (_1!9305 lt!315555)))))))

(declare-fun e!138842 () Bool)

(assert (=> b!202498 (=> (not res!169612) (not e!138842))))

(assert (=> b!202498 e!138842))

(declare-fun lt!315558 () Unit!14345)

(assert (=> b!202498 (= lt!315558 lt!315517)))

(declare-datatypes ((tuple2!17324 0))(
  ( (tuple2!17325 (_1!9314 BitStream!8160) (_2!9314 BitStream!8160)) )
))
(declare-fun lt!315532 () tuple2!17324)

(declare-fun reader!0 (BitStream!8160 BitStream!8160) tuple2!17324)

(assert (=> b!202498 (= lt!315532 (reader!0 (_2!9304 lt!314936) (_2!9304 lt!315563)))))

(declare-fun lt!315514 () tuple2!17324)

(assert (=> b!202498 (= lt!315514 (reader!0 (_2!9304 lt!315522) (_2!9304 lt!315563)))))

(declare-fun lt!315540 () tuple2!17306)

(assert (=> b!202498 (= lt!315540 (readBitPure!0 (_1!9314 lt!315532)))))

(assert (=> b!202498 (= (_2!9305 lt!315540) lt!315541)))

(declare-fun lt!315564 () Unit!14345)

(declare-fun Unit!14362 () Unit!14345)

(assert (=> b!202498 (= lt!315564 Unit!14362)))

(declare-fun lt!315557 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!202498 (= lt!315557 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!315548 () (_ BitVec 64))

(assert (=> b!202498 (= lt!315548 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!315543 () Unit!14345)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8160 array!10282 (_ BitVec 64)) Unit!14345)

(assert (=> b!202498 (= lt!315543 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9304 lt!314936) (buf!5031 (_2!9304 lt!315563)) lt!315548))))

(assert (=> b!202498 (validate_offset_bits!1 ((_ sign_extend 32) (size!4526 (buf!5031 (_2!9304 lt!315563)))) ((_ sign_extend 32) (currentByte!9462 (_2!9304 lt!314936))) ((_ sign_extend 32) (currentBit!9457 (_2!9304 lt!314936))) lt!315548)))

(declare-fun lt!315547 () Unit!14345)

(assert (=> b!202498 (= lt!315547 lt!315543)))

(declare-datatypes ((tuple2!17326 0))(
  ( (tuple2!17327 (_1!9315 BitStream!8160) (_2!9315 (_ BitVec 64))) )
))
(declare-fun lt!315516 () tuple2!17326)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8160 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17326)

(assert (=> b!202498 (= lt!315516 (readNBitsLSBFirstsLoopPure!0 (_1!9314 lt!315532) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!315557))))

(declare-fun lt!315537 () (_ BitVec 64))

(assert (=> b!202498 (= lt!315537 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!315561 () Unit!14345)

(assert (=> b!202498 (= lt!315561 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9304 lt!315522) (buf!5031 (_2!9304 lt!315563)) lt!315537))))

(assert (=> b!202498 (validate_offset_bits!1 ((_ sign_extend 32) (size!4526 (buf!5031 (_2!9304 lt!315563)))) ((_ sign_extend 32) (currentByte!9462 (_2!9304 lt!315522))) ((_ sign_extend 32) (currentBit!9457 (_2!9304 lt!315522))) lt!315537)))

(declare-fun lt!315530 () Unit!14345)

(assert (=> b!202498 (= lt!315530 lt!315561)))

(declare-fun lt!315550 () tuple2!17326)

(assert (=> b!202498 (= lt!315550 (readNBitsLSBFirstsLoopPure!0 (_1!9314 lt!315514) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!315557 (ite (_2!9305 lt!315540) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!315528 () tuple2!17326)

(assert (=> b!202498 (= lt!315528 (readNBitsLSBFirstsLoopPure!0 (_1!9314 lt!315532) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!315557))))

(declare-fun c!10043 () Bool)

(assert (=> b!202498 (= c!10043 (_2!9305 (readBitPure!0 (_1!9314 lt!315532))))))

(declare-fun lt!315535 () tuple2!17326)

(declare-fun e!138840 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!8160 (_ BitVec 64)) BitStream!8160)

(assert (=> b!202498 (= lt!315535 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9314 lt!315532) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!315557 e!138840)))))

(declare-fun lt!315521 () Unit!14345)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8160 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14345)

(assert (=> b!202498 (= lt!315521 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9314 lt!315532) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!315557))))

(assert (=> b!202498 (and (= (_2!9315 lt!315528) (_2!9315 lt!315535)) (= (_1!9315 lt!315528) (_1!9315 lt!315535)))))

(declare-fun lt!315527 () Unit!14345)

(assert (=> b!202498 (= lt!315527 lt!315521)))

(assert (=> b!202498 (= (_1!9314 lt!315532) (withMovedBitIndex!0 (_2!9314 lt!315532) (bvsub (bitIndex!0 (size!4526 (buf!5031 (_2!9304 lt!314936))) (currentByte!9462 (_2!9304 lt!314936)) (currentBit!9457 (_2!9304 lt!314936))) (bitIndex!0 (size!4526 (buf!5031 (_2!9304 lt!315563))) (currentByte!9462 (_2!9304 lt!315563)) (currentBit!9457 (_2!9304 lt!315563))))))))

(declare-fun lt!315545 () Unit!14345)

(declare-fun Unit!14372 () Unit!14345)

(assert (=> b!202498 (= lt!315545 Unit!14372)))

(assert (=> b!202498 (= (_1!9314 lt!315514) (withMovedBitIndex!0 (_2!9314 lt!315514) (bvsub (bitIndex!0 (size!4526 (buf!5031 (_2!9304 lt!315522))) (currentByte!9462 (_2!9304 lt!315522)) (currentBit!9457 (_2!9304 lt!315522))) (bitIndex!0 (size!4526 (buf!5031 (_2!9304 lt!315563))) (currentByte!9462 (_2!9304 lt!315563)) (currentBit!9457 (_2!9304 lt!315563))))))))

(declare-fun lt!315559 () Unit!14345)

(declare-fun Unit!14373 () Unit!14345)

(assert (=> b!202498 (= lt!315559 Unit!14373)))

(assert (=> b!202498 (= (bitIndex!0 (size!4526 (buf!5031 (_2!9304 lt!314936))) (currentByte!9462 (_2!9304 lt!314936)) (currentBit!9457 (_2!9304 lt!314936))) (bvsub (bitIndex!0 (size!4526 (buf!5031 (_2!9304 lt!315522))) (currentByte!9462 (_2!9304 lt!315522)) (currentBit!9457 (_2!9304 lt!315522))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!315531 () Unit!14345)

(declare-fun Unit!14374 () Unit!14345)

(assert (=> b!202498 (= lt!315531 Unit!14374)))

(assert (=> b!202498 (= (_2!9315 lt!315516) (_2!9315 lt!315550))))

(declare-fun lt!315562 () Unit!14345)

(declare-fun Unit!14375 () Unit!14345)

(assert (=> b!202498 (= lt!315562 Unit!14375)))

(assert (=> b!202498 (invariant!0 (currentBit!9457 (_2!9304 lt!315563)) (currentByte!9462 (_2!9304 lt!315563)) (size!4526 (buf!5031 (_2!9304 lt!315563))))))

(declare-fun lt!315534 () Unit!14345)

(declare-fun Unit!14376 () Unit!14345)

(assert (=> b!202498 (= lt!315534 Unit!14376)))

(assert (=> b!202498 (= (size!4526 (buf!5031 (_2!9304 lt!314936))) (size!4526 (buf!5031 (_2!9304 lt!315563))))))

(declare-fun lt!315551 () Unit!14345)

(declare-fun Unit!14377 () Unit!14345)

(assert (=> b!202498 (= lt!315551 Unit!14377)))

(assert (=> b!202498 (= (bitIndex!0 (size!4526 (buf!5031 (_2!9304 lt!315563))) (currentByte!9462 (_2!9304 lt!315563)) (currentBit!9457 (_2!9304 lt!315563))) (bvsub (bvadd (bitIndex!0 (size!4526 (buf!5031 (_2!9304 lt!314936))) (currentByte!9462 (_2!9304 lt!314936)) (currentBit!9457 (_2!9304 lt!314936))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!315529 () Unit!14345)

(declare-fun Unit!14378 () Unit!14345)

(assert (=> b!202498 (= lt!315529 Unit!14378)))

(declare-fun lt!315525 () Unit!14345)

(declare-fun Unit!14379 () Unit!14345)

(assert (=> b!202498 (= lt!315525 Unit!14379)))

(declare-fun lt!315568 () tuple2!17324)

(assert (=> b!202498 (= lt!315568 (reader!0 (_2!9304 lt!314936) (_2!9304 lt!315563)))))

(declare-fun lt!315526 () (_ BitVec 64))

(assert (=> b!202498 (= lt!315526 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!315519 () Unit!14345)

(assert (=> b!202498 (= lt!315519 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9304 lt!314936) (buf!5031 (_2!9304 lt!315563)) lt!315526))))

(assert (=> b!202498 (validate_offset_bits!1 ((_ sign_extend 32) (size!4526 (buf!5031 (_2!9304 lt!315563)))) ((_ sign_extend 32) (currentByte!9462 (_2!9304 lt!314936))) ((_ sign_extend 32) (currentBit!9457 (_2!9304 lt!314936))) lt!315526)))

(declare-fun lt!315520 () Unit!14345)

(assert (=> b!202498 (= lt!315520 lt!315519)))

(declare-fun lt!315546 () tuple2!17326)

(assert (=> b!202498 (= lt!315546 (readNBitsLSBFirstsLoopPure!0 (_1!9314 lt!315568) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!169616 () Bool)

(assert (=> b!202498 (= res!169616 (= (_2!9315 lt!315546) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!138838 () Bool)

(assert (=> b!202498 (=> (not res!169616) (not e!138838))))

(assert (=> b!202498 e!138838))

(declare-fun lt!315544 () Unit!14345)

(declare-fun Unit!14380 () Unit!14345)

(assert (=> b!202498 (= lt!315544 Unit!14380)))

(declare-fun b!202499 () Bool)

(declare-fun e!138844 () Bool)

(declare-fun e!138841 () Bool)

(assert (=> b!202499 (= e!138844 e!138841)))

(declare-fun res!169608 () Bool)

(assert (=> b!202499 (=> (not res!169608) (not e!138841))))

(declare-fun lt!315518 () tuple2!17326)

(assert (=> b!202499 (= res!169608 (= (_2!9315 lt!315518) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!315538 () tuple2!17324)

(assert (=> b!202499 (= lt!315518 (readNBitsLSBFirstsLoopPure!0 (_1!9314 lt!315538) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!315569 () Unit!14345)

(declare-fun lt!315542 () Unit!14345)

(assert (=> b!202499 (= lt!315569 lt!315542)))

(declare-fun lt!315533 () tuple2!17304)

(declare-fun lt!315556 () (_ BitVec 64))

(assert (=> b!202499 (validate_offset_bits!1 ((_ sign_extend 32) (size!4526 (buf!5031 (_2!9304 lt!315533)))) ((_ sign_extend 32) (currentByte!9462 (_2!9304 lt!314936))) ((_ sign_extend 32) (currentBit!9457 (_2!9304 lt!314936))) lt!315556)))

(assert (=> b!202499 (= lt!315542 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9304 lt!314936) (buf!5031 (_2!9304 lt!315533)) lt!315556))))

(declare-fun e!138843 () Bool)

(assert (=> b!202499 e!138843))

(declare-fun res!169609 () Bool)

(assert (=> b!202499 (=> (not res!169609) (not e!138843))))

(assert (=> b!202499 (= res!169609 (and (= (size!4526 (buf!5031 (_2!9304 lt!314936))) (size!4526 (buf!5031 (_2!9304 lt!315533)))) (bvsge lt!315556 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!202499 (= lt!315556 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!202499 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!202499 (= lt!315538 (reader!0 (_2!9304 lt!314936) (_2!9304 lt!315533)))))

(declare-fun b!202500 () Bool)

(assert (=> b!202500 (= e!138838 (= (_1!9315 lt!315546) (_2!9314 lt!315568)))))

(declare-fun b!202501 () Bool)

(declare-fun res!169618 () Bool)

(assert (=> b!202501 (=> (not res!169618) (not e!138844))))

(declare-fun lt!315566 () (_ BitVec 64))

(declare-fun lt!315553 () (_ BitVec 64))

(assert (=> b!202501 (= res!169618 (= (bitIndex!0 (size!4526 (buf!5031 (_2!9304 lt!315533))) (currentByte!9462 (_2!9304 lt!315533)) (currentBit!9457 (_2!9304 lt!315533))) (bvsub lt!315566 lt!315553)))))

(assert (=> b!202501 (or (= (bvand lt!315566 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!315553 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!315566 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!315566 lt!315553) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!202501 (= lt!315553 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!315549 () (_ BitVec 64))

(declare-fun lt!315523 () (_ BitVec 64))

(assert (=> b!202501 (= lt!315566 (bvadd lt!315549 lt!315523))))

(assert (=> b!202501 (or (not (= (bvand lt!315549 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!315523 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!315549 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!315549 lt!315523) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!202501 (= lt!315523 ((_ sign_extend 32) nBits!348))))

(assert (=> b!202501 (= lt!315549 (bitIndex!0 (size!4526 (buf!5031 (_2!9304 lt!314936))) (currentByte!9462 (_2!9304 lt!314936)) (currentBit!9457 (_2!9304 lt!314936))))))

(declare-fun d!69223 () Bool)

(assert (=> d!69223 e!138844))

(declare-fun res!169611 () Bool)

(assert (=> d!69223 (=> (not res!169611) (not e!138844))))

(assert (=> d!69223 (= res!169611 (invariant!0 (currentBit!9457 (_2!9304 lt!315533)) (currentByte!9462 (_2!9304 lt!315533)) (size!4526 (buf!5031 (_2!9304 lt!315533)))))))

(assert (=> d!69223 (= lt!315533 e!138837)))

(assert (=> d!69223 (= c!10042 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!69223 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!69223 (= (appendBitsLSBFirstLoopTR!0 (_2!9304 lt!314936) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!315533)))

(declare-fun b!202502 () Bool)

(declare-fun lt!315560 () tuple2!17306)

(assert (=> b!202502 (= lt!315560 (readBitPure!0 (readerFrom!0 (_2!9304 lt!315565) (currentBit!9457 (_2!9304 lt!314936)) (currentByte!9462 (_2!9304 lt!314936)))))))

(declare-fun res!169614 () Bool)

(assert (=> b!202502 (= res!169614 (and (= (_2!9305 lt!315560) lt!315541) (= (_1!9305 lt!315560) (_2!9304 lt!315565))))))

(declare-fun e!138839 () Bool)

(assert (=> b!202502 (=> (not res!169614) (not e!138839))))

(assert (=> b!202502 (= e!138836 e!138839)))

(declare-fun b!202503 () Bool)

(assert (=> b!202503 (= e!138843 (validate_offset_bits!1 ((_ sign_extend 32) (size!4526 (buf!5031 (_2!9304 lt!314936)))) ((_ sign_extend 32) (currentByte!9462 (_2!9304 lt!314936))) ((_ sign_extend 32) (currentBit!9457 (_2!9304 lt!314936))) lt!315556))))

(declare-fun b!202504 () Bool)

(declare-fun Unit!14381 () Unit!14345)

(assert (=> b!202504 (= e!138837 (tuple2!17305 Unit!14381 (_2!9304 lt!314936)))))

(declare-fun lt!315567 () Unit!14345)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8160) Unit!14345)

(assert (=> b!202504 (= lt!315567 (lemmaIsPrefixRefl!0 (_2!9304 lt!314936)))))

(assert (=> b!202504 call!3189))

(declare-fun lt!315536 () Unit!14345)

(assert (=> b!202504 (= lt!315536 lt!315567)))

(declare-fun b!202505 () Bool)

(assert (=> b!202505 (= e!138842 (= (_2!9305 lt!315554) (_2!9305 lt!315555)))))

(declare-fun b!202506 () Bool)

(assert (=> b!202506 (= e!138839 (= (bitIndex!0 (size!4526 (buf!5031 (_1!9305 lt!315560))) (currentByte!9462 (_1!9305 lt!315560)) (currentBit!9457 (_1!9305 lt!315560))) (bitIndex!0 (size!4526 (buf!5031 (_2!9304 lt!315565))) (currentByte!9462 (_2!9304 lt!315565)) (currentBit!9457 (_2!9304 lt!315565)))))))

(declare-fun b!202507 () Bool)

(assert (=> b!202507 (= e!138840 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!202508 () Bool)

(declare-fun res!169607 () Bool)

(assert (=> b!202508 (=> (not res!169607) (not e!138844))))

(assert (=> b!202508 (= res!169607 (isPrefixOf!0 (_2!9304 lt!314936) (_2!9304 lt!315533)))))

(declare-fun b!202509 () Bool)

(assert (=> b!202509 (= e!138841 (= (_1!9315 lt!315518) (_2!9314 lt!315538)))))

(declare-fun b!202510 () Bool)

(declare-fun res!169613 () Bool)

(assert (=> b!202510 (=> (not res!169613) (not e!138844))))

(assert (=> b!202510 (= res!169613 (= (size!4526 (buf!5031 (_2!9304 lt!314936))) (size!4526 (buf!5031 (_2!9304 lt!315533)))))))

(declare-fun b!202511 () Bool)

(assert (=> b!202511 (= e!138840 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!202512 () Bool)

(declare-fun res!169615 () Bool)

(assert (=> b!202512 (= res!169615 (isPrefixOf!0 (_2!9304 lt!314936) (_2!9304 lt!315565)))))

(assert (=> b!202512 (=> (not res!169615) (not e!138836))))

(declare-fun b!202513 () Bool)

(declare-fun res!169617 () Bool)

(assert (=> b!202513 (= res!169617 (= (bitIndex!0 (size!4526 (buf!5031 (_2!9304 lt!315565))) (currentByte!9462 (_2!9304 lt!315565)) (currentBit!9457 (_2!9304 lt!315565))) (bvadd (bitIndex!0 (size!4526 (buf!5031 (_2!9304 lt!314936))) (currentByte!9462 (_2!9304 lt!314936)) (currentBit!9457 (_2!9304 lt!314936))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!202513 (=> (not res!169617) (not e!138836))))

(assert (= (and d!69223 c!10042) b!202504))

(assert (= (and d!69223 (not c!10042)) b!202498))

(assert (= (and b!202498 res!169610) b!202513))

(assert (= (and b!202513 res!169617) b!202512))

(assert (= (and b!202512 res!169615) b!202502))

(assert (= (and b!202502 res!169614) b!202506))

(assert (= (and b!202498 res!169612) b!202505))

(assert (= (and b!202498 c!10043) b!202507))

(assert (= (and b!202498 (not c!10043)) b!202511))

(assert (= (and b!202498 res!169616) b!202500))

(assert (= (or b!202504 b!202498) bm!3186))

(assert (= (and d!69223 res!169611) b!202510))

(assert (= (and b!202510 res!169613) b!202501))

(assert (= (and b!202501 res!169618) b!202508))

(assert (= (and b!202508 res!169607) b!202499))

(assert (= (and b!202499 res!169609) b!202503))

(assert (= (and b!202499 res!169608) b!202509))

(declare-fun m!312989 () Bool)

(assert (=> b!202502 m!312989))

(assert (=> b!202502 m!312989))

(declare-fun m!312991 () Bool)

(assert (=> b!202502 m!312991))

(declare-fun m!312993 () Bool)

(assert (=> b!202513 m!312993))

(assert (=> b!202513 m!312667))

(declare-fun m!312995 () Bool)

(assert (=> b!202503 m!312995))

(declare-fun m!312997 () Bool)

(assert (=> b!202504 m!312997))

(declare-fun m!312999 () Bool)

(assert (=> b!202499 m!312999))

(declare-fun m!313001 () Bool)

(assert (=> b!202499 m!313001))

(declare-fun m!313003 () Bool)

(assert (=> b!202499 m!313003))

(declare-fun m!313005 () Bool)

(assert (=> b!202499 m!313005))

(declare-fun m!313007 () Bool)

(assert (=> b!202499 m!313007))

(declare-fun m!313009 () Bool)

(assert (=> b!202499 m!313009))

(assert (=> b!202498 m!312999))

(declare-fun m!313011 () Bool)

(assert (=> b!202498 m!313011))

(declare-fun m!313013 () Bool)

(assert (=> b!202498 m!313013))

(declare-fun m!313015 () Bool)

(assert (=> b!202498 m!313015))

(declare-fun m!313017 () Bool)

(assert (=> b!202498 m!313017))

(declare-fun m!313019 () Bool)

(assert (=> b!202498 m!313019))

(declare-fun m!313021 () Bool)

(assert (=> b!202498 m!313021))

(declare-fun m!313023 () Bool)

(assert (=> b!202498 m!313023))

(declare-fun m!313025 () Bool)

(assert (=> b!202498 m!313025))

(declare-fun m!313027 () Bool)

(assert (=> b!202498 m!313027))

(declare-fun m!313029 () Bool)

(assert (=> b!202498 m!313029))

(declare-fun m!313031 () Bool)

(assert (=> b!202498 m!313031))

(declare-fun m!313033 () Bool)

(assert (=> b!202498 m!313033))

(declare-fun m!313035 () Bool)

(assert (=> b!202498 m!313035))

(declare-fun m!313037 () Bool)

(assert (=> b!202498 m!313037))

(declare-fun m!313039 () Bool)

(assert (=> b!202498 m!313039))

(declare-fun m!313041 () Bool)

(assert (=> b!202498 m!313041))

(declare-fun m!313043 () Bool)

(assert (=> b!202498 m!313043))

(declare-fun m!313045 () Bool)

(assert (=> b!202498 m!313045))

(declare-fun m!313047 () Bool)

(assert (=> b!202498 m!313047))

(declare-fun m!313049 () Bool)

(assert (=> b!202498 m!313049))

(declare-fun m!313051 () Bool)

(assert (=> b!202498 m!313051))

(declare-fun m!313053 () Bool)

(assert (=> b!202498 m!313053))

(declare-fun m!313055 () Bool)

(assert (=> b!202498 m!313055))

(assert (=> b!202498 m!313003))

(declare-fun m!313057 () Bool)

(assert (=> b!202498 m!313057))

(declare-fun m!313059 () Bool)

(assert (=> b!202498 m!313059))

(declare-fun m!313061 () Bool)

(assert (=> b!202498 m!313061))

(declare-fun m!313063 () Bool)

(assert (=> b!202498 m!313063))

(declare-fun m!313065 () Bool)

(assert (=> b!202498 m!313065))

(assert (=> b!202498 m!312667))

(declare-fun m!313067 () Bool)

(assert (=> b!202498 m!313067))

(assert (=> b!202498 m!313021))

(declare-fun m!313069 () Bool)

(assert (=> b!202498 m!313069))

(declare-fun m!313071 () Bool)

(assert (=> b!202506 m!313071))

(assert (=> b!202506 m!312993))

(declare-fun m!313073 () Bool)

(assert (=> d!69223 m!313073))

(declare-fun m!313075 () Bool)

(assert (=> b!202512 m!313075))

(declare-fun m!313077 () Bool)

(assert (=> b!202501 m!313077))

(assert (=> b!202501 m!312667))

(declare-fun m!313079 () Bool)

(assert (=> b!202508 m!313079))

(declare-fun m!313081 () Bool)

(assert (=> bm!3186 m!313081))

(assert (=> b!202234 d!69223))

(assert (=> b!202231 d!69215))

(assert (=> b!202231 d!69217))

(declare-fun b!202525 () Bool)

(declare-fun res!169629 () Bool)

(declare-fun e!138850 () Bool)

(assert (=> b!202525 (=> (not res!169629) (not e!138850))))

(declare-fun lt!315585 () tuple2!17304)

(declare-fun lt!315587 () (_ BitVec 64))

(declare-fun lt!315586 () (_ BitVec 64))

(assert (=> b!202525 (= res!169629 (= (bitIndex!0 (size!4526 (buf!5031 (_2!9304 lt!315585))) (currentByte!9462 (_2!9304 lt!315585)) (currentBit!9457 (_2!9304 lt!315585))) (bvadd lt!315586 lt!315587)))))

(assert (=> b!202525 (or (not (= (bvand lt!315586 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!315587 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!315586 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!315586 lt!315587) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!202525 (= lt!315587 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!202525 (= lt!315586 (bitIndex!0 (size!4526 (buf!5031 thiss!1204)) (currentByte!9462 thiss!1204) (currentBit!9457 thiss!1204)))))

(declare-fun b!202528 () Bool)

(declare-fun e!138851 () Bool)

(declare-fun lt!315584 () tuple2!17306)

(assert (=> b!202528 (= e!138851 (= (bitIndex!0 (size!4526 (buf!5031 (_1!9305 lt!315584))) (currentByte!9462 (_1!9305 lt!315584)) (currentBit!9457 (_1!9305 lt!315584))) (bitIndex!0 (size!4526 (buf!5031 (_2!9304 lt!315585))) (currentByte!9462 (_2!9304 lt!315585)) (currentBit!9457 (_2!9304 lt!315585)))))))

(declare-fun b!202526 () Bool)

(declare-fun res!169632 () Bool)

(assert (=> b!202526 (=> (not res!169632) (not e!138850))))

(assert (=> b!202526 (= res!169632 (isPrefixOf!0 thiss!1204 (_2!9304 lt!315585)))))

(declare-fun b!202527 () Bool)

(assert (=> b!202527 (= e!138850 e!138851)))

(declare-fun res!169631 () Bool)

(assert (=> b!202527 (=> (not res!169631) (not e!138851))))

(assert (=> b!202527 (= res!169631 (and (= (_2!9305 lt!315584) lt!314934) (= (_1!9305 lt!315584) (_2!9304 lt!315585))))))

(assert (=> b!202527 (= lt!315584 (readBitPure!0 (readerFrom!0 (_2!9304 lt!315585) (currentBit!9457 thiss!1204) (currentByte!9462 thiss!1204))))))

(declare-fun d!69277 () Bool)

(assert (=> d!69277 e!138850))

(declare-fun res!169630 () Bool)

(assert (=> d!69277 (=> (not res!169630) (not e!138850))))

(assert (=> d!69277 (= res!169630 (= (size!4526 (buf!5031 thiss!1204)) (size!4526 (buf!5031 (_2!9304 lt!315585)))))))

(declare-fun choose!16 (BitStream!8160 Bool) tuple2!17304)

(assert (=> d!69277 (= lt!315585 (choose!16 thiss!1204 lt!314934))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!69277 (validate_offset_bit!0 ((_ sign_extend 32) (size!4526 (buf!5031 thiss!1204))) ((_ sign_extend 32) (currentByte!9462 thiss!1204)) ((_ sign_extend 32) (currentBit!9457 thiss!1204)))))

(assert (=> d!69277 (= (appendBit!0 thiss!1204 lt!314934) lt!315585)))

(assert (= (and d!69277 res!169630) b!202525))

(assert (= (and b!202525 res!169629) b!202526))

(assert (= (and b!202526 res!169632) b!202527))

(assert (= (and b!202527 res!169631) b!202528))

(declare-fun m!313083 () Bool)

(assert (=> b!202528 m!313083))

(declare-fun m!313085 () Bool)

(assert (=> b!202528 m!313085))

(assert (=> b!202525 m!313085))

(assert (=> b!202525 m!312669))

(declare-fun m!313087 () Bool)

(assert (=> d!69277 m!313087))

(declare-fun m!313089 () Bool)

(assert (=> d!69277 m!313089))

(declare-fun m!313091 () Bool)

(assert (=> b!202527 m!313091))

(assert (=> b!202527 m!313091))

(declare-fun m!313093 () Bool)

(assert (=> b!202527 m!313093))

(declare-fun m!313095 () Bool)

(assert (=> b!202526 m!313095))

(assert (=> b!202231 d!69277))

(declare-fun d!69279 () Bool)

(assert (=> d!69279 (= (invariant!0 (currentBit!9457 thiss!1204) (currentByte!9462 thiss!1204) (size!4526 (buf!5031 thiss!1204))) (and (bvsge (currentBit!9457 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9457 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9462 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9462 thiss!1204) (size!4526 (buf!5031 thiss!1204))) (and (= (currentBit!9457 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9462 thiss!1204) (size!4526 (buf!5031 thiss!1204)))))))))

(assert (=> b!202236 d!69279))

(declare-fun d!69281 () Bool)

(assert (=> d!69281 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9457 thiss!1204) (currentByte!9462 thiss!1204) (size!4526 (buf!5031 thiss!1204))))))

(declare-fun bs!17089 () Bool)

(assert (= bs!17089 d!69281))

(assert (=> bs!17089 m!312673))

(assert (=> start!42908 d!69281))

(assert (=> b!202230 d!69221))

(declare-fun d!69283 () Bool)

(assert (=> d!69283 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4526 (buf!5031 thiss!1204))) ((_ sign_extend 32) (currentByte!9462 thiss!1204)) ((_ sign_extend 32) (currentBit!9457 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4526 (buf!5031 thiss!1204))) ((_ sign_extend 32) (currentByte!9462 thiss!1204)) ((_ sign_extend 32) (currentBit!9457 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!17090 () Bool)

(assert (= bs!17090 d!69283))

(assert (=> bs!17090 m!312725))

(assert (=> b!202232 d!69283))

(declare-fun d!69285 () Bool)

(declare-fun e!138852 () Bool)

(assert (=> d!69285 e!138852))

(declare-fun res!169634 () Bool)

(assert (=> d!69285 (=> (not res!169634) (not e!138852))))

(declare-fun lt!315589 () (_ BitVec 64))

(declare-fun lt!315588 () (_ BitVec 64))

(declare-fun lt!315591 () (_ BitVec 64))

(assert (=> d!69285 (= res!169634 (= lt!315589 (bvsub lt!315588 lt!315591)))))

(assert (=> d!69285 (or (= (bvand lt!315588 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!315591 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!315588 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!315588 lt!315591) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69285 (= lt!315591 (remainingBits!0 ((_ sign_extend 32) (size!4526 (buf!5031 (_1!9305 lt!314932)))) ((_ sign_extend 32) (currentByte!9462 (_1!9305 lt!314932))) ((_ sign_extend 32) (currentBit!9457 (_1!9305 lt!314932)))))))

(declare-fun lt!315592 () (_ BitVec 64))

(declare-fun lt!315593 () (_ BitVec 64))

(assert (=> d!69285 (= lt!315588 (bvmul lt!315592 lt!315593))))

(assert (=> d!69285 (or (= lt!315592 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!315593 (bvsdiv (bvmul lt!315592 lt!315593) lt!315592)))))

(assert (=> d!69285 (= lt!315593 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69285 (= lt!315592 ((_ sign_extend 32) (size!4526 (buf!5031 (_1!9305 lt!314932)))))))

(assert (=> d!69285 (= lt!315589 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9462 (_1!9305 lt!314932))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9457 (_1!9305 lt!314932)))))))

(assert (=> d!69285 (invariant!0 (currentBit!9457 (_1!9305 lt!314932)) (currentByte!9462 (_1!9305 lt!314932)) (size!4526 (buf!5031 (_1!9305 lt!314932))))))

(assert (=> d!69285 (= (bitIndex!0 (size!4526 (buf!5031 (_1!9305 lt!314932))) (currentByte!9462 (_1!9305 lt!314932)) (currentBit!9457 (_1!9305 lt!314932))) lt!315589)))

(declare-fun b!202529 () Bool)

(declare-fun res!169633 () Bool)

(assert (=> b!202529 (=> (not res!169633) (not e!138852))))

(assert (=> b!202529 (= res!169633 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!315589))))

(declare-fun b!202530 () Bool)

(declare-fun lt!315590 () (_ BitVec 64))

(assert (=> b!202530 (= e!138852 (bvsle lt!315589 (bvmul lt!315590 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!202530 (or (= lt!315590 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!315590 #b0000000000000000000000000000000000000000000000000000000000001000) lt!315590)))))

(assert (=> b!202530 (= lt!315590 ((_ sign_extend 32) (size!4526 (buf!5031 (_1!9305 lt!314932)))))))

(assert (= (and d!69285 res!169634) b!202529))

(assert (= (and b!202529 res!169633) b!202530))

(declare-fun m!313097 () Bool)

(assert (=> d!69285 m!313097))

(declare-fun m!313099 () Bool)

(assert (=> d!69285 m!313099))

(assert (=> b!202237 d!69285))

(check-sat (not b!202290) (not b!202506) (not d!69215) (not b!202501) (not b!202292) (not b!202498) (not d!69281) (not d!69211) (not b!202525) (not b!202503) (not d!69285) (not b!202526) (not d!69209) (not d!69277) (not b!202527) (not b!202512) (not b!202499) (not bm!3186) (not d!69217) (not b!202508) (not b!202528) (not b!202293) (not b!202295) (not b!202513) (not b!202502) (not b!202504) (not d!69223) (not b!202275) (not d!69283))
