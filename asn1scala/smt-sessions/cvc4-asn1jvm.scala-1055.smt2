; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30212 () Bool)

(assert start!30212)

(declare-fun b!154926 () Bool)

(declare-fun res!129612 () Bool)

(declare-fun e!104250 () Bool)

(assert (=> b!154926 (=> (not res!129612) (not e!104250))))

(declare-fun lt!241281 () (_ BitVec 64))

(declare-datatypes ((array!7026 0))(
  ( (array!7027 (arr!3985 (Array (_ BitVec 32) (_ BitVec 8))) (size!3162 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5582 0))(
  ( (BitStream!5583 (buf!3665 array!7026) (currentByte!6696 (_ BitVec 32)) (currentBit!6691 (_ BitVec 32))) )
))
(declare-fun bs2!18 () BitStream!5582)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!154926 (= res!129612 (bvsle lt!241281 (bitIndex!0 (size!3162 (buf!3665 bs2!18)) (currentByte!6696 bs2!18) (currentBit!6691 bs2!18))))))

(declare-fun b!154927 () Bool)

(declare-fun e!104249 () Bool)

(declare-fun array_inv!2951 (array!7026) Bool)

(assert (=> b!154927 (= e!104249 (array_inv!2951 (buf!3665 bs2!18)))))

(declare-fun res!129610 () Bool)

(declare-fun e!104248 () Bool)

(assert (=> start!30212 (=> (not res!129610) (not e!104248))))

(declare-fun bs1!10 () BitStream!5582)

(assert (=> start!30212 (= res!129610 (= (size!3162 (buf!3665 bs1!10)) (size!3162 (buf!3665 bs2!18))))))

(assert (=> start!30212 e!104248))

(declare-fun e!104251 () Bool)

(declare-fun inv!12 (BitStream!5582) Bool)

(assert (=> start!30212 (and (inv!12 bs1!10) e!104251)))

(assert (=> start!30212 (and (inv!12 bs2!18) e!104249)))

(declare-fun b!154928 () Bool)

(declare-fun lt!241282 () (_ BitVec 32))

