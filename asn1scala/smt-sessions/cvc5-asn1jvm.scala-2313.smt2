; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58674 () Bool)

(assert start!58674)

(declare-fun b!269367 () Bool)

(declare-fun e!189313 () Bool)

(declare-datatypes ((array!15017 0))(
  ( (array!15018 (arr!7531 (Array (_ BitVec 32) (_ BitVec 8))) (size!6544 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11902 0))(
  ( (BitStream!11903 (buf!7012 array!15017) (currentByte!12954 (_ BitVec 32)) (currentBit!12949 (_ BitVec 32))) )
))
(declare-fun w3!25 () BitStream!11902)

(declare-fun array_inv!6268 (array!15017) Bool)

(assert (=> b!269367 (= e!189313 (array_inv!6268 (buf!7012 w3!25)))))

(declare-fun b!269368 () Bool)

(declare-fun e!189312 () Bool)

(declare-fun w1!591 () BitStream!11902)

(assert (=> b!269368 (= e!189312 (array_inv!6268 (buf!7012 w1!591)))))

(declare-fun res!224549 () Bool)

(declare-fun e!189310 () Bool)

(assert (=> start!58674 (=> (not res!224549) (not e!189310))))

(declare-fun w2!587 () BitStream!11902)

(declare-fun isPrefixOf!0 (BitStream!11902 BitStream!11902) Bool)

(assert (=> start!58674 (= res!224549 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58674 e!189310))

(declare-fun inv!12 (BitStream!11902) Bool)

(assert (=> start!58674 (and (inv!12 w1!591) e!189312)))

(declare-fun e!189314 () Bool)

(assert (=> start!58674 (and (inv!12 w2!587) e!189314)))

(assert (=> start!58674 (and (inv!12 w3!25) e!189313)))

(declare-fun b!269369 () Bool)

(assert (=> b!269369 (= e!189314 (array_inv!6268 (buf!7012 w2!587)))))

(declare-fun b!269370 () Bool)

(declare-fun res!224550 () Bool)

(assert (=> b!269370 (=> (not res!224550) (not e!189310))))

(assert (=> b!269370 (= res!224550 (and (bvsle #b00000000000000000000000000000000 (currentByte!12954 w1!591)) (bvsle (currentByte!12954 w1!591) (currentByte!12954 w2!587)) (bvsle (size!6544 (buf!7012 w1!591)) (size!6544 (buf!7012 w2!587))) (bvsle (size!6544 (buf!7012 w2!587)) (size!6544 (buf!7012 w3!25))) (bvsle (currentByte!12954 w1!591) (size!6544 (buf!7012 w1!591))) (bvsle (currentByte!12954 w2!587) (size!6544 (buf!7012 w2!587)))))))

(declare-fun b!269371 () Bool)

(declare-fun arrayRangesEq!1076 (array!15017 array!15017 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!269371 (= e!189310 (not (arrayRangesEq!1076 (buf!7012 w1!591) (buf!7012 w2!587) #b00000000000000000000000000000000 (currentByte!12954 w1!591))))))

(declare-fun b!269372 () Bool)

(declare-fun res!224551 () Bool)

(assert (=> b!269372 (=> (not res!224551) (not e!189310))))

(assert (=> b!269372 (= res!224551 (isPrefixOf!0 w2!587 w3!25))))

(assert (= (and start!58674 res!224549) b!269372))

(assert (= (and b!269372 res!224551) b!269370))

(assert (= (and b!269370 res!224550) b!269371))

(assert (= start!58674 b!269368))

(assert (= start!58674 b!269369))

(assert (= start!58674 b!269367))

(declare-fun m!400937 () Bool)

(assert (=> start!58674 m!400937))

(declare-fun m!400939 () Bool)

(assert (=> start!58674 m!400939))

(declare-fun m!400941 () Bool)

(assert (=> start!58674 m!400941))

(declare-fun m!400943 () Bool)

(assert (=> start!58674 m!400943))

(declare-fun m!400945 () Bool)

(assert (=> b!269372 m!400945))

(declare-fun m!400947 () Bool)

(assert (=> b!269369 m!400947))

(declare-fun m!400949 () Bool)

(assert (=> b!269367 m!400949))

(declare-fun m!400951 () Bool)

(assert (=> b!269371 m!400951))

(declare-fun m!400953 () Bool)

(assert (=> b!269368 m!400953))

(push 1)

(assert (not start!58674))

(assert (not b!269368))

(assert (not b!269369))

(assert (not b!269371))

(assert (not b!269372))

(assert (not b!269367))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!91194 () Bool)

(declare-fun res!224592 () Bool)

(declare-fun e!189375 () Bool)

(assert (=> d!91194 (=> (not res!224592) (not e!189375))))

(assert (=> d!91194 (= res!224592 (= (size!6544 (buf!7012 w1!591)) (size!6544 (buf!7012 w2!587))))))

(assert (=> d!91194 (= (isPrefixOf!0 w1!591 w2!587) e!189375)))

(declare-fun b!269431 () Bool)

(declare-fun res!224593 () Bool)

(assert (=> b!269431 (=> (not res!224593) (not e!189375))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!269431 (= res!224593 (bvsle (bitIndex!0 (size!6544 (buf!7012 w1!591)) (currentByte!12954 w1!591) (currentBit!12949 w1!591)) (bitIndex!0 (size!6544 (buf!7012 w2!587)) (currentByte!12954 w2!587) (currentBit!12949 w2!587))))))

(declare-fun b!269432 () Bool)

(declare-fun e!189374 () Bool)

(assert (=> b!269432 (= e!189375 e!189374)))

(declare-fun res!224594 () Bool)

(assert (=> b!269432 (=> res!224594 e!189374)))

(assert (=> b!269432 (= res!224594 (= (size!6544 (buf!7012 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!269433 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15017 array!15017 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!269433 (= e!189374 (arrayBitRangesEq!0 (buf!7012 w1!591) (buf!7012 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6544 (buf!7012 w1!591)) (currentByte!12954 w1!591) (currentBit!12949 w1!591))))))

(assert (= (and d!91194 res!224592) b!269431))

(assert (= (and b!269431 res!224593) b!269432))

(assert (= (and b!269432 (not res!224594)) b!269433))

(declare-fun m!401007 () Bool)

(assert (=> b!269431 m!401007))

(declare-fun m!401009 () Bool)

(assert (=> b!269431 m!401009))

(assert (=> b!269433 m!401007))

(assert (=> b!269433 m!401007))

(declare-fun m!401011 () Bool)

(assert (=> b!269433 m!401011))

(assert (=> start!58674 d!91194))

(declare-fun d!91208 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!91208 (= (inv!12 w1!591) (invariant!0 (currentBit!12949 w1!591) (currentByte!12954 w1!591) (size!6544 (buf!7012 w1!591))))))

(declare-fun bs!23109 () Bool)

(assert (= bs!23109 d!91208))

(declare-fun m!401019 () Bool)

(assert (=> bs!23109 m!401019))

(assert (=> start!58674 d!91208))

(declare-fun d!91210 () Bool)

(assert (=> d!91210 (= (inv!12 w2!587) (invariant!0 (currentBit!12949 w2!587) (currentByte!12954 w2!587) (size!6544 (buf!7012 w2!587))))))

(declare-fun bs!23110 () Bool)

(assert (= bs!23110 d!91210))

(declare-fun m!401021 () Bool)

(assert (=> bs!23110 m!401021))

(assert (=> start!58674 d!91210))

(declare-fun d!91212 () Bool)

(assert (=> d!91212 (= (inv!12 w3!25) (invariant!0 (currentBit!12949 w3!25) (currentByte!12954 w3!25) (size!6544 (buf!7012 w3!25))))))

(declare-fun bs!23111 () Bool)

(assert (= bs!23111 d!91212))

(declare-fun m!401023 () Bool)

(assert (=> bs!23111 m!401023))

(assert (=> start!58674 d!91212))

(declare-fun d!91214 () Bool)

(declare-fun res!224597 () Bool)

(declare-fun e!189379 () Bool)

(assert (=> d!91214 (=> (not res!224597) (not e!189379))))

(assert (=> d!91214 (= res!224597 (= (size!6544 (buf!7012 w2!587)) (size!6544 (buf!7012 w3!25))))))

(assert (=> d!91214 (= (isPrefixOf!0 w2!587 w3!25) e!189379)))

(declare-fun b!269436 () Bool)

(declare-fun res!224598 () Bool)

(assert (=> b!269436 (=> (not res!224598) (not e!189379))))

(assert (=> b!269436 (= res!224598 (bvsle (bitIndex!0 (size!6544 (buf!7012 w2!587)) (currentByte!12954 w2!587) (currentBit!12949 w2!587)) (bitIndex!0 (size!6544 (buf!7012 w3!25)) (currentByte!12954 w3!25) (currentBit!12949 w3!25))))))

(declare-fun b!269437 () Bool)

(declare-fun e!189378 () Bool)

(assert (=> b!269437 (= e!189379 e!189378)))

(declare-fun res!224599 () Bool)

(assert (=> b!269437 (=> res!224599 e!189378)))

(assert (=> b!269437 (= res!224599 (= (size!6544 (buf!7012 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!269438 () Bool)

(assert (=> b!269438 (= e!189378 (arrayBitRangesEq!0 (buf!7012 w2!587) (buf!7012 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6544 (buf!7012 w2!587)) (currentByte!12954 w2!587) (currentBit!12949 w2!587))))))

(assert (= (and d!91214 res!224597) b!269436))

(assert (= (and b!269436 res!224598) b!269437))

(assert (= (and b!269437 (not res!224599)) b!269438))

(assert (=> b!269436 m!401009))

(declare-fun m!401025 () Bool)

(assert (=> b!269436 m!401025))

(assert (=> b!269438 m!401009))

(assert (=> b!269438 m!401009))

(declare-fun m!401027 () Bool)

(assert (=> b!269438 m!401027))

(assert (=> b!269372 d!91214))

(declare-fun d!91216 () Bool)

(declare-fun res!224604 () Bool)

(declare-fun e!189384 () Bool)

(assert (=> d!91216 (=> res!224604 e!189384)))

(assert (=> d!91216 (= res!224604 (= #b00000000000000000000000000000000 (currentByte!12954 w1!591)))))

(assert (=> d!91216 (= (arrayRangesEq!1076 (buf!7012 w1!591) (buf!7012 w2!587) #b00000000000000000000000000000000 (currentByte!12954 w1!591)) e!189384)))

(declare-fun b!269443 () Bool)

(declare-fun e!189385 () Bool)

(assert (=> b!269443 (= e!189384 e!189385)))

(declare-fun res!224605 () Bool)

(assert (=> b!269443 (=> (not res!224605) (not e!189385))))

(assert (=> b!269443 (= res!224605 (= (select (arr!7531 (buf!7012 w1!591)) #b00000000000000000000000000000000) (select (arr!7531 (buf!7012 w2!587)) #b00000000000000000000000000000000)))))

(declare-fun b!269444 () Bool)

(assert (=> b!269444 (= e!189385 (arrayRangesEq!1076 (buf!7012 w1!591) (buf!7012 w2!587) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12954 w1!591)))))

(assert (= (and d!91216 (not res!224604)) b!269443))

(assert (= (and b!269443 res!224605) b!269444))

(declare-fun m!401029 () Bool)

(assert (=> b!269443 m!401029))

(declare-fun m!401031 () Bool)

(assert (=> b!269443 m!401031))

(declare-fun m!401033 () Bool)

(assert (=> b!269444 m!401033))

(assert (=> b!269371 d!91216))

(declare-fun d!91220 () Bool)

(assert (=> d!91220 (= (array_inv!6268 (buf!7012 w1!591)) (bvsge (size!6544 (buf!7012 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!269368 d!91220))

(declare-fun d!91222 () Bool)

(assert (=> d!91222 (= (array_inv!6268 (buf!7012 w3!25)) (bvsge (size!6544 (buf!7012 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!269367 d!91222))

(declare-fun d!91224 () Bool)

(assert (=> d!91224 (= (array_inv!6268 (buf!7012 w2!587)) (bvsge (size!6544 (buf!7012 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!269369 d!91224))

(push 1)

(assert (not b!269433))

(assert (not d!91212))

(assert (not b!269444))

(assert (not d!91210))

(assert (not b!269438))

(assert (not b!269431))

(assert (not b!269436))

(assert (not d!91208))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!269498 () Bool)

(declare-fun e!189435 () Bool)

(declare-fun e!189433 () Bool)

(assert (=> b!269498 (= e!189435 e!189433)))

(declare-fun c!12438 () Bool)

(declare-datatypes ((tuple4!440 0))(
  ( (tuple4!441 (_1!12203 (_ BitVec 32)) (_2!12203 (_ BitVec 32)) (_3!1000 (_ BitVec 32)) (_4!220 (_ BitVec 32))) )
))
(declare-fun lt!409000 () tuple4!440)

(assert (=> b!269498 (= c!12438 (= (_3!1000 lt!409000) (_4!220 lt!409000)))))

(declare-fun b!269499 () Bool)

(declare-fun e!189434 () Bool)

(assert (=> b!269499 (= e!189433 e!189434)))

(declare-fun res!224649 () Bool)

(declare-fun lt!409001 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!269499 (= res!224649 (byteRangesEq!0 (select (arr!7531 (buf!7012 w1!591)) (_3!1000 lt!409000)) (select (arr!7531 (buf!7012 w2!587)) (_3!1000 lt!409000)) lt!409001 #b00000000000000000000000000001000))))

(assert (=> b!269499 (=> (not res!224649) (not e!189434))))

(declare-fun b!269500 () Bool)

(declare-fun e!189432 () Bool)

(declare-fun call!4289 () Bool)

(assert (=> b!269500 (= e!189432 call!4289)))

(declare-fun b!269501 () Bool)

(declare-fun e!189430 () Bool)

(assert (=> b!269501 (= e!189430 (arrayRangesEq!1076 (buf!7012 w1!591) (buf!7012 w2!587) (_1!12203 lt!409000) (_2!12203 lt!409000)))))

(declare-fun b!269503 () Bool)

(declare-fun e!189431 () Bool)

(assert (=> b!269503 (= e!189431 e!189435)))

(declare-fun res!224653 () Bool)

(assert (=> b!269503 (=> (not res!224653) (not e!189435))))

(assert (=> b!269503 (= res!224653 e!189430)))

(declare-fun res!224652 () Bool)

(assert (=> b!269503 (=> res!224652 e!189430)))

(assert (=> b!269503 (= res!224652 (bvsge (_1!12203 lt!409000) (_2!12203 lt!409000)))))

(declare-fun lt!408999 () (_ BitVec 32))

(assert (=> b!269503 (= lt!408999 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6544 (buf!7012 w1!591)) (currentByte!12954 w1!591) (currentBit!12949 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269503 (= lt!409001 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!440)

(assert (=> b!269503 (= lt!409000 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6544 (buf!7012 w1!591)) (currentByte!12954 w1!591) (currentBit!12949 w1!591))))))

(declare-fun bm!4286 () Bool)

(assert (=> bm!4286 (= call!4289 (byteRangesEq!0 (ite c!12438 (select (arr!7531 (buf!7012 w1!591)) (_3!1000 lt!409000)) (select (arr!7531 (buf!7012 w1!591)) (_4!220 lt!409000))) (ite c!12438 (select (arr!7531 (buf!7012 w2!587)) (_3!1000 lt!409000)) (select (arr!7531 (buf!7012 w2!587)) (_4!220 lt!409000))) (ite c!12438 lt!409001 #b00000000000000000000000000000000) lt!408999))))

(declare-fun b!269504 () Bool)

(assert (=> b!269504 (= e!189433 call!4289)))

(declare-fun d!91244 () Bool)

(declare-fun res!224651 () Bool)

(assert (=> d!91244 (=> res!224651 e!189431)))

(assert (=> d!91244 (= res!224651 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6544 (buf!7012 w1!591)) (currentByte!12954 w1!591) (currentBit!12949 w1!591))))))

(assert (=> d!91244 (= (arrayBitRangesEq!0 (buf!7012 w1!591) (buf!7012 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6544 (buf!7012 w1!591)) (currentByte!12954 w1!591) (currentBit!12949 w1!591))) e!189431)))

(declare-fun b!269502 () Bool)

(declare-fun res!224650 () Bool)

(assert (=> b!269502 (= res!224650 (= lt!408999 #b00000000000000000000000000000000))))

(assert (=> b!269502 (=> res!224650 e!189432)))

(assert (=> b!269502 (= e!189434 e!189432)))

(assert (= (and d!91244 (not res!224651)) b!269503))

(assert (= (and b!269503 (not res!224652)) b!269501))

(assert (= (and b!269503 res!224653) b!269498))

(assert (= (and b!269498 c!12438) b!269504))

(assert (= (and b!269498 (not c!12438)) b!269499))

(assert (= (and b!269499 res!224649) b!269502))

(assert (= (and b!269502 (not res!224650)) b!269500))

(assert (= (or b!269504 b!269500) bm!4286))

(declare-fun m!401073 () Bool)

(assert (=> b!269499 m!401073))

(declare-fun m!401075 () Bool)

(assert (=> b!269499 m!401075))

(assert (=> b!269499 m!401073))

(assert (=> b!269499 m!401075))

(declare-fun m!401077 () Bool)

(assert (=> b!269499 m!401077))

(declare-fun m!401079 () Bool)

(assert (=> b!269501 m!401079))

(assert (=> b!269503 m!401007))

(declare-fun m!401081 () Bool)

(assert (=> b!269503 m!401081))

(assert (=> bm!4286 m!401075))

(declare-fun m!401083 () Bool)

(assert (=> bm!4286 m!401083))

(declare-fun m!401085 () Bool)

(assert (=> bm!4286 m!401085))

(declare-fun m!401087 () Bool)

(assert (=> bm!4286 m!401087))

(assert (=> bm!4286 m!401073))

(assert (=> b!269433 d!91244))

(declare-fun d!91248 () Bool)

(declare-fun e!189451 () Bool)

(assert (=> d!91248 e!189451))

(declare-fun res!224675 () Bool)

(assert (=> d!91248 (=> (not res!224675) (not e!189451))))

(declare-fun lt!409052 () (_ BitVec 64))

(declare-fun lt!409050 () (_ BitVec 64))

(declare-fun lt!409049 () (_ BitVec 64))

(assert (=> d!91248 (= res!224675 (= lt!409050 (bvsub lt!409052 lt!409049)))))

(assert (=> d!91248 (or (= (bvand lt!409052 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409049 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409052 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409052 lt!409049) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!91248 (= lt!409049 (remainingBits!0 ((_ sign_extend 32) (size!6544 (buf!7012 w1!591))) ((_ sign_extend 32) (currentByte!12954 w1!591)) ((_ sign_extend 32) (currentBit!12949 w1!591))))))

(declare-fun lt!409051 () (_ BitVec 64))

(declare-fun lt!409047 () (_ BitVec 64))

(assert (=> d!91248 (= lt!409052 (bvmul lt!409051 lt!409047))))

(assert (=> d!91248 (or (= lt!409051 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409047 (bvsdiv (bvmul lt!409051 lt!409047) lt!409051)))))

(assert (=> d!91248 (= lt!409047 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91248 (= lt!409051 ((_ sign_extend 32) (size!6544 (buf!7012 w1!591))))))

(assert (=> d!91248 (= lt!409050 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12954 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12949 w1!591))))))

(assert (=> d!91248 (invariant!0 (currentBit!12949 w1!591) (currentByte!12954 w1!591) (size!6544 (buf!7012 w1!591)))))

(assert (=> d!91248 (= (bitIndex!0 (size!6544 (buf!7012 w1!591)) (currentByte!12954 w1!591) (currentBit!12949 w1!591)) lt!409050)))

(declare-fun b!269528 () Bool)

(declare-fun res!224676 () Bool)

(assert (=> b!269528 (=> (not res!224676) (not e!189451))))

(assert (=> b!269528 (= res!224676 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409050))))

(declare-fun b!269529 () Bool)

(declare-fun lt!409048 () (_ BitVec 64))

(assert (=> b!269529 (= e!189451 (bvsle lt!409050 (bvmul lt!409048 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269529 (or (= lt!409048 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409048 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409048)))))

(assert (=> b!269529 (= lt!409048 ((_ sign_extend 32) (size!6544 (buf!7012 w1!591))))))

(assert (= (and d!91248 res!224675) b!269528))

(assert (= (and b!269528 res!224676) b!269529))

(declare-fun m!401117 () Bool)

(assert (=> d!91248 m!401117))

(assert (=> d!91248 m!401019))

(assert (=> b!269433 d!91248))

(declare-fun d!91264 () Bool)

(declare-fun e!189452 () Bool)

(assert (=> d!91264 e!189452))

(declare-fun res!224677 () Bool)

(assert (=> d!91264 (=> (not res!224677) (not e!189452))))

(declare-fun lt!409055 () (_ BitVec 64))

(declare-fun lt!409058 () (_ BitVec 64))

(declare-fun lt!409056 () (_ BitVec 64))

(assert (=> d!91264 (= res!224677 (= lt!409056 (bvsub lt!409058 lt!409055)))))

(assert (=> d!91264 (or (= (bvand lt!409058 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409055 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409058 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409058 lt!409055) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!91264 (= lt!409055 (remainingBits!0 ((_ sign_extend 32) (size!6544 (buf!7012 w2!587))) ((_ sign_extend 32) (currentByte!12954 w2!587)) ((_ sign_extend 32) (currentBit!12949 w2!587))))))

(declare-fun lt!409057 () (_ BitVec 64))

(declare-fun lt!409053 () (_ BitVec 64))

(assert (=> d!91264 (= lt!409058 (bvmul lt!409057 lt!409053))))

(assert (=> d!91264 (or (= lt!409057 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409053 (bvsdiv (bvmul lt!409057 lt!409053) lt!409057)))))

(assert (=> d!91264 (= lt!409053 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91264 (= lt!409057 ((_ sign_extend 32) (size!6544 (buf!7012 w2!587))))))

(assert (=> d!91264 (= lt!409056 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12954 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12949 w2!587))))))

(assert (=> d!91264 (invariant!0 (currentBit!12949 w2!587) (currentByte!12954 w2!587) (size!6544 (buf!7012 w2!587)))))

(assert (=> d!91264 (= (bitIndex!0 (size!6544 (buf!7012 w2!587)) (currentByte!12954 w2!587) (currentBit!12949 w2!587)) lt!409056)))

(declare-fun b!269530 () Bool)

(declare-fun res!224678 () Bool)

(assert (=> b!269530 (=> (not res!224678) (not e!189452))))

(assert (=> b!269530 (= res!224678 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409056))))

(declare-fun b!269531 () Bool)

(declare-fun lt!409054 () (_ BitVec 64))

(assert (=> b!269531 (= e!189452 (bvsle lt!409056 (bvmul lt!409054 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269531 (or (= lt!409054 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409054 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409054)))))

(assert (=> b!269531 (= lt!409054 ((_ sign_extend 32) (size!6544 (buf!7012 w2!587))))))

(assert (= (and d!91264 res!224677) b!269530))

(assert (= (and b!269530 res!224678) b!269531))

(declare-fun m!401119 () Bool)

(assert (=> d!91264 m!401119))

(assert (=> d!91264 m!401021))

(assert (=> b!269436 d!91264))

(declare-fun d!91266 () Bool)

(declare-fun e!189453 () Bool)

(assert (=> d!91266 e!189453))

(declare-fun res!224679 () Bool)

(assert (=> d!91266 (=> (not res!224679) (not e!189453))))

(declare-fun lt!409062 () (_ BitVec 64))

(declare-fun lt!409061 () (_ BitVec 64))

(declare-fun lt!409064 () (_ BitVec 64))

(assert (=> d!91266 (= res!224679 (= lt!409062 (bvsub lt!409064 lt!409061)))))

(assert (=> d!91266 (or (= (bvand lt!409064 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409061 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409064 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409064 lt!409061) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!91266 (= lt!409061 (remainingBits!0 ((_ sign_extend 32) (size!6544 (buf!7012 w3!25))) ((_ sign_extend 32) (currentByte!12954 w3!25)) ((_ sign_extend 32) (currentBit!12949 w3!25))))))

(declare-fun lt!409063 () (_ BitVec 64))

(declare-fun lt!409059 () (_ BitVec 64))

(assert (=> d!91266 (= lt!409064 (bvmul lt!409063 lt!409059))))

(assert (=> d!91266 (or (= lt!409063 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409059 (bvsdiv (bvmul lt!409063 lt!409059) lt!409063)))))

(assert (=> d!91266 (= lt!409059 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91266 (= lt!409063 ((_ sign_extend 32) (size!6544 (buf!7012 w3!25))))))

(assert (=> d!91266 (= lt!409062 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12954 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12949 w3!25))))))

(assert (=> d!91266 (invariant!0 (currentBit!12949 w3!25) (currentByte!12954 w3!25) (size!6544 (buf!7012 w3!25)))))

(assert (=> d!91266 (= (bitIndex!0 (size!6544 (buf!7012 w3!25)) (currentByte!12954 w3!25) (currentBit!12949 w3!25)) lt!409062)))

(declare-fun b!269532 () Bool)

(declare-fun res!224680 () Bool)

(assert (=> b!269532 (=> (not res!224680) (not e!189453))))

(assert (=> b!269532 (= res!224680 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409062))))

(declare-fun b!269533 () Bool)

(declare-fun lt!409060 () (_ BitVec 64))

(assert (=> b!269533 (= e!189453 (bvsle lt!409062 (bvmul lt!409060 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269533 (or (= lt!409060 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409060 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409060)))))

(assert (=> b!269533 (= lt!409060 ((_ sign_extend 32) (size!6544 (buf!7012 w3!25))))))

(assert (= (and d!91266 res!224679) b!269532))

(assert (= (and b!269532 res!224680) b!269533))

(declare-fun m!401121 () Bool)

(assert (=> d!91266 m!401121))

(assert (=> d!91266 m!401023))

(assert (=> b!269436 d!91266))

(declare-fun d!91268 () Bool)

(assert (=> d!91268 (= (invariant!0 (currentBit!12949 w2!587) (currentByte!12954 w2!587) (size!6544 (buf!7012 w2!587))) (and (bvsge (currentBit!12949 w2!587) #b00000000000000000000000000000000) (bvslt (currentBit!12949 w2!587) #b00000000000000000000000000001000) (bvsge (currentByte!12954 w2!587) #b00000000000000000000000000000000) (or (bvslt (currentByte!12954 w2!587) (size!6544 (buf!7012 w2!587))) (and (= (currentBit!12949 w2!587) #b00000000000000000000000000000000) (= (currentByte!12954 w2!587) (size!6544 (buf!7012 w2!587)))))))))

(assert (=> d!91210 d!91268))

(declare-fun d!91270 () Bool)

(assert (=> d!91270 (= (invariant!0 (currentBit!12949 w3!25) (currentByte!12954 w3!25) (size!6544 (buf!7012 w3!25))) (and (bvsge (currentBit!12949 w3!25) #b00000000000000000000000000000000) (bvslt (currentBit!12949 w3!25) #b00000000000000000000000000001000) (bvsge (currentByte!12954 w3!25) #b00000000000000000000000000000000) (or (bvslt (currentByte!12954 w3!25) (size!6544 (buf!7012 w3!25))) (and (= (currentBit!12949 w3!25) #b00000000000000000000000000000000) (= (currentByte!12954 w3!25) (size!6544 (buf!7012 w3!25)))))))))

(assert (=> d!91212 d!91270))

(declare-fun d!91272 () Bool)

(assert (=> d!91272 (= (invariant!0 (currentBit!12949 w1!591) (currentByte!12954 w1!591) (size!6544 (buf!7012 w1!591))) (and (bvsge (currentBit!12949 w1!591) #b00000000000000000000000000000000) (bvslt (currentBit!12949 w1!591) #b00000000000000000000000000001000) (bvsge (currentByte!12954 w1!591) #b00000000000000000000000000000000) (or (bvslt (currentByte!12954 w1!591) (size!6544 (buf!7012 w1!591))) (and (= (currentBit!12949 w1!591) #b00000000000000000000000000000000) (= (currentByte!12954 w1!591) (size!6544 (buf!7012 w1!591)))))))))

(assert (=> d!91208 d!91272))

(declare-fun b!269534 () Bool)

(declare-fun e!189459 () Bool)

(declare-fun e!189457 () Bool)

(assert (=> b!269534 (= e!189459 e!189457)))

(declare-fun c!12440 () Bool)

(declare-fun lt!409066 () tuple4!440)

(assert (=> b!269534 (= c!12440 (= (_3!1000 lt!409066) (_4!220 lt!409066)))))

(declare-fun b!269535 () Bool)

(declare-fun e!189458 () Bool)

(assert (=> b!269535 (= e!189457 e!189458)))

(declare-fun lt!409067 () (_ BitVec 32))

(declare-fun res!224681 () Bool)

(assert (=> b!269535 (= res!224681 (byteRangesEq!0 (select (arr!7531 (buf!7012 w2!587)) (_3!1000 lt!409066)) (select (arr!7531 (buf!7012 w3!25)) (_3!1000 lt!409066)) lt!409067 #b00000000000000000000000000001000))))

(assert (=> b!269535 (=> (not res!224681) (not e!189458))))

(declare-fun b!269536 () Bool)

(declare-fun e!189456 () Bool)

(declare-fun call!4291 () Bool)

(assert (=> b!269536 (= e!189456 call!4291)))

(declare-fun b!269537 () Bool)

(declare-fun e!189454 () Bool)

(assert (=> b!269537 (= e!189454 (arrayRangesEq!1076 (buf!7012 w2!587) (buf!7012 w3!25) (_1!12203 lt!409066) (_2!12203 lt!409066)))))

(declare-fun b!269539 () Bool)

(declare-fun e!189455 () Bool)

(assert (=> b!269539 (= e!189455 e!189459)))

(declare-fun res!224685 () Bool)

(assert (=> b!269539 (=> (not res!224685) (not e!189459))))

(assert (=> b!269539 (= res!224685 e!189454)))

(declare-fun res!224684 () Bool)

(assert (=> b!269539 (=> res!224684 e!189454)))

(assert (=> b!269539 (= res!224684 (bvsge (_1!12203 lt!409066) (_2!12203 lt!409066)))))

(declare-fun lt!409065 () (_ BitVec 32))

(assert (=> b!269539 (= lt!409065 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6544 (buf!7012 w2!587)) (currentByte!12954 w2!587) (currentBit!12949 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269539 (= lt!409067 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269539 (= lt!409066 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6544 (buf!7012 w2!587)) (currentByte!12954 w2!587) (currentBit!12949 w2!587))))))

(declare-fun bm!4288 () Bool)

(assert (=> bm!4288 (= call!4291 (byteRangesEq!0 (ite c!12440 (select (arr!7531 (buf!7012 w2!587)) (_3!1000 lt!409066)) (select (arr!7531 (buf!7012 w2!587)) (_4!220 lt!409066))) (ite c!12440 (select (arr!7531 (buf!7012 w3!25)) (_3!1000 lt!409066)) (select (arr!7531 (buf!7012 w3!25)) (_4!220 lt!409066))) (ite c!12440 lt!409067 #b00000000000000000000000000000000) lt!409065))))

(declare-fun b!269540 () Bool)

(assert (=> b!269540 (= e!189457 call!4291)))

(declare-fun d!91276 () Bool)

(declare-fun res!224683 () Bool)

(assert (=> d!91276 (=> res!224683 e!189455)))

(assert (=> d!91276 (= res!224683 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6544 (buf!7012 w2!587)) (currentByte!12954 w2!587) (currentBit!12949 w2!587))))))

(assert (=> d!91276 (= (arrayBitRangesEq!0 (buf!7012 w2!587) (buf!7012 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6544 (buf!7012 w2!587)) (currentByte!12954 w2!587) (currentBit!12949 w2!587))) e!189455)))

(declare-fun b!269538 () Bool)

(declare-fun res!224682 () Bool)

(assert (=> b!269538 (= res!224682 (= lt!409065 #b00000000000000000000000000000000))))

(assert (=> b!269538 (=> res!224682 e!189456)))

(assert (=> b!269538 (= e!189458 e!189456)))

(assert (= (and d!91276 (not res!224683)) b!269539))

(assert (= (and b!269539 (not res!224684)) b!269537))

(assert (= (and b!269539 res!224685) b!269534))

(assert (= (and b!269534 c!12440) b!269540))

(assert (= (and b!269534 (not c!12440)) b!269535))

(assert (= (and b!269535 res!224681) b!269538))

(assert (= (and b!269538 (not res!224682)) b!269536))

(assert (= (or b!269540 b!269536) bm!4288))

(declare-fun m!401123 () Bool)

(assert (=> b!269535 m!401123))

(declare-fun m!401125 () Bool)

(assert (=> b!269535 m!401125))

(assert (=> b!269535 m!401123))

(assert (=> b!269535 m!401125))

(declare-fun m!401127 () Bool)

(assert (=> b!269535 m!401127))

(declare-fun m!401129 () Bool)

(assert (=> b!269537 m!401129))

(assert (=> b!269539 m!401009))

(declare-fun m!401131 () Bool)

(assert (=> b!269539 m!401131))

(assert (=> bm!4288 m!401125))

(declare-fun m!401133 () Bool)

(assert (=> bm!4288 m!401133))

(declare-fun m!401135 () Bool)

(assert (=> bm!4288 m!401135))

(declare-fun m!401137 () Bool)

(assert (=> bm!4288 m!401137))

(assert (=> bm!4288 m!401123))

(assert (=> b!269438 d!91276))

(assert (=> b!269438 d!91264))

(assert (=> b!269431 d!91248))

(assert (=> b!269431 d!91264))

(declare-fun d!91278 () Bool)

(declare-fun res!224686 () Bool)

(declare-fun e!189460 () Bool)

(assert (=> d!91278 (=> res!224686 e!189460)))

(assert (=> d!91278 (= res!224686 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12954 w1!591)))))

(assert (=> d!91278 (= (arrayRangesEq!1076 (buf!7012 w1!591) (buf!7012 w2!587) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12954 w1!591)) e!189460)))

(declare-fun b!269541 () Bool)

(declare-fun e!189461 () Bool)

(assert (=> b!269541 (= e!189460 e!189461)))

(declare-fun res!224687 () Bool)

(assert (=> b!269541 (=> (not res!224687) (not e!189461))))

(assert (=> b!269541 (= res!224687 (= (select (arr!7531 (buf!7012 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7531 (buf!7012 w2!587)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!269542 () Bool)

(assert (=> b!269542 (= e!189461 (arrayRangesEq!1076 (buf!7012 w1!591) (buf!7012 w2!587) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12954 w1!591)))))

(assert (= (and d!91278 (not res!224686)) b!269541))

(assert (= (and b!269541 res!224687) b!269542))

(declare-fun m!401139 () Bool)

(assert (=> b!269541 m!401139))

(declare-fun m!401141 () Bool)

(assert (=> b!269541 m!401141))

(declare-fun m!401143 () Bool)

(assert (=> b!269542 m!401143))

(assert (=> b!269444 d!91278))

(push 1)

(assert (not b!269501))

(assert (not d!91266))

(assert (not b!269535))

(assert (not b!269503))

(assert (not b!269542))

(assert (not d!91264))

(assert (not b!269499))

(assert (not bm!4286))

(assert (not b!269537))

(assert (not bm!4288))

(assert (not d!91248))

(assert (not b!269539))

(check-sat)

(pop 1)

(push 1)

(check-sat)

