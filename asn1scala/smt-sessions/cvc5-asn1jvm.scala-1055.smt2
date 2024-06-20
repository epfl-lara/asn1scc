; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30208 () Bool)

(assert start!30208)

(declare-fun b!154890 () Bool)

(declare-fun res!129587 () Bool)

(declare-fun e!104213 () Bool)

(assert (=> b!154890 (=> (not res!129587) (not e!104213))))

(declare-fun lt!241254 () (_ BitVec 64))

(declare-datatypes ((array!7022 0))(
  ( (array!7023 (arr!3983 (Array (_ BitVec 32) (_ BitVec 8))) (size!3160 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5578 0))(
  ( (BitStream!5579 (buf!3663 array!7022) (currentByte!6694 (_ BitVec 32)) (currentBit!6689 (_ BitVec 32))) )
))
(declare-fun bs2!18 () BitStream!5578)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!154890 (= res!129587 (bvsle lt!241254 (bitIndex!0 (size!3160 (buf!3663 bs2!18)) (currentByte!6694 bs2!18) (currentBit!6689 bs2!18))))))

(declare-fun b!154891 () Bool)

(declare-fun e!104215 () Bool)

(declare-fun array_inv!2949 (array!7022) Bool)

(assert (=> b!154891 (= e!104215 (array_inv!2949 (buf!3663 bs2!18)))))

(declare-fun res!129588 () Bool)

(declare-fun e!104217 () Bool)

(assert (=> start!30208 (=> (not res!129588) (not e!104217))))

(declare-fun bs1!10 () BitStream!5578)

(assert (=> start!30208 (= res!129588 (= (size!3160 (buf!3663 bs1!10)) (size!3160 (buf!3663 bs2!18))))))

(assert (=> start!30208 e!104217))

(declare-fun e!104216 () Bool)

(declare-fun inv!12 (BitStream!5578) Bool)

(assert (=> start!30208 (and (inv!12 bs1!10) e!104216)))

(assert (=> start!30208 (and (inv!12 bs2!18) e!104215)))

(declare-fun b!154892 () Bool)

(assert (=> b!154892 (= e!104217 e!104213)))

(declare-fun res!129585 () Bool)

(assert (=> b!154892 (=> (not res!129585) (not e!104213))))

(assert (=> b!154892 (= res!129585 (bvsle lt!241254 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3160 (buf!3663 bs1!10))))))))

(declare-fun lt!241253 () (_ BitVec 64))

(assert (=> b!154892 (= lt!241254 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!241253))))

(assert (=> b!154892 (= lt!241253 (bitIndex!0 (size!3160 (buf!3663 bs1!10)) (currentByte!6694 bs1!10) (currentBit!6689 bs1!10)))))

(declare-fun b!154893 () Bool)

(declare-fun res!129586 () Bool)

(assert (=> b!154893 (=> (not res!129586) (not e!104213))))

