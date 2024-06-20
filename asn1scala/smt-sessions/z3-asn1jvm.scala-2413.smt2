; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61476 () Bool)

(assert start!61476)

(declare-fun res!229598 () Bool)

(declare-fun e!196260 () Bool)

(assert (=> start!61476 (=> (not res!229598) (not e!196260))))

(declare-datatypes ((array!15807 0))(
  ( (array!15808 (arr!7838 (Array (_ BitVec 32) (_ BitVec 8))) (size!6845 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12504 0))(
  ( (BitStream!12505 (buf!7313 array!15807) (currentByte!13524 (_ BitVec 32)) (currentBit!13519 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12504)

(declare-fun bs2!19 () BitStream!12504)

(assert (=> start!61476 (= res!229598 (= (size!6845 (buf!7313 bs1!11)) (size!6845 (buf!7313 bs2!19))))))

(assert (=> start!61476 e!196260))

(declare-fun e!196263 () Bool)

(declare-fun inv!12 (BitStream!12504) Bool)

(assert (=> start!61476 (and (inv!12 bs1!11) e!196263)))

(declare-fun e!196261 () Bool)

(assert (=> start!61476 (and (inv!12 bs2!19) e!196261)))

(declare-fun b!276311 () Bool)

(declare-fun array_inv!6569 (array!15807) Bool)

(assert (=> b!276311 (= e!196261 (array_inv!6569 (buf!7313 bs2!19)))))

(declare-fun b!276312 () Bool)

(declare-fun e!196265 () Bool)

(assert (=> b!276312 (= e!196260 e!196265)))

(declare-fun res!229600 () Bool)

(assert (=> b!276312 (=> (not res!229600) (not e!196265))))

(declare-fun lt!414494 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!15807 array!15807 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276312 (= res!229600 (arrayBitRangesEq!0 (buf!7313 bs1!11) (buf!7313 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414494))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!276312 (= lt!414494 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6845 (buf!7313 bs1!11)) (currentByte!13524 bs1!11) (currentBit!13519 bs1!11))))))

(declare-fun b!276313 () Bool)

(assert (=> b!276313 (= e!196265 (not (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!414494)))))

(declare-datatypes ((tuple2!22526 0))(
  ( (tuple2!22527 (_1!12304 BitStream!12504) (_2!12304 Bool)) )
))
(declare-fun lt!414493 () tuple2!22526)

(declare-fun readBitPure!0 (BitStream!12504) tuple2!22526)

(assert (=> b!276313 (= lt!414493 (readBitPure!0 (BitStream!12505 (buf!7313 bs2!19) (currentByte!13524 bs1!11) (currentBit!13519 bs1!11))))))

(declare-fun lt!414495 () tuple2!22526)

(assert (=> b!276313 (= lt!414495 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276313 (invariant!0 (currentBit!13519 bs1!11) (currentByte!13524 bs1!11) (size!6845 (buf!7313 bs2!19)))))

(declare-fun b!276314 () Bool)

(assert (=> b!276314 (= e!196263 (array_inv!6569 (buf!7313 bs1!11)))))

(declare-fun b!276315 () Bool)

(declare-fun res!229599 () Bool)

(assert (=> b!276315 (=> (not res!229599) (not e!196260))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276315 (= res!229599 (validate_offset_bit!0 ((_ sign_extend 32) (size!6845 (buf!7313 bs1!11))) ((_ sign_extend 32) (currentByte!13524 bs1!11)) ((_ sign_extend 32) (currentBit!13519 bs1!11))))))

(assert (= (and start!61476 res!229598) b!276315))

(assert (= (and b!276315 res!229599) b!276312))

(assert (= (and b!276312 res!229600) b!276313))

(assert (= start!61476 b!276314))

(assert (= start!61476 b!276311))

(declare-fun m!409309 () Bool)

(assert (=> b!276315 m!409309))

(declare-fun m!409311 () Bool)

(assert (=> start!61476 m!409311))

(declare-fun m!409313 () Bool)

(assert (=> start!61476 m!409313))

(declare-fun m!409315 () Bool)

(assert (=> b!276313 m!409315))

(declare-fun m!409317 () Bool)

(assert (=> b!276313 m!409317))

(declare-fun m!409319 () Bool)

(assert (=> b!276313 m!409319))

(declare-fun m!409321 () Bool)

(assert (=> b!276312 m!409321))

(declare-fun m!409323 () Bool)

(assert (=> b!276312 m!409323))

(declare-fun m!409325 () Bool)

(assert (=> b!276314 m!409325))

(declare-fun m!409327 () Bool)

(assert (=> b!276311 m!409327))

(check-sat (not b!276312) (not b!276315) (not start!61476) (not b!276314) (not b!276311) (not b!276313))
(check-sat)
(get-model)

(declare-fun d!95152 () Bool)

(declare-datatypes ((tuple2!22534 0))(
  ( (tuple2!22535 (_1!12310 Bool) (_2!12310 BitStream!12504)) )
))
(declare-fun lt!414517 () tuple2!22534)

(declare-fun readBit!0 (BitStream!12504) tuple2!22534)

(assert (=> d!95152 (= lt!414517 (readBit!0 (BitStream!12505 (buf!7313 bs2!19) (currentByte!13524 bs1!11) (currentBit!13519 bs1!11))))))

(assert (=> d!95152 (= (readBitPure!0 (BitStream!12505 (buf!7313 bs2!19) (currentByte!13524 bs1!11) (currentBit!13519 bs1!11))) (tuple2!22527 (_2!12310 lt!414517) (_1!12310 lt!414517)))))

(declare-fun bs!23996 () Bool)

(assert (= bs!23996 d!95152))

(declare-fun m!409359 () Bool)

(assert (=> bs!23996 m!409359))

(assert (=> b!276313 d!95152))

(declare-fun d!95170 () Bool)

(declare-fun lt!414518 () tuple2!22534)

(assert (=> d!95170 (= lt!414518 (readBit!0 bs1!11))))

(assert (=> d!95170 (= (readBitPure!0 bs1!11) (tuple2!22527 (_2!12310 lt!414518) (_1!12310 lt!414518)))))

(declare-fun bs!23997 () Bool)

(assert (= bs!23997 d!95170))

(declare-fun m!409361 () Bool)

(assert (=> bs!23997 m!409361))

(assert (=> b!276313 d!95170))

(declare-fun d!95172 () Bool)

(assert (=> d!95172 (= (invariant!0 (currentBit!13519 bs1!11) (currentByte!13524 bs1!11) (size!6845 (buf!7313 bs2!19))) (and (bvsge (currentBit!13519 bs1!11) #b00000000000000000000000000000000) (bvslt (currentBit!13519 bs1!11) #b00000000000000000000000000001000) (bvsge (currentByte!13524 bs1!11) #b00000000000000000000000000000000) (or (bvslt (currentByte!13524 bs1!11) (size!6845 (buf!7313 bs2!19))) (and (= (currentBit!13519 bs1!11) #b00000000000000000000000000000000) (= (currentByte!13524 bs1!11) (size!6845 (buf!7313 bs2!19)))))))))

(assert (=> b!276313 d!95172))

(declare-fun d!95174 () Bool)

(assert (=> d!95174 (= (array_inv!6569 (buf!7313 bs1!11)) (bvsge (size!6845 (buf!7313 bs1!11)) #b00000000000000000000000000000000))))

(assert (=> b!276314 d!95174))

(declare-fun d!95176 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!95176 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6845 (buf!7313 bs1!11))) ((_ sign_extend 32) (currentByte!13524 bs1!11)) ((_ sign_extend 32) (currentBit!13519 bs1!11))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6845 (buf!7313 bs1!11))) ((_ sign_extend 32) (currentByte!13524 bs1!11)) ((_ sign_extend 32) (currentBit!13519 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!23998 () Bool)

(assert (= bs!23998 d!95176))

(declare-fun m!409379 () Bool)

(assert (=> bs!23998 m!409379))

(assert (=> b!276315 d!95176))

(declare-fun d!95180 () Bool)

(assert (=> d!95180 (= (array_inv!6569 (buf!7313 bs2!19)) (bvsge (size!6845 (buf!7313 bs2!19)) #b00000000000000000000000000000000))))

(assert (=> b!276311 d!95180))

(declare-fun lt!414579 () (_ BitVec 32))

(declare-datatypes ((tuple4!526 0))(
  ( (tuple4!527 (_1!12311 (_ BitVec 32)) (_2!12311 (_ BitVec 32)) (_3!1043 (_ BitVec 32)) (_4!263 (_ BitVec 32))) )
))
(declare-fun lt!414578 () tuple4!526)

(declare-fun call!4445 () Bool)

(declare-fun bm!4442 () Bool)

(declare-fun c!12630 () Bool)

(declare-fun lt!414577 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4442 (= call!4445 (byteRangesEq!0 (ite c!12630 (select (arr!7838 (buf!7313 bs1!11)) (_3!1043 lt!414578)) (select (arr!7838 (buf!7313 bs1!11)) (_4!263 lt!414578))) (ite c!12630 (select (arr!7838 (buf!7313 bs2!19)) (_3!1043 lt!414578)) (select (arr!7838 (buf!7313 bs2!19)) (_4!263 lt!414578))) (ite c!12630 lt!414579 #b00000000000000000000000000000000) lt!414577))))

(declare-fun b!276399 () Bool)

(declare-fun e!196340 () Bool)

(assert (=> b!276399 (= e!196340 call!4445)))

(declare-fun b!276400 () Bool)

(declare-fun res!229664 () Bool)

(assert (=> b!276400 (= res!229664 (= lt!414577 #b00000000000000000000000000000000))))

(assert (=> b!276400 (=> res!229664 e!196340)))

(declare-fun e!196338 () Bool)

(assert (=> b!276400 (= e!196338 e!196340)))

(declare-fun b!276401 () Bool)

(declare-fun e!196342 () Bool)

(assert (=> b!276401 (= e!196342 call!4445)))

(declare-fun e!196341 () Bool)

(declare-fun b!276402 () Bool)

(declare-fun arrayRangesEq!1156 (array!15807 array!15807 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276402 (= e!196341 (arrayRangesEq!1156 (buf!7313 bs1!11) (buf!7313 bs2!19) (_1!12311 lt!414578) (_2!12311 lt!414578)))))

(declare-fun d!95182 () Bool)

(declare-fun res!229666 () Bool)

(declare-fun e!196343 () Bool)

(assert (=> d!95182 (=> res!229666 e!196343)))

(assert (=> d!95182 (= res!229666 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!414494))))

(assert (=> d!95182 (= (arrayBitRangesEq!0 (buf!7313 bs1!11) (buf!7313 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414494) e!196343)))

(declare-fun b!276403 () Bool)

(declare-fun e!196339 () Bool)

(assert (=> b!276403 (= e!196339 e!196342)))

(assert (=> b!276403 (= c!12630 (= (_3!1043 lt!414578) (_4!263 lt!414578)))))

(declare-fun b!276404 () Bool)

(assert (=> b!276404 (= e!196343 e!196339)))

(declare-fun res!229662 () Bool)

(assert (=> b!276404 (=> (not res!229662) (not e!196339))))

(assert (=> b!276404 (= res!229662 e!196341)))

(declare-fun res!229665 () Bool)

(assert (=> b!276404 (=> res!229665 e!196341)))

(assert (=> b!276404 (= res!229665 (bvsge (_1!12311 lt!414578) (_2!12311 lt!414578)))))

(assert (=> b!276404 (= lt!414577 ((_ extract 31 0) (bvsrem lt!414494 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!276404 (= lt!414579 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!526)

(assert (=> b!276404 (= lt!414578 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!414494))))

(declare-fun b!276405 () Bool)

(assert (=> b!276405 (= e!196342 e!196338)))

(declare-fun res!229663 () Bool)

(assert (=> b!276405 (= res!229663 (byteRangesEq!0 (select (arr!7838 (buf!7313 bs1!11)) (_3!1043 lt!414578)) (select (arr!7838 (buf!7313 bs2!19)) (_3!1043 lt!414578)) lt!414579 #b00000000000000000000000000001000))))

(assert (=> b!276405 (=> (not res!229663) (not e!196338))))

(assert (= (and d!95182 (not res!229666)) b!276404))

(assert (= (and b!276404 (not res!229665)) b!276402))

(assert (= (and b!276404 res!229662) b!276403))

(assert (= (and b!276403 c!12630) b!276401))

(assert (= (and b!276403 (not c!12630)) b!276405))

(assert (= (and b!276405 res!229663) b!276400))

(assert (= (and b!276400 (not res!229664)) b!276399))

(assert (= (or b!276401 b!276399) bm!4442))

(declare-fun m!409407 () Bool)

(assert (=> bm!4442 m!409407))

(declare-fun m!409409 () Bool)

(assert (=> bm!4442 m!409409))

(declare-fun m!409411 () Bool)

(assert (=> bm!4442 m!409411))

(declare-fun m!409413 () Bool)

(assert (=> bm!4442 m!409413))

(declare-fun m!409415 () Bool)

(assert (=> bm!4442 m!409415))

(declare-fun m!409417 () Bool)

(assert (=> b!276402 m!409417))

(declare-fun m!409419 () Bool)

(assert (=> b!276404 m!409419))

(assert (=> b!276405 m!409411))

(assert (=> b!276405 m!409409))

(assert (=> b!276405 m!409411))

(assert (=> b!276405 m!409409))

(declare-fun m!409421 () Bool)

(assert (=> b!276405 m!409421))

(assert (=> b!276312 d!95182))

(declare-fun d!95200 () Bool)

(declare-fun e!196346 () Bool)

(assert (=> d!95200 e!196346))

(declare-fun res!229672 () Bool)

(assert (=> d!95200 (=> (not res!229672) (not e!196346))))

(declare-fun lt!414595 () (_ BitVec 64))

(declare-fun lt!414596 () (_ BitVec 64))

(declare-fun lt!414592 () (_ BitVec 64))

(assert (=> d!95200 (= res!229672 (= lt!414595 (bvsub lt!414596 lt!414592)))))

(assert (=> d!95200 (or (= (bvand lt!414596 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414592 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!414596 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!414596 lt!414592) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!95200 (= lt!414592 (remainingBits!0 ((_ sign_extend 32) (size!6845 (buf!7313 bs1!11))) ((_ sign_extend 32) (currentByte!13524 bs1!11)) ((_ sign_extend 32) (currentBit!13519 bs1!11))))))

(declare-fun lt!414594 () (_ BitVec 64))

(declare-fun lt!414597 () (_ BitVec 64))

(assert (=> d!95200 (= lt!414596 (bvmul lt!414594 lt!414597))))

(assert (=> d!95200 (or (= lt!414594 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!414597 (bvsdiv (bvmul lt!414594 lt!414597) lt!414594)))))

(assert (=> d!95200 (= lt!414597 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!95200 (= lt!414594 ((_ sign_extend 32) (size!6845 (buf!7313 bs1!11))))))

(assert (=> d!95200 (= lt!414595 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13524 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13519 bs1!11))))))

(assert (=> d!95200 (invariant!0 (currentBit!13519 bs1!11) (currentByte!13524 bs1!11) (size!6845 (buf!7313 bs1!11)))))

(assert (=> d!95200 (= (bitIndex!0 (size!6845 (buf!7313 bs1!11)) (currentByte!13524 bs1!11) (currentBit!13519 bs1!11)) lt!414595)))

(declare-fun b!276410 () Bool)

(declare-fun res!229671 () Bool)

(assert (=> b!276410 (=> (not res!229671) (not e!196346))))

(assert (=> b!276410 (= res!229671 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!414595))))

(declare-fun b!276411 () Bool)

(declare-fun lt!414593 () (_ BitVec 64))

(assert (=> b!276411 (= e!196346 (bvsle lt!414595 (bvmul lt!414593 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!276411 (or (= lt!414593 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!414593 #b0000000000000000000000000000000000000000000000000000000000001000) lt!414593)))))

(assert (=> b!276411 (= lt!414593 ((_ sign_extend 32) (size!6845 (buf!7313 bs1!11))))))

(assert (= (and d!95200 res!229672) b!276410))

(assert (= (and b!276410 res!229671) b!276411))

(assert (=> d!95200 m!409379))

(declare-fun m!409423 () Bool)

(assert (=> d!95200 m!409423))

(assert (=> b!276312 d!95200))

(declare-fun d!95202 () Bool)

(assert (=> d!95202 (= (inv!12 bs1!11) (invariant!0 (currentBit!13519 bs1!11) (currentByte!13524 bs1!11) (size!6845 (buf!7313 bs1!11))))))

(declare-fun bs!24004 () Bool)

(assert (= bs!24004 d!95202))

(assert (=> bs!24004 m!409423))

(assert (=> start!61476 d!95202))

(declare-fun d!95204 () Bool)

(assert (=> d!95204 (= (inv!12 bs2!19) (invariant!0 (currentBit!13519 bs2!19) (currentByte!13524 bs2!19) (size!6845 (buf!7313 bs2!19))))))

(declare-fun bs!24005 () Bool)

(assert (= bs!24005 d!95204))

(declare-fun m!409425 () Bool)

(assert (=> bs!24005 m!409425))

(assert (=> start!61476 d!95204))

(check-sat (not d!95202) (not b!276404) (not bm!4442) (not d!95152) (not d!95204) (not d!95170) (not b!276405) (not d!95200) (not d!95176) (not b!276402))
