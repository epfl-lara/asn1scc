; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58676 () Bool)

(assert start!58676)

(declare-fun b!269385 () Bool)

(declare-fun res!224559 () Bool)

(declare-fun e!189333 () Bool)

(assert (=> b!269385 (=> (not res!224559) (not e!189333))))

(declare-datatypes ((array!15019 0))(
  ( (array!15020 (arr!7532 (Array (_ BitVec 32) (_ BitVec 8))) (size!6545 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11904 0))(
  ( (BitStream!11905 (buf!7013 array!15019) (currentByte!12955 (_ BitVec 32)) (currentBit!12950 (_ BitVec 32))) )
))
(declare-fun w2!587 () BitStream!11904)

(declare-fun w3!25 () BitStream!11904)

(declare-fun isPrefixOf!0 (BitStream!11904 BitStream!11904) Bool)

(assert (=> b!269385 (= res!224559 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun res!224560 () Bool)

(assert (=> start!58676 (=> (not res!224560) (not e!189333))))

(declare-fun w1!591 () BitStream!11904)

(assert (=> start!58676 (= res!224560 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58676 e!189333))

(declare-fun e!189335 () Bool)

(declare-fun inv!12 (BitStream!11904) Bool)

(assert (=> start!58676 (and (inv!12 w1!591) e!189335)))

(declare-fun e!189334 () Bool)

(assert (=> start!58676 (and (inv!12 w2!587) e!189334)))

(declare-fun e!189332 () Bool)

(assert (=> start!58676 (and (inv!12 w3!25) e!189332)))

(declare-fun b!269386 () Bool)

(declare-fun array_inv!6269 (array!15019) Bool)

(assert (=> b!269386 (= e!189334 (array_inv!6269 (buf!7013 w2!587)))))

(declare-fun b!269387 () Bool)

(declare-fun res!224558 () Bool)

(assert (=> b!269387 (=> (not res!224558) (not e!189333))))

(assert (=> b!269387 (= res!224558 (and (bvsle #b00000000000000000000000000000000 (currentByte!12955 w1!591)) (bvsle (currentByte!12955 w1!591) (currentByte!12955 w2!587)) (bvsle (size!6545 (buf!7013 w1!591)) (size!6545 (buf!7013 w2!587))) (bvsle (size!6545 (buf!7013 w2!587)) (size!6545 (buf!7013 w3!25))) (bvsle (currentByte!12955 w1!591) (size!6545 (buf!7013 w1!591))) (bvsle (currentByte!12955 w2!587) (size!6545 (buf!7013 w2!587)))))))

(declare-fun b!269388 () Bool)

(declare-fun arrayRangesEq!1077 (array!15019 array!15019 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!269388 (= e!189333 (not (arrayRangesEq!1077 (buf!7013 w1!591) (buf!7013 w2!587) #b00000000000000000000000000000000 (currentByte!12955 w1!591))))))

(declare-fun b!269389 () Bool)

(assert (=> b!269389 (= e!189332 (array_inv!6269 (buf!7013 w3!25)))))

(declare-fun b!269390 () Bool)

(assert (=> b!269390 (= e!189335 (array_inv!6269 (buf!7013 w1!591)))))

(assert (= (and start!58676 res!224560) b!269385))

(assert (= (and b!269385 res!224559) b!269387))

(assert (= (and b!269387 res!224558) b!269388))

(assert (= start!58676 b!269390))

(assert (= start!58676 b!269386))

(assert (= start!58676 b!269389))

(declare-fun m!400955 () Bool)

(assert (=> start!58676 m!400955))

(declare-fun m!400957 () Bool)

(assert (=> start!58676 m!400957))

(declare-fun m!400959 () Bool)

(assert (=> start!58676 m!400959))

(declare-fun m!400961 () Bool)

(assert (=> start!58676 m!400961))

(declare-fun m!400963 () Bool)

(assert (=> b!269385 m!400963))

(declare-fun m!400965 () Bool)

(assert (=> b!269390 m!400965))

(declare-fun m!400967 () Bool)

(assert (=> b!269386 m!400967))

(declare-fun m!400969 () Bool)

(assert (=> b!269388 m!400969))

(declare-fun m!400971 () Bool)

(assert (=> b!269389 m!400971))

(check-sat (not b!269390) (not b!269386) (not start!58676) (not b!269389) (not b!269388) (not b!269385))
(check-sat)
(get-model)

(declare-fun d!91188 () Bool)

(assert (=> d!91188 (= (array_inv!6269 (buf!7013 w3!25)) (bvsge (size!6545 (buf!7013 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!269389 d!91188))

(declare-fun d!91190 () Bool)

(assert (=> d!91190 (= (array_inv!6269 (buf!7013 w1!591)) (bvsge (size!6545 (buf!7013 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!269390 d!91190))

(declare-fun d!91192 () Bool)

(declare-fun res!224577 () Bool)

(declare-fun e!189363 () Bool)

(assert (=> d!91192 (=> (not res!224577) (not e!189363))))

(assert (=> d!91192 (= res!224577 (= (size!6545 (buf!7013 w1!591)) (size!6545 (buf!7013 w2!587))))))

(assert (=> d!91192 (= (isPrefixOf!0 w1!591 w2!587) e!189363)))

(declare-fun b!269415 () Bool)

(declare-fun res!224576 () Bool)

(assert (=> b!269415 (=> (not res!224576) (not e!189363))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!269415 (= res!224576 (bvsle (bitIndex!0 (size!6545 (buf!7013 w1!591)) (currentByte!12955 w1!591) (currentBit!12950 w1!591)) (bitIndex!0 (size!6545 (buf!7013 w2!587)) (currentByte!12955 w2!587) (currentBit!12950 w2!587))))))

(declare-fun b!269416 () Bool)

(declare-fun e!189362 () Bool)

(assert (=> b!269416 (= e!189363 e!189362)))

(declare-fun res!224578 () Bool)

(assert (=> b!269416 (=> res!224578 e!189362)))

(assert (=> b!269416 (= res!224578 (= (size!6545 (buf!7013 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!269417 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15019 array!15019 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!269417 (= e!189362 (arrayBitRangesEq!0 (buf!7013 w1!591) (buf!7013 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6545 (buf!7013 w1!591)) (currentByte!12955 w1!591) (currentBit!12950 w1!591))))))

(assert (= (and d!91192 res!224577) b!269415))

(assert (= (and b!269415 res!224576) b!269416))

(assert (= (and b!269416 (not res!224578)) b!269417))

(declare-fun m!400991 () Bool)

(assert (=> b!269415 m!400991))

(declare-fun m!400993 () Bool)

(assert (=> b!269415 m!400993))

(assert (=> b!269417 m!400991))

(assert (=> b!269417 m!400991))

(declare-fun m!400995 () Bool)

(assert (=> b!269417 m!400995))

(assert (=> start!58676 d!91192))

(declare-fun d!91196 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!91196 (= (inv!12 w1!591) (invariant!0 (currentBit!12950 w1!591) (currentByte!12955 w1!591) (size!6545 (buf!7013 w1!591))))))

(declare-fun bs!23106 () Bool)

(assert (= bs!23106 d!91196))

(declare-fun m!400997 () Bool)

(assert (=> bs!23106 m!400997))

(assert (=> start!58676 d!91196))

(declare-fun d!91198 () Bool)

(assert (=> d!91198 (= (inv!12 w2!587) (invariant!0 (currentBit!12950 w2!587) (currentByte!12955 w2!587) (size!6545 (buf!7013 w2!587))))))

(declare-fun bs!23107 () Bool)

(assert (= bs!23107 d!91198))

(declare-fun m!400999 () Bool)

(assert (=> bs!23107 m!400999))

(assert (=> start!58676 d!91198))

(declare-fun d!91200 () Bool)

(assert (=> d!91200 (= (inv!12 w3!25) (invariant!0 (currentBit!12950 w3!25) (currentByte!12955 w3!25) (size!6545 (buf!7013 w3!25))))))

(declare-fun bs!23108 () Bool)

(assert (= bs!23108 d!91200))

(declare-fun m!401001 () Bool)

(assert (=> bs!23108 m!401001))

(assert (=> start!58676 d!91200))

(declare-fun d!91202 () Bool)

(declare-fun res!224580 () Bool)

(declare-fun e!189365 () Bool)

(assert (=> d!91202 (=> (not res!224580) (not e!189365))))

(assert (=> d!91202 (= res!224580 (= (size!6545 (buf!7013 w2!587)) (size!6545 (buf!7013 w3!25))))))

(assert (=> d!91202 (= (isPrefixOf!0 w2!587 w3!25) e!189365)))

(declare-fun b!269418 () Bool)

(declare-fun res!224579 () Bool)

(assert (=> b!269418 (=> (not res!224579) (not e!189365))))

(assert (=> b!269418 (= res!224579 (bvsle (bitIndex!0 (size!6545 (buf!7013 w2!587)) (currentByte!12955 w2!587) (currentBit!12950 w2!587)) (bitIndex!0 (size!6545 (buf!7013 w3!25)) (currentByte!12955 w3!25) (currentBit!12950 w3!25))))))

(declare-fun b!269419 () Bool)

(declare-fun e!189364 () Bool)

(assert (=> b!269419 (= e!189365 e!189364)))

(declare-fun res!224581 () Bool)

(assert (=> b!269419 (=> res!224581 e!189364)))

(assert (=> b!269419 (= res!224581 (= (size!6545 (buf!7013 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!269420 () Bool)

(assert (=> b!269420 (= e!189364 (arrayBitRangesEq!0 (buf!7013 w2!587) (buf!7013 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6545 (buf!7013 w2!587)) (currentByte!12955 w2!587) (currentBit!12950 w2!587))))))

(assert (= (and d!91202 res!224580) b!269418))

(assert (= (and b!269418 res!224579) b!269419))

(assert (= (and b!269419 (not res!224581)) b!269420))

(assert (=> b!269418 m!400993))

(declare-fun m!401003 () Bool)

(assert (=> b!269418 m!401003))

(assert (=> b!269420 m!400993))

(assert (=> b!269420 m!400993))

(declare-fun m!401005 () Bool)

(assert (=> b!269420 m!401005))

(assert (=> b!269385 d!91202))

(declare-fun d!91204 () Bool)

(assert (=> d!91204 (= (array_inv!6269 (buf!7013 w2!587)) (bvsge (size!6545 (buf!7013 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!269386 d!91204))

(declare-fun d!91206 () Bool)

(declare-fun res!224595 () Bool)

(declare-fun e!189376 () Bool)

(assert (=> d!91206 (=> res!224595 e!189376)))

(assert (=> d!91206 (= res!224595 (= #b00000000000000000000000000000000 (currentByte!12955 w1!591)))))

(assert (=> d!91206 (= (arrayRangesEq!1077 (buf!7013 w1!591) (buf!7013 w2!587) #b00000000000000000000000000000000 (currentByte!12955 w1!591)) e!189376)))

(declare-fun b!269434 () Bool)

(declare-fun e!189377 () Bool)

(assert (=> b!269434 (= e!189376 e!189377)))

(declare-fun res!224596 () Bool)

(assert (=> b!269434 (=> (not res!224596) (not e!189377))))

(assert (=> b!269434 (= res!224596 (= (select (arr!7532 (buf!7013 w1!591)) #b00000000000000000000000000000000) (select (arr!7532 (buf!7013 w2!587)) #b00000000000000000000000000000000)))))

(declare-fun b!269435 () Bool)

(assert (=> b!269435 (= e!189377 (arrayRangesEq!1077 (buf!7013 w1!591) (buf!7013 w2!587) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12955 w1!591)))))

(assert (= (and d!91206 (not res!224595)) b!269434))

(assert (= (and b!269434 res!224596) b!269435))

(declare-fun m!401013 () Bool)

(assert (=> b!269434 m!401013))

(declare-fun m!401015 () Bool)

(assert (=> b!269434 m!401015))

(declare-fun m!401017 () Bool)

(assert (=> b!269435 m!401017))

(assert (=> b!269388 d!91206))

(check-sat (not d!91198) (not d!91200) (not d!91196) (not b!269417) (not b!269418) (not b!269420) (not b!269415) (not b!269435))
(check-sat)
(get-model)

(declare-fun d!91242 () Bool)

(declare-fun res!224637 () Bool)

(declare-fun e!189416 () Bool)

(assert (=> d!91242 (=> res!224637 e!189416)))

(assert (=> d!91242 (= res!224637 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6545 (buf!7013 w2!587)) (currentByte!12955 w2!587) (currentBit!12950 w2!587))))))

(assert (=> d!91242 (= (arrayBitRangesEq!0 (buf!7013 w2!587) (buf!7013 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6545 (buf!7013 w2!587)) (currentByte!12955 w2!587) (currentBit!12950 w2!587))) e!189416)))

(declare-datatypes ((tuple4!438 0))(
  ( (tuple4!439 (_1!12202 (_ BitVec 32)) (_2!12202 (_ BitVec 32)) (_3!999 (_ BitVec 32)) (_4!219 (_ BitVec 32))) )
))
(declare-fun lt!408990 () tuple4!438)

(declare-fun b!269477 () Bool)

(declare-fun e!189414 () Bool)

(assert (=> b!269477 (= e!189414 (arrayRangesEq!1077 (buf!7013 w2!587) (buf!7013 w3!25) (_1!12202 lt!408990) (_2!12202 lt!408990)))))

(declare-fun b!269478 () Bool)

(declare-fun e!189417 () Bool)

(assert (=> b!269478 (= e!189416 e!189417)))

(declare-fun res!224634 () Bool)

(assert (=> b!269478 (=> (not res!224634) (not e!189417))))

(assert (=> b!269478 (= res!224634 e!189414)))

(declare-fun res!224636 () Bool)

(assert (=> b!269478 (=> res!224636 e!189414)))

(assert (=> b!269478 (= res!224636 (bvsge (_1!12202 lt!408990) (_2!12202 lt!408990)))))

(declare-fun lt!408992 () (_ BitVec 32))

(assert (=> b!269478 (= lt!408992 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6545 (buf!7013 w2!587)) (currentByte!12955 w2!587) (currentBit!12950 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!408991 () (_ BitVec 32))

(assert (=> b!269478 (= lt!408991 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!438)

(assert (=> b!269478 (= lt!408990 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6545 (buf!7013 w2!587)) (currentByte!12955 w2!587) (currentBit!12950 w2!587))))))

(declare-fun b!269479 () Bool)

(declare-fun e!189412 () Bool)

(declare-fun call!4286 () Bool)

(assert (=> b!269479 (= e!189412 call!4286)))

(declare-fun e!189415 () Bool)

(declare-fun b!269480 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!269480 (= e!189415 (byteRangesEq!0 (select (arr!7532 (buf!7013 w2!587)) (_4!219 lt!408990)) (select (arr!7532 (buf!7013 w3!25)) (_4!219 lt!408990)) #b00000000000000000000000000000000 lt!408992))))

(declare-fun b!269481 () Bool)

(declare-fun e!189413 () Bool)

(assert (=> b!269481 (= e!189412 e!189413)))

(declare-fun res!224638 () Bool)

(assert (=> b!269481 (= res!224638 call!4286)))

(assert (=> b!269481 (=> (not res!224638) (not e!189413))))

(declare-fun bm!4283 () Bool)

(declare-fun c!12435 () Bool)

(assert (=> bm!4283 (= call!4286 (byteRangesEq!0 (select (arr!7532 (buf!7013 w2!587)) (_3!999 lt!408990)) (select (arr!7532 (buf!7013 w3!25)) (_3!999 lt!408990)) lt!408991 (ite c!12435 lt!408992 #b00000000000000000000000000001000)))))

(declare-fun b!269482 () Bool)

(declare-fun res!224635 () Bool)

(assert (=> b!269482 (= res!224635 (= lt!408992 #b00000000000000000000000000000000))))

(assert (=> b!269482 (=> res!224635 e!189415)))

(assert (=> b!269482 (= e!189413 e!189415)))

(declare-fun b!269483 () Bool)

(assert (=> b!269483 (= e!189417 e!189412)))

(assert (=> b!269483 (= c!12435 (= (_3!999 lt!408990) (_4!219 lt!408990)))))

(assert (= (and d!91242 (not res!224637)) b!269478))

(assert (= (and b!269478 (not res!224636)) b!269477))

(assert (= (and b!269478 res!224634) b!269483))

(assert (= (and b!269483 c!12435) b!269479))

(assert (= (and b!269483 (not c!12435)) b!269481))

(assert (= (and b!269481 res!224638) b!269482))

(assert (= (and b!269482 (not res!224635)) b!269480))

(assert (= (or b!269479 b!269481) bm!4283))

(declare-fun m!401057 () Bool)

(assert (=> b!269477 m!401057))

(assert (=> b!269478 m!400993))

(declare-fun m!401059 () Bool)

(assert (=> b!269478 m!401059))

(declare-fun m!401061 () Bool)

(assert (=> b!269480 m!401061))

(declare-fun m!401063 () Bool)

(assert (=> b!269480 m!401063))

(assert (=> b!269480 m!401061))

(assert (=> b!269480 m!401063))

(declare-fun m!401065 () Bool)

(assert (=> b!269480 m!401065))

(declare-fun m!401067 () Bool)

(assert (=> bm!4283 m!401067))

(declare-fun m!401069 () Bool)

(assert (=> bm!4283 m!401069))

(assert (=> bm!4283 m!401067))

(assert (=> bm!4283 m!401069))

(declare-fun m!401071 () Bool)

(assert (=> bm!4283 m!401071))

(assert (=> b!269420 d!91242))

(declare-fun d!91246 () Bool)

(declare-fun e!189438 () Bool)

(assert (=> d!91246 e!189438))

(declare-fun res!224658 () Bool)

(assert (=> d!91246 (=> (not res!224658) (not e!189438))))

(declare-fun lt!409016 () (_ BitVec 64))

(declare-fun lt!409014 () (_ BitVec 64))

(declare-fun lt!409018 () (_ BitVec 64))

(assert (=> d!91246 (= res!224658 (= lt!409016 (bvsub lt!409018 lt!409014)))))

(assert (=> d!91246 (or (= (bvand lt!409018 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409014 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409018 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409018 lt!409014) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!91246 (= lt!409014 (remainingBits!0 ((_ sign_extend 32) (size!6545 (buf!7013 w2!587))) ((_ sign_extend 32) (currentByte!12955 w2!587)) ((_ sign_extend 32) (currentBit!12950 w2!587))))))

(declare-fun lt!409015 () (_ BitVec 64))

(declare-fun lt!409017 () (_ BitVec 64))

(assert (=> d!91246 (= lt!409018 (bvmul lt!409015 lt!409017))))

(assert (=> d!91246 (or (= lt!409015 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409017 (bvsdiv (bvmul lt!409015 lt!409017) lt!409015)))))

(assert (=> d!91246 (= lt!409017 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91246 (= lt!409015 ((_ sign_extend 32) (size!6545 (buf!7013 w2!587))))))

(assert (=> d!91246 (= lt!409016 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12955 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12950 w2!587))))))

(assert (=> d!91246 (invariant!0 (currentBit!12950 w2!587) (currentByte!12955 w2!587) (size!6545 (buf!7013 w2!587)))))

(assert (=> d!91246 (= (bitIndex!0 (size!6545 (buf!7013 w2!587)) (currentByte!12955 w2!587) (currentBit!12950 w2!587)) lt!409016)))

(declare-fun b!269509 () Bool)

(declare-fun res!224659 () Bool)

(assert (=> b!269509 (=> (not res!224659) (not e!189438))))

(assert (=> b!269509 (= res!224659 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409016))))

(declare-fun b!269510 () Bool)

(declare-fun lt!409019 () (_ BitVec 64))

(assert (=> b!269510 (= e!189438 (bvsle lt!409016 (bvmul lt!409019 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269510 (or (= lt!409019 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409019 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409019)))))

(assert (=> b!269510 (= lt!409019 ((_ sign_extend 32) (size!6545 (buf!7013 w2!587))))))

(assert (= (and d!91246 res!224658) b!269509))

(assert (= (and b!269509 res!224659) b!269510))

(declare-fun m!401089 () Bool)

(assert (=> d!91246 m!401089))

(assert (=> d!91246 m!400999))

(assert (=> b!269420 d!91246))

(declare-fun d!91250 () Bool)

(assert (=> d!91250 (= (invariant!0 (currentBit!12950 w1!591) (currentByte!12955 w1!591) (size!6545 (buf!7013 w1!591))) (and (bvsge (currentBit!12950 w1!591) #b00000000000000000000000000000000) (bvslt (currentBit!12950 w1!591) #b00000000000000000000000000001000) (bvsge (currentByte!12955 w1!591) #b00000000000000000000000000000000) (or (bvslt (currentByte!12955 w1!591) (size!6545 (buf!7013 w1!591))) (and (= (currentBit!12950 w1!591) #b00000000000000000000000000000000) (= (currentByte!12955 w1!591) (size!6545 (buf!7013 w1!591)))))))))

(assert (=> d!91196 d!91250))

(declare-fun d!91252 () Bool)

(declare-fun e!189439 () Bool)

(assert (=> d!91252 e!189439))

(declare-fun res!224660 () Bool)

(assert (=> d!91252 (=> (not res!224660) (not e!189439))))

(declare-fun lt!409020 () (_ BitVec 64))

(declare-fun lt!409024 () (_ BitVec 64))

(declare-fun lt!409022 () (_ BitVec 64))

(assert (=> d!91252 (= res!224660 (= lt!409022 (bvsub lt!409024 lt!409020)))))

(assert (=> d!91252 (or (= (bvand lt!409024 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409020 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409024 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409024 lt!409020) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!91252 (= lt!409020 (remainingBits!0 ((_ sign_extend 32) (size!6545 (buf!7013 w1!591))) ((_ sign_extend 32) (currentByte!12955 w1!591)) ((_ sign_extend 32) (currentBit!12950 w1!591))))))

(declare-fun lt!409021 () (_ BitVec 64))

(declare-fun lt!409023 () (_ BitVec 64))

(assert (=> d!91252 (= lt!409024 (bvmul lt!409021 lt!409023))))

(assert (=> d!91252 (or (= lt!409021 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409023 (bvsdiv (bvmul lt!409021 lt!409023) lt!409021)))))

(assert (=> d!91252 (= lt!409023 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91252 (= lt!409021 ((_ sign_extend 32) (size!6545 (buf!7013 w1!591))))))

(assert (=> d!91252 (= lt!409022 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12955 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12950 w1!591))))))

(assert (=> d!91252 (invariant!0 (currentBit!12950 w1!591) (currentByte!12955 w1!591) (size!6545 (buf!7013 w1!591)))))

(assert (=> d!91252 (= (bitIndex!0 (size!6545 (buf!7013 w1!591)) (currentByte!12955 w1!591) (currentBit!12950 w1!591)) lt!409022)))

(declare-fun b!269511 () Bool)

(declare-fun res!224661 () Bool)

(assert (=> b!269511 (=> (not res!224661) (not e!189439))))

(assert (=> b!269511 (= res!224661 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409022))))

(declare-fun b!269512 () Bool)

(declare-fun lt!409025 () (_ BitVec 64))

(assert (=> b!269512 (= e!189439 (bvsle lt!409022 (bvmul lt!409025 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269512 (or (= lt!409025 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409025 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409025)))))

(assert (=> b!269512 (= lt!409025 ((_ sign_extend 32) (size!6545 (buf!7013 w1!591))))))

(assert (= (and d!91252 res!224660) b!269511))

(assert (= (and b!269511 res!224661) b!269512))

(declare-fun m!401091 () Bool)

(assert (=> d!91252 m!401091))

(assert (=> d!91252 m!400997))

(assert (=> b!269415 d!91252))

(assert (=> b!269415 d!91246))

(declare-fun d!91254 () Bool)

(assert (=> d!91254 (= (invariant!0 (currentBit!12950 w2!587) (currentByte!12955 w2!587) (size!6545 (buf!7013 w2!587))) (and (bvsge (currentBit!12950 w2!587) #b00000000000000000000000000000000) (bvslt (currentBit!12950 w2!587) #b00000000000000000000000000001000) (bvsge (currentByte!12955 w2!587) #b00000000000000000000000000000000) (or (bvslt (currentByte!12955 w2!587) (size!6545 (buf!7013 w2!587))) (and (= (currentBit!12950 w2!587) #b00000000000000000000000000000000) (= (currentByte!12955 w2!587) (size!6545 (buf!7013 w2!587)))))))))

(assert (=> d!91198 d!91254))

(declare-fun d!91256 () Bool)

(declare-fun res!224665 () Bool)

(declare-fun e!189444 () Bool)

(assert (=> d!91256 (=> res!224665 e!189444)))

(assert (=> d!91256 (= res!224665 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6545 (buf!7013 w1!591)) (currentByte!12955 w1!591) (currentBit!12950 w1!591))))))

(assert (=> d!91256 (= (arrayBitRangesEq!0 (buf!7013 w1!591) (buf!7013 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6545 (buf!7013 w1!591)) (currentByte!12955 w1!591) (currentBit!12950 w1!591))) e!189444)))

(declare-fun lt!409026 () tuple4!438)

(declare-fun b!269513 () Bool)

(declare-fun e!189442 () Bool)

(assert (=> b!269513 (= e!189442 (arrayRangesEq!1077 (buf!7013 w1!591) (buf!7013 w2!587) (_1!12202 lt!409026) (_2!12202 lt!409026)))))

(declare-fun b!269514 () Bool)

(declare-fun e!189445 () Bool)

(assert (=> b!269514 (= e!189444 e!189445)))

(declare-fun res!224662 () Bool)

(assert (=> b!269514 (=> (not res!224662) (not e!189445))))

(assert (=> b!269514 (= res!224662 e!189442)))

(declare-fun res!224664 () Bool)

(assert (=> b!269514 (=> res!224664 e!189442)))

(assert (=> b!269514 (= res!224664 (bvsge (_1!12202 lt!409026) (_2!12202 lt!409026)))))

(declare-fun lt!409028 () (_ BitVec 32))

(assert (=> b!269514 (= lt!409028 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6545 (buf!7013 w1!591)) (currentByte!12955 w1!591) (currentBit!12950 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!409027 () (_ BitVec 32))

(assert (=> b!269514 (= lt!409027 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269514 (= lt!409026 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6545 (buf!7013 w1!591)) (currentByte!12955 w1!591) (currentBit!12950 w1!591))))))

(declare-fun b!269515 () Bool)

(declare-fun e!189440 () Bool)

(declare-fun call!4290 () Bool)

(assert (=> b!269515 (= e!189440 call!4290)))

(declare-fun b!269516 () Bool)

(declare-fun e!189443 () Bool)

(assert (=> b!269516 (= e!189443 (byteRangesEq!0 (select (arr!7532 (buf!7013 w1!591)) (_4!219 lt!409026)) (select (arr!7532 (buf!7013 w2!587)) (_4!219 lt!409026)) #b00000000000000000000000000000000 lt!409028))))

(declare-fun b!269517 () Bool)

(declare-fun e!189441 () Bool)

(assert (=> b!269517 (= e!189440 e!189441)))

(declare-fun res!224666 () Bool)

(assert (=> b!269517 (= res!224666 call!4290)))

(assert (=> b!269517 (=> (not res!224666) (not e!189441))))

(declare-fun c!12439 () Bool)

(declare-fun bm!4287 () Bool)

(assert (=> bm!4287 (= call!4290 (byteRangesEq!0 (select (arr!7532 (buf!7013 w1!591)) (_3!999 lt!409026)) (select (arr!7532 (buf!7013 w2!587)) (_3!999 lt!409026)) lt!409027 (ite c!12439 lt!409028 #b00000000000000000000000000001000)))))

(declare-fun b!269518 () Bool)

(declare-fun res!224663 () Bool)

(assert (=> b!269518 (= res!224663 (= lt!409028 #b00000000000000000000000000000000))))

(assert (=> b!269518 (=> res!224663 e!189443)))

(assert (=> b!269518 (= e!189441 e!189443)))

(declare-fun b!269519 () Bool)

(assert (=> b!269519 (= e!189445 e!189440)))

(assert (=> b!269519 (= c!12439 (= (_3!999 lt!409026) (_4!219 lt!409026)))))

(assert (= (and d!91256 (not res!224665)) b!269514))

(assert (= (and b!269514 (not res!224664)) b!269513))

(assert (= (and b!269514 res!224662) b!269519))

(assert (= (and b!269519 c!12439) b!269515))

(assert (= (and b!269519 (not c!12439)) b!269517))

(assert (= (and b!269517 res!224666) b!269518))

(assert (= (and b!269518 (not res!224663)) b!269516))

(assert (= (or b!269515 b!269517) bm!4287))

(declare-fun m!401093 () Bool)

(assert (=> b!269513 m!401093))

(assert (=> b!269514 m!400991))

(declare-fun m!401095 () Bool)

(assert (=> b!269514 m!401095))

(declare-fun m!401097 () Bool)

(assert (=> b!269516 m!401097))

(declare-fun m!401099 () Bool)

(assert (=> b!269516 m!401099))

(assert (=> b!269516 m!401097))

(assert (=> b!269516 m!401099))

(declare-fun m!401101 () Bool)

(assert (=> b!269516 m!401101))

(declare-fun m!401103 () Bool)

(assert (=> bm!4287 m!401103))

(declare-fun m!401105 () Bool)

(assert (=> bm!4287 m!401105))

(assert (=> bm!4287 m!401103))

(assert (=> bm!4287 m!401105))

(declare-fun m!401107 () Bool)

(assert (=> bm!4287 m!401107))

(assert (=> b!269417 d!91256))

(assert (=> b!269417 d!91252))

(assert (=> b!269418 d!91246))

(declare-fun d!91258 () Bool)

(declare-fun e!189446 () Bool)

(assert (=> d!91258 e!189446))

(declare-fun res!224667 () Bool)

(assert (=> d!91258 (=> (not res!224667) (not e!189446))))

(declare-fun lt!409033 () (_ BitVec 64))

(declare-fun lt!409031 () (_ BitVec 64))

(declare-fun lt!409029 () (_ BitVec 64))

(assert (=> d!91258 (= res!224667 (= lt!409031 (bvsub lt!409033 lt!409029)))))

(assert (=> d!91258 (or (= (bvand lt!409033 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409029 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409033 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409033 lt!409029) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!91258 (= lt!409029 (remainingBits!0 ((_ sign_extend 32) (size!6545 (buf!7013 w3!25))) ((_ sign_extend 32) (currentByte!12955 w3!25)) ((_ sign_extend 32) (currentBit!12950 w3!25))))))

(declare-fun lt!409030 () (_ BitVec 64))

(declare-fun lt!409032 () (_ BitVec 64))

(assert (=> d!91258 (= lt!409033 (bvmul lt!409030 lt!409032))))

(assert (=> d!91258 (or (= lt!409030 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409032 (bvsdiv (bvmul lt!409030 lt!409032) lt!409030)))))

(assert (=> d!91258 (= lt!409032 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91258 (= lt!409030 ((_ sign_extend 32) (size!6545 (buf!7013 w3!25))))))

(assert (=> d!91258 (= lt!409031 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12955 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12950 w3!25))))))

(assert (=> d!91258 (invariant!0 (currentBit!12950 w3!25) (currentByte!12955 w3!25) (size!6545 (buf!7013 w3!25)))))

(assert (=> d!91258 (= (bitIndex!0 (size!6545 (buf!7013 w3!25)) (currentByte!12955 w3!25) (currentBit!12950 w3!25)) lt!409031)))

(declare-fun b!269520 () Bool)

(declare-fun res!224668 () Bool)

(assert (=> b!269520 (=> (not res!224668) (not e!189446))))

(assert (=> b!269520 (= res!224668 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409031))))

(declare-fun b!269521 () Bool)

(declare-fun lt!409034 () (_ BitVec 64))

(assert (=> b!269521 (= e!189446 (bvsle lt!409031 (bvmul lt!409034 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269521 (or (= lt!409034 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409034 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409034)))))

(assert (=> b!269521 (= lt!409034 ((_ sign_extend 32) (size!6545 (buf!7013 w3!25))))))

(assert (= (and d!91258 res!224667) b!269520))

(assert (= (and b!269520 res!224668) b!269521))

(declare-fun m!401109 () Bool)

(assert (=> d!91258 m!401109))

(assert (=> d!91258 m!401001))

(assert (=> b!269418 d!91258))

(declare-fun d!91260 () Bool)

(assert (=> d!91260 (= (invariant!0 (currentBit!12950 w3!25) (currentByte!12955 w3!25) (size!6545 (buf!7013 w3!25))) (and (bvsge (currentBit!12950 w3!25) #b00000000000000000000000000000000) (bvslt (currentBit!12950 w3!25) #b00000000000000000000000000001000) (bvsge (currentByte!12955 w3!25) #b00000000000000000000000000000000) (or (bvslt (currentByte!12955 w3!25) (size!6545 (buf!7013 w3!25))) (and (= (currentBit!12950 w3!25) #b00000000000000000000000000000000) (= (currentByte!12955 w3!25) (size!6545 (buf!7013 w3!25)))))))))

(assert (=> d!91200 d!91260))

(declare-fun d!91262 () Bool)

(declare-fun res!224669 () Bool)

(declare-fun e!189447 () Bool)

(assert (=> d!91262 (=> res!224669 e!189447)))

(assert (=> d!91262 (= res!224669 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12955 w1!591)))))

(assert (=> d!91262 (= (arrayRangesEq!1077 (buf!7013 w1!591) (buf!7013 w2!587) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12955 w1!591)) e!189447)))

(declare-fun b!269522 () Bool)

(declare-fun e!189448 () Bool)

(assert (=> b!269522 (= e!189447 e!189448)))

(declare-fun res!224670 () Bool)

(assert (=> b!269522 (=> (not res!224670) (not e!189448))))

(assert (=> b!269522 (= res!224670 (= (select (arr!7532 (buf!7013 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7532 (buf!7013 w2!587)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!269523 () Bool)

(assert (=> b!269523 (= e!189448 (arrayRangesEq!1077 (buf!7013 w1!591) (buf!7013 w2!587) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12955 w1!591)))))

(assert (= (and d!91262 (not res!224669)) b!269522))

(assert (= (and b!269522 res!224670) b!269523))

(declare-fun m!401111 () Bool)

(assert (=> b!269522 m!401111))

(declare-fun m!401113 () Bool)

(assert (=> b!269522 m!401113))

(declare-fun m!401115 () Bool)

(assert (=> b!269523 m!401115))

(assert (=> b!269435 d!91262))

(check-sat (not b!269523) (not b!269478) (not b!269477) (not bm!4283) (not b!269514) (not d!91252) (not b!269513) (not b!269480) (not b!269516) (not d!91246) (not d!91258) (not bm!4287))
(check-sat)
(get-model)

(declare-fun d!91296 () Bool)

(assert (=> d!91296 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6545 (buf!7013 w2!587)) (currentByte!12955 w2!587) (currentBit!12950 w2!587))) (tuple4!439 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6545 (buf!7013 w2!587)) (currentByte!12955 w2!587) (currentBit!12950 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6545 (buf!7013 w2!587)) (currentByte!12955 w2!587) (currentBit!12950 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!269478 d!91296))

(declare-fun d!91298 () Bool)

(declare-fun res!224720 () Bool)

(declare-fun e!189493 () Bool)

(assert (=> d!91298 (=> res!224720 e!189493)))

(assert (=> d!91298 (= res!224720 (= (_1!12202 lt!409026) (_2!12202 lt!409026)))))

(assert (=> d!91298 (= (arrayRangesEq!1077 (buf!7013 w1!591) (buf!7013 w2!587) (_1!12202 lt!409026) (_2!12202 lt!409026)) e!189493)))

(declare-fun b!269583 () Bool)

(declare-fun e!189494 () Bool)

(assert (=> b!269583 (= e!189493 e!189494)))

(declare-fun res!224721 () Bool)

(assert (=> b!269583 (=> (not res!224721) (not e!189494))))

(assert (=> b!269583 (= res!224721 (= (select (arr!7532 (buf!7013 w1!591)) (_1!12202 lt!409026)) (select (arr!7532 (buf!7013 w2!587)) (_1!12202 lt!409026))))))

(declare-fun b!269584 () Bool)

(assert (=> b!269584 (= e!189494 (arrayRangesEq!1077 (buf!7013 w1!591) (buf!7013 w2!587) (bvadd (_1!12202 lt!409026) #b00000000000000000000000000000001) (_2!12202 lt!409026)))))

(assert (= (and d!91298 (not res!224720)) b!269583))

(assert (= (and b!269583 res!224721) b!269584))

(declare-fun m!401189 () Bool)

(assert (=> b!269583 m!401189))

(declare-fun m!401191 () Bool)

(assert (=> b!269583 m!401191))

(declare-fun m!401193 () Bool)

(assert (=> b!269584 m!401193))

(assert (=> b!269513 d!91298))

(declare-fun d!91300 () Bool)

(assert (=> d!91300 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6545 (buf!7013 w1!591)) (currentByte!12955 w1!591) (currentBit!12950 w1!591))) (tuple4!439 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6545 (buf!7013 w1!591)) (currentByte!12955 w1!591) (currentBit!12950 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6545 (buf!7013 w1!591)) (currentByte!12955 w1!591) (currentBit!12950 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!269514 d!91300))

(declare-fun d!91302 () Bool)

(assert (=> d!91302 (= (byteRangesEq!0 (select (arr!7532 (buf!7013 w2!587)) (_4!219 lt!408990)) (select (arr!7532 (buf!7013 w3!25)) (_4!219 lt!408990)) #b00000000000000000000000000000000 lt!408992) (or (= #b00000000000000000000000000000000 lt!408992) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7532 (buf!7013 w2!587)) (_4!219 lt!408990))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!408992))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7532 (buf!7013 w3!25)) (_4!219 lt!408990))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!408992))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23115 () Bool)

(assert (= bs!23115 d!91302))

(declare-fun m!401195 () Bool)

(assert (=> bs!23115 m!401195))

(declare-fun m!401197 () Bool)

(assert (=> bs!23115 m!401197))

(assert (=> b!269480 d!91302))

(declare-fun d!91304 () Bool)

(assert (=> d!91304 (= (remainingBits!0 ((_ sign_extend 32) (size!6545 (buf!7013 w1!591))) ((_ sign_extend 32) (currentByte!12955 w1!591)) ((_ sign_extend 32) (currentBit!12950 w1!591))) (bvsub (bvmul ((_ sign_extend 32) (size!6545 (buf!7013 w1!591))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12955 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12950 w1!591)))))))

(assert (=> d!91252 d!91304))

(assert (=> d!91252 d!91250))

(declare-fun d!91306 () Bool)

(declare-fun res!224722 () Bool)

(declare-fun e!189495 () Bool)

(assert (=> d!91306 (=> res!224722 e!189495)))

(assert (=> d!91306 (= res!224722 (= (_1!12202 lt!408990) (_2!12202 lt!408990)))))

(assert (=> d!91306 (= (arrayRangesEq!1077 (buf!7013 w2!587) (buf!7013 w3!25) (_1!12202 lt!408990) (_2!12202 lt!408990)) e!189495)))

(declare-fun b!269585 () Bool)

(declare-fun e!189496 () Bool)

(assert (=> b!269585 (= e!189495 e!189496)))

(declare-fun res!224723 () Bool)

(assert (=> b!269585 (=> (not res!224723) (not e!189496))))

(assert (=> b!269585 (= res!224723 (= (select (arr!7532 (buf!7013 w2!587)) (_1!12202 lt!408990)) (select (arr!7532 (buf!7013 w3!25)) (_1!12202 lt!408990))))))

(declare-fun b!269586 () Bool)

(assert (=> b!269586 (= e!189496 (arrayRangesEq!1077 (buf!7013 w2!587) (buf!7013 w3!25) (bvadd (_1!12202 lt!408990) #b00000000000000000000000000000001) (_2!12202 lt!408990)))))

(assert (= (and d!91306 (not res!224722)) b!269585))

(assert (= (and b!269585 res!224723) b!269586))

(declare-fun m!401199 () Bool)

(assert (=> b!269585 m!401199))

(declare-fun m!401201 () Bool)

(assert (=> b!269585 m!401201))

(declare-fun m!401203 () Bool)

(assert (=> b!269586 m!401203))

(assert (=> b!269477 d!91306))

(declare-fun d!91308 () Bool)

(assert (=> d!91308 (= (byteRangesEq!0 (select (arr!7532 (buf!7013 w1!591)) (_3!999 lt!409026)) (select (arr!7532 (buf!7013 w2!587)) (_3!999 lt!409026)) lt!409027 (ite c!12439 lt!409028 #b00000000000000000000000000001000)) (or (= lt!409027 (ite c!12439 lt!409028 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7532 (buf!7013 w1!591)) (_3!999 lt!409026))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!12439 lt!409028 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409027)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7532 (buf!7013 w2!587)) (_3!999 lt!409026))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!12439 lt!409028 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409027)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23116 () Bool)

(assert (= bs!23116 d!91308))

(declare-fun m!401205 () Bool)

(assert (=> bs!23116 m!401205))

(declare-fun m!401207 () Bool)

(assert (=> bs!23116 m!401207))

(assert (=> bm!4287 d!91308))

(declare-fun d!91310 () Bool)

(declare-fun res!224724 () Bool)

(declare-fun e!189497 () Bool)

(assert (=> d!91310 (=> res!224724 e!189497)))

(assert (=> d!91310 (= res!224724 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12955 w1!591)))))

(assert (=> d!91310 (= (arrayRangesEq!1077 (buf!7013 w1!591) (buf!7013 w2!587) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12955 w1!591)) e!189497)))

(declare-fun b!269587 () Bool)

(declare-fun e!189498 () Bool)

(assert (=> b!269587 (= e!189497 e!189498)))

(declare-fun res!224725 () Bool)

(assert (=> b!269587 (=> (not res!224725) (not e!189498))))

(assert (=> b!269587 (= res!224725 (= (select (arr!7532 (buf!7013 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!7532 (buf!7013 w2!587)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!269588 () Bool)

(assert (=> b!269588 (= e!189498 (arrayRangesEq!1077 (buf!7013 w1!591) (buf!7013 w2!587) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12955 w1!591)))))

(assert (= (and d!91310 (not res!224724)) b!269587))

(assert (= (and b!269587 res!224725) b!269588))

(declare-fun m!401209 () Bool)

(assert (=> b!269587 m!401209))

(declare-fun m!401211 () Bool)

(assert (=> b!269587 m!401211))

(declare-fun m!401213 () Bool)

(assert (=> b!269588 m!401213))

(assert (=> b!269523 d!91310))

(declare-fun d!91312 () Bool)

(assert (=> d!91312 (= (remainingBits!0 ((_ sign_extend 32) (size!6545 (buf!7013 w2!587))) ((_ sign_extend 32) (currentByte!12955 w2!587)) ((_ sign_extend 32) (currentBit!12950 w2!587))) (bvsub (bvmul ((_ sign_extend 32) (size!6545 (buf!7013 w2!587))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12955 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12950 w2!587)))))))

(assert (=> d!91246 d!91312))

(assert (=> d!91246 d!91254))

(declare-fun d!91314 () Bool)

(assert (=> d!91314 (= (byteRangesEq!0 (select (arr!7532 (buf!7013 w1!591)) (_4!219 lt!409026)) (select (arr!7532 (buf!7013 w2!587)) (_4!219 lt!409026)) #b00000000000000000000000000000000 lt!409028) (or (= #b00000000000000000000000000000000 lt!409028) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7532 (buf!7013 w1!591)) (_4!219 lt!409026))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409028))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7532 (buf!7013 w2!587)) (_4!219 lt!409026))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409028))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23117 () Bool)

(assert (= bs!23117 d!91314))

(declare-fun m!401215 () Bool)

(assert (=> bs!23117 m!401215))

(assert (=> bs!23117 m!401197))

(assert (=> b!269516 d!91314))

(declare-fun d!91316 () Bool)

(assert (=> d!91316 (= (remainingBits!0 ((_ sign_extend 32) (size!6545 (buf!7013 w3!25))) ((_ sign_extend 32) (currentByte!12955 w3!25)) ((_ sign_extend 32) (currentBit!12950 w3!25))) (bvsub (bvmul ((_ sign_extend 32) (size!6545 (buf!7013 w3!25))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12955 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12950 w3!25)))))))

(assert (=> d!91258 d!91316))

(assert (=> d!91258 d!91260))

(declare-fun d!91318 () Bool)

(assert (=> d!91318 (= (byteRangesEq!0 (select (arr!7532 (buf!7013 w2!587)) (_3!999 lt!408990)) (select (arr!7532 (buf!7013 w3!25)) (_3!999 lt!408990)) lt!408991 (ite c!12435 lt!408992 #b00000000000000000000000000001000)) (or (= lt!408991 (ite c!12435 lt!408992 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7532 (buf!7013 w2!587)) (_3!999 lt!408990))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!12435 lt!408992 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!408991)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7532 (buf!7013 w3!25)) (_3!999 lt!408990))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!12435 lt!408992 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!408991)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23118 () Bool)

(assert (= bs!23118 d!91318))

(declare-fun m!401217 () Bool)

(assert (=> bs!23118 m!401217))

(declare-fun m!401219 () Bool)

(assert (=> bs!23118 m!401219))

(assert (=> bm!4283 d!91318))

(check-sat (not b!269584) (not b!269586) (not b!269588))