(assert (=> b!154928 (= e!104250 (and (bvsle #b00000000000000000000000000000000 lt!241282) (bvsgt lt!241282 (size!3162 (buf!3665 bs1!10)))))))

(declare-fun lt!241284 () (_ BitVec 64))

(assert (=> b!154928 (= lt!241282 ((_ extract 31 0) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bvsdiv lt!241284 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-datatypes ((tuple2!13724 0))(
  ( (tuple2!13725 (_1!7270 BitStream!5582) (_2!7270 (_ BitVec 8))) )
))
(declare-fun lt!241285 () tuple2!13724)

(declare-fun readBytePure!0 (BitStream!5582) tuple2!13724)

(assert (=> b!154928 (= lt!241285 (readBytePure!0 (BitStream!5583 (buf!3665 bs2!18) (currentByte!6696 bs1!10) (currentBit!6691 bs1!10))))))

(declare-fun lt!241283 () tuple2!13724)

(assert (=> b!154928 (= lt!241283 (readBytePure!0 bs1!10))))

(declare-fun b!154929 () Bool)

(declare-fun res!129611 () Bool)

(assert (=> b!154929 (=> (not res!129611) (not e!104250))))

(declare-fun arrayBitRangesEq!0 (array!7026 array!7026 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!154929 (= res!129611 (arrayBitRangesEq!0 (buf!3665 bs1!10) (buf!3665 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!241281))))

(declare-fun b!154930 () Bool)

(assert (=> b!154930 (= e!104248 e!104250)))

(declare-fun res!129609 () Bool)

(assert (=> b!154930 (=> (not res!129609) (not e!104250))))

(assert (=> b!154930 (= res!129609 (bvsle lt!241281 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3162 (buf!3665 bs1!10))))))))

(assert (=> b!154930 (= lt!241281 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!241284))))

(assert (=> b!154930 (= lt!241284 (bitIndex!0 (size!3162 (buf!3665 bs1!10)) (currentByte!6696 bs1!10) (currentBit!6691 bs1!10)))))

(declare-fun b!154931 () Bool)

(assert (=> b!154931 (= e!104251 (array_inv!2951 (buf!3665 bs1!10)))))

(assert (= (and start!30212 res!129610) b!154930))

(assert (= (and b!154930 res!129609) b!154926))

(assert (= (and b!154926 res!129612) b!154929))

(assert (= (and b!154929 res!129611) b!154928))

(assert (= start!30212 b!154931))

(assert (= start!30212 b!154927))

(declare-fun m!240883 () Bool)

(assert (=> b!154926 m!240883))

(declare-fun m!240885 () Bool)

(assert (=> b!154927 m!240885))

(declare-fun m!240887 () Bool)

(assert (=> start!30212 m!240887))

(declare-fun m!240889 () Bool)

(assert (=> start!30212 m!240889))

(declare-fun m!240891 () Bool)

(assert (=> b!154930 m!240891))

(declare-fun m!240893 () Bool)

(assert (=> b!154929 m!240893))

(declare-fun m!240895 () Bool)

(assert (=> b!154928 m!240895))

(declare-fun m!240897 () Bool)

(assert (=> b!154928 m!240897))

(declare-fun m!240899 () Bool)

(assert (=> b!154931 m!240899))

(push 1)

(assert (not start!30212))

(assert (not b!154929))

(assert (not b!154930))

(assert (not b!154928))

(assert (not b!154927))

(assert (not b!154926))

(assert (not b!154931))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!51086 () Bool)

(declare-fun e!104293 () Bool)

(assert (=> d!51086 e!104293))

(declare-fun res!129656 () Bool)

(assert (=> d!51086 (=> (not res!129656) (not e!104293))))

(declare-fun lt!241360 () (_ BitVec 64))

(declare-fun lt!241359 () (_ BitVec 64))

(declare-fun lt!241361 () (_ BitVec 64))

(assert (=> d!51086 (= res!129656 (= lt!241360 (bvsub lt!241359 lt!241361)))))

(assert (=> d!51086 (or (= (bvand lt!241359 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241361 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!241359 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!241359 lt!241361) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!51086 (= lt!241361 (remainingBits!0 ((_ sign_extend 32) (size!3162 (buf!3665 bs1!10))) ((_ sign_extend 32) (currentByte!6696 bs1!10)) ((_ sign_extend 32) (currentBit!6691 bs1!10))))))

(declare-fun lt!241364 () (_ BitVec 64))

(declare-fun lt!241363 () (_ BitVec 64))

(assert (=> d!51086 (= lt!241359 (bvmul lt!241364 lt!241363))))

(assert (=> d!51086 (or (= lt!241364 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!241363 (bvsdiv (bvmul lt!241364 lt!241363) lt!241364)))))

(assert (=> d!51086 (= lt!241363 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!51086 (= lt!241364 ((_ sign_extend 32) (size!3162 (buf!3665 bs1!10))))))

(assert (=> d!51086 (= lt!241360 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6696 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6691 bs1!10))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!51086 (invariant!0 (currentBit!6691 bs1!10) (currentByte!6696 bs1!10) (size!3162 (buf!3665 bs1!10)))))

(assert (=> d!51086 (= (bitIndex!0 (size!3162 (buf!3665 bs1!10)) (currentByte!6696 bs1!10) (currentBit!6691 bs1!10)) lt!241360)))

(declare-fun b!154985 () Bool)

(declare-fun res!129657 () Bool)

(assert (=> b!154985 (=> (not res!129657) (not e!104293))))

(assert (=> b!154985 (= res!129657 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!241360))))

(declare-fun b!154986 () Bool)

(declare-fun lt!241362 () (_ BitVec 64))

(assert (=> b!154986 (= e!104293 (bvsle lt!241360 (bvmul lt!241362 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154986 (or (= lt!241362 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!241362 #b0000000000000000000000000000000000000000000000000000000000001000) lt!241362)))))

(assert (=> b!154986 (= lt!241362 ((_ sign_extend 32) (size!3162 (buf!3665 bs1!10))))))

(assert (= (and d!51086 res!129656) b!154985))

(assert (= (and b!154985 res!129657) b!154986))

(declare-fun m!240935 () Bool)

(assert (=> d!51086 m!240935))

(declare-fun m!240937 () Bool)

(assert (=> d!51086 m!240937))

(assert (=> b!154930 d!51086))

(declare-fun d!51090 () Bool)

(assert (=> d!51090 (= (array_inv!2951 (buf!3665 bs1!10)) (bvsge (size!3162 (buf!3665 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!154931 d!51090))

(declare-fun d!51092 () Bool)

(declare-fun e!104300 () Bool)

(assert (=> d!51092 e!104300))

(declare-fun res!129663 () Bool)

(assert (=> d!51092 (=> (not res!129663) (not e!104300))))

(declare-fun lt!241370 () (_ BitVec 64))

(declare-fun lt!241368 () (_ BitVec 64))

(declare-fun lt!241369 () (_ BitVec 64))

(assert (=> d!51092 (= res!129663 (= lt!241369 (bvsub lt!241368 lt!241370)))))

(assert (=> d!51092 (or (= (bvand lt!241368 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241370 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!241368 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!241368 lt!241370) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51092 (= lt!241370 (remainingBits!0 ((_ sign_extend 32) (size!3162 (buf!3665 bs2!18))) ((_ sign_extend 32) (currentByte!6696 bs2!18)) ((_ sign_extend 32) (currentBit!6691 bs2!18))))))

(declare-fun lt!241373 () (_ BitVec 64))

(declare-fun lt!241372 () (_ BitVec 64))

(assert (=> d!51092 (= lt!241368 (bvmul lt!241373 lt!241372))))

(assert (=> d!51092 (or (= lt!241373 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!241372 (bvsdiv (bvmul lt!241373 lt!241372) lt!241373)))))

(assert (=> d!51092 (= lt!241372 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!51092 (= lt!241373 ((_ sign_extend 32) (size!3162 (buf!3665 bs2!18))))))

(assert (=> d!51092 (= lt!241369 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6696 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6691 bs2!18))))))

(assert (=> d!51092 (invariant!0 (currentBit!6691 bs2!18) (currentByte!6696 bs2!18) (size!3162 (buf!3665 bs2!18)))))

(assert (=> d!51092 (= (bitIndex!0 (size!3162 (buf!3665 bs2!18)) (currentByte!6696 bs2!18) (currentBit!6691 bs2!18)) lt!241369)))

(declare-fun b!154994 () Bool)

(declare-fun res!129664 () Bool)

(assert (=> b!154994 (=> (not res!129664) (not e!104300))))

(assert (=> b!154994 (= res!129664 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!241369))))

(declare-fun b!154995 () Bool)

(declare-fun lt!241371 () (_ BitVec 64))

(assert (=> b!154995 (= e!104300 (bvsle lt!241369 (bvmul lt!241371 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154995 (or (= lt!241371 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!241371 #b0000000000000000000000000000000000000000000000000000000000001000) lt!241371)))))

(assert (=> b!154995 (= lt!241371 ((_ sign_extend 32) (size!3162 (buf!3665 bs2!18))))))

(assert (= (and d!51092 res!129663) b!154994))

(assert (= (and b!154994 res!129664) b!154995))

(declare-fun m!240955 () Bool)

(assert (=> d!51092 m!240955))

(declare-fun m!240957 () Bool)

(assert (=> d!51092 m!240957))

(assert (=> b!154926 d!51092))

(declare-fun d!51096 () Bool)

(assert (=> d!51096 (= (inv!12 bs1!10) (invariant!0 (currentBit!6691 bs1!10) (currentByte!6696 bs1!10) (size!3162 (buf!3665 bs1!10))))))

(declare-fun bs!12506 () Bool)

(assert (= bs!12506 d!51096))

(assert (=> bs!12506 m!240937))

(assert (=> start!30212 d!51096))

(declare-fun d!51100 () Bool)

(assert (=> d!51100 (= (inv!12 bs2!18) (invariant!0 (currentBit!6691 bs2!18) (currentByte!6696 bs2!18) (size!3162 (buf!3665 bs2!18))))))

(declare-fun bs!12507 () Bool)

(assert (= bs!12507 d!51100))

(assert (=> bs!12507 m!240957))

(assert (=> start!30212 d!51100))

(declare-fun d!51102 () Bool)

(assert (=> d!51102 (= (array_inv!2951 (buf!3665 bs2!18)) (bvsge (size!3162 (buf!3665 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!154927 d!51102))

(declare-fun d!51104 () Bool)

(declare-datatypes ((tuple2!13730 0))(
  ( (tuple2!13731 (_1!7275 (_ BitVec 8)) (_2!7275 BitStream!5582)) )
))
(declare-fun lt!241386 () tuple2!13730)

(declare-fun readByte!0 (BitStream!5582) tuple2!13730)

(assert (=> d!51104 (= lt!241386 (readByte!0 (BitStream!5583 (buf!3665 bs2!18) (currentByte!6696 bs1!10) (currentBit!6691 bs1!10))))))

(assert (=> d!51104 (= (readBytePure!0 (BitStream!5583 (buf!3665 bs2!18) (currentByte!6696 bs1!10) (currentBit!6691 bs1!10))) (tuple2!13725 (_2!7275 lt!241386) (_1!7275 lt!241386)))))

(declare-fun bs!12510 () Bool)

(assert (= bs!12510 d!51104))

(declare-fun m!240965 () Bool)

(assert (=> bs!12510 m!240965))

(assert (=> b!154928 d!51104))

(declare-fun d!51110 () Bool)

(declare-fun lt!241387 () tuple2!13730)

(assert (=> d!51110 (= lt!241387 (readByte!0 bs1!10))))

(assert (=> d!51110 (= (readBytePure!0 bs1!10) (tuple2!13725 (_2!7275 lt!241387) (_1!7275 lt!241387)))))

(declare-fun bs!12511 () Bool)

(assert (= bs!12511 d!51110))

(declare-fun m!240967 () Bool)

(assert (=> bs!12511 m!240967))

(assert (=> b!154928 d!51110))

(declare-fun e!104316 () Bool)

(declare-fun lt!241396 () (_ BitVec 32))

(declare-fun b!155012 () Bool)

(declare-datatypes ((tuple4!214 0))(
  ( (tuple4!215 (_1!7276 (_ BitVec 32)) (_2!7276 (_ BitVec 32)) (_3!410 (_ BitVec 32)) (_4!107 (_ BitVec 32))) )
))
(declare-fun lt!241395 () tuple4!214)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!155012 (= e!104316 (byteRangesEq!0 (select (arr!3985 (buf!3665 bs1!10)) (_4!107 lt!241395)) (select (arr!3985 (buf!3665 bs2!18)) (_4!107 lt!241395)) #b00000000000000000000000000000000 lt!241396))))

(declare-fun c!8247 () Bool)

(declare-fun bm!2228 () Bool)

(declare-fun call!2231 () Bool)

(declare-fun lt!241394 () (_ BitVec 32))

(assert (=> bm!2228 (= call!2231 (byteRangesEq!0 (select (arr!3985 (buf!3665 bs1!10)) (_3!410 lt!241395)) (select (arr!3985 (buf!3665 bs2!18)) (_3!410 lt!241395)) lt!241394 (ite c!8247 lt!241396 #b00000000000000000000000000001000)))))

(declare-fun b!155013 () Bool)

(declare-fun e!104318 () Bool)

(declare-fun e!104315 () Bool)

(assert (=> b!155013 (= e!104318 e!104315)))

(declare-fun res!129679 () Bool)

(assert (=> b!155013 (=> (not res!129679) (not e!104315))))

(declare-fun e!104314 () Bool)

(assert (=> b!155013 (= res!129679 e!104314)))

(declare-fun res!129677 () Bool)

(assert (=> b!155013 (=> res!129677 e!104314)))

(assert (=> b!155013 (= res!129677 (bvsge (_1!7276 lt!241395) (_2!7276 lt!241395)))))

(assert (=> b!155013 (= lt!241396 ((_ extract 31 0) (bvsrem lt!241281 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!155013 (= lt!241394 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!214)

(assert (=> b!155013 (= lt!241395 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!241281))))

(declare-fun b!155014 () Bool)

(declare-fun e!104317 () Bool)

(declare-fun e!104319 () Bool)

(assert (=> b!155014 (= e!104317 e!104319)))

(declare-fun res!129680 () Bool)

(assert (=> b!155014 (= res!129680 call!2231)))

(assert (=> b!155014 (=> (not res!129680) (not e!104319))))

(declare-fun b!155015 () Bool)

(assert (=> b!155015 (= e!104315 e!104317)))

(assert (=> b!155015 (= c!8247 (= (_3!410 lt!241395) (_4!107 lt!241395)))))

(declare-fun b!155017 () Bool)

(declare-fun arrayRangesEq!400 (array!7026 array!7026 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!155017 (= e!104314 (arrayRangesEq!400 (buf!3665 bs1!10) (buf!3665 bs2!18) (_1!7276 lt!241395) (_2!7276 lt!241395)))))

(declare-fun b!155018 () Bool)

(declare-fun res!129681 () Bool)

(assert (=> b!155018 (= res!129681 (= lt!241396 #b00000000000000000000000000000000))))

(assert (=> b!155018 (=> res!129681 e!104316)))

(assert (=> b!155018 (= e!104319 e!104316)))

(declare-fun b!155016 () Bool)

(assert (=> b!155016 (= e!104317 call!2231)))

(declare-fun d!51112 () Bool)

(declare-fun res!129678 () Bool)

(assert (=> d!51112 (=> res!129678 e!104318)))

(assert (=> d!51112 (= res!129678 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!241281))))

(assert (=> d!51112 (= (arrayBitRangesEq!0 (buf!3665 bs1!10) (buf!3665 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!241281) e!104318)))

(assert (= (and d!51112 (not res!129678)) b!155013))

(assert (= (and b!155013 (not res!129677)) b!155017))

(assert (= (and b!155013 res!129679) b!155015))

(assert (= (and b!155015 c!8247) b!155016))

(assert (= (and b!155015 (not c!8247)) b!155014))

(assert (= (and b!155014 res!129680) b!155018))

(assert (= (and b!155018 (not res!129681)) b!155012))

(assert (= (or b!155016 b!155014) bm!2228))

(declare-fun m!240969 () Bool)

(assert (=> b!155012 m!240969))

(declare-fun m!240971 () Bool)

(assert (=> b!155012 m!240971))

(assert (=> b!155012 m!240969))

(assert (=> b!155012 m!240971))

(declare-fun m!240973 () Bool)

(assert (=> b!155012 m!240973))

(declare-fun m!240975 () Bool)

(assert (=> bm!2228 m!240975))

(declare-fun m!240977 () Bool)

(assert (=> bm!2228 m!240977))

(assert (=> bm!2228 m!240975))

(assert (=> bm!2228 m!240977))

(declare-fun m!240979 () Bool)

(assert (=> bm!2228 m!240979))

(declare-fun m!240981 () Bool)

(assert (=> b!155013 m!240981))

(declare-fun m!240983 () Bool)

(assert (=> b!155017 m!240983))

(assert (=> b!154929 d!51112))

(push 1)

(assert (not d!51104))

(assert (not b!155017))

(assert (not d!51110))

(assert (not d!51100))

(assert (not bm!2228))

(assert (not b!155012))

(assert (not d!51096))

(assert (not d!51092))

(assert (not d!51086))

(assert (not b!155013))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

