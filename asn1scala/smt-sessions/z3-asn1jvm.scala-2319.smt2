; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58966 () Bool)

(assert start!58966)

(declare-fun b!270411 () Bool)

(declare-fun e!190291 () Bool)

(declare-datatypes ((array!15073 0))(
  ( (array!15074 (arr!7550 (Array (_ BitVec 32) (_ BitVec 8))) (size!6563 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11940 0))(
  ( (BitStream!11941 (buf!7031 array!15073) (currentByte!12996 (_ BitVec 32)) (currentBit!12991 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11940)

(declare-fun array_inv!6287 (array!15073) Bool)

(assert (=> b!270411 (= e!190291 (array_inv!6287 (buf!7031 w1!591)))))

(declare-fun b!270412 () Bool)

(declare-fun e!190294 () Bool)

(declare-fun w3!25 () BitStream!11940)

(assert (=> b!270412 (= e!190294 (array_inv!6287 (buf!7031 w3!25)))))

(declare-fun res!225350 () Bool)

(declare-fun e!190293 () Bool)

(assert (=> start!58966 (=> (not res!225350) (not e!190293))))

(declare-fun w2!587 () BitStream!11940)

(declare-fun isPrefixOf!0 (BitStream!11940 BitStream!11940) Bool)

(assert (=> start!58966 (= res!225350 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58966 e!190293))

(declare-fun inv!12 (BitStream!11940) Bool)

(assert (=> start!58966 (and (inv!12 w1!591) e!190291)))

(declare-fun e!190290 () Bool)

(assert (=> start!58966 (and (inv!12 w2!587) e!190290)))

(assert (=> start!58966 (and (inv!12 w3!25) e!190294)))

(declare-fun b!270413 () Bool)

(assert (=> b!270413 (= e!190290 (array_inv!6287 (buf!7031 w2!587)))))

(declare-fun b!270414 () Bool)

(declare-fun res!225352 () Bool)

(assert (=> b!270414 (=> (not res!225352) (not e!190293))))

(assert (=> b!270414 (= res!225352 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!270415 () Bool)

(declare-fun e!190296 () Bool)

(declare-fun arrayRangesEq!1095 (array!15073 array!15073 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!270415 (= e!190296 (arrayRangesEq!1095 (buf!7031 w2!587) (buf!7031 w3!25) #b00000000000000000000000000000000 (currentByte!12996 w2!587)))))

(declare-fun b!270416 () Bool)

(assert (=> b!270416 (= e!190293 (not e!190296))))

(declare-fun res!225351 () Bool)

(assert (=> b!270416 (=> res!225351 e!190296)))

(assert (=> b!270416 (= res!225351 (or (bvsge (currentByte!12996 w1!591) (size!6563 (buf!7031 w1!591))) (bvsge (currentByte!12996 w1!591) (currentByte!12996 w2!587)) (bvsgt #b00000000000000000000000000000000 (currentByte!12996 w2!587)) (bvsgt (size!6563 (buf!7031 w2!587)) (size!6563 (buf!7031 w3!25))) (bvsgt (currentByte!12996 w2!587) (size!6563 (buf!7031 w2!587))) (bvsgt #b00000000000000000000000000000000 (currentByte!12996 w1!591))))))

(assert (=> b!270416 (arrayRangesEq!1095 (buf!7031 w1!591) (buf!7031 w3!25) #b00000000000000000000000000000000 (currentByte!12996 w1!591))))

(declare-datatypes ((Unit!19081 0))(
  ( (Unit!19082) )
))
(declare-fun lt!409436 () Unit!19081)

(declare-fun arrayRangesEqTransitive!358 (array!15073 array!15073 array!15073 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19081)

(assert (=> b!270416 (= lt!409436 (arrayRangesEqTransitive!358 (buf!7031 w1!591) (buf!7031 w2!587) (buf!7031 w3!25) #b00000000000000000000000000000000 (currentByte!12996 w1!591) (currentByte!12996 w2!587)))))

(assert (= (and start!58966 res!225350) b!270414))

(assert (= (and b!270414 res!225352) b!270416))

(assert (= (and b!270416 (not res!225351)) b!270415))

(assert (= start!58966 b!270411))

(assert (= start!58966 b!270413))

(assert (= start!58966 b!270412))

(declare-fun m!402307 () Bool)

(assert (=> start!58966 m!402307))

(declare-fun m!402309 () Bool)

(assert (=> start!58966 m!402309))

(declare-fun m!402311 () Bool)

(assert (=> start!58966 m!402311))

(declare-fun m!402313 () Bool)

(assert (=> start!58966 m!402313))

(declare-fun m!402315 () Bool)

(assert (=> b!270415 m!402315))

(declare-fun m!402317 () Bool)

(assert (=> b!270411 m!402317))

(declare-fun m!402319 () Bool)

(assert (=> b!270416 m!402319))

(declare-fun m!402321 () Bool)

(assert (=> b!270416 m!402321))

(declare-fun m!402323 () Bool)

(assert (=> b!270413 m!402323))

(declare-fun m!402325 () Bool)

(assert (=> b!270412 m!402325))

(declare-fun m!402327 () Bool)

(assert (=> b!270414 m!402327))

(check-sat (not b!270412) (not b!270413) (not b!270416) (not b!270414) (not b!270415) (not b!270411) (not start!58966))
(check-sat)
(get-model)

(declare-fun d!91848 () Bool)

(assert (=> d!91848 (= (array_inv!6287 (buf!7031 w3!25)) (bvsge (size!6563 (buf!7031 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!270412 d!91848))

(declare-fun d!91850 () Bool)

(assert (=> d!91850 (= (array_inv!6287 (buf!7031 w1!591)) (bvsge (size!6563 (buf!7031 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!270411 d!91850))

(declare-fun d!91852 () Bool)

(assert (=> d!91852 (= (array_inv!6287 (buf!7031 w2!587)) (bvsge (size!6563 (buf!7031 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!270413 d!91852))

(declare-fun d!91856 () Bool)

(declare-fun res!225408 () Bool)

(declare-fun e!190358 () Bool)

(assert (=> d!91856 (=> (not res!225408) (not e!190358))))

(assert (=> d!91856 (= res!225408 (= (size!6563 (buf!7031 w2!587)) (size!6563 (buf!7031 w3!25))))))

(assert (=> d!91856 (= (isPrefixOf!0 w2!587 w3!25) e!190358)))

(declare-fun b!270481 () Bool)

(declare-fun res!225410 () Bool)

(assert (=> b!270481 (=> (not res!225410) (not e!190358))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!270481 (= res!225410 (bvsle (bitIndex!0 (size!6563 (buf!7031 w2!587)) (currentByte!12996 w2!587) (currentBit!12991 w2!587)) (bitIndex!0 (size!6563 (buf!7031 w3!25)) (currentByte!12996 w3!25) (currentBit!12991 w3!25))))))

(declare-fun b!270482 () Bool)

(declare-fun e!190359 () Bool)

(assert (=> b!270482 (= e!190358 e!190359)))

(declare-fun res!225409 () Bool)

(assert (=> b!270482 (=> res!225409 e!190359)))

(assert (=> b!270482 (= res!225409 (= (size!6563 (buf!7031 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!270483 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15073 array!15073 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!270483 (= e!190359 (arrayBitRangesEq!0 (buf!7031 w2!587) (buf!7031 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6563 (buf!7031 w2!587)) (currentByte!12996 w2!587) (currentBit!12991 w2!587))))))

(assert (= (and d!91856 res!225408) b!270481))

(assert (= (and b!270481 res!225410) b!270482))

(assert (= (and b!270482 (not res!225409)) b!270483))

(declare-fun m!402407 () Bool)

(assert (=> b!270481 m!402407))

(declare-fun m!402409 () Bool)

(assert (=> b!270481 m!402409))

(assert (=> b!270483 m!402407))

(assert (=> b!270483 m!402407))

(declare-fun m!402411 () Bool)

(assert (=> b!270483 m!402411))

(assert (=> b!270414 d!91856))

(declare-fun d!91892 () Bool)

(declare-fun res!225415 () Bool)

(declare-fun e!190364 () Bool)

(assert (=> d!91892 (=> res!225415 e!190364)))

(assert (=> d!91892 (= res!225415 (= #b00000000000000000000000000000000 (currentByte!12996 w1!591)))))

(assert (=> d!91892 (= (arrayRangesEq!1095 (buf!7031 w1!591) (buf!7031 w3!25) #b00000000000000000000000000000000 (currentByte!12996 w1!591)) e!190364)))

(declare-fun b!270488 () Bool)

(declare-fun e!190365 () Bool)

(assert (=> b!270488 (= e!190364 e!190365)))

(declare-fun res!225416 () Bool)

(assert (=> b!270488 (=> (not res!225416) (not e!190365))))

(assert (=> b!270488 (= res!225416 (= (select (arr!7550 (buf!7031 w1!591)) #b00000000000000000000000000000000) (select (arr!7550 (buf!7031 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!270489 () Bool)

(assert (=> b!270489 (= e!190365 (arrayRangesEq!1095 (buf!7031 w1!591) (buf!7031 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12996 w1!591)))))

(assert (= (and d!91892 (not res!225415)) b!270488))

(assert (= (and b!270488 res!225416) b!270489))

(declare-fun m!402413 () Bool)

(assert (=> b!270488 m!402413))

(declare-fun m!402415 () Bool)

(assert (=> b!270488 m!402415))

(declare-fun m!402417 () Bool)

(assert (=> b!270489 m!402417))

(assert (=> b!270416 d!91892))

(declare-fun d!91894 () Bool)

(assert (=> d!91894 (arrayRangesEq!1095 (buf!7031 w1!591) (buf!7031 w3!25) #b00000000000000000000000000000000 (currentByte!12996 w1!591))))

(declare-fun lt!409448 () Unit!19081)

(declare-fun choose!397 (array!15073 array!15073 array!15073 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19081)

(assert (=> d!91894 (= lt!409448 (choose!397 (buf!7031 w1!591) (buf!7031 w2!587) (buf!7031 w3!25) #b00000000000000000000000000000000 (currentByte!12996 w1!591) (currentByte!12996 w2!587)))))

(assert (=> d!91894 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!12996 w1!591)) (bvsle (currentByte!12996 w1!591) (currentByte!12996 w2!587)))))

(assert (=> d!91894 (= (arrayRangesEqTransitive!358 (buf!7031 w1!591) (buf!7031 w2!587) (buf!7031 w3!25) #b00000000000000000000000000000000 (currentByte!12996 w1!591) (currentByte!12996 w2!587)) lt!409448)))

(declare-fun bs!23217 () Bool)

(assert (= bs!23217 d!91894))

(assert (=> bs!23217 m!402319))

(declare-fun m!402419 () Bool)

(assert (=> bs!23217 m!402419))

(assert (=> b!270416 d!91894))

(declare-fun d!91896 () Bool)

(declare-fun res!225417 () Bool)

(declare-fun e!190366 () Bool)

(assert (=> d!91896 (=> (not res!225417) (not e!190366))))

(assert (=> d!91896 (= res!225417 (= (size!6563 (buf!7031 w1!591)) (size!6563 (buf!7031 w2!587))))))

(assert (=> d!91896 (= (isPrefixOf!0 w1!591 w2!587) e!190366)))

(declare-fun b!270490 () Bool)

(declare-fun res!225419 () Bool)

(assert (=> b!270490 (=> (not res!225419) (not e!190366))))

(assert (=> b!270490 (= res!225419 (bvsle (bitIndex!0 (size!6563 (buf!7031 w1!591)) (currentByte!12996 w1!591) (currentBit!12991 w1!591)) (bitIndex!0 (size!6563 (buf!7031 w2!587)) (currentByte!12996 w2!587) (currentBit!12991 w2!587))))))

(declare-fun b!270491 () Bool)

(declare-fun e!190367 () Bool)

(assert (=> b!270491 (= e!190366 e!190367)))

(declare-fun res!225418 () Bool)

(assert (=> b!270491 (=> res!225418 e!190367)))

(assert (=> b!270491 (= res!225418 (= (size!6563 (buf!7031 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!270492 () Bool)

(assert (=> b!270492 (= e!190367 (arrayBitRangesEq!0 (buf!7031 w1!591) (buf!7031 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6563 (buf!7031 w1!591)) (currentByte!12996 w1!591) (currentBit!12991 w1!591))))))

(assert (= (and d!91896 res!225417) b!270490))

(assert (= (and b!270490 res!225419) b!270491))

(assert (= (and b!270491 (not res!225418)) b!270492))

(declare-fun m!402421 () Bool)

(assert (=> b!270490 m!402421))

(assert (=> b!270490 m!402407))

(assert (=> b!270492 m!402421))

(assert (=> b!270492 m!402421))

(declare-fun m!402423 () Bool)

(assert (=> b!270492 m!402423))

(assert (=> start!58966 d!91896))

(declare-fun d!91898 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!91898 (= (inv!12 w1!591) (invariant!0 (currentBit!12991 w1!591) (currentByte!12996 w1!591) (size!6563 (buf!7031 w1!591))))))

(declare-fun bs!23218 () Bool)

(assert (= bs!23218 d!91898))

(declare-fun m!402425 () Bool)

(assert (=> bs!23218 m!402425))

(assert (=> start!58966 d!91898))

(declare-fun d!91900 () Bool)

(assert (=> d!91900 (= (inv!12 w2!587) (invariant!0 (currentBit!12991 w2!587) (currentByte!12996 w2!587) (size!6563 (buf!7031 w2!587))))))

(declare-fun bs!23219 () Bool)

(assert (= bs!23219 d!91900))

(declare-fun m!402427 () Bool)

(assert (=> bs!23219 m!402427))

(assert (=> start!58966 d!91900))

(declare-fun d!91902 () Bool)

(assert (=> d!91902 (= (inv!12 w3!25) (invariant!0 (currentBit!12991 w3!25) (currentByte!12996 w3!25) (size!6563 (buf!7031 w3!25))))))

(declare-fun bs!23220 () Bool)

(assert (= bs!23220 d!91902))

(declare-fun m!402429 () Bool)

(assert (=> bs!23220 m!402429))

(assert (=> start!58966 d!91902))

(declare-fun d!91904 () Bool)

(declare-fun res!225420 () Bool)

(declare-fun e!190368 () Bool)

(assert (=> d!91904 (=> res!225420 e!190368)))

(assert (=> d!91904 (= res!225420 (= #b00000000000000000000000000000000 (currentByte!12996 w2!587)))))

(assert (=> d!91904 (= (arrayRangesEq!1095 (buf!7031 w2!587) (buf!7031 w3!25) #b00000000000000000000000000000000 (currentByte!12996 w2!587)) e!190368)))

(declare-fun b!270493 () Bool)

(declare-fun e!190369 () Bool)

(assert (=> b!270493 (= e!190368 e!190369)))

(declare-fun res!225421 () Bool)

(assert (=> b!270493 (=> (not res!225421) (not e!190369))))

(assert (=> b!270493 (= res!225421 (= (select (arr!7550 (buf!7031 w2!587)) #b00000000000000000000000000000000) (select (arr!7550 (buf!7031 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!270494 () Bool)

(assert (=> b!270494 (= e!190369 (arrayRangesEq!1095 (buf!7031 w2!587) (buf!7031 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12996 w2!587)))))

(assert (= (and d!91904 (not res!225420)) b!270493))

(assert (= (and b!270493 res!225421) b!270494))

(declare-fun m!402431 () Bool)

(assert (=> b!270493 m!402431))

(assert (=> b!270493 m!402415))

(declare-fun m!402433 () Bool)

(assert (=> b!270494 m!402433))

(assert (=> b!270415 d!91904))

(check-sat (not b!270492) (not b!270483) (not d!91902) (not d!91894) (not b!270494) (not b!270489) (not d!91898) (not b!270490) (not b!270481) (not d!91900))
(check-sat)
(get-model)

(assert (=> d!91894 d!91892))

(declare-fun d!91908 () Bool)

(assert (=> d!91908 (arrayRangesEq!1095 (buf!7031 w1!591) (buf!7031 w3!25) #b00000000000000000000000000000000 (currentByte!12996 w1!591))))

(assert (=> d!91908 true))

(declare-fun _$16!134 () Unit!19081)

(assert (=> d!91908 (= (choose!397 (buf!7031 w1!591) (buf!7031 w2!587) (buf!7031 w3!25) #b00000000000000000000000000000000 (currentByte!12996 w1!591) (currentByte!12996 w2!587)) _$16!134)))

(declare-fun bs!23221 () Bool)

(assert (= bs!23221 d!91908))

(assert (=> bs!23221 m!402319))

(assert (=> d!91894 d!91908))

(declare-fun d!91910 () Bool)

(assert (=> d!91910 (= (invariant!0 (currentBit!12991 w3!25) (currentByte!12996 w3!25) (size!6563 (buf!7031 w3!25))) (and (bvsge (currentBit!12991 w3!25) #b00000000000000000000000000000000) (bvslt (currentBit!12991 w3!25) #b00000000000000000000000000001000) (bvsge (currentByte!12996 w3!25) #b00000000000000000000000000000000) (or (bvslt (currentByte!12996 w3!25) (size!6563 (buf!7031 w3!25))) (and (= (currentBit!12991 w3!25) #b00000000000000000000000000000000) (= (currentByte!12996 w3!25) (size!6563 (buf!7031 w3!25)))))))))

(assert (=> d!91902 d!91910))

(declare-fun d!91912 () Bool)

(declare-fun res!225422 () Bool)

(declare-fun e!190370 () Bool)

(assert (=> d!91912 (=> res!225422 e!190370)))

(assert (=> d!91912 (= res!225422 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12996 w2!587)))))

(assert (=> d!91912 (= (arrayRangesEq!1095 (buf!7031 w2!587) (buf!7031 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12996 w2!587)) e!190370)))

(declare-fun b!270495 () Bool)

(declare-fun e!190371 () Bool)

(assert (=> b!270495 (= e!190370 e!190371)))

(declare-fun res!225423 () Bool)

(assert (=> b!270495 (=> (not res!225423) (not e!190371))))

(assert (=> b!270495 (= res!225423 (= (select (arr!7550 (buf!7031 w2!587)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7550 (buf!7031 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!270496 () Bool)

(assert (=> b!270496 (= e!190371 (arrayRangesEq!1095 (buf!7031 w2!587) (buf!7031 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12996 w2!587)))))

(assert (= (and d!91912 (not res!225422)) b!270495))

(assert (= (and b!270495 res!225423) b!270496))

(declare-fun m!402435 () Bool)

(assert (=> b!270495 m!402435))

(declare-fun m!402437 () Bool)

(assert (=> b!270495 m!402437))

(declare-fun m!402439 () Bool)

(assert (=> b!270496 m!402439))

(assert (=> b!270494 d!91912))

(declare-fun d!91914 () Bool)

(declare-fun e!190382 () Bool)

(assert (=> d!91914 e!190382))

(declare-fun res!225440 () Bool)

(assert (=> d!91914 (=> (not res!225440) (not e!190382))))

(declare-fun lt!409490 () (_ BitVec 64))

(declare-fun lt!409486 () (_ BitVec 64))

(declare-fun lt!409489 () (_ BitVec 64))

(assert (=> d!91914 (= res!225440 (= lt!409489 (bvsub lt!409490 lt!409486)))))

(assert (=> d!91914 (or (= (bvand lt!409490 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409486 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409490 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409490 lt!409486) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!91914 (= lt!409486 (remainingBits!0 ((_ sign_extend 32) (size!6563 (buf!7031 w2!587))) ((_ sign_extend 32) (currentByte!12996 w2!587)) ((_ sign_extend 32) (currentBit!12991 w2!587))))))

(declare-fun lt!409488 () (_ BitVec 64))

(declare-fun lt!409487 () (_ BitVec 64))

(assert (=> d!91914 (= lt!409490 (bvmul lt!409488 lt!409487))))

(assert (=> d!91914 (or (= lt!409488 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409487 (bvsdiv (bvmul lt!409488 lt!409487) lt!409488)))))

(assert (=> d!91914 (= lt!409487 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91914 (= lt!409488 ((_ sign_extend 32) (size!6563 (buf!7031 w2!587))))))

(assert (=> d!91914 (= lt!409489 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12996 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12991 w2!587))))))

(assert (=> d!91914 (invariant!0 (currentBit!12991 w2!587) (currentByte!12996 w2!587) (size!6563 (buf!7031 w2!587)))))

(assert (=> d!91914 (= (bitIndex!0 (size!6563 (buf!7031 w2!587)) (currentByte!12996 w2!587) (currentBit!12991 w2!587)) lt!409489)))

(declare-fun b!270513 () Bool)

(declare-fun res!225441 () Bool)

(assert (=> b!270513 (=> (not res!225441) (not e!190382))))

(assert (=> b!270513 (= res!225441 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409489))))

(declare-fun b!270514 () Bool)

(declare-fun lt!409485 () (_ BitVec 64))

(assert (=> b!270514 (= e!190382 (bvsle lt!409489 (bvmul lt!409485 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!270514 (or (= lt!409485 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409485 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409485)))))

(assert (=> b!270514 (= lt!409485 ((_ sign_extend 32) (size!6563 (buf!7031 w2!587))))))

(assert (= (and d!91914 res!225440) b!270513))

(assert (= (and b!270513 res!225441) b!270514))

(declare-fun m!402455 () Bool)

(assert (=> d!91914 m!402455))

(assert (=> d!91914 m!402427))

(assert (=> b!270481 d!91914))

(declare-fun d!91928 () Bool)

(declare-fun e!190383 () Bool)

(assert (=> d!91928 e!190383))

(declare-fun res!225442 () Bool)

(assert (=> d!91928 (=> (not res!225442) (not e!190383))))

(declare-fun lt!409492 () (_ BitVec 64))

(declare-fun lt!409495 () (_ BitVec 64))

(declare-fun lt!409496 () (_ BitVec 64))

(assert (=> d!91928 (= res!225442 (= lt!409495 (bvsub lt!409496 lt!409492)))))

(assert (=> d!91928 (or (= (bvand lt!409496 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409492 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409496 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409496 lt!409492) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!91928 (= lt!409492 (remainingBits!0 ((_ sign_extend 32) (size!6563 (buf!7031 w3!25))) ((_ sign_extend 32) (currentByte!12996 w3!25)) ((_ sign_extend 32) (currentBit!12991 w3!25))))))

(declare-fun lt!409494 () (_ BitVec 64))

(declare-fun lt!409493 () (_ BitVec 64))

(assert (=> d!91928 (= lt!409496 (bvmul lt!409494 lt!409493))))

(assert (=> d!91928 (or (= lt!409494 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409493 (bvsdiv (bvmul lt!409494 lt!409493) lt!409494)))))

(assert (=> d!91928 (= lt!409493 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91928 (= lt!409494 ((_ sign_extend 32) (size!6563 (buf!7031 w3!25))))))

(assert (=> d!91928 (= lt!409495 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12996 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12991 w3!25))))))

(assert (=> d!91928 (invariant!0 (currentBit!12991 w3!25) (currentByte!12996 w3!25) (size!6563 (buf!7031 w3!25)))))

(assert (=> d!91928 (= (bitIndex!0 (size!6563 (buf!7031 w3!25)) (currentByte!12996 w3!25) (currentBit!12991 w3!25)) lt!409495)))

(declare-fun b!270515 () Bool)

(declare-fun res!225443 () Bool)

(assert (=> b!270515 (=> (not res!225443) (not e!190383))))

(assert (=> b!270515 (= res!225443 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409495))))

(declare-fun b!270516 () Bool)

(declare-fun lt!409491 () (_ BitVec 64))

(assert (=> b!270516 (= e!190383 (bvsle lt!409495 (bvmul lt!409491 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!270516 (or (= lt!409491 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409491 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409491)))))

(assert (=> b!270516 (= lt!409491 ((_ sign_extend 32) (size!6563 (buf!7031 w3!25))))))

(assert (= (and d!91928 res!225442) b!270515))

(assert (= (and b!270515 res!225443) b!270516))

(declare-fun m!402457 () Bool)

(assert (=> d!91928 m!402457))

(assert (=> d!91928 m!402429))

(assert (=> b!270481 d!91928))

(declare-fun d!91932 () Bool)

(assert (=> d!91932 (= (invariant!0 (currentBit!12991 w2!587) (currentByte!12996 w2!587) (size!6563 (buf!7031 w2!587))) (and (bvsge (currentBit!12991 w2!587) #b00000000000000000000000000000000) (bvslt (currentBit!12991 w2!587) #b00000000000000000000000000001000) (bvsge (currentByte!12996 w2!587) #b00000000000000000000000000000000) (or (bvslt (currentByte!12996 w2!587) (size!6563 (buf!7031 w2!587))) (and (= (currentBit!12991 w2!587) #b00000000000000000000000000000000) (= (currentByte!12996 w2!587) (size!6563 (buf!7031 w2!587)))))))))

(assert (=> d!91900 d!91932))

(declare-fun d!91934 () Bool)

(declare-fun e!190384 () Bool)

(assert (=> d!91934 e!190384))

(declare-fun res!225444 () Bool)

(assert (=> d!91934 (=> (not res!225444) (not e!190384))))

(declare-fun lt!409502 () (_ BitVec 64))

(declare-fun lt!409498 () (_ BitVec 64))

(declare-fun lt!409501 () (_ BitVec 64))

(assert (=> d!91934 (= res!225444 (= lt!409501 (bvsub lt!409502 lt!409498)))))

(assert (=> d!91934 (or (= (bvand lt!409502 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409498 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409502 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409502 lt!409498) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!91934 (= lt!409498 (remainingBits!0 ((_ sign_extend 32) (size!6563 (buf!7031 w1!591))) ((_ sign_extend 32) (currentByte!12996 w1!591)) ((_ sign_extend 32) (currentBit!12991 w1!591))))))

(declare-fun lt!409500 () (_ BitVec 64))

(declare-fun lt!409499 () (_ BitVec 64))

(assert (=> d!91934 (= lt!409502 (bvmul lt!409500 lt!409499))))

(assert (=> d!91934 (or (= lt!409500 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409499 (bvsdiv (bvmul lt!409500 lt!409499) lt!409500)))))

(assert (=> d!91934 (= lt!409499 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91934 (= lt!409500 ((_ sign_extend 32) (size!6563 (buf!7031 w1!591))))))

(assert (=> d!91934 (= lt!409501 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12996 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12991 w1!591))))))

(assert (=> d!91934 (invariant!0 (currentBit!12991 w1!591) (currentByte!12996 w1!591) (size!6563 (buf!7031 w1!591)))))

(assert (=> d!91934 (= (bitIndex!0 (size!6563 (buf!7031 w1!591)) (currentByte!12996 w1!591) (currentBit!12991 w1!591)) lt!409501)))

(declare-fun b!270517 () Bool)

(declare-fun res!225445 () Bool)

(assert (=> b!270517 (=> (not res!225445) (not e!190384))))

(assert (=> b!270517 (= res!225445 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409501))))

(declare-fun b!270518 () Bool)

(declare-fun lt!409497 () (_ BitVec 64))

(assert (=> b!270518 (= e!190384 (bvsle lt!409501 (bvmul lt!409497 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!270518 (or (= lt!409497 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409497 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409497)))))

(assert (=> b!270518 (= lt!409497 ((_ sign_extend 32) (size!6563 (buf!7031 w1!591))))))

(assert (= (and d!91934 res!225444) b!270517))

(assert (= (and b!270517 res!225445) b!270518))

(declare-fun m!402459 () Bool)

(assert (=> d!91934 m!402459))

(assert (=> d!91934 m!402425))

(assert (=> b!270490 d!91934))

(assert (=> b!270490 d!91914))

(declare-fun b!270577 () Bool)

(declare-fun e!190436 () Bool)

(declare-fun e!190432 () Bool)

(assert (=> b!270577 (= e!190436 e!190432)))

(declare-fun res!225493 () Bool)

(assert (=> b!270577 (=> (not res!225493) (not e!190432))))

(declare-fun e!190433 () Bool)

(assert (=> b!270577 (= res!225493 e!190433)))

(declare-fun res!225492 () Bool)

(assert (=> b!270577 (=> res!225492 e!190433)))

(declare-datatypes ((tuple4!458 0))(
  ( (tuple4!459 (_1!12212 (_ BitVec 32)) (_2!12212 (_ BitVec 32)) (_3!1009 (_ BitVec 32)) (_4!229 (_ BitVec 32))) )
))
(declare-fun lt!409558 () tuple4!458)

(assert (=> b!270577 (= res!225492 (bvsge (_1!12212 lt!409558) (_2!12212 lt!409558)))))

(declare-fun lt!409559 () (_ BitVec 32))

(assert (=> b!270577 (= lt!409559 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6563 (buf!7031 w2!587)) (currentByte!12996 w2!587) (currentBit!12991 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!409557 () (_ BitVec 32))

(assert (=> b!270577 (= lt!409557 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!458)

(assert (=> b!270577 (= lt!409558 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6563 (buf!7031 w2!587)) (currentByte!12996 w2!587) (currentBit!12991 w2!587))))))

(declare-fun bm!4323 () Bool)

(declare-fun c!12475 () Bool)

(declare-fun call!4326 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4323 (= call!4326 (byteRangesEq!0 (ite c!12475 (select (arr!7550 (buf!7031 w2!587)) (_3!1009 lt!409558)) (select (arr!7550 (buf!7031 w2!587)) (_4!229 lt!409558))) (ite c!12475 (select (arr!7550 (buf!7031 w3!25)) (_3!1009 lt!409558)) (select (arr!7550 (buf!7031 w3!25)) (_4!229 lt!409558))) (ite c!12475 lt!409557 #b00000000000000000000000000000000) lt!409559))))

(declare-fun d!91936 () Bool)

(declare-fun res!225495 () Bool)

(assert (=> d!91936 (=> res!225495 e!190436)))

(assert (=> d!91936 (= res!225495 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6563 (buf!7031 w2!587)) (currentByte!12996 w2!587) (currentBit!12991 w2!587))))))

(assert (=> d!91936 (= (arrayBitRangesEq!0 (buf!7031 w2!587) (buf!7031 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6563 (buf!7031 w2!587)) (currentByte!12996 w2!587) (currentBit!12991 w2!587))) e!190436)))

(declare-fun b!270578 () Bool)

(declare-fun e!190434 () Bool)

(assert (=> b!270578 (= e!190432 e!190434)))

(assert (=> b!270578 (= c!12475 (= (_3!1009 lt!409558) (_4!229 lt!409558)))))

(declare-fun b!270579 () Bool)

(declare-fun e!190431 () Bool)

(assert (=> b!270579 (= e!190431 call!4326)))

(declare-fun b!270580 () Bool)

(declare-fun res!225496 () Bool)

(assert (=> b!270580 (= res!225496 (= lt!409559 #b00000000000000000000000000000000))))

(assert (=> b!270580 (=> res!225496 e!190431)))

(declare-fun e!190435 () Bool)

(assert (=> b!270580 (= e!190435 e!190431)))

(declare-fun b!270581 () Bool)

(assert (=> b!270581 (= e!190434 e!190435)))

(declare-fun res!225494 () Bool)

(assert (=> b!270581 (= res!225494 (byteRangesEq!0 (select (arr!7550 (buf!7031 w2!587)) (_3!1009 lt!409558)) (select (arr!7550 (buf!7031 w3!25)) (_3!1009 lt!409558)) lt!409557 #b00000000000000000000000000001000))))

(assert (=> b!270581 (=> (not res!225494) (not e!190435))))

(declare-fun b!270582 () Bool)

(assert (=> b!270582 (= e!190434 call!4326)))

(declare-fun b!270583 () Bool)

(assert (=> b!270583 (= e!190433 (arrayRangesEq!1095 (buf!7031 w2!587) (buf!7031 w3!25) (_1!12212 lt!409558) (_2!12212 lt!409558)))))

(assert (= (and d!91936 (not res!225495)) b!270577))

(assert (= (and b!270577 (not res!225492)) b!270583))

(assert (= (and b!270577 res!225493) b!270578))

(assert (= (and b!270578 c!12475) b!270582))

(assert (= (and b!270578 (not c!12475)) b!270581))

(assert (= (and b!270581 res!225494) b!270580))

(assert (= (and b!270580 (not res!225496)) b!270579))

(assert (= (or b!270582 b!270579) bm!4323))

(assert (=> b!270577 m!402407))

(declare-fun m!402511 () Bool)

(assert (=> b!270577 m!402511))

(declare-fun m!402513 () Bool)

(assert (=> bm!4323 m!402513))

(declare-fun m!402515 () Bool)

(assert (=> bm!4323 m!402515))

(declare-fun m!402517 () Bool)

(assert (=> bm!4323 m!402517))

(declare-fun m!402519 () Bool)

(assert (=> bm!4323 m!402519))

(declare-fun m!402521 () Bool)

(assert (=> bm!4323 m!402521))

(assert (=> b!270581 m!402519))

(assert (=> b!270581 m!402521))

(assert (=> b!270581 m!402519))

(assert (=> b!270581 m!402521))

(declare-fun m!402523 () Bool)

(assert (=> b!270581 m!402523))

(declare-fun m!402525 () Bool)

(assert (=> b!270583 m!402525))

(assert (=> b!270483 d!91936))

(assert (=> b!270483 d!91914))

(declare-fun b!270584 () Bool)

(declare-fun e!190442 () Bool)

(declare-fun e!190438 () Bool)

(assert (=> b!270584 (= e!190442 e!190438)))

(declare-fun res!225498 () Bool)

(assert (=> b!270584 (=> (not res!225498) (not e!190438))))

(declare-fun e!190439 () Bool)

(assert (=> b!270584 (= res!225498 e!190439)))

(declare-fun res!225497 () Bool)

(assert (=> b!270584 (=> res!225497 e!190439)))

(declare-fun lt!409561 () tuple4!458)

(assert (=> b!270584 (= res!225497 (bvsge (_1!12212 lt!409561) (_2!12212 lt!409561)))))

(declare-fun lt!409562 () (_ BitVec 32))

(assert (=> b!270584 (= lt!409562 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6563 (buf!7031 w1!591)) (currentByte!12996 w1!591) (currentBit!12991 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!409560 () (_ BitVec 32))

(assert (=> b!270584 (= lt!409560 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!270584 (= lt!409561 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6563 (buf!7031 w1!591)) (currentByte!12996 w1!591) (currentBit!12991 w1!591))))))

(declare-fun call!4327 () Bool)

(declare-fun bm!4324 () Bool)

(declare-fun c!12476 () Bool)

(assert (=> bm!4324 (= call!4327 (byteRangesEq!0 (ite c!12476 (select (arr!7550 (buf!7031 w1!591)) (_3!1009 lt!409561)) (select (arr!7550 (buf!7031 w1!591)) (_4!229 lt!409561))) (ite c!12476 (select (arr!7550 (buf!7031 w2!587)) (_3!1009 lt!409561)) (select (arr!7550 (buf!7031 w2!587)) (_4!229 lt!409561))) (ite c!12476 lt!409560 #b00000000000000000000000000000000) lt!409562))))

(declare-fun d!91962 () Bool)

(declare-fun res!225500 () Bool)

(assert (=> d!91962 (=> res!225500 e!190442)))

(assert (=> d!91962 (= res!225500 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6563 (buf!7031 w1!591)) (currentByte!12996 w1!591) (currentBit!12991 w1!591))))))

(assert (=> d!91962 (= (arrayBitRangesEq!0 (buf!7031 w1!591) (buf!7031 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6563 (buf!7031 w1!591)) (currentByte!12996 w1!591) (currentBit!12991 w1!591))) e!190442)))

(declare-fun b!270585 () Bool)

(declare-fun e!190440 () Bool)

(assert (=> b!270585 (= e!190438 e!190440)))

(assert (=> b!270585 (= c!12476 (= (_3!1009 lt!409561) (_4!229 lt!409561)))))

(declare-fun b!270586 () Bool)

(declare-fun e!190437 () Bool)

(assert (=> b!270586 (= e!190437 call!4327)))

(declare-fun b!270587 () Bool)

(declare-fun res!225501 () Bool)

(assert (=> b!270587 (= res!225501 (= lt!409562 #b00000000000000000000000000000000))))

(assert (=> b!270587 (=> res!225501 e!190437)))

(declare-fun e!190441 () Bool)

(assert (=> b!270587 (= e!190441 e!190437)))

(declare-fun b!270588 () Bool)

(assert (=> b!270588 (= e!190440 e!190441)))

(declare-fun res!225499 () Bool)

(assert (=> b!270588 (= res!225499 (byteRangesEq!0 (select (arr!7550 (buf!7031 w1!591)) (_3!1009 lt!409561)) (select (arr!7550 (buf!7031 w2!587)) (_3!1009 lt!409561)) lt!409560 #b00000000000000000000000000001000))))

(assert (=> b!270588 (=> (not res!225499) (not e!190441))))

(declare-fun b!270589 () Bool)

(assert (=> b!270589 (= e!190440 call!4327)))

(declare-fun b!270590 () Bool)

(assert (=> b!270590 (= e!190439 (arrayRangesEq!1095 (buf!7031 w1!591) (buf!7031 w2!587) (_1!12212 lt!409561) (_2!12212 lt!409561)))))

(assert (= (and d!91962 (not res!225500)) b!270584))

(assert (= (and b!270584 (not res!225497)) b!270590))

(assert (= (and b!270584 res!225498) b!270585))

(assert (= (and b!270585 c!12476) b!270589))

(assert (= (and b!270585 (not c!12476)) b!270588))

(assert (= (and b!270588 res!225499) b!270587))

(assert (= (and b!270587 (not res!225501)) b!270586))

(assert (= (or b!270589 b!270586) bm!4324))

(assert (=> b!270584 m!402421))

(declare-fun m!402527 () Bool)

(assert (=> b!270584 m!402527))

(declare-fun m!402529 () Bool)

(assert (=> bm!4324 m!402529))

(declare-fun m!402531 () Bool)

(assert (=> bm!4324 m!402531))

(declare-fun m!402533 () Bool)

(assert (=> bm!4324 m!402533))

(declare-fun m!402535 () Bool)

(assert (=> bm!4324 m!402535))

(declare-fun m!402537 () Bool)

(assert (=> bm!4324 m!402537))

(assert (=> b!270588 m!402535))

(assert (=> b!270588 m!402537))

(assert (=> b!270588 m!402535))

(assert (=> b!270588 m!402537))

(declare-fun m!402539 () Bool)

(assert (=> b!270588 m!402539))

(declare-fun m!402541 () Bool)

(assert (=> b!270590 m!402541))

(assert (=> b!270492 d!91962))

(assert (=> b!270492 d!91934))

(declare-fun d!91964 () Bool)

(declare-fun res!225502 () Bool)

(declare-fun e!190443 () Bool)

(assert (=> d!91964 (=> res!225502 e!190443)))

(assert (=> d!91964 (= res!225502 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12996 w1!591)))))

(assert (=> d!91964 (= (arrayRangesEq!1095 (buf!7031 w1!591) (buf!7031 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12996 w1!591)) e!190443)))

(declare-fun b!270591 () Bool)

(declare-fun e!190444 () Bool)

(assert (=> b!270591 (= e!190443 e!190444)))

(declare-fun res!225503 () Bool)

(assert (=> b!270591 (=> (not res!225503) (not e!190444))))

(assert (=> b!270591 (= res!225503 (= (select (arr!7550 (buf!7031 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7550 (buf!7031 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!270592 () Bool)

(assert (=> b!270592 (= e!190444 (arrayRangesEq!1095 (buf!7031 w1!591) (buf!7031 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12996 w1!591)))))

(assert (= (and d!91964 (not res!225502)) b!270591))

(assert (= (and b!270591 res!225503) b!270592))

(declare-fun m!402543 () Bool)

(assert (=> b!270591 m!402543))

(assert (=> b!270591 m!402437))

(declare-fun m!402545 () Bool)

(assert (=> b!270592 m!402545))

(assert (=> b!270489 d!91964))

(declare-fun d!91966 () Bool)

(assert (=> d!91966 (= (invariant!0 (currentBit!12991 w1!591) (currentByte!12996 w1!591) (size!6563 (buf!7031 w1!591))) (and (bvsge (currentBit!12991 w1!591) #b00000000000000000000000000000000) (bvslt (currentBit!12991 w1!591) #b00000000000000000000000000001000) (bvsge (currentByte!12996 w1!591) #b00000000000000000000000000000000) (or (bvslt (currentByte!12996 w1!591) (size!6563 (buf!7031 w1!591))) (and (= (currentBit!12991 w1!591) #b00000000000000000000000000000000) (= (currentByte!12996 w1!591) (size!6563 (buf!7031 w1!591)))))))))

(assert (=> d!91898 d!91966))

(check-sat (not d!91908) (not d!91928) (not b!270581) (not d!91934) (not b!270584) (not b!270592) (not b!270590) (not b!270496) (not bm!4324) (not d!91914) (not b!270583) (not b!270588) (not bm!4323) (not b!270577))
(check-sat)
(get-model)

(declare-fun d!91972 () Bool)

(declare-fun res!225524 () Bool)

(declare-fun e!190469 () Bool)

(assert (=> d!91972 (=> res!225524 e!190469)))

(assert (=> d!91972 (= res!225524 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12996 w1!591)))))

(assert (=> d!91972 (= (arrayRangesEq!1095 (buf!7031 w1!591) (buf!7031 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12996 w1!591)) e!190469)))

(declare-fun b!270621 () Bool)

(declare-fun e!190470 () Bool)

(assert (=> b!270621 (= e!190469 e!190470)))

(declare-fun res!225525 () Bool)

(assert (=> b!270621 (=> (not res!225525) (not e!190470))))

(assert (=> b!270621 (= res!225525 (= (select (arr!7550 (buf!7031 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!7550 (buf!7031 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!270622 () Bool)

(assert (=> b!270622 (= e!190470 (arrayRangesEq!1095 (buf!7031 w1!591) (buf!7031 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12996 w1!591)))))

(assert (= (and d!91972 (not res!225524)) b!270621))

(assert (= (and b!270621 res!225525) b!270622))

(declare-fun m!402579 () Bool)

(assert (=> b!270621 m!402579))

(declare-fun m!402581 () Bool)

(assert (=> b!270621 m!402581))

(declare-fun m!402583 () Bool)

(assert (=> b!270622 m!402583))

(assert (=> b!270592 d!91972))

(declare-fun d!91974 () Bool)

(declare-fun res!225526 () Bool)

(declare-fun e!190471 () Bool)

(assert (=> d!91974 (=> res!225526 e!190471)))

(assert (=> d!91974 (= res!225526 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12996 w2!587)))))

(assert (=> d!91974 (= (arrayRangesEq!1095 (buf!7031 w2!587) (buf!7031 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12996 w2!587)) e!190471)))

(declare-fun b!270623 () Bool)

(declare-fun e!190472 () Bool)

(assert (=> b!270623 (= e!190471 e!190472)))

(declare-fun res!225527 () Bool)

(assert (=> b!270623 (=> (not res!225527) (not e!190472))))

(assert (=> b!270623 (= res!225527 (= (select (arr!7550 (buf!7031 w2!587)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!7550 (buf!7031 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!270624 () Bool)

(assert (=> b!270624 (= e!190472 (arrayRangesEq!1095 (buf!7031 w2!587) (buf!7031 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12996 w2!587)))))

(assert (= (and d!91974 (not res!225526)) b!270623))

(assert (= (and b!270623 res!225527) b!270624))

(declare-fun m!402585 () Bool)

(assert (=> b!270623 m!402585))

(assert (=> b!270623 m!402581))

(declare-fun m!402587 () Bool)

(assert (=> b!270624 m!402587))

(assert (=> b!270496 d!91974))

(declare-fun d!91976 () Bool)

(assert (=> d!91976 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6563 (buf!7031 w2!587)) (currentByte!12996 w2!587) (currentBit!12991 w2!587))) (tuple4!459 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6563 (buf!7031 w2!587)) (currentByte!12996 w2!587) (currentBit!12991 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6563 (buf!7031 w2!587)) (currentByte!12996 w2!587) (currentBit!12991 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!270577 d!91976))

(declare-fun d!91978 () Bool)

(assert (=> d!91978 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6563 (buf!7031 w1!591)) (currentByte!12996 w1!591) (currentBit!12991 w1!591))) (tuple4!459 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6563 (buf!7031 w1!591)) (currentByte!12996 w1!591) (currentBit!12991 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6563 (buf!7031 w1!591)) (currentByte!12996 w1!591) (currentBit!12991 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!270584 d!91978))

(declare-fun d!91980 () Bool)

(assert (=> d!91980 (= (byteRangesEq!0 (ite c!12475 (select (arr!7550 (buf!7031 w2!587)) (_3!1009 lt!409558)) (select (arr!7550 (buf!7031 w2!587)) (_4!229 lt!409558))) (ite c!12475 (select (arr!7550 (buf!7031 w3!25)) (_3!1009 lt!409558)) (select (arr!7550 (buf!7031 w3!25)) (_4!229 lt!409558))) (ite c!12475 lt!409557 #b00000000000000000000000000000000) lt!409559) (or (= (ite c!12475 lt!409557 #b00000000000000000000000000000000) lt!409559) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12475 (select (arr!7550 (buf!7031 w2!587)) (_3!1009 lt!409558)) (select (arr!7550 (buf!7031 w2!587)) (_4!229 lt!409558)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409559))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12475 lt!409557 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12475 (select (arr!7550 (buf!7031 w3!25)) (_3!1009 lt!409558)) (select (arr!7550 (buf!7031 w3!25)) (_4!229 lt!409558)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409559))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12475 lt!409557 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!23224 () Bool)

(assert (= bs!23224 d!91980))

(declare-fun m!402589 () Bool)

(assert (=> bs!23224 m!402589))

(declare-fun m!402591 () Bool)

(assert (=> bs!23224 m!402591))

(assert (=> bm!4323 d!91980))

(declare-fun d!91982 () Bool)

(assert (=> d!91982 (= (byteRangesEq!0 (ite c!12476 (select (arr!7550 (buf!7031 w1!591)) (_3!1009 lt!409561)) (select (arr!7550 (buf!7031 w1!591)) (_4!229 lt!409561))) (ite c!12476 (select (arr!7550 (buf!7031 w2!587)) (_3!1009 lt!409561)) (select (arr!7550 (buf!7031 w2!587)) (_4!229 lt!409561))) (ite c!12476 lt!409560 #b00000000000000000000000000000000) lt!409562) (or (= (ite c!12476 lt!409560 #b00000000000000000000000000000000) lt!409562) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12476 (select (arr!7550 (buf!7031 w1!591)) (_3!1009 lt!409561)) (select (arr!7550 (buf!7031 w1!591)) (_4!229 lt!409561)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409562))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12476 lt!409560 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12476 (select (arr!7550 (buf!7031 w2!587)) (_3!1009 lt!409561)) (select (arr!7550 (buf!7031 w2!587)) (_4!229 lt!409561)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409562))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12476 lt!409560 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!23225 () Bool)

(assert (= bs!23225 d!91982))

(declare-fun m!402593 () Bool)

(assert (=> bs!23225 m!402593))

(declare-fun m!402595 () Bool)

(assert (=> bs!23225 m!402595))

(assert (=> bm!4324 d!91982))

(declare-fun d!91984 () Bool)

(assert (=> d!91984 (= (remainingBits!0 ((_ sign_extend 32) (size!6563 (buf!7031 w1!591))) ((_ sign_extend 32) (currentByte!12996 w1!591)) ((_ sign_extend 32) (currentBit!12991 w1!591))) (bvsub (bvmul ((_ sign_extend 32) (size!6563 (buf!7031 w1!591))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12996 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12991 w1!591)))))))

(assert (=> d!91934 d!91984))

(assert (=> d!91934 d!91966))

(declare-fun d!91986 () Bool)

(assert (=> d!91986 (= (byteRangesEq!0 (select (arr!7550 (buf!7031 w2!587)) (_3!1009 lt!409558)) (select (arr!7550 (buf!7031 w3!25)) (_3!1009 lt!409558)) lt!409557 #b00000000000000000000000000001000) (or (= lt!409557 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7550 (buf!7031 w2!587)) (_3!1009 lt!409558))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409557)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7550 (buf!7031 w3!25)) (_3!1009 lt!409558))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409557)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23226 () Bool)

(assert (= bs!23226 d!91986))

(declare-fun m!402597 () Bool)

(assert (=> bs!23226 m!402597))

(declare-fun m!402599 () Bool)

(assert (=> bs!23226 m!402599))

(assert (=> b!270581 d!91986))

(declare-fun d!91988 () Bool)

(assert (=> d!91988 (= (byteRangesEq!0 (select (arr!7550 (buf!7031 w1!591)) (_3!1009 lt!409561)) (select (arr!7550 (buf!7031 w2!587)) (_3!1009 lt!409561)) lt!409560 #b00000000000000000000000000001000) (or (= lt!409560 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7550 (buf!7031 w1!591)) (_3!1009 lt!409561))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409560)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7550 (buf!7031 w2!587)) (_3!1009 lt!409561))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409560)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23227 () Bool)

(assert (= bs!23227 d!91988))

(assert (=> bs!23227 m!402597))

(declare-fun m!402601 () Bool)

(assert (=> bs!23227 m!402601))

(assert (=> b!270588 d!91988))

(declare-fun d!91990 () Bool)

(assert (=> d!91990 (= (remainingBits!0 ((_ sign_extend 32) (size!6563 (buf!7031 w3!25))) ((_ sign_extend 32) (currentByte!12996 w3!25)) ((_ sign_extend 32) (currentBit!12991 w3!25))) (bvsub (bvmul ((_ sign_extend 32) (size!6563 (buf!7031 w3!25))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12996 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12991 w3!25)))))))

(assert (=> d!91928 d!91990))

(assert (=> d!91928 d!91910))

(assert (=> d!91908 d!91892))

(declare-fun d!91992 () Bool)

(declare-fun res!225528 () Bool)

(declare-fun e!190473 () Bool)

(assert (=> d!91992 (=> res!225528 e!190473)))

(assert (=> d!91992 (= res!225528 (= (_1!12212 lt!409561) (_2!12212 lt!409561)))))

(assert (=> d!91992 (= (arrayRangesEq!1095 (buf!7031 w1!591) (buf!7031 w2!587) (_1!12212 lt!409561) (_2!12212 lt!409561)) e!190473)))

(declare-fun b!270625 () Bool)

(declare-fun e!190474 () Bool)

(assert (=> b!270625 (= e!190473 e!190474)))

(declare-fun res!225529 () Bool)

(assert (=> b!270625 (=> (not res!225529) (not e!190474))))

(assert (=> b!270625 (= res!225529 (= (select (arr!7550 (buf!7031 w1!591)) (_1!12212 lt!409561)) (select (arr!7550 (buf!7031 w2!587)) (_1!12212 lt!409561))))))

(declare-fun b!270626 () Bool)

(assert (=> b!270626 (= e!190474 (arrayRangesEq!1095 (buf!7031 w1!591) (buf!7031 w2!587) (bvadd (_1!12212 lt!409561) #b00000000000000000000000000000001) (_2!12212 lt!409561)))))

(assert (= (and d!91992 (not res!225528)) b!270625))

(assert (= (and b!270625 res!225529) b!270626))

(declare-fun m!402603 () Bool)

(assert (=> b!270625 m!402603))

(declare-fun m!402605 () Bool)

(assert (=> b!270625 m!402605))

(declare-fun m!402607 () Bool)

(assert (=> b!270626 m!402607))

(assert (=> b!270590 d!91992))

(declare-fun d!91994 () Bool)

(assert (=> d!91994 (= (remainingBits!0 ((_ sign_extend 32) (size!6563 (buf!7031 w2!587))) ((_ sign_extend 32) (currentByte!12996 w2!587)) ((_ sign_extend 32) (currentBit!12991 w2!587))) (bvsub (bvmul ((_ sign_extend 32) (size!6563 (buf!7031 w2!587))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12996 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12991 w2!587)))))))

(assert (=> d!91914 d!91994))

(assert (=> d!91914 d!91932))

(declare-fun d!91996 () Bool)

(declare-fun res!225530 () Bool)

(declare-fun e!190475 () Bool)

(assert (=> d!91996 (=> res!225530 e!190475)))

(assert (=> d!91996 (= res!225530 (= (_1!12212 lt!409558) (_2!12212 lt!409558)))))

(assert (=> d!91996 (= (arrayRangesEq!1095 (buf!7031 w2!587) (buf!7031 w3!25) (_1!12212 lt!409558) (_2!12212 lt!409558)) e!190475)))

(declare-fun b!270627 () Bool)

(declare-fun e!190476 () Bool)

(assert (=> b!270627 (= e!190475 e!190476)))

(declare-fun res!225531 () Bool)

(assert (=> b!270627 (=> (not res!225531) (not e!190476))))

(assert (=> b!270627 (= res!225531 (= (select (arr!7550 (buf!7031 w2!587)) (_1!12212 lt!409558)) (select (arr!7550 (buf!7031 w3!25)) (_1!12212 lt!409558))))))

(declare-fun b!270628 () Bool)

(assert (=> b!270628 (= e!190476 (arrayRangesEq!1095 (buf!7031 w2!587) (buf!7031 w3!25) (bvadd (_1!12212 lt!409558) #b00000000000000000000000000000001) (_2!12212 lt!409558)))))

(assert (= (and d!91996 (not res!225530)) b!270627))

(assert (= (and b!270627 res!225531) b!270628))

(declare-fun m!402609 () Bool)

(assert (=> b!270627 m!402609))

(declare-fun m!402611 () Bool)

(assert (=> b!270627 m!402611))

(declare-fun m!402613 () Bool)

(assert (=> b!270628 m!402613))

(assert (=> b!270583 d!91996))

(check-sat (not b!270628) (not b!270622) (not b!270624) (not b!270626))
