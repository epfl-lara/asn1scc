; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61474 () Bool)

(assert start!61474)

(declare-fun res!229591 () Bool)

(declare-fun e!196245 () Bool)

(assert (=> start!61474 (=> (not res!229591) (not e!196245))))

(declare-datatypes ((array!15805 0))(
  ( (array!15806 (arr!7837 (Array (_ BitVec 32) (_ BitVec 8))) (size!6844 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12502 0))(
  ( (BitStream!12503 (buf!7312 array!15805) (currentByte!13523 (_ BitVec 32)) (currentBit!13518 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12502)

(declare-fun bs2!19 () BitStream!12502)

(assert (=> start!61474 (= res!229591 (= (size!6844 (buf!7312 bs1!11)) (size!6844 (buf!7312 bs2!19))))))

(assert (=> start!61474 e!196245))

(declare-fun e!196246 () Bool)

(declare-fun inv!12 (BitStream!12502) Bool)

(assert (=> start!61474 (and (inv!12 bs1!11) e!196246)))

(declare-fun e!196242 () Bool)

(assert (=> start!61474 (and (inv!12 bs2!19) e!196242)))

(declare-fun b!276296 () Bool)

(declare-fun res!229590 () Bool)

(assert (=> b!276296 (=> (not res!229590) (not e!196245))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276296 (= res!229590 (validate_offset_bit!0 ((_ sign_extend 32) (size!6844 (buf!7312 bs1!11))) ((_ sign_extend 32) (currentByte!13523 bs1!11)) ((_ sign_extend 32) (currentBit!13518 bs1!11))))))

(declare-fun b!276297 () Bool)

(declare-fun array_inv!6568 (array!15805) Bool)

(assert (=> b!276297 (= e!196246 (array_inv!6568 (buf!7312 bs1!11)))))

(declare-fun b!276298 () Bool)

(declare-fun e!196244 () Bool)

(declare-fun lt!414486 () (_ BitVec 64))

(assert (=> b!276298 (= e!196244 (not (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!414486)))))

(declare-datatypes ((tuple2!22524 0))(
  ( (tuple2!22525 (_1!12303 BitStream!12502) (_2!12303 Bool)) )
))
(declare-fun lt!414484 () tuple2!22524)

(declare-fun readBitPure!0 (BitStream!12502) tuple2!22524)

(assert (=> b!276298 (= lt!414484 (readBitPure!0 (BitStream!12503 (buf!7312 bs2!19) (currentByte!13523 bs1!11) (currentBit!13518 bs1!11))))))

(declare-fun lt!414485 () tuple2!22524)

(assert (=> b!276298 (= lt!414485 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276298 (invariant!0 (currentBit!13518 bs1!11) (currentByte!13523 bs1!11) (size!6844 (buf!7312 bs2!19)))))

(declare-fun b!276299 () Bool)

(assert (=> b!276299 (= e!196242 (array_inv!6568 (buf!7312 bs2!19)))))

(declare-fun b!276300 () Bool)

(assert (=> b!276300 (= e!196245 e!196244)))

(declare-fun res!229589 () Bool)

(assert (=> b!276300 (=> (not res!229589) (not e!196244))))

(declare-fun arrayBitRangesEq!0 (array!15805 array!15805 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276300 (= res!229589 (arrayBitRangesEq!0 (buf!7312 bs1!11) (buf!7312 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414486))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!276300 (= lt!414486 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6844 (buf!7312 bs1!11)) (currentByte!13523 bs1!11) (currentBit!13518 bs1!11))))))

(assert (= (and start!61474 res!229591) b!276296))

(assert (= (and b!276296 res!229590) b!276300))

(assert (= (and b!276300 res!229589) b!276298))

(assert (= start!61474 b!276297))

(assert (= start!61474 b!276299))

(declare-fun m!409289 () Bool)

(assert (=> b!276297 m!409289))

(declare-fun m!409291 () Bool)

(assert (=> b!276296 m!409291))

(declare-fun m!409293 () Bool)

(assert (=> start!61474 m!409293))

(declare-fun m!409295 () Bool)

(assert (=> start!61474 m!409295))

(declare-fun m!409297 () Bool)

(assert (=> b!276300 m!409297))

(declare-fun m!409299 () Bool)

(assert (=> b!276300 m!409299))

(declare-fun m!409301 () Bool)

(assert (=> b!276299 m!409301))

(declare-fun m!409303 () Bool)

(assert (=> b!276298 m!409303))

(declare-fun m!409305 () Bool)

(assert (=> b!276298 m!409305))

(declare-fun m!409307 () Bool)

(assert (=> b!276298 m!409307))

(push 1)

(assert (not start!61474))

(assert (not b!276296))

(assert (not b!276299))

(assert (not b!276300))

(assert (not b!276298))

(assert (not b!276297))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95146 () Bool)

(assert (=> d!95146 (= (array_inv!6568 (buf!7312 bs2!19)) (bvsge (size!6844 (buf!7312 bs2!19)) #b00000000000000000000000000000000))))

(assert (=> b!276299 d!95146))

(declare-datatypes ((tuple4!522 0))(
  ( (tuple4!523 (_1!12306 (_ BitVec 32)) (_2!12306 (_ BitVec 32)) (_3!1041 (_ BitVec 32)) (_4!261 (_ BitVec 32))) )
))
(declare-fun lt!414521 () tuple4!522)

(declare-fun b!276345 () Bool)

(declare-fun lt!414519 () (_ BitVec 32))

(declare-fun e!196298 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276345 (= e!196298 (byteRangesEq!0 (select (arr!7837 (buf!7312 bs1!11)) (_4!261 lt!414521)) (select (arr!7837 (buf!7312 bs2!19)) (_4!261 lt!414521)) #b00000000000000000000000000000000 lt!414519))))

(declare-fun b!276346 () Bool)

(declare-fun e!196299 () Bool)

(declare-fun call!4439 () Bool)

(assert (=> b!276346 (= e!196299 call!4439)))

(declare-fun c!12624 () Bool)

(declare-fun bm!4436 () Bool)

(declare-fun lt!414520 () (_ BitVec 32))

(assert (=> bm!4436 (= call!4439 (byteRangesEq!0 (select (arr!7837 (buf!7312 bs1!11)) (_3!1041 lt!414521)) (select (arr!7837 (buf!7312 bs2!19)) (_3!1041 lt!414521)) lt!414520 (ite c!12624 lt!414519 #b00000000000000000000000000001000)))))

(declare-fun b!276347 () Bool)

(declare-fun res!229620 () Bool)

(assert (=> b!276347 (= res!229620 (= lt!414519 #b00000000000000000000000000000000))))

(assert (=> b!276347 (=> res!229620 e!196298)))

(declare-fun e!196300 () Bool)

(assert (=> b!276347 (= e!196300 e!196298)))

(declare-fun b!276348 () Bool)

(declare-fun e!196301 () Bool)

(assert (=> b!276348 (= e!196301 e!196299)))

(assert (=> b!276348 (= c!12624 (= (_3!1041 lt!414521) (_4!261 lt!414521)))))

(declare-fun b!276349 () Bool)

(declare-fun e!196296 () Bool)

(assert (=> b!276349 (= e!196296 e!196301)))

(declare-fun res!229623 () Bool)

(assert (=> b!276349 (=> (not res!229623) (not e!196301))))

(declare-fun e!196297 () Bool)

(assert (=> b!276349 (= res!229623 e!196297)))

(declare-fun res!229621 () Bool)

(assert (=> b!276349 (=> res!229621 e!196297)))

(assert (=> b!276349 (= res!229621 (bvsge (_1!12306 lt!414521) (_2!12306 lt!414521)))))

(assert (=> b!276349 (= lt!414519 ((_ extract 31 0) (bvsrem lt!414486 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!276349 (= lt!414520 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!522)

(assert (=> b!276349 (= lt!414521 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!414486))))

(declare-fun d!95148 () Bool)

(declare-fun res!229624 () Bool)

(assert (=> d!95148 (=> res!229624 e!196296)))

(assert (=> d!95148 (= res!229624 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!414486))))

(assert (=> d!95148 (= (arrayBitRangesEq!0 (buf!7312 bs1!11) (buf!7312 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414486) e!196296)))

(declare-fun b!276350 () Bool)

(declare-fun arrayRangesEq!1154 (array!15805 array!15805 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276350 (= e!196297 (arrayRangesEq!1154 (buf!7312 bs1!11) (buf!7312 bs2!19) (_1!12306 lt!414521) (_2!12306 lt!414521)))))

(declare-fun b!276351 () Bool)

(assert (=> b!276351 (= e!196299 e!196300)))

(declare-fun res!229622 () Bool)

(assert (=> b!276351 (= res!229622 call!4439)))

(assert (=> b!276351 (=> (not res!229622) (not e!196300))))

(assert (= (and d!95148 (not res!229624)) b!276349))

(assert (= (and b!276349 (not res!229621)) b!276350))

(assert (= (and b!276349 res!229623) b!276348))

(assert (= (and b!276348 c!12624) b!276346))

(assert (= (and b!276348 (not c!12624)) b!276351))

(assert (= (and b!276351 res!229622) b!276347))

(assert (= (and b!276347 (not res!229620)) b!276345))

(assert (= (or b!276346 b!276351) bm!4436))

(declare-fun m!409363 () Bool)

(assert (=> b!276345 m!409363))

(declare-fun m!409365 () Bool)

(assert (=> b!276345 m!409365))

(assert (=> b!276345 m!409363))

(assert (=> b!276345 m!409365))

(declare-fun m!409367 () Bool)

(assert (=> b!276345 m!409367))

(declare-fun m!409369 () Bool)

(assert (=> bm!4436 m!409369))

(declare-fun m!409371 () Bool)

(assert (=> bm!4436 m!409371))

(assert (=> bm!4436 m!409369))

(assert (=> bm!4436 m!409371))

(declare-fun m!409373 () Bool)

(assert (=> bm!4436 m!409373))

(declare-fun m!409375 () Bool)

(assert (=> b!276349 m!409375))

(declare-fun m!409377 () Bool)

(assert (=> b!276350 m!409377))

(assert (=> b!276300 d!95148))

(declare-fun d!95178 () Bool)

(declare-fun e!196322 () Bool)

(assert (=> d!95178 e!196322))

(declare-fun res!229645 () Bool)

(assert (=> d!95178 (=> (not res!229645) (not e!196322))))

(declare-fun lt!414547 () (_ BitVec 64))

(declare-fun lt!414545 () (_ BitVec 64))

(declare-fun lt!414546 () (_ BitVec 64))

(assert (=> d!95178 (= res!229645 (= lt!414545 (bvsub lt!414546 lt!414547)))))

(assert (=> d!95178 (or (= (bvand lt!414546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414547 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!414546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!414546 lt!414547) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!95178 (= lt!414547 (remainingBits!0 ((_ sign_extend 32) (size!6844 (buf!7312 bs1!11))) ((_ sign_extend 32) (currentByte!13523 bs1!11)) ((_ sign_extend 32) (currentBit!13518 bs1!11))))))

(declare-fun lt!414548 () (_ BitVec 64))

(declare-fun lt!414543 () (_ BitVec 64))

(assert (=> d!95178 (= lt!414546 (bvmul lt!414548 lt!414543))))

(assert (=> d!95178 (or (= lt!414548 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!414543 (bvsdiv (bvmul lt!414548 lt!414543) lt!414548)))))

(assert (=> d!95178 (= lt!414543 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!95178 (= lt!414548 ((_ sign_extend 32) (size!6844 (buf!7312 bs1!11))))))

(assert (=> d!95178 (= lt!414545 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13523 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13518 bs1!11))))))

(assert (=> d!95178 (invariant!0 (currentBit!13518 bs1!11) (currentByte!13523 bs1!11) (size!6844 (buf!7312 bs1!11)))))

(assert (=> d!95178 (= (bitIndex!0 (size!6844 (buf!7312 bs1!11)) (currentByte!13523 bs1!11) (currentBit!13518 bs1!11)) lt!414545)))

(declare-fun b!276377 () Bool)

(declare-fun res!229644 () Bool)

(assert (=> b!276377 (=> (not res!229644) (not e!196322))))

(assert (=> b!276377 (= res!229644 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!414545))))

(declare-fun b!276378 () Bool)

(declare-fun lt!414544 () (_ BitVec 64))

(assert (=> b!276378 (= e!196322 (bvsle lt!414545 (bvmul lt!414544 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!276378 (or (= lt!414544 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!414544 #b0000000000000000000000000000000000000000000000000000000000001000) lt!414544)))))

(assert (=> b!276378 (= lt!414544 ((_ sign_extend 32) (size!6844 (buf!7312 bs1!11))))))

(assert (= (and d!95178 res!229645) b!276377))

(assert (= (and b!276377 res!229644) b!276378))

(declare-fun m!409397 () Bool)

(assert (=> d!95178 m!409397))

(declare-fun m!409399 () Bool)

(assert (=> d!95178 m!409399))

(assert (=> b!276300 d!95178))

(declare-fun d!95186 () Bool)

(assert (=> d!95186 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6844 (buf!7312 bs1!11))) ((_ sign_extend 32) (currentByte!13523 bs1!11)) ((_ sign_extend 32) (currentBit!13518 bs1!11))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6844 (buf!7312 bs1!11))) ((_ sign_extend 32) (currentByte!13523 bs1!11)) ((_ sign_extend 32) (currentBit!13518 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!23999 () Bool)

(assert (= bs!23999 d!95186))

(assert (=> bs!23999 m!409397))

(assert (=> b!276296 d!95186))

(declare-fun d!95188 () Bool)

(assert (=> d!95188 (= (array_inv!6568 (buf!7312 bs1!11)) (bvsge (size!6844 (buf!7312 bs1!11)) #b00000000000000000000000000000000))))

(assert (=> b!276297 d!95188))

(declare-fun d!95190 () Bool)

(assert (=> d!95190 (= (inv!12 bs1!11) (invariant!0 (currentBit!13518 bs1!11) (currentByte!13523 bs1!11) (size!6844 (buf!7312 bs1!11))))))

(declare-fun bs!24000 () Bool)

(assert (= bs!24000 d!95190))

(assert (=> bs!24000 m!409399))

(assert (=> start!61474 d!95190))

(declare-fun d!95192 () Bool)

(assert (=> d!95192 (= (inv!12 bs2!19) (invariant!0 (currentBit!13518 bs2!19) (currentByte!13523 bs2!19) (size!6844 (buf!7312 bs2!19))))))

(declare-fun bs!24001 () Bool)

(assert (= bs!24001 d!95192))

(declare-fun m!409401 () Bool)

(assert (=> bs!24001 m!409401))

(assert (=> start!61474 d!95192))

(declare-fun d!95194 () Bool)

(declare-datatypes ((tuple2!22532 0))(
  ( (tuple2!22533 (_1!12309 Bool) (_2!12309 BitStream!12502)) )
))
(declare-fun lt!414551 () tuple2!22532)

(declare-fun readBit!0 (BitStream!12502) tuple2!22532)

(assert (=> d!95194 (= lt!414551 (readBit!0 (BitStream!12503 (buf!7312 bs2!19) (currentByte!13523 bs1!11) (currentBit!13518 bs1!11))))))

(assert (=> d!95194 (= (readBitPure!0 (BitStream!12503 (buf!7312 bs2!19) (currentByte!13523 bs1!11) (currentBit!13518 bs1!11))) (tuple2!22525 (_2!12309 lt!414551) (_1!12309 lt!414551)))))

(declare-fun bs!24002 () Bool)

(assert (= bs!24002 d!95194))

(declare-fun m!409403 () Bool)

(assert (=> bs!24002 m!409403))

(assert (=> b!276298 d!95194))

(declare-fun d!95196 () Bool)

(declare-fun lt!414552 () tuple2!22532)

(assert (=> d!95196 (= lt!414552 (readBit!0 bs1!11))))

(assert (=> d!95196 (= (readBitPure!0 bs1!11) (tuple2!22525 (_2!12309 lt!414552) (_1!12309 lt!414552)))))

(declare-fun bs!24003 () Bool)

(assert (= bs!24003 d!95196))

(declare-fun m!409405 () Bool)

(assert (=> bs!24003 m!409405))

(assert (=> b!276298 d!95196))

(declare-fun d!95198 () Bool)

(assert (=> d!95198 (= (invariant!0 (currentBit!13518 bs1!11) (currentByte!13523 bs1!11) (size!6844 (buf!7312 bs2!19))) (and (bvsge (currentBit!13518 bs1!11) #b00000000000000000000000000000000) (bvslt (currentBit!13518 bs1!11) #b00000000000000000000000000001000) (bvsge (currentByte!13523 bs1!11) #b00000000000000000000000000000000) (or (bvslt (currentByte!13523 bs1!11) (size!6844 (buf!7312 bs2!19))) (and (= (currentBit!13518 bs1!11) #b00000000000000000000000000000000) (= (currentByte!13523 bs1!11) (size!6844 (buf!7312 bs2!19)))))))))

(assert (=> b!276298 d!95198))

(push 1)

(assert (not d!95186))

(assert (not d!95196))

(assert (not b!276350))

(assert (not d!95190))

(assert (not b!276345))

(assert (not d!95194))

(assert (not d!95192))

(assert (not b!276349))

(assert (not bm!4436))

(assert (not d!95178))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