(declare-fun arrayBitRangesEq!0 (array!7022 array!7022 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!154893 (= res!129586 (arrayBitRangesEq!0 (buf!3663 bs1!10) (buf!3663 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!241254))))

(declare-fun b!154894 () Bool)

(assert (=> b!154894 (= e!104216 (array_inv!2949 (buf!3663 bs1!10)))))

(declare-fun b!154895 () Bool)

(declare-fun lt!241251 () (_ BitVec 32))

(assert (=> b!154895 (= e!104213 (and (bvsle #b00000000000000000000000000000000 lt!241251) (bvsgt lt!241251 (size!3160 (buf!3663 bs1!10)))))))

(assert (=> b!154895 (= lt!241251 ((_ extract 31 0) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bvsdiv lt!241253 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-datatypes ((tuple2!13720 0))(
  ( (tuple2!13721 (_1!7268 BitStream!5578) (_2!7268 (_ BitVec 8))) )
))
(declare-fun lt!241255 () tuple2!13720)

(declare-fun readBytePure!0 (BitStream!5578) tuple2!13720)

(assert (=> b!154895 (= lt!241255 (readBytePure!0 (BitStream!5579 (buf!3663 bs2!18) (currentByte!6694 bs1!10) (currentBit!6689 bs1!10))))))

(declare-fun lt!241252 () tuple2!13720)

(assert (=> b!154895 (= lt!241252 (readBytePure!0 bs1!10))))

(assert (= (and start!30208 res!129588) b!154892))

(assert (= (and b!154892 res!129585) b!154890))

(assert (= (and b!154890 res!129587) b!154893))

(assert (= (and b!154893 res!129586) b!154895))

(assert (= start!30208 b!154894))

(assert (= start!30208 b!154891))

(declare-fun m!240847 () Bool)

(assert (=> start!30208 m!240847))

(declare-fun m!240849 () Bool)

(assert (=> start!30208 m!240849))

(declare-fun m!240851 () Bool)

(assert (=> b!154890 m!240851))

(declare-fun m!240853 () Bool)

(assert (=> b!154894 m!240853))

(declare-fun m!240855 () Bool)

(assert (=> b!154891 m!240855))

(declare-fun m!240857 () Bool)

(assert (=> b!154892 m!240857))

(declare-fun m!240859 () Bool)

(assert (=> b!154893 m!240859))

(declare-fun m!240861 () Bool)

(assert (=> b!154895 m!240861))

(declare-fun m!240863 () Bool)

(assert (=> b!154895 m!240863))

(push 1)

(assert (not b!154891))

(assert (not b!154895))

(assert (not b!154894))

(assert (not b!154893))

(assert (not b!154890))

(assert (not start!30208))

(assert (not b!154892))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!51062 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!51062 (= (inv!12 bs1!10) (invariant!0 (currentBit!6689 bs1!10) (currentByte!6694 bs1!10) (size!3160 (buf!3663 bs1!10))))))

(declare-fun bs!12500 () Bool)

(assert (= bs!12500 d!51062))

(declare-fun m!240901 () Bool)

(assert (=> bs!12500 m!240901))

(assert (=> start!30208 d!51062))

(declare-fun d!51064 () Bool)

(assert (=> d!51064 (= (inv!12 bs2!18) (invariant!0 (currentBit!6689 bs2!18) (currentByte!6694 bs2!18) (size!3160 (buf!3663 bs2!18))))))

(declare-fun bs!12501 () Bool)

(assert (= bs!12501 d!51064))

(declare-fun m!240903 () Bool)

(assert (=> bs!12501 m!240903))

(assert (=> start!30208 d!51064))

(declare-fun d!51066 () Bool)

(assert (=> d!51066 (= (array_inv!2949 (buf!3663 bs2!18)) (bvsge (size!3160 (buf!3663 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!154891 d!51066))

(declare-fun d!51068 () Bool)

(declare-fun e!104274 () Bool)

(assert (=> d!51068 e!104274))

(declare-fun res!129633 () Bool)

(assert (=> d!51068 (=> (not res!129633) (not e!104274))))

(declare-fun lt!241316 () (_ BitVec 64))

(declare-fun lt!241315 () (_ BitVec 64))

(declare-fun lt!241313 () (_ BitVec 64))

(assert (=> d!51068 (= res!129633 (= lt!241316 (bvsub lt!241315 lt!241313)))))

(assert (=> d!51068 (or (= (bvand lt!241315 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241313 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!241315 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!241315 lt!241313) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!51068 (= lt!241313 (remainingBits!0 ((_ sign_extend 32) (size!3160 (buf!3663 bs1!10))) ((_ sign_extend 32) (currentByte!6694 bs1!10)) ((_ sign_extend 32) (currentBit!6689 bs1!10))))))

(declare-fun lt!241311 () (_ BitVec 64))

(declare-fun lt!241312 () (_ BitVec 64))

(assert (=> d!51068 (= lt!241315 (bvmul lt!241311 lt!241312))))

(assert (=> d!51068 (or (= lt!241311 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!241312 (bvsdiv (bvmul lt!241311 lt!241312) lt!241311)))))

(assert (=> d!51068 (= lt!241312 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!51068 (= lt!241311 ((_ sign_extend 32) (size!3160 (buf!3663 bs1!10))))))

(assert (=> d!51068 (= lt!241316 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6694 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6689 bs1!10))))))

(assert (=> d!51068 (invariant!0 (currentBit!6689 bs1!10) (currentByte!6694 bs1!10) (size!3160 (buf!3663 bs1!10)))))

(assert (=> d!51068 (= (bitIndex!0 (size!3160 (buf!3663 bs1!10)) (currentByte!6694 bs1!10) (currentBit!6689 bs1!10)) lt!241316)))

(declare-fun b!154957 () Bool)

(declare-fun res!129632 () Bool)

(assert (=> b!154957 (=> (not res!129632) (not e!104274))))

(assert (=> b!154957 (= res!129632 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!241316))))

(declare-fun b!154958 () Bool)

(declare-fun lt!241314 () (_ BitVec 64))

(assert (=> b!154958 (= e!104274 (bvsle lt!241316 (bvmul lt!241314 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154958 (or (= lt!241314 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!241314 #b0000000000000000000000000000000000000000000000000000000000001000) lt!241314)))))

(assert (=> b!154958 (= lt!241314 ((_ sign_extend 32) (size!3160 (buf!3663 bs1!10))))))

(assert (= (and d!51068 res!129633) b!154957))

(assert (= (and b!154957 res!129632) b!154958))

(declare-fun m!240929 () Bool)

(assert (=> d!51068 m!240929))

(assert (=> d!51068 m!240901))

(assert (=> b!154892 d!51068))

(declare-fun b!154987 () Bool)

(declare-fun e!104295 () Bool)

(declare-fun e!104296 () Bool)

(assert (=> b!154987 (= e!104295 e!104296)))

(declare-fun res!129659 () Bool)

(assert (=> b!154987 (=> (not res!129659) (not e!104296))))

(declare-fun e!104299 () Bool)

(assert (=> b!154987 (= res!129659 e!104299)))

(declare-fun res!129662 () Bool)

(assert (=> b!154987 (=> res!129662 e!104299)))

(declare-datatypes ((tuple4!212 0))(
  ( (tuple4!213 (_1!7273 (_ BitVec 32)) (_2!7273 (_ BitVec 32)) (_3!409 (_ BitVec 32)) (_4!106 (_ BitVec 32))) )
))
(declare-fun lt!241365 () tuple4!212)

(assert (=> b!154987 (= res!129662 (bvsge (_1!7273 lt!241365) (_2!7273 lt!241365)))))

(declare-fun lt!241366 () (_ BitVec 32))

(assert (=> b!154987 (= lt!241366 ((_ extract 31 0) (bvsrem lt!241254 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!241367 () (_ BitVec 32))

(assert (=> b!154987 (= lt!241367 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!212)

(assert (=> b!154987 (= lt!241365 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!241254))))

(declare-fun b!154988 () Bool)

(declare-fun e!104297 () Bool)

(declare-fun call!2228 () Bool)

(assert (=> b!154988 (= e!104297 call!2228)))

(declare-fun b!154989 () Bool)

(declare-fun e!104294 () Bool)

(assert (=> b!154989 (= e!104296 e!104294)))

(declare-fun c!8244 () Bool)

(assert (=> b!154989 (= c!8244 (= (_3!409 lt!241365) (_4!106 lt!241365)))))

(declare-fun b!154990 () Bool)

(declare-fun arrayRangesEq!399 (array!7022 array!7022 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!154990 (= e!104299 (arrayRangesEq!399 (buf!3663 bs1!10) (buf!3663 bs2!18) (_1!7273 lt!241365) (_2!7273 lt!241365)))))

(declare-fun d!51084 () Bool)

(declare-fun res!129660 () Bool)

(assert (=> d!51084 (=> res!129660 e!104295)))

(assert (=> d!51084 (= res!129660 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!241254))))

(assert (=> d!51084 (= (arrayBitRangesEq!0 (buf!3663 bs1!10) (buf!3663 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!241254) e!104295)))

(declare-fun b!154991 () Bool)

(assert (=> b!154991 (= e!104294 call!2228)))

(declare-fun bm!2225 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2225 (= call!2228 (byteRangesEq!0 (ite c!8244 (select (arr!3983 (buf!3663 bs1!10)) (_3!409 lt!241365)) (select (arr!3983 (buf!3663 bs1!10)) (_4!106 lt!241365))) (ite c!8244 (select (arr!3983 (buf!3663 bs2!18)) (_3!409 lt!241365)) (select (arr!3983 (buf!3663 bs2!18)) (_4!106 lt!241365))) (ite c!8244 lt!241367 #b00000000000000000000000000000000) lt!241366))))

(declare-fun b!154992 () Bool)

(declare-fun e!104298 () Bool)

(assert (=> b!154992 (= e!104294 e!104298)))

(declare-fun res!129661 () Bool)

(assert (=> b!154992 (= res!129661 (byteRangesEq!0 (select (arr!3983 (buf!3663 bs1!10)) (_3!409 lt!241365)) (select (arr!3983 (buf!3663 bs2!18)) (_3!409 lt!241365)) lt!241367 #b00000000000000000000000000001000))))

(assert (=> b!154992 (=> (not res!129661) (not e!104298))))

(declare-fun b!154993 () Bool)

(declare-fun res!129658 () Bool)

(assert (=> b!154993 (= res!129658 (= lt!241366 #b00000000000000000000000000000000))))

(assert (=> b!154993 (=> res!129658 e!104297)))

(assert (=> b!154993 (= e!104298 e!104297)))

(assert (= (and d!51084 (not res!129660)) b!154987))

(assert (= (and b!154987 (not res!129662)) b!154990))

(assert (= (and b!154987 res!129659) b!154989))

(assert (= (and b!154989 c!8244) b!154991))

(assert (= (and b!154989 (not c!8244)) b!154992))

(assert (= (and b!154992 res!129661) b!154993))

(assert (= (and b!154993 (not res!129658)) b!154988))

(assert (= (or b!154991 b!154988) bm!2225))

(declare-fun m!240939 () Bool)

(assert (=> b!154987 m!240939))

(declare-fun m!240941 () Bool)

(assert (=> b!154990 m!240941))

(declare-fun m!240943 () Bool)

(assert (=> bm!2225 m!240943))

(declare-fun m!240945 () Bool)

(assert (=> bm!2225 m!240945))

(declare-fun m!240947 () Bool)

(assert (=> bm!2225 m!240947))

(declare-fun m!240949 () Bool)

(assert (=> bm!2225 m!240949))

(declare-fun m!240951 () Bool)

(assert (=> bm!2225 m!240951))

(assert (=> b!154992 m!240947))

(assert (=> b!154992 m!240943))

(assert (=> b!154992 m!240947))

(assert (=> b!154992 m!240943))

(declare-fun m!240953 () Bool)

(assert (=> b!154992 m!240953))

(assert (=> b!154893 d!51084))

(declare-fun d!51094 () Bool)

(assert (=> d!51094 (= (array_inv!2949 (buf!3663 bs1!10)) (bvsge (size!3160 (buf!3663 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!154894 d!51094))

(declare-fun d!51098 () Bool)

(declare-datatypes ((tuple2!13728 0))(
  ( (tuple2!13729 (_1!7274 (_ BitVec 8)) (_2!7274 BitStream!5578)) )
))
(declare-fun lt!241376 () tuple2!13728)

(declare-fun readByte!0 (BitStream!5578) tuple2!13728)

(assert (=> d!51098 (= lt!241376 (readByte!0 (BitStream!5579 (buf!3663 bs2!18) (currentByte!6694 bs1!10) (currentBit!6689 bs1!10))))))

(assert (=> d!51098 (= (readBytePure!0 (BitStream!5579 (buf!3663 bs2!18) (currentByte!6694 bs1!10) (currentBit!6689 bs1!10))) (tuple2!13721 (_2!7274 lt!241376) (_1!7274 lt!241376)))))

(declare-fun bs!12508 () Bool)

(assert (= bs!12508 d!51098))

(declare-fun m!240959 () Bool)

(assert (=> bs!12508 m!240959))

(assert (=> b!154895 d!51098))

(declare-fun d!51106 () Bool)

(declare-fun lt!241377 () tuple2!13728)

(assert (=> d!51106 (= lt!241377 (readByte!0 bs1!10))))

(assert (=> d!51106 (= (readBytePure!0 bs1!10) (tuple2!13721 (_2!7274 lt!241377) (_1!7274 lt!241377)))))

(declare-fun bs!12509 () Bool)

(assert (= bs!12509 d!51106))

(declare-fun m!240961 () Bool)

(assert (=> bs!12509 m!240961))

(assert (=> b!154895 d!51106))

(declare-fun d!51108 () Bool)

(declare-fun e!104301 () Bool)

(assert (=> d!51108 e!104301))

(declare-fun res!129666 () Bool)

(assert (=> d!51108 (=> (not res!129666) (not e!104301))))

(declare-fun lt!241383 () (_ BitVec 64))

(declare-fun lt!241382 () (_ BitVec 64))

(declare-fun lt!241380 () (_ BitVec 64))

(assert (=> d!51108 (= res!129666 (= lt!241383 (bvsub lt!241382 lt!241380)))))

(assert (=> d!51108 (or (= (bvand lt!241382 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241380 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!241382 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!241382 lt!241380) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51108 (= lt!241380 (remainingBits!0 ((_ sign_extend 32) (size!3160 (buf!3663 bs2!18))) ((_ sign_extend 32) (currentByte!6694 bs2!18)) ((_ sign_extend 32) (currentBit!6689 bs2!18))))))

(declare-fun lt!241378 () (_ BitVec 64))

(declare-fun lt!241379 () (_ BitVec 64))

(assert (=> d!51108 (= lt!241382 (bvmul lt!241378 lt!241379))))

(assert (=> d!51108 (or (= lt!241378 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!241379 (bvsdiv (bvmul lt!241378 lt!241379) lt!241378)))))

(assert (=> d!51108 (= lt!241379 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!51108 (= lt!241378 ((_ sign_extend 32) (size!3160 (buf!3663 bs2!18))))))

(assert (=> d!51108 (= lt!241383 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6694 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6689 bs2!18))))))

(assert (=> d!51108 (invariant!0 (currentBit!6689 bs2!18) (currentByte!6694 bs2!18) (size!3160 (buf!3663 bs2!18)))))

(assert (=> d!51108 (= (bitIndex!0 (size!3160 (buf!3663 bs2!18)) (currentByte!6694 bs2!18) (currentBit!6689 bs2!18)) lt!241383)))

(declare-fun b!154996 () Bool)

(declare-fun res!129665 () Bool)

(assert (=> b!154996 (=> (not res!129665) (not e!104301))))

(assert (=> b!154996 (= res!129665 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!241383))))

(declare-fun b!154997 () Bool)

(declare-fun lt!241381 () (_ BitVec 64))

(assert (=> b!154997 (= e!104301 (bvsle lt!241383 (bvmul lt!241381 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154997 (or (= lt!241381 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!241381 #b0000000000000000000000000000000000000000000000000000000000001000) lt!241381)))))

(assert (=> b!154997 (= lt!241381 ((_ sign_extend 32) (size!3160 (buf!3663 bs2!18))))))

(assert (= (and d!51108 res!129666) b!154996))

(assert (= (and b!154996 res!129665) b!154997))

(declare-fun m!240963 () Bool)

(assert (=> d!51108 m!240963))

(assert (=> d!51108 m!240903))

(assert (=> b!154890 d!51108))

(push 1)

(assert (not bm!2225))

(assert (not d!51062))

(assert (not b!154987))

(assert (not d!51068))

(assert (not d!51098))

(assert (not b!154992))

(assert (not d!51106))

(assert (not d!51064))

(assert (not d!51108))

(assert (not b!154990))

(check-sat)

(pop 1)

(push 1)

(check-sat)

