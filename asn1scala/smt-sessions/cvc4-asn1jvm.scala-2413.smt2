; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61478 () Bool)

(assert start!61478)

(declare-fun b!276326 () Bool)

(declare-fun e!196282 () Bool)

(declare-fun lt!414504 () (_ BitVec 64))

(assert (=> b!276326 (= e!196282 (not (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!414504)))))

(declare-datatypes ((array!15809 0))(
  ( (array!15810 (arr!7839 (Array (_ BitVec 32) (_ BitVec 8))) (size!6846 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12506 0))(
  ( (BitStream!12507 (buf!7314 array!15809) (currentByte!13525 (_ BitVec 32)) (currentBit!13520 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22528 0))(
  ( (tuple2!22529 (_1!12305 BitStream!12506) (_2!12305 Bool)) )
))
(declare-fun lt!414502 () tuple2!22528)

(declare-fun bs2!19 () BitStream!12506)

(declare-fun bs1!11 () BitStream!12506)

(declare-fun readBitPure!0 (BitStream!12506) tuple2!22528)

(assert (=> b!276326 (= lt!414502 (readBitPure!0 (BitStream!12507 (buf!7314 bs2!19) (currentByte!13525 bs1!11) (currentBit!13520 bs1!11))))))

(declare-fun lt!414503 () tuple2!22528)

(assert (=> b!276326 (= lt!414503 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276326 (invariant!0 (currentBit!13520 bs1!11) (currentByte!13525 bs1!11) (size!6846 (buf!7314 bs2!19)))))

(declare-fun b!276328 () Bool)

(declare-fun e!196281 () Bool)

(declare-fun array_inv!6570 (array!15809) Bool)

(assert (=> b!276328 (= e!196281 (array_inv!6570 (buf!7314 bs1!11)))))

(declare-fun b!276329 () Bool)

(declare-fun res!229607 () Bool)

(declare-fun e!196283 () Bool)

(assert (=> b!276329 (=> (not res!229607) (not e!196283))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276329 (= res!229607 (validate_offset_bit!0 ((_ sign_extend 32) (size!6846 (buf!7314 bs1!11))) ((_ sign_extend 32) (currentByte!13525 bs1!11)) ((_ sign_extend 32) (currentBit!13520 bs1!11))))))

(declare-fun b!276330 () Bool)

(assert (=> b!276330 (= e!196283 e!196282)))

(declare-fun res!229609 () Bool)

(assert (=> b!276330 (=> (not res!229609) (not e!196282))))

(declare-fun arrayBitRangesEq!0 (array!15809 array!15809 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276330 (= res!229609 (arrayBitRangesEq!0 (buf!7314 bs1!11) (buf!7314 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414504))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!276330 (= lt!414504 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6846 (buf!7314 bs1!11)) (currentByte!13525 bs1!11) (currentBit!13520 bs1!11))))))

(declare-fun res!229608 () Bool)

(assert (=> start!61478 (=> (not res!229608) (not e!196283))))

(assert (=> start!61478 (= res!229608 (= (size!6846 (buf!7314 bs1!11)) (size!6846 (buf!7314 bs2!19))))))

(assert (=> start!61478 e!196283))

(declare-fun inv!12 (BitStream!12506) Bool)

(assert (=> start!61478 (and (inv!12 bs1!11) e!196281)))

(declare-fun e!196280 () Bool)

(assert (=> start!61478 (and (inv!12 bs2!19) e!196280)))

(declare-fun b!276327 () Bool)

(assert (=> b!276327 (= e!196280 (array_inv!6570 (buf!7314 bs2!19)))))

(assert (= (and start!61478 res!229608) b!276329))

(assert (= (and b!276329 res!229607) b!276330))

(assert (= (and b!276330 res!229609) b!276326))

(assert (= start!61478 b!276328))

(assert (= start!61478 b!276327))

(declare-fun m!409329 () Bool)

(assert (=> start!61478 m!409329))

(declare-fun m!409331 () Bool)

(assert (=> start!61478 m!409331))

(declare-fun m!409333 () Bool)

(assert (=> b!276328 m!409333))

(declare-fun m!409335 () Bool)

(assert (=> b!276326 m!409335))

(declare-fun m!409337 () Bool)

(assert (=> b!276326 m!409337))

(declare-fun m!409339 () Bool)

(assert (=> b!276326 m!409339))

(declare-fun m!409341 () Bool)

(assert (=> b!276327 m!409341))

(declare-fun m!409343 () Bool)

(assert (=> b!276330 m!409343))

(declare-fun m!409345 () Bool)

(assert (=> b!276330 m!409345))

(declare-fun m!409347 () Bool)

(assert (=> b!276329 m!409347))

(push 1)

(assert (not b!276329))

(assert (not start!61478))

(assert (not b!276326))

(assert (not b!276330))

(assert (not b!276327))

(assert (not b!276328))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95150 () Bool)

(declare-datatypes ((tuple2!22530 0))(
  ( (tuple2!22531 (_1!12307 Bool) (_2!12307 BitStream!12506)) )
))
(declare-fun lt!414507 () tuple2!22530)

(declare-fun readBit!0 (BitStream!12506) tuple2!22530)

(assert (=> d!95150 (= lt!414507 (readBit!0 (BitStream!12507 (buf!7314 bs2!19) (currentByte!13525 bs1!11) (currentBit!13520 bs1!11))))))

(assert (=> d!95150 (= (readBitPure!0 (BitStream!12507 (buf!7314 bs2!19) (currentByte!13525 bs1!11) (currentBit!13520 bs1!11))) (tuple2!22529 (_2!12307 lt!414507) (_1!12307 lt!414507)))))

(declare-fun bs!23991 () Bool)

(assert (= bs!23991 d!95150))

(declare-fun m!409349 () Bool)

(assert (=> bs!23991 m!409349))

(assert (=> b!276326 d!95150))

(declare-fun d!95154 () Bool)

(declare-fun lt!414508 () tuple2!22530)

(assert (=> d!95154 (= lt!414508 (readBit!0 bs1!11))))

(assert (=> d!95154 (= (readBitPure!0 bs1!11) (tuple2!22529 (_2!12307 lt!414508) (_1!12307 lt!414508)))))

(declare-fun bs!23992 () Bool)

(assert (= bs!23992 d!95154))

(declare-fun m!409351 () Bool)

(assert (=> bs!23992 m!409351))

(assert (=> b!276326 d!95154))

(declare-fun d!95156 () Bool)

(assert (=> d!95156 (= (invariant!0 (currentBit!13520 bs1!11) (currentByte!13525 bs1!11) (size!6846 (buf!7314 bs2!19))) (and (bvsge (currentBit!13520 bs1!11) #b00000000000000000000000000000000) (bvslt (currentBit!13520 bs1!11) #b00000000000000000000000000001000) (bvsge (currentByte!13525 bs1!11) #b00000000000000000000000000000000) (or (bvslt (currentByte!13525 bs1!11) (size!6846 (buf!7314 bs2!19))) (and (= (currentBit!13520 bs1!11) #b00000000000000000000000000000000) (= (currentByte!13525 bs1!11) (size!6846 (buf!7314 bs2!19)))))))))

(assert (=> b!276326 d!95156))

(declare-fun d!95158 () Bool)

(assert (=> d!95158 (= (inv!12 bs1!11) (invariant!0 (currentBit!13520 bs1!11) (currentByte!13525 bs1!11) (size!6846 (buf!7314 bs1!11))))))

(declare-fun bs!23993 () Bool)

(assert (= bs!23993 d!95158))

(declare-fun m!409353 () Bool)

(assert (=> bs!23993 m!409353))

(assert (=> start!61478 d!95158))

(declare-fun d!95160 () Bool)

(assert (=> d!95160 (= (inv!12 bs2!19) (invariant!0 (currentBit!13520 bs2!19) (currentByte!13525 bs2!19) (size!6846 (buf!7314 bs2!19))))))

(declare-fun bs!23994 () Bool)

(assert (= bs!23994 d!95160))

(declare-fun m!409355 () Bool)

(assert (=> bs!23994 m!409355))

(assert (=> start!61478 d!95160))

(declare-fun d!95162 () Bool)

(assert (=> d!95162 (= (array_inv!6570 (buf!7314 bs2!19)) (bvsge (size!6846 (buf!7314 bs2!19)) #b00000000000000000000000000000000))))

(assert (=> b!276327 d!95162))

(declare-fun d!95164 () Bool)

(assert (=> d!95164 (= (array_inv!6570 (buf!7314 bs1!11)) (bvsge (size!6846 (buf!7314 bs1!11)) #b00000000000000000000000000000000))))

(assert (=> b!276328 d!95164))

(declare-fun d!95166 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!95166 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6846 (buf!7314 bs1!11))) ((_ sign_extend 32) (currentByte!13525 bs1!11)) ((_ sign_extend 32) (currentBit!13520 bs1!11))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6846 (buf!7314 bs1!11))) ((_ sign_extend 32) (currentByte!13525 bs1!11)) ((_ sign_extend 32) (currentBit!13520 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!23995 () Bool)

(assert (= bs!23995 d!95166))

(declare-fun m!409357 () Bool)

(assert (=> bs!23995 m!409357))

(assert (=> b!276329 d!95166))

(declare-fun lt!414542 () (_ BitVec 32))

(declare-fun bm!4439 () Bool)

(declare-fun c!12627 () Bool)

(declare-datatypes ((tuple4!524 0))(
  ( (tuple4!525 (_1!12308 (_ BitVec 32)) (_2!12308 (_ BitVec 32)) (_3!1042 (_ BitVec 32)) (_4!262 (_ BitVec 32))) )
))
(declare-fun lt!414540 () tuple4!524)

(declare-fun call!4442 () Bool)

(declare-fun lt!414541 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4439 (= call!4442 (byteRangesEq!0 (select (arr!7839 (buf!7314 bs1!11)) (_3!1042 lt!414540)) (select (arr!7839 (buf!7314 bs2!19)) (_3!1042 lt!414540)) lt!414542 (ite c!12627 lt!414541 #b00000000000000000000000000001000)))))

(declare-fun b!276370 () Bool)

(declare-fun e!196319 () Bool)

(declare-fun e!196316 () Bool)

(assert (=> b!276370 (= e!196319 e!196316)))

(declare-fun res!229641 () Bool)

(assert (=> b!276370 (= res!229641 call!4442)))

(assert (=> b!276370 (=> (not res!229641) (not e!196316))))

(declare-fun e!196321 () Bool)

(declare-fun b!276371 () Bool)

(assert (=> b!276371 (= e!196321 (byteRangesEq!0 (select (arr!7839 (buf!7314 bs1!11)) (_4!262 lt!414540)) (select (arr!7839 (buf!7314 bs2!19)) (_4!262 lt!414540)) #b00000000000000000000000000000000 lt!414541))))

(declare-fun b!276372 () Bool)

(declare-fun e!196320 () Bool)

(assert (=> b!276372 (= e!196320 e!196319)))

(assert (=> b!276372 (= c!12627 (= (_3!1042 lt!414540) (_4!262 lt!414540)))))

(declare-fun b!276373 () Bool)

(declare-fun e!196317 () Bool)

(assert (=> b!276373 (= e!196317 e!196320)))

(declare-fun res!229640 () Bool)

(assert (=> b!276373 (=> (not res!229640) (not e!196320))))

(declare-fun e!196318 () Bool)

(assert (=> b!276373 (= res!229640 e!196318)))

(declare-fun res!229642 () Bool)

(assert (=> b!276373 (=> res!229642 e!196318)))

(assert (=> b!276373 (= res!229642 (bvsge (_1!12308 lt!414540) (_2!12308 lt!414540)))))

(assert (=> b!276373 (= lt!414541 ((_ extract 31 0) (bvsrem lt!414504 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!276373 (= lt!414542 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!524)

(assert (=> b!276373 (= lt!414540 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!414504))))

(declare-fun b!276374 () Bool)

(assert (=> b!276374 (= e!196319 call!4442)))

(declare-fun b!276375 () Bool)

(declare-fun arrayRangesEq!1155 (array!15809 array!15809 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276375 (= e!196318 (arrayRangesEq!1155 (buf!7314 bs1!11) (buf!7314 bs2!19) (_1!12308 lt!414540) (_2!12308 lt!414540)))))

(declare-fun d!95168 () Bool)

(declare-fun res!229639 () Bool)

(assert (=> d!95168 (=> res!229639 e!196317)))

(assert (=> d!95168 (= res!229639 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!414504))))

(assert (=> d!95168 (= (arrayBitRangesEq!0 (buf!7314 bs1!11) (buf!7314 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414504) e!196317)))

(declare-fun b!276376 () Bool)

(declare-fun res!229643 () Bool)

(assert (=> b!276376 (= res!229643 (= lt!414541 #b00000000000000000000000000000000))))

(assert (=> b!276376 (=> res!229643 e!196321)))

(assert (=> b!276376 (= e!196316 e!196321)))

(assert (= (and d!95168 (not res!229639)) b!276373))

(assert (= (and b!276373 (not res!229642)) b!276375))

(assert (= (and b!276373 res!229640) b!276372))

(assert (= (and b!276372 c!12627) b!276374))

(assert (= (and b!276372 (not c!12627)) b!276370))

(assert (= (and b!276370 res!229641) b!276376))

(assert (= (and b!276376 (not res!229643)) b!276371))

(assert (= (or b!276374 b!276370) bm!4439))

(declare-fun m!409381 () Bool)

(assert (=> bm!4439 m!409381))

(declare-fun m!409383 () Bool)

(assert (=> bm!4439 m!409383))

(assert (=> bm!4439 m!409381))

(assert (=> bm!4439 m!409383))

(declare-fun m!409385 () Bool)

(assert (=> bm!4439 m!409385))

(declare-fun m!409387 () Bool)

(assert (=> b!276371 m!409387))

(declare-fun m!409389 () Bool)

(assert (=> b!276371 m!409389))

(assert (=> b!276371 m!409387))

(assert (=> b!276371 m!409389))

(declare-fun m!409391 () Bool)

(assert (=> b!276371 m!409391))

(declare-fun m!409393 () Bool)

(assert (=> b!276373 m!409393))

(declare-fun m!409395 () Bool)

(assert (=> b!276375 m!409395))

(assert (=> b!276330 d!95168))

(declare-fun d!95184 () Bool)

(declare-fun e!196337 () Bool)

(assert (=> d!95184 e!196337))

(declare-fun res!229661 () Bool)

(assert (=> d!95184 (=> (not res!229661) (not e!196337))))

(declare-fun lt!414576 () (_ BitVec 64))

(declare-fun lt!414572 () (_ BitVec 64))

(declare-fun lt!414574 () (_ BitVec 64))

(assert (=> d!95184 (= res!229661 (= lt!414576 (bvsub lt!414574 lt!414572)))))

(assert (=> d!95184 (or (= (bvand lt!414574 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414572 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!414574 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!414574 lt!414572) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!95184 (= lt!414572 (remainingBits!0 ((_ sign_extend 32) (size!6846 (buf!7314 bs1!11))) ((_ sign_extend 32) (currentByte!13525 bs1!11)) ((_ sign_extend 32) (currentBit!13520 bs1!11))))))

(declare-fun lt!414575 () (_ BitVec 64))

(declare-fun lt!414573 () (_ BitVec 64))

(assert (=> d!95184 (= lt!414574 (bvmul lt!414575 lt!414573))))

(assert (=> d!95184 (or (= lt!414575 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!414573 (bvsdiv (bvmul lt!414575 lt!414573) lt!414575)))))

(assert (=> d!95184 (= lt!414573 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!95184 (= lt!414575 ((_ sign_extend 32) (size!6846 (buf!7314 bs1!11))))))

(assert (=> d!95184 (= lt!414576 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13525 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13520 bs1!11))))))

(assert (=> d!95184 (invariant!0 (currentBit!13520 bs1!11) (currentByte!13525 bs1!11) (size!6846 (buf!7314 bs1!11)))))

(assert (=> d!95184 (= (bitIndex!0 (size!6846 (buf!7314 bs1!11)) (currentByte!13525 bs1!11) (currentBit!13520 bs1!11)) lt!414576)))

(declare-fun b!276397 () Bool)

(declare-fun res!229660 () Bool)

(assert (=> b!276397 (=> (not res!229660) (not e!196337))))

(assert (=> b!276397 (= res!229660 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!414576))))

(declare-fun b!276398 () Bool)

(declare-fun lt!414571 () (_ BitVec 64))

(assert (=> b!276398 (= e!196337 (bvsle lt!414576 (bvmul lt!414571 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!276398 (or (= lt!414571 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!414571 #b0000000000000000000000000000000000000000000000000000000000001000) lt!414571)))))

(assert (=> b!276398 (= lt!414571 ((_ sign_extend 32) (size!6846 (buf!7314 bs1!11))))))

(assert (= (and d!95184 res!229661) b!276397))

(assert (= (and b!276397 res!229660) b!276398))

(assert (=> d!95184 m!409357))

(assert (=> d!95184 m!409353))

(assert (=> b!276330 d!95184))

(push 1)

(assert (not b!276375))

(assert (not d!95184))

(assert (not b!276371))

(assert (not d!95166))

(assert (not b!276373))

(assert (not d!95158))

(assert (not d!95160))

(assert (not d!95150))

(assert (not bm!4439))

(assert (not d!95154))

(check-sat)

(pop 1)

(push 1)

(check-sat)

