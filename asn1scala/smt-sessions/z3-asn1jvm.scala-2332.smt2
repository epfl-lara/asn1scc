; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59644 () Bool)

(assert start!59644)

(declare-fun res!226942 () Bool)

(declare-fun e!192334 () Bool)

(assert (=> start!59644 (=> (not res!226942) (not e!192334))))

(declare-datatypes ((array!15187 0))(
  ( (array!15188 (arr!7589 (Array (_ BitVec 32) (_ BitVec 8))) (size!6602 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12018 0))(
  ( (BitStream!12019 (buf!7070 array!15187) (currentByte!13071 (_ BitVec 32)) (currentBit!13066 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12018)

(assert (=> start!59644 (= res!226942 (not (= (size!6602 (buf!7070 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59644 e!192334))

(declare-fun e!192333 () Bool)

(declare-fun inv!12 (BitStream!12018) Bool)

(assert (=> start!59644 (and (inv!12 bs!71) e!192333)))

(declare-fun b!272518 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!272518 (= e!192334 (not (invariant!0 (currentBit!13066 bs!71) (currentByte!13071 bs!71) (size!6602 (buf!7070 bs!71)))))))

(declare-fun arrayBitRangesEq!0 (array!15187 array!15187 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272518 (arrayBitRangesEq!0 (buf!7070 bs!71) (buf!7070 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6602 (buf!7070 bs!71)))))))

(declare-datatypes ((Unit!19183 0))(
  ( (Unit!19184) )
))
(declare-fun lt!410372 () Unit!19183)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15187) Unit!19183)

(assert (=> b!272518 (= lt!410372 (arrayBitEqImpliesRangesEqLemma!0 (buf!7070 bs!71)))))

(declare-fun b!272519 () Bool)

(declare-fun array_inv!6326 (array!15187) Bool)

(assert (=> b!272519 (= e!192333 (array_inv!6326 (buf!7070 bs!71)))))

(assert (= (and start!59644 res!226942) b!272518))

(assert (= start!59644 b!272519))

(declare-fun m!405331 () Bool)

(assert (=> start!59644 m!405331))

(declare-fun m!405333 () Bool)

(assert (=> b!272518 m!405333))

(declare-fun m!405335 () Bool)

(assert (=> b!272518 m!405335))

(declare-fun m!405337 () Bool)

(assert (=> b!272518 m!405337))

(declare-fun m!405339 () Bool)

(assert (=> b!272519 m!405339))

(check-sat (not b!272519) (not start!59644) (not b!272518))
(check-sat)
(get-model)

(declare-fun d!93262 () Bool)

(assert (=> d!93262 (= (array_inv!6326 (buf!7070 bs!71)) (bvsge (size!6602 (buf!7070 bs!71)) #b00000000000000000000000000000000))))

(assert (=> b!272519 d!93262))

(declare-fun d!93266 () Bool)

(assert (=> d!93266 (= (inv!12 bs!71) (invariant!0 (currentBit!13066 bs!71) (currentByte!13071 bs!71) (size!6602 (buf!7070 bs!71))))))

(declare-fun bs!23505 () Bool)

(assert (= bs!23505 d!93266))

(assert (=> bs!23505 m!405333))

(assert (=> start!59644 d!93266))

(declare-fun d!93270 () Bool)

(assert (=> d!93270 (= (invariant!0 (currentBit!13066 bs!71) (currentByte!13071 bs!71) (size!6602 (buf!7070 bs!71))) (and (bvsge (currentBit!13066 bs!71) #b00000000000000000000000000000000) (bvslt (currentBit!13066 bs!71) #b00000000000000000000000000001000) (bvsge (currentByte!13071 bs!71) #b00000000000000000000000000000000) (or (bvslt (currentByte!13071 bs!71) (size!6602 (buf!7070 bs!71))) (and (= (currentBit!13066 bs!71) #b00000000000000000000000000000000) (= (currentByte!13071 bs!71) (size!6602 (buf!7070 bs!71)))))))))

(assert (=> b!272518 d!93270))

(declare-fun b!272585 () Bool)

(declare-fun e!192395 () Bool)

(declare-fun call!4379 () Bool)

(assert (=> b!272585 (= e!192395 call!4379)))

(declare-fun b!272586 () Bool)

(declare-fun e!192399 () Bool)

(declare-fun e!192400 () Bool)

(assert (=> b!272586 (= e!192399 e!192400)))

(declare-fun c!12564 () Bool)

(declare-datatypes ((tuple4!482 0))(
  ( (tuple4!483 (_1!12224 (_ BitVec 32)) (_2!12224 (_ BitVec 32)) (_3!1021 (_ BitVec 32)) (_4!241 (_ BitVec 32))) )
))
(declare-fun lt!410410 () tuple4!482)

(assert (=> b!272586 (= c!12564 (= (_3!1021 lt!410410) (_4!241 lt!410410)))))

(declare-fun b!272588 () Bool)

(declare-fun e!192396 () Bool)

(assert (=> b!272588 (= e!192400 e!192396)))

(declare-fun res!226991 () Bool)

(declare-fun lt!410409 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!272588 (= res!226991 (byteRangesEq!0 (select (arr!7589 (buf!7070 bs!71)) (_3!1021 lt!410410)) (select (arr!7589 (buf!7070 bs!71)) (_3!1021 lt!410410)) lt!410409 #b00000000000000000000000000001000))))

(assert (=> b!272588 (=> (not res!226991) (not e!192396))))

(declare-fun bm!4376 () Bool)

(declare-fun lt!410411 () (_ BitVec 32))

(assert (=> bm!4376 (= call!4379 (byteRangesEq!0 (ite c!12564 (select (arr!7589 (buf!7070 bs!71)) (_3!1021 lt!410410)) (select (arr!7589 (buf!7070 bs!71)) (_4!241 lt!410410))) (ite c!12564 (select (arr!7589 (buf!7070 bs!71)) (_3!1021 lt!410410)) (select (arr!7589 (buf!7070 bs!71)) (_4!241 lt!410410))) (ite c!12564 lt!410409 #b00000000000000000000000000000000) lt!410411))))

(declare-fun b!272589 () Bool)

(assert (=> b!272589 (= e!192400 call!4379)))

(declare-fun d!93274 () Bool)

(declare-fun res!226989 () Bool)

(declare-fun e!192398 () Bool)

(assert (=> d!93274 (=> res!226989 e!192398)))

(assert (=> d!93274 (= res!226989 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6602 (buf!7070 bs!71))))))))

(assert (=> d!93274 (= (arrayBitRangesEq!0 (buf!7070 bs!71) (buf!7070 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6602 (buf!7070 bs!71))))) e!192398)))

(declare-fun b!272587 () Bool)

(assert (=> b!272587 (= e!192398 e!192399)))

(declare-fun res!226992 () Bool)

(assert (=> b!272587 (=> (not res!226992) (not e!192399))))

(declare-fun e!192397 () Bool)

(assert (=> b!272587 (= res!226992 e!192397)))

(declare-fun res!226990 () Bool)

(assert (=> b!272587 (=> res!226990 e!192397)))

(assert (=> b!272587 (= res!226990 (bvsge (_1!12224 lt!410410) (_2!12224 lt!410410)))))

(assert (=> b!272587 (= lt!410411 ((_ extract 31 0) (bvsrem (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6602 (buf!7070 bs!71)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!272587 (= lt!410409 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!482)

(assert (=> b!272587 (= lt!410410 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6602 (buf!7070 bs!71))))))))

(declare-fun b!272590 () Bool)

(declare-fun res!226993 () Bool)

(assert (=> b!272590 (= res!226993 (= lt!410411 #b00000000000000000000000000000000))))

(assert (=> b!272590 (=> res!226993 e!192395)))

(assert (=> b!272590 (= e!192396 e!192395)))

(declare-fun b!272591 () Bool)

(declare-fun arrayRangesEq!1134 (array!15187 array!15187 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!272591 (= e!192397 (arrayRangesEq!1134 (buf!7070 bs!71) (buf!7070 bs!71) (_1!12224 lt!410410) (_2!12224 lt!410410)))))

(assert (= (and d!93274 (not res!226989)) b!272587))

(assert (= (and b!272587 (not res!226990)) b!272591))

(assert (= (and b!272587 res!226992) b!272586))

(assert (= (and b!272586 c!12564) b!272589))

(assert (= (and b!272586 (not c!12564)) b!272588))

(assert (= (and b!272588 res!226991) b!272590))

(assert (= (and b!272590 (not res!226993)) b!272585))

(assert (= (or b!272589 b!272585) bm!4376))

(declare-fun m!405379 () Bool)

(assert (=> b!272588 m!405379))

(assert (=> b!272588 m!405379))

(assert (=> b!272588 m!405379))

(assert (=> b!272588 m!405379))

(declare-fun m!405381 () Bool)

(assert (=> b!272588 m!405381))

(assert (=> bm!4376 m!405379))

(declare-fun m!405383 () Bool)

(assert (=> bm!4376 m!405383))

(assert (=> bm!4376 m!405379))

(assert (=> bm!4376 m!405383))

(declare-fun m!405385 () Bool)

(assert (=> bm!4376 m!405385))

(declare-fun m!405387 () Bool)

(assert (=> b!272587 m!405387))

(declare-fun m!405389 () Bool)

(assert (=> b!272591 m!405389))

(assert (=> b!272518 d!93274))

(declare-fun d!93280 () Bool)

(declare-fun e!192406 () Bool)

(assert (=> d!93280 e!192406))

(declare-fun res!226999 () Bool)

(assert (=> d!93280 (=> (not res!226999) (not e!192406))))

(declare-fun lt!410428 () (_ BitVec 64))

(declare-fun lt!410429 () (_ BitVec 64))

(assert (=> d!93280 (= res!226999 (or (= lt!410428 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!410429 (bvsdiv (bvmul lt!410428 lt!410429) lt!410428))))))

(assert (=> d!93280 (= lt!410429 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93280 (= lt!410428 ((_ sign_extend 32) (size!6602 (buf!7070 bs!71))))))

(declare-fun lt!410427 () Unit!19183)

(declare-fun choose!44 (array!15187) Unit!19183)

(assert (=> d!93280 (= lt!410427 (choose!44 (buf!7070 bs!71)))))

(assert (=> d!93280 (= (arrayBitEqImpliesRangesEqLemma!0 (buf!7070 bs!71)) lt!410427)))

(declare-fun b!272597 () Bool)

(assert (=> b!272597 (= e!192406 (arrayBitRangesEq!0 (buf!7070 bs!71) (buf!7070 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!6602 (buf!7070 bs!71))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!93280 res!226999) b!272597))

(declare-fun m!405395 () Bool)

(assert (=> d!93280 m!405395))

(declare-fun m!405397 () Bool)

(assert (=> b!272597 m!405397))

(assert (=> b!272518 d!93280))

(check-sat (not b!272588) (not d!93266) (not b!272587) (not bm!4376) (not d!93280) (not b!272597) (not b!272591))
