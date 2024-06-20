; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58968 () Bool)

(assert start!58968)

(declare-fun b!270429 () Bool)

(declare-fun e!190320 () Bool)

(declare-datatypes ((array!15075 0))(
  ( (array!15076 (arr!7551 (Array (_ BitVec 32) (_ BitVec 8))) (size!6564 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11942 0))(
  ( (BitStream!11943 (buf!7032 array!15075) (currentByte!12997 (_ BitVec 32)) (currentBit!12992 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11942)

(declare-fun array_inv!6288 (array!15075) Bool)

(assert (=> b!270429 (= e!190320 (array_inv!6288 (buf!7032 w1!591)))))

(declare-fun b!270431 () Bool)

(declare-fun e!190321 () Bool)

(declare-fun w2!587 () BitStream!11942)

(assert (=> b!270431 (= e!190321 (array_inv!6288 (buf!7032 w2!587)))))

(declare-fun b!270432 () Bool)

(declare-fun e!190319 () Bool)

(declare-fun w3!25 () BitStream!11942)

(assert (=> b!270432 (= e!190319 (array_inv!6288 (buf!7032 w3!25)))))

(declare-fun b!270433 () Bool)

(declare-fun e!190317 () Bool)

(declare-fun e!190318 () Bool)

(assert (=> b!270433 (= e!190317 (not e!190318))))

(declare-fun res!225360 () Bool)

(assert (=> b!270433 (=> res!225360 e!190318)))

(assert (=> b!270433 (= res!225360 (or (bvsge (currentByte!12997 w1!591) (size!6564 (buf!7032 w1!591))) (bvsge (currentByte!12997 w1!591) (currentByte!12997 w2!587)) (bvsgt #b00000000000000000000000000000000 (currentByte!12997 w2!587)) (bvsgt (size!6564 (buf!7032 w2!587)) (size!6564 (buf!7032 w3!25))) (bvsgt (currentByte!12997 w2!587) (size!6564 (buf!7032 w2!587))) (bvsgt #b00000000000000000000000000000000 (currentByte!12997 w1!591))))))

(declare-fun arrayRangesEq!1096 (array!15075 array!15075 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!270433 (arrayRangesEq!1096 (buf!7032 w1!591) (buf!7032 w3!25) #b00000000000000000000000000000000 (currentByte!12997 w1!591))))

(declare-datatypes ((Unit!19083 0))(
  ( (Unit!19084) )
))
(declare-fun lt!409439 () Unit!19083)

(declare-fun arrayRangesEqTransitive!359 (array!15075 array!15075 array!15075 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19083)

(assert (=> b!270433 (= lt!409439 (arrayRangesEqTransitive!359 (buf!7032 w1!591) (buf!7032 w2!587) (buf!7032 w3!25) #b00000000000000000000000000000000 (currentByte!12997 w1!591) (currentByte!12997 w2!587)))))

(declare-fun b!270434 () Bool)

(declare-fun res!225361 () Bool)

(assert (=> b!270434 (=> (not res!225361) (not e!190317))))

(declare-fun isPrefixOf!0 (BitStream!11942 BitStream!11942) Bool)

(assert (=> b!270434 (= res!225361 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!270430 () Bool)

(assert (=> b!270430 (= e!190318 (arrayRangesEq!1096 (buf!7032 w2!587) (buf!7032 w3!25) #b00000000000000000000000000000000 (currentByte!12997 w2!587)))))

(declare-fun res!225359 () Bool)

(assert (=> start!58968 (=> (not res!225359) (not e!190317))))

(assert (=> start!58968 (= res!225359 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58968 e!190317))

(declare-fun inv!12 (BitStream!11942) Bool)

(assert (=> start!58968 (and (inv!12 w1!591) e!190320)))

(assert (=> start!58968 (and (inv!12 w2!587) e!190321)))

(assert (=> start!58968 (and (inv!12 w3!25) e!190319)))

(assert (= (and start!58968 res!225359) b!270434))

(assert (= (and b!270434 res!225361) b!270433))

(assert (= (and b!270433 (not res!225360)) b!270430))

(assert (= start!58968 b!270429))

(assert (= start!58968 b!270431))

(assert (= start!58968 b!270432))

(declare-fun m!402329 () Bool)

(assert (=> b!270431 m!402329))

(declare-fun m!402331 () Bool)

(assert (=> b!270430 m!402331))

(declare-fun m!402333 () Bool)

(assert (=> b!270432 m!402333))

(declare-fun m!402335 () Bool)

(assert (=> b!270429 m!402335))

(declare-fun m!402337 () Bool)

(assert (=> b!270434 m!402337))

(declare-fun m!402339 () Bool)

(assert (=> b!270433 m!402339))

(declare-fun m!402341 () Bool)

(assert (=> b!270433 m!402341))

(declare-fun m!402343 () Bool)

(assert (=> start!58968 m!402343))

(declare-fun m!402345 () Bool)

(assert (=> start!58968 m!402345))

(declare-fun m!402347 () Bool)

(assert (=> start!58968 m!402347))

(declare-fun m!402349 () Bool)

(assert (=> start!58968 m!402349))

(push 1)

(assert (not start!58968))

(assert (not b!270434))

(assert (not b!270432))

(assert (not b!270431))

(assert (not b!270433))

(assert (not b!270430))

(assert (not b!270429))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!91846 () Bool)

(declare-fun res!225378 () Bool)

(declare-fun e!190333 () Bool)

(assert (=> d!91846 (=> (not res!225378) (not e!190333))))

(assert (=> d!91846 (= res!225378 (= (size!6564 (buf!7032 w2!587)) (size!6564 (buf!7032 w3!25))))))

(assert (=> d!91846 (= (isPrefixOf!0 w2!587 w3!25) e!190333)))

(declare-fun b!270450 () Bool)

(declare-fun res!225379 () Bool)

(assert (=> b!270450 (=> (not res!225379) (not e!190333))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!270450 (= res!225379 (bvsle (bitIndex!0 (size!6564 (buf!7032 w2!587)) (currentByte!12997 w2!587) (currentBit!12992 w2!587)) (bitIndex!0 (size!6564 (buf!7032 w3!25)) (currentByte!12997 w3!25) (currentBit!12992 w3!25))))))

(declare-fun b!270451 () Bool)

(declare-fun e!190332 () Bool)

(assert (=> b!270451 (= e!190333 e!190332)))

(declare-fun res!225377 () Bool)

(assert (=> b!270451 (=> res!225377 e!190332)))

(assert (=> b!270451 (= res!225377 (= (size!6564 (buf!7032 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!270452 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15075 array!15075 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!270452 (= e!190332 (arrayBitRangesEq!0 (buf!7032 w2!587) (buf!7032 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6564 (buf!7032 w2!587)) (currentByte!12997 w2!587) (currentBit!12992 w2!587))))))

(assert (= (and d!91846 res!225378) b!270450))

(assert (= (and b!270450 res!225379) b!270451))

(assert (= (and b!270451 (not res!225377)) b!270452))

(declare-fun m!402357 () Bool)

(assert (=> b!270450 m!402357))

(declare-fun m!402359 () Bool)

(assert (=> b!270450 m!402359))

(assert (=> b!270452 m!402357))

(assert (=> b!270452 m!402357))

(declare-fun m!402363 () Bool)

(assert (=> b!270452 m!402363))

(assert (=> b!270434 d!91846))

(declare-fun d!91858 () Bool)

(declare-fun res!225384 () Bool)

(declare-fun e!190337 () Bool)

(assert (=> d!91858 (=> (not res!225384) (not e!190337))))

(assert (=> d!91858 (= res!225384 (= (size!6564 (buf!7032 w1!591)) (size!6564 (buf!7032 w2!587))))))

(assert (=> d!91858 (= (isPrefixOf!0 w1!591 w2!587) e!190337)))

(declare-fun b!270456 () Bool)

(declare-fun res!225385 () Bool)

(assert (=> b!270456 (=> (not res!225385) (not e!190337))))

(assert (=> b!270456 (= res!225385 (bvsle (bitIndex!0 (size!6564 (buf!7032 w1!591)) (currentByte!12997 w1!591) (currentBit!12992 w1!591)) (bitIndex!0 (size!6564 (buf!7032 w2!587)) (currentByte!12997 w2!587) (currentBit!12992 w2!587))))))

(declare-fun b!270457 () Bool)

(declare-fun e!190336 () Bool)

(assert (=> b!270457 (= e!190337 e!190336)))

(declare-fun res!225383 () Bool)

(assert (=> b!270457 (=> res!225383 e!190336)))

(assert (=> b!270457 (= res!225383 (= (size!6564 (buf!7032 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!270458 () Bool)

(assert (=> b!270458 (= e!190336 (arrayBitRangesEq!0 (buf!7032 w1!591) (buf!7032 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6564 (buf!7032 w1!591)) (currentByte!12997 w1!591) (currentBit!12992 w1!591))))))

(assert (= (and d!91858 res!225384) b!270456))

(assert (= (and b!270456 res!225385) b!270457))

(assert (= (and b!270457 (not res!225383)) b!270458))

(declare-fun m!402367 () Bool)

(assert (=> b!270456 m!402367))

(assert (=> b!270456 m!402357))

(assert (=> b!270458 m!402367))

(assert (=> b!270458 m!402367))

(declare-fun m!402369 () Bool)

(assert (=> b!270458 m!402369))

(assert (=> start!58968 d!91858))

(declare-fun d!91862 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!91862 (= (inv!12 w1!591) (invariant!0 (currentBit!12992 w1!591) (currentByte!12997 w1!591) (size!6564 (buf!7032 w1!591))))))

(declare-fun bs!23212 () Bool)

(assert (= bs!23212 d!91862))

(declare-fun m!402377 () Bool)

(assert (=> bs!23212 m!402377))

(assert (=> start!58968 d!91862))

(declare-fun d!91870 () Bool)

(assert (=> d!91870 (= (inv!12 w2!587) (invariant!0 (currentBit!12992 w2!587) (currentByte!12997 w2!587) (size!6564 (buf!7032 w2!587))))))

(declare-fun bs!23213 () Bool)

(assert (= bs!23213 d!91870))

(declare-fun m!402379 () Bool)

(assert (=> bs!23213 m!402379))

(assert (=> start!58968 d!91870))

(declare-fun d!91872 () Bool)

(assert (=> d!91872 (= (inv!12 w3!25) (invariant!0 (currentBit!12992 w3!25) (currentByte!12997 w3!25) (size!6564 (buf!7032 w3!25))))))

(declare-fun bs!23214 () Bool)

(assert (= bs!23214 d!91872))

(declare-fun m!402381 () Bool)

(assert (=> bs!23214 m!402381))

(assert (=> start!58968 d!91872))

(declare-fun d!91874 () Bool)

(declare-fun res!225398 () Bool)

(declare-fun e!190350 () Bool)

(assert (=> d!91874 (=> res!225398 e!190350)))

(assert (=> d!91874 (= res!225398 (= #b00000000000000000000000000000000 (currentByte!12997 w1!591)))))

(assert (=> d!91874 (= (arrayRangesEq!1096 (buf!7032 w1!591) (buf!7032 w3!25) #b00000000000000000000000000000000 (currentByte!12997 w1!591)) e!190350)))

(declare-fun b!270471 () Bool)

(declare-fun e!190351 () Bool)

(assert (=> b!270471 (= e!190350 e!190351)))

(declare-fun res!225399 () Bool)

(assert (=> b!270471 (=> (not res!225399) (not e!190351))))

(assert (=> b!270471 (= res!225399 (= (select (arr!7551 (buf!7032 w1!591)) #b00000000000000000000000000000000) (select (arr!7551 (buf!7032 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!270472 () Bool)

(assert (=> b!270472 (= e!190351 (arrayRangesEq!1096 (buf!7032 w1!591) (buf!7032 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12997 w1!591)))))

(assert (= (and d!91874 (not res!225398)) b!270471))

(assert (= (and b!270471 res!225399) b!270472))

(declare-fun m!402395 () Bool)

(assert (=> b!270471 m!402395))

(declare-fun m!402397 () Bool)

(assert (=> b!270471 m!402397))

(declare-fun m!402399 () Bool)

(assert (=> b!270472 m!402399))

(assert (=> b!270433 d!91874))

(declare-fun d!91882 () Bool)

(assert (=> d!91882 (arrayRangesEq!1096 (buf!7032 w1!591) (buf!7032 w3!25) #b00000000000000000000000000000000 (currentByte!12997 w1!591))))

(declare-fun lt!409445 () Unit!19083)

(declare-fun choose!396 (array!15075 array!15075 array!15075 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19083)

(assert (=> d!91882 (= lt!409445 (choose!396 (buf!7032 w1!591) (buf!7032 w2!587) (buf!7032 w3!25) #b00000000000000000000000000000000 (currentByte!12997 w1!591) (currentByte!12997 w2!587)))))

(assert (=> d!91882 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!12997 w1!591)) (bvsle (currentByte!12997 w1!591) (currentByte!12997 w2!587)))))

(assert (=> d!91882 (= (arrayRangesEqTransitive!359 (buf!7032 w1!591) (buf!7032 w2!587) (buf!7032 w3!25) #b00000000000000000000000000000000 (currentByte!12997 w1!591) (currentByte!12997 w2!587)) lt!409445)))

(declare-fun bs!23216 () Bool)

(assert (= bs!23216 d!91882))

(assert (=> bs!23216 m!402339))

(declare-fun m!402401 () Bool)

(assert (=> bs!23216 m!402401))

(assert (=> b!270433 d!91882))

(declare-fun d!91884 () Bool)

(declare-fun res!225406 () Bool)

(declare-fun e!190356 () Bool)

(assert (=> d!91884 (=> res!225406 e!190356)))

(assert (=> d!91884 (= res!225406 (= #b00000000000000000000000000000000 (currentByte!12997 w2!587)))))

(assert (=> d!91884 (= (arrayRangesEq!1096 (buf!7032 w2!587) (buf!7032 w3!25) #b00000000000000000000000000000000 (currentByte!12997 w2!587)) e!190356)))

(declare-fun b!270479 () Bool)

(declare-fun e!190357 () Bool)

(assert (=> b!270479 (= e!190356 e!190357)))

(declare-fun res!225407 () Bool)

(assert (=> b!270479 (=> (not res!225407) (not e!190357))))

(assert (=> b!270479 (= res!225407 (= (select (arr!7551 (buf!7032 w2!587)) #b00000000000000000000000000000000) (select (arr!7551 (buf!7032 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!270480 () Bool)

(assert (=> b!270480 (= e!190357 (arrayRangesEq!1096 (buf!7032 w2!587) (buf!7032 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12997 w2!587)))))

(assert (= (and d!91884 (not res!225406)) b!270479))

(assert (= (and b!270479 res!225407) b!270480))

(declare-fun m!402403 () Bool)

(assert (=> b!270479 m!402403))

(assert (=> b!270479 m!402397))

(declare-fun m!402405 () Bool)

(assert (=> b!270480 m!402405))

(assert (=> b!270430 d!91884))

(declare-fun d!91886 () Bool)

(assert (=> d!91886 (= (array_inv!6288 (buf!7032 w1!591)) (bvsge (size!6564 (buf!7032 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!270429 d!91886))

(declare-fun d!91888 () Bool)

(assert (=> d!91888 (= (array_inv!6288 (buf!7032 w2!587)) (bvsge (size!6564 (buf!7032 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!270431 d!91888))

(declare-fun d!91890 () Bool)

(assert (=> d!91890 (= (array_inv!6288 (buf!7032 w3!25)) (bvsge (size!6564 (buf!7032 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!270432 d!91890))

(push 1)

(assert (not d!91882))

(assert (not d!91870))

(assert (not b!270456))

(assert (not b!270452))

(assert (not d!91872))

(assert (not d!91862))

(assert (not b!270450))

(assert (not b!270480))

(assert (not b!270458))

(assert (not b!270472))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!91930 () Bool)

(assert (=> d!91930 (= (invariant!0 (currentBit!12992 w1!591) (currentByte!12997 w1!591) (size!6564 (buf!7032 w1!591))) (and (bvsge (currentBit!12992 w1!591) #b00000000000000000000000000000000) (bvslt (currentBit!12992 w1!591) #b00000000000000000000000000001000) (bvsge (currentByte!12997 w1!591) #b00000000000000000000000000000000) (or (bvslt (currentByte!12997 w1!591) (size!6564 (buf!7032 w1!591))) (and (= (currentBit!12992 w1!591) #b00000000000000000000000000000000) (= (currentByte!12997 w1!591) (size!6564 (buf!7032 w1!591)))))))))

(assert (=> d!91862 d!91930))

(declare-fun d!91938 () Bool)

(declare-fun res!225446 () Bool)

(declare-fun e!190385 () Bool)

(assert (=> d!91938 (=> res!225446 e!190385)))

(assert (=> d!91938 (= res!225446 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12997 w1!591)))))

(assert (=> d!91938 (= (arrayRangesEq!1096 (buf!7032 w1!591) (buf!7032 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12997 w1!591)) e!190385)))

(declare-fun b!270519 () Bool)

(declare-fun e!190386 () Bool)

(assert (=> b!270519 (= e!190385 e!190386)))

(declare-fun res!225447 () Bool)

(assert (=> b!270519 (=> (not res!225447) (not e!190386))))

(assert (=> b!270519 (= res!225447 (= (select (arr!7551 (buf!7032 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7551 (buf!7032 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!270520 () Bool)

(assert (=> b!270520 (= e!190386 (arrayRangesEq!1096 (buf!7032 w1!591) (buf!7032 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12997 w1!591)))))

(assert (= (and d!91938 (not res!225446)) b!270519))

(assert (= (and b!270519 res!225447) b!270520))

(declare-fun m!402461 () Bool)

(assert (=> b!270519 m!402461))

(declare-fun m!402463 () Bool)

(assert (=> b!270519 m!402463))

(declare-fun m!402465 () Bool)

(assert (=> b!270520 m!402465))

(assert (=> b!270472 d!91938))

(declare-fun d!91940 () Bool)

(assert (=> d!91940 (= (invariant!0 (currentBit!12992 w2!587) (currentByte!12997 w2!587) (size!6564 (buf!7032 w2!587))) (and (bvsge (currentBit!12992 w2!587) #b00000000000000000000000000000000) (bvslt (currentBit!12992 w2!587) #b00000000000000000000000000001000) (bvsge (currentByte!12997 w2!587) #b00000000000000000000000000000000) (or (bvslt (currentByte!12997 w2!587) (size!6564 (buf!7032 w2!587))) (and (= (currentBit!12992 w2!587) #b00000000000000000000000000000000) (= (currentByte!12997 w2!587) (size!6564 (buf!7032 w2!587)))))))))

(assert (=> d!91870 d!91940))

(declare-fun d!91942 () Bool)

(assert (=> d!91942 (= (invariant!0 (currentBit!12992 w3!25) (currentByte!12997 w3!25) (size!6564 (buf!7032 w3!25))) (and (bvsge (currentBit!12992 w3!25) #b00000000000000000000000000000000) (bvslt (currentBit!12992 w3!25) #b00000000000000000000000000001000) (bvsge (currentByte!12997 w3!25) #b00000000000000000000000000000000) (or (bvslt (currentByte!12997 w3!25) (size!6564 (buf!7032 w3!25))) (and (= (currentBit!12992 w3!25) #b00000000000000000000000000000000) (= (currentByte!12997 w3!25) (size!6564 (buf!7032 w3!25)))))))))

(assert (=> d!91872 d!91942))

(declare-fun d!91944 () Bool)

(declare-fun res!225448 () Bool)

(declare-fun e!190387 () Bool)

(assert (=> d!91944 (=> res!225448 e!190387)))

(assert (=> d!91944 (= res!225448 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12997 w2!587)))))

(assert (=> d!91944 (= (arrayRangesEq!1096 (buf!7032 w2!587) (buf!7032 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12997 w2!587)) e!190387)))

(declare-fun b!270521 () Bool)

(declare-fun e!190388 () Bool)

(assert (=> b!270521 (= e!190387 e!190388)))

(declare-fun res!225449 () Bool)

(assert (=> b!270521 (=> (not res!225449) (not e!190388))))

(assert (=> b!270521 (= res!225449 (= (select (arr!7551 (buf!7032 w2!587)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7551 (buf!7032 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!270522 () Bool)

(assert (=> b!270522 (= e!190388 (arrayRangesEq!1096 (buf!7032 w2!587) (buf!7032 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12997 w2!587)))))

(assert (= (and d!91944 (not res!225448)) b!270521))

(assert (= (and b!270521 res!225449) b!270522))

(declare-fun m!402467 () Bool)

(assert (=> b!270521 m!402467))

(assert (=> b!270521 m!402463))

(declare-fun m!402469 () Bool)

(assert (=> b!270522 m!402469))

(assert (=> b!270480 d!91944))

(declare-fun d!91946 () Bool)

(declare-fun e!190411 () Bool)

(assert (=> d!91946 e!190411))

(declare-fun res!225472 () Bool)

(assert (=> d!91946 (=> (not res!225472) (not e!190411))))

(declare-fun lt!409531 () (_ BitVec 64))

(declare-fun lt!409535 () (_ BitVec 64))

(declare-fun lt!409530 () (_ BitVec 64))

(assert (=> d!91946 (= res!225472 (= lt!409531 (bvsub lt!409530 lt!409535)))))

(assert (=> d!91946 (or (= (bvand lt!409530 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409535 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409530 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409530 lt!409535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!91946 (= lt!409535 (remainingBits!0 ((_ sign_extend 32) (size!6564 (buf!7032 w1!591))) ((_ sign_extend 32) (currentByte!12997 w1!591)) ((_ sign_extend 32) (currentBit!12992 w1!591))))))

(declare-fun lt!409533 () (_ BitVec 64))

(declare-fun lt!409534 () (_ BitVec 64))

(assert (=> d!91946 (= lt!409530 (bvmul lt!409533 lt!409534))))

(assert (=> d!91946 (or (= lt!409533 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409534 (bvsdiv (bvmul lt!409533 lt!409534) lt!409533)))))

(assert (=> d!91946 (= lt!409534 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91946 (= lt!409533 ((_ sign_extend 32) (size!6564 (buf!7032 w1!591))))))

(assert (=> d!91946 (= lt!409531 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12997 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12992 w1!591))))))

(assert (=> d!91946 (invariant!0 (currentBit!12992 w1!591) (currentByte!12997 w1!591) (size!6564 (buf!7032 w1!591)))))

(assert (=> d!91946 (= (bitIndex!0 (size!6564 (buf!7032 w1!591)) (currentByte!12997 w1!591) (currentBit!12992 w1!591)) lt!409531)))

(declare-fun b!270550 () Bool)

(declare-fun res!225471 () Bool)

(assert (=> b!270550 (=> (not res!225471) (not e!190411))))

(assert (=> b!270550 (= res!225471 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409531))))

(declare-fun b!270551 () Bool)

(declare-fun lt!409532 () (_ BitVec 64))

(assert (=> b!270551 (= e!190411 (bvsle lt!409531 (bvmul lt!409532 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!270551 (or (= lt!409532 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409532 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409532)))))

(assert (=> b!270551 (= lt!409532 ((_ sign_extend 32) (size!6564 (buf!7032 w1!591))))))

(assert (= (and d!91946 res!225472) b!270550))

(assert (= (and b!270550 res!225471) b!270551))

(declare-fun m!402487 () Bool)

(assert (=> d!91946 m!402487))

(assert (=> d!91946 m!402377))

(assert (=> b!270456 d!91946))

(declare-fun d!91950 () Bool)

(declare-fun e!190421 () Bool)

(assert (=> d!91950 e!190421))

(declare-fun res!225482 () Bool)

(assert (=> d!91950 (=> (not res!225482) (not e!190421))))

(declare-fun lt!409543 () (_ BitVec 64))

(declare-fun lt!409547 () (_ BitVec 64))

(declare-fun lt!409542 () (_ BitVec 64))

(assert (=> d!91950 (= res!225482 (= lt!409543 (bvsub lt!409542 lt!409547)))))

(assert (=> d!91950 (or (= (bvand lt!409542 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409547 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409542 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409542 lt!409547) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!91950 (= lt!409547 (remainingBits!0 ((_ sign_extend 32) (size!6564 (buf!7032 w2!587))) ((_ sign_extend 32) (currentByte!12997 w2!587)) ((_ sign_extend 32) (currentBit!12992 w2!587))))))

(declare-fun lt!409545 () (_ BitVec 64))

(declare-fun lt!409546 () (_ BitVec 64))

(assert (=> d!91950 (= lt!409542 (bvmul lt!409545 lt!409546))))

(assert (=> d!91950 (or (= lt!409545 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409546 (bvsdiv (bvmul lt!409545 lt!409546) lt!409545)))))

(assert (=> d!91950 (= lt!409546 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91950 (= lt!409545 ((_ sign_extend 32) (size!6564 (buf!7032 w2!587))))))

(assert (=> d!91950 (= lt!409543 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12997 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12992 w2!587))))))

(assert (=> d!91950 (invariant!0 (currentBit!12992 w2!587) (currentByte!12997 w2!587) (size!6564 (buf!7032 w2!587)))))

(assert (=> d!91950 (= (bitIndex!0 (size!6564 (buf!7032 w2!587)) (currentByte!12997 w2!587) (currentBit!12992 w2!587)) lt!409543)))

(declare-fun b!270562 () Bool)

(declare-fun res!225481 () Bool)

(assert (=> b!270562 (=> (not res!225481) (not e!190421))))

(assert (=> b!270562 (= res!225481 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409543))))

(declare-fun b!270563 () Bool)

(declare-fun lt!409544 () (_ BitVec 64))

(assert (=> b!270563 (= e!190421 (bvsle lt!409543 (bvmul lt!409544 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!270563 (or (= lt!409544 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409544 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409544)))))

(assert (=> b!270563 (= lt!409544 ((_ sign_extend 32) (size!6564 (buf!7032 w2!587))))))

(assert (= (and d!91950 res!225482) b!270562))

(assert (= (and b!270562 res!225481) b!270563))

(declare-fun m!402491 () Bool)

(assert (=> d!91950 m!402491))

(assert (=> d!91950 m!402379))

(assert (=> b!270456 d!91950))

(assert (=> b!270450 d!91950))

(declare-fun d!91954 () Bool)

(declare-fun e!190430 () Bool)

(assert (=> d!91954 e!190430))

(declare-fun res!225491 () Bool)

(assert (=> d!91954 (=> (not res!225491) (not e!190430))))

(declare-fun lt!409556 () (_ BitVec 64))

(declare-fun lt!409552 () (_ BitVec 64))

(declare-fun lt!409551 () (_ BitVec 64))

(assert (=> d!91954 (= res!225491 (= lt!409552 (bvsub lt!409551 lt!409556)))))

(assert (=> d!91954 (or (= (bvand lt!409551 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409556 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409551 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409551 lt!409556) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!91954 (= lt!409556 (remainingBits!0 ((_ sign_extend 32) (size!6564 (buf!7032 w3!25))) ((_ sign_extend 32) (currentByte!12997 w3!25)) ((_ sign_extend 32) (currentBit!12992 w3!25))))))

(declare-fun lt!409554 () (_ BitVec 64))

(declare-fun lt!409555 () (_ BitVec 64))

(assert (=> d!91954 (= lt!409551 (bvmul lt!409554 lt!409555))))

(assert (=> d!91954 (or (= lt!409554 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409555 (bvsdiv (bvmul lt!409554 lt!409555) lt!409554)))))

(assert (=> d!91954 (= lt!409555 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91954 (= lt!409554 ((_ sign_extend 32) (size!6564 (buf!7032 w3!25))))))

(assert (=> d!91954 (= lt!409552 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12997 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12992 w3!25))))))

(assert (=> d!91954 (invariant!0 (currentBit!12992 w3!25) (currentByte!12997 w3!25) (size!6564 (buf!7032 w3!25)))))

(assert (=> d!91954 (= (bitIndex!0 (size!6564 (buf!7032 w3!25)) (currentByte!12997 w3!25) (currentBit!12992 w3!25)) lt!409552)))

(declare-fun b!270575 () Bool)

(declare-fun res!225490 () Bool)

(assert (=> b!270575 (=> (not res!225490) (not e!190430))))

(assert (=> b!270575 (= res!225490 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409552))))

(declare-fun b!270576 () Bool)

(declare-fun lt!409553 () (_ BitVec 64))

(assert (=> b!270576 (= e!190430 (bvsle lt!409552 (bvmul lt!409553 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!270576 (or (= lt!409553 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409553 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409553)))))

(assert (=> b!270576 (= lt!409553 ((_ sign_extend 32) (size!6564 (buf!7032 w3!25))))))

(assert (= (and d!91954 res!225491) b!270575))

(assert (= (and b!270575 res!225490) b!270576))

(declare-fun m!402493 () Bool)

(assert (=> d!91954 m!402493))

(assert (=> d!91954 m!402381))

(assert (=> b!270450 d!91954))

(declare-datatypes ((tuple4!460 0))(
  ( (tuple4!461 (_1!12213 (_ BitVec 32)) (_2!12213 (_ BitVec 32)) (_3!1010 (_ BitVec 32)) (_4!230 (_ BitVec 32))) )
))
(declare-fun lt!409571 () tuple4!460)

(declare-fun bm!4327 () Bool)

(declare-fun lt!409569 () (_ BitVec 32))

(declare-fun call!4330 () Bool)

(declare-fun lt!409570 () (_ BitVec 32))

(declare-fun c!12479 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4327 (= call!4330 (byteRangesEq!0 (ite c!12479 (select (arr!7551 (buf!7032 w1!591)) (_3!1010 lt!409571)) (select (arr!7551 (buf!7032 w1!591)) (_4!230 lt!409571))) (ite c!12479 (select (arr!7551 (buf!7032 w2!587)) (_3!1010 lt!409571)) (select (arr!7551 (buf!7032 w2!587)) (_4!230 lt!409571))) (ite c!12479 lt!409570 #b00000000000000000000000000000000) lt!409569))))

(declare-fun b!270607 () Bool)

(declare-fun e!190457 () Bool)

(assert (=> b!270607 (= e!190457 call!4330)))

(declare-fun b!270608 () Bool)

(declare-fun e!190461 () Bool)

(declare-fun e!190462 () Bool)

(assert (=> b!270608 (= e!190461 e!190462)))

(declare-fun res!225515 () Bool)

(assert (=> b!270608 (=> (not res!225515) (not e!190462))))

(declare-fun e!190458 () Bool)

(assert (=> b!270608 (= res!225515 e!190458)))

(declare-fun res!225518 () Bool)

(assert (=> b!270608 (=> res!225518 e!190458)))

(assert (=> b!270608 (= res!225518 (bvsge (_1!12213 lt!409571) (_2!12213 lt!409571)))))

(assert (=> b!270608 (= lt!409569 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6564 (buf!7032 w1!591)) (currentByte!12997 w1!591) (currentBit!12992 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!270608 (= lt!409570 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!460)

(assert (=> b!270608 (= lt!409571 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6564 (buf!7032 w1!591)) (currentByte!12997 w1!591) (currentBit!12992 w1!591))))))

(declare-fun b!270609 () Bool)

(declare-fun res!225514 () Bool)

(assert (=> b!270609 (= res!225514 (= lt!409569 #b00000000000000000000000000000000))))

(assert (=> b!270609 (=> res!225514 e!190457)))

(declare-fun e!190459 () Bool)

(assert (=> b!270609 (= e!190459 e!190457)))

(declare-fun d!91956 () Bool)

(declare-fun res!225516 () Bool)

(assert (=> d!91956 (=> res!225516 e!190461)))

(assert (=> d!91956 (= res!225516 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6564 (buf!7032 w1!591)) (currentByte!12997 w1!591) (currentBit!12992 w1!591))))))

(assert (=> d!91956 (= (arrayBitRangesEq!0 (buf!7032 w1!591) (buf!7032 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6564 (buf!7032 w1!591)) (currentByte!12997 w1!591) (currentBit!12992 w1!591))) e!190461)))

(declare-fun b!270610 () Bool)

(assert (=> b!270610 (= e!190458 (arrayRangesEq!1096 (buf!7032 w1!591) (buf!7032 w2!587) (_1!12213 lt!409571) (_2!12213 lt!409571)))))

(declare-fun b!270611 () Bool)

(declare-fun e!190460 () Bool)

(assert (=> b!270611 (= e!190460 call!4330)))

(declare-fun b!270612 () Bool)

(assert (=> b!270612 (= e!190462 e!190460)))

(assert (=> b!270612 (= c!12479 (= (_3!1010 lt!409571) (_4!230 lt!409571)))))

(declare-fun b!270613 () Bool)

(assert (=> b!270613 (= e!190460 e!190459)))

(declare-fun res!225517 () Bool)

(assert (=> b!270613 (= res!225517 (byteRangesEq!0 (select (arr!7551 (buf!7032 w1!591)) (_3!1010 lt!409571)) (select (arr!7551 (buf!7032 w2!587)) (_3!1010 lt!409571)) lt!409570 #b00000000000000000000000000001000))))

(assert (=> b!270613 (=> (not res!225517) (not e!190459))))

(assert (= (and d!91956 (not res!225516)) b!270608))

(assert (= (and b!270608 (not res!225518)) b!270610))

(assert (= (and b!270608 res!225515) b!270612))

(assert (= (and b!270612 c!12479) b!270611))

(assert (= (and b!270612 (not c!12479)) b!270613))

(assert (= (and b!270613 res!225517) b!270609))

(assert (= (and b!270609 (not res!225514)) b!270607))

(assert (= (or b!270611 b!270607) bm!4327))

(declare-fun m!402547 () Bool)

(assert (=> bm!4327 m!402547))

(declare-fun m!402549 () Bool)

(assert (=> bm!4327 m!402549))

(declare-fun m!402551 () Bool)

(assert (=> bm!4327 m!402551))

(declare-fun m!402553 () Bool)

(assert (=> bm!4327 m!402553))

(declare-fun m!402555 () Bool)

(assert (=> bm!4327 m!402555))

(assert (=> b!270608 m!402367))

(declare-fun m!402557 () Bool)

(assert (=> b!270608 m!402557))

(declare-fun m!402559 () Bool)

(assert (=> b!270610 m!402559))

(assert (=> b!270613 m!402551))

(assert (=> b!270613 m!402555))

(assert (=> b!270613 m!402551))

(assert (=> b!270613 m!402555))

(declare-fun m!402561 () Bool)

(assert (=> b!270613 m!402561))

(assert (=> b!270458 d!91956))

(assert (=> b!270458 d!91946))

(declare-fun bm!4328 () Bool)

(declare-fun call!4331 () Bool)

(declare-fun lt!409574 () tuple4!460)

(declare-fun lt!409573 () (_ BitVec 32))

(declare-fun c!12480 () Bool)

(declare-fun lt!409572 () (_ BitVec 32))

(assert (=> bm!4328 (= call!4331 (byteRangesEq!0 (ite c!12480 (select (arr!7551 (buf!7032 w2!587)) (_3!1010 lt!409574)) (select (arr!7551 (buf!7032 w2!587)) (_4!230 lt!409574))) (ite c!12480 (select (arr!7551 (buf!7032 w3!25)) (_3!1010 lt!409574)) (select (arr!7551 (buf!7032 w3!25)) (_4!230 lt!409574))) (ite c!12480 lt!409573 #b00000000000000000000000000000000) lt!409572))))

(declare-fun b!270614 () Bool)

(declare-fun e!190463 () Bool)

(assert (=> b!270614 (= e!190463 call!4331)))

(declare-fun b!270615 () Bool)

(declare-fun e!190467 () Bool)

(declare-fun e!190468 () Bool)

(assert (=> b!270615 (= e!190467 e!190468)))

(declare-fun res!225520 () Bool)

(assert (=> b!270615 (=> (not res!225520) (not e!190468))))

(declare-fun e!190464 () Bool)

(assert (=> b!270615 (= res!225520 e!190464)))

(declare-fun res!225523 () Bool)

(assert (=> b!270615 (=> res!225523 e!190464)))

(assert (=> b!270615 (= res!225523 (bvsge (_1!12213 lt!409574) (_2!12213 lt!409574)))))

(assert (=> b!270615 (= lt!409572 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6564 (buf!7032 w2!587)) (currentByte!12997 w2!587) (currentBit!12992 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!270615 (= lt!409573 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!270615 (= lt!409574 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6564 (buf!7032 w2!587)) (currentByte!12997 w2!587) (currentBit!12992 w2!587))))))

(declare-fun b!270616 () Bool)

(declare-fun res!225519 () Bool)

(assert (=> b!270616 (= res!225519 (= lt!409572 #b00000000000000000000000000000000))))

(assert (=> b!270616 (=> res!225519 e!190463)))

(declare-fun e!190465 () Bool)

(assert (=> b!270616 (= e!190465 e!190463)))

(declare-fun d!91968 () Bool)

(declare-fun res!225521 () Bool)

(assert (=> d!91968 (=> res!225521 e!190467)))

(assert (=> d!91968 (= res!225521 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6564 (buf!7032 w2!587)) (currentByte!12997 w2!587) (currentBit!12992 w2!587))))))

(assert (=> d!91968 (= (arrayBitRangesEq!0 (buf!7032 w2!587) (buf!7032 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6564 (buf!7032 w2!587)) (currentByte!12997 w2!587) (currentBit!12992 w2!587))) e!190467)))

(declare-fun b!270617 () Bool)

(assert (=> b!270617 (= e!190464 (arrayRangesEq!1096 (buf!7032 w2!587) (buf!7032 w3!25) (_1!12213 lt!409574) (_2!12213 lt!409574)))))

(declare-fun b!270618 () Bool)

(declare-fun e!190466 () Bool)

(assert (=> b!270618 (= e!190466 call!4331)))

(declare-fun b!270619 () Bool)

(assert (=> b!270619 (= e!190468 e!190466)))

(assert (=> b!270619 (= c!12480 (= (_3!1010 lt!409574) (_4!230 lt!409574)))))

(declare-fun b!270620 () Bool)

(assert (=> b!270620 (= e!190466 e!190465)))

(declare-fun res!225522 () Bool)

(assert (=> b!270620 (= res!225522 (byteRangesEq!0 (select (arr!7551 (buf!7032 w2!587)) (_3!1010 lt!409574)) (select (arr!7551 (buf!7032 w3!25)) (_3!1010 lt!409574)) lt!409573 #b00000000000000000000000000001000))))

(assert (=> b!270620 (=> (not res!225522) (not e!190465))))

(assert (= (and d!91968 (not res!225521)) b!270615))

(assert (= (and b!270615 (not res!225523)) b!270617))

(assert (= (and b!270615 res!225520) b!270619))

(assert (= (and b!270619 c!12480) b!270618))

(assert (= (and b!270619 (not c!12480)) b!270620))

(assert (= (and b!270620 res!225522) b!270616))

(assert (= (and b!270616 (not res!225519)) b!270614))

(assert (= (or b!270618 b!270614) bm!4328))

(declare-fun m!402563 () Bool)

(assert (=> bm!4328 m!402563))

(declare-fun m!402565 () Bool)

(assert (=> bm!4328 m!402565))

(declare-fun m!402567 () Bool)

(assert (=> bm!4328 m!402567))

(declare-fun m!402569 () Bool)

(assert (=> bm!4328 m!402569))

(declare-fun m!402571 () Bool)

(assert (=> bm!4328 m!402571))

(assert (=> b!270615 m!402357))

(declare-fun m!402573 () Bool)

(assert (=> b!270615 m!402573))

(declare-fun m!402575 () Bool)

(assert (=> b!270617 m!402575))

(assert (=> b!270620 m!402567))

(assert (=> b!270620 m!402571))

(assert (=> b!270620 m!402567))

(assert (=> b!270620 m!402571))

(declare-fun m!402577 () Bool)

(assert (=> b!270620 m!402577))

(assert (=> b!270452 d!91968))

(assert (=> b!270452 d!91950))

(assert (=> d!91882 d!91874))

(declare-fun d!91970 () Bool)

(assert (=> d!91970 (arrayRangesEq!1096 (buf!7032 w1!591) (buf!7032 w3!25) #b00000000000000000000000000000000 (currentByte!12997 w1!591))))

(assert (=> d!91970 true))

(declare-fun _$16!140 () Unit!19083)

(assert (=> d!91970 (= (choose!396 (buf!7032 w1!591) (buf!7032 w2!587) (buf!7032 w3!25) #b00000000000000000000000000000000 (currentByte!12997 w1!591) (currentByte!12997 w2!587)) _$16!140)))

(declare-fun bs!23223 () Bool)

(assert (= bs!23223 d!91970))

(assert (=> bs!23223 m!402339))

(assert (=> d!91882 d!91970))

(push 1)

(assert (not b!270520))

(assert (not d!91954))

(assert (not bm!4327))

(assert (not d!91950))

(assert (not b!270617))

(assert (not b!270620))

(assert (not bm!4328))

(assert (not b!270615))

(assert (not d!91970))

(assert (not b!270610))

(assert (not b!270608))

(assert (not b!270522))

(assert (not d!91946))

(assert (not b!270613))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!91998 () Bool)

(declare-fun res!225532 () Bool)

(declare-fun e!190477 () Bool)

(assert (=> d!91998 (=> res!225532 e!190477)))

(assert (=> d!91998 (= res!225532 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12997 w1!591)))))

(assert (=> d!91998 (= (arrayRangesEq!1096 (buf!7032 w1!591) (buf!7032 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12997 w1!591)) e!190477)))

(declare-fun b!270629 () Bool)

(declare-fun e!190478 () Bool)

(assert (=> b!270629 (= e!190477 e!190478)))

(declare-fun res!225533 () Bool)

(assert (=> b!270629 (=> (not res!225533) (not e!190478))))

(assert (=> b!270629 (= res!225533 (= (select (arr!7551 (buf!7032 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!7551 (buf!7032 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!270630 () Bool)

(assert (=> b!270630 (= e!190478 (arrayRangesEq!1096 (buf!7032 w1!591) (buf!7032 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12997 w1!591)))))

(assert (= (and d!91998 (not res!225532)) b!270629))

(assert (= (and b!270629 res!225533) b!270630))

(declare-fun m!402615 () Bool)

(assert (=> b!270629 m!402615))

(declare-fun m!402617 () Bool)

(assert (=> b!270629 m!402617))

(declare-fun m!402619 () Bool)

(assert (=> b!270630 m!402619))

(assert (=> b!270520 d!91998))

(declare-fun d!92000 () Bool)

(assert (=> d!92000 (= (byteRangesEq!0 (ite c!12480 (select (arr!7551 (buf!7032 w2!587)) (_3!1010 lt!409574)) (select (arr!7551 (buf!7032 w2!587)) (_4!230 lt!409574))) (ite c!12480 (select (arr!7551 (buf!7032 w3!25)) (_3!1010 lt!409574)) (select (arr!7551 (buf!7032 w3!25)) (_4!230 lt!409574))) (ite c!12480 lt!409573 #b00000000000000000000000000000000) lt!409572) (or (= (ite c!12480 lt!409573 #b00000000000000000000000000000000) lt!409572) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12480 (select (arr!7551 (buf!7032 w2!587)) (_3!1010 lt!409574)) (select (arr!7551 (buf!7032 w2!587)) (_4!230 lt!409574)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409572))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12480 lt!409573 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12480 (select (arr!7551 (buf!7032 w3!25)) (_3!1010 lt!409574)) (select (arr!7551 (buf!7032 w3!25)) (_4!230 lt!409574)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409572))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12480 lt!409573 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!23228 () Bool)

(assert (= bs!23228 d!92000))

(declare-fun m!402621 () Bool)

(assert (=> bs!23228 m!402621))

(declare-fun m!402623 () Bool)

(assert (=> bs!23228 m!402623))

(assert (=> bm!4328 d!92000))

(declare-fun d!92002 () Bool)

(assert (=> d!92002 (= (remainingBits!0 ((_ sign_extend 32) (size!6564 (buf!7032 w3!25))) ((_ sign_extend 32) (currentByte!12997 w3!25)) ((_ sign_extend 32) (currentBit!12992 w3!25))) (bvsub (bvmul ((_ sign_extend 32) (size!6564 (buf!7032 w3!25))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12997 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12992 w3!25)))))))

(assert (=> d!91954 d!92002))

(assert (=> d!91954 d!91942))

(declare-fun d!92004 () Bool)

(assert (=> d!92004 (= (byteRangesEq!0 (ite c!12479 (select (arr!7551 (buf!7032 w1!591)) (_3!1010 lt!409571)) (select (arr!7551 (buf!7032 w1!591)) (_4!230 lt!409571))) (ite c!12479 (select (arr!7551 (buf!7032 w2!587)) (_3!1010 lt!409571)) (select (arr!7551 (buf!7032 w2!587)) (_4!230 lt!409571))) (ite c!12479 lt!409570 #b00000000000000000000000000000000) lt!409569) (or (= (ite c!12479 lt!409570 #b00000000000000000000000000000000) lt!409569) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12479 (select (arr!7551 (buf!7032 w1!591)) (_3!1010 lt!409571)) (select (arr!7551 (buf!7032 w1!591)) (_4!230 lt!409571)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409569))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12479 lt!409570 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12479 (select (arr!7551 (buf!7032 w2!587)) (_3!1010 lt!409571)) (select (arr!7551 (buf!7032 w2!587)) (_4!230 lt!409571)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409569))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12479 lt!409570 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!23229 () Bool)

(assert (= bs!23229 d!92004))

(declare-fun m!402625 () Bool)

(assert (=> bs!23229 m!402625))

(declare-fun m!402627 () Bool)

(assert (=> bs!23229 m!402627))

(assert (=> bm!4327 d!92004))

(declare-fun d!92006 () Bool)

(assert (=> d!92006 (= (remainingBits!0 ((_ sign_extend 32) (size!6564 (buf!7032 w1!591))) ((_ sign_extend 32) (currentByte!12997 w1!591)) ((_ sign_extend 32) (currentBit!12992 w1!591))) (bvsub (bvmul ((_ sign_extend 32) (size!6564 (buf!7032 w1!591))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12997 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12992 w1!591)))))))

(assert (=> d!91946 d!92006))

(assert (=> d!91946 d!91930))

(declare-fun d!92008 () Bool)

(assert (=> d!92008 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6564 (buf!7032 w1!591)) (currentByte!12997 w1!591) (currentBit!12992 w1!591))) (tuple4!461 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6564 (buf!7032 w1!591)) (currentByte!12997 w1!591) (currentBit!12992 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6564 (buf!7032 w1!591)) (currentByte!12997 w1!591) (currentBit!12992 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!270608 d!92008))

(declare-fun d!92010 () Bool)

(assert (=> d!92010 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6564 (buf!7032 w2!587)) (currentByte!12997 w2!587) (currentBit!12992 w2!587))) (tuple4!461 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6564 (buf!7032 w2!587)) (currentByte!12997 w2!587) (currentBit!12992 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6564 (buf!7032 w2!587)) (currentByte!12997 w2!587) (currentBit!12992 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!270615 d!92010))

(assert (=> d!91970 d!91874))

(declare-fun d!92012 () Bool)

(declare-fun res!225534 () Bool)

(declare-fun e!190479 () Bool)

(assert (=> d!92012 (=> res!225534 e!190479)))

(assert (=> d!92012 (= res!225534 (= (_1!12213 lt!409574) (_2!12213 lt!409574)))))

(assert (=> d!92012 (= (arrayRangesEq!1096 (buf!7032 w2!587) (buf!7032 w3!25) (_1!12213 lt!409574) (_2!12213 lt!409574)) e!190479)))

(declare-fun b!270631 () Bool)

(declare-fun e!190480 () Bool)

(assert (=> b!270631 (= e!190479 e!190480)))

(declare-fun res!225535 () Bool)

(assert (=> b!270631 (=> (not res!225535) (not e!190480))))

(assert (=> b!270631 (= res!225535 (= (select (arr!7551 (buf!7032 w2!587)) (_1!12213 lt!409574)) (select (arr!7551 (buf!7032 w3!25)) (_1!12213 lt!409574))))))

(declare-fun b!270632 () Bool)

(assert (=> b!270632 (= e!190480 (arrayRangesEq!1096 (buf!7032 w2!587) (buf!7032 w3!25) (bvadd (_1!12213 lt!409574) #b00000000000000000000000000000001) (_2!12213 lt!409574)))))

(assert (= (and d!92012 (not res!225534)) b!270631))

(assert (= (and b!270631 res!225535) b!270632))

(declare-fun m!402629 () Bool)

(assert (=> b!270631 m!402629))

(declare-fun m!402631 () Bool)

(assert (=> b!270631 m!402631))

(declare-fun m!402633 () Bool)

(assert (=> b!270632 m!402633))

(assert (=> b!270617 d!92012))

(declare-fun d!92014 () Bool)

(declare-fun res!225536 () Bool)

(declare-fun e!190481 () Bool)

(assert (=> d!92014 (=> res!225536 e!190481)))

(assert (=> d!92014 (= res!225536 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12997 w2!587)))))

(assert (=> d!92014 (= (arrayRangesEq!1096 (buf!7032 w2!587) (buf!7032 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12997 w2!587)) e!190481)))

(declare-fun b!270633 () Bool)

(declare-fun e!190482 () Bool)

(assert (=> b!270633 (= e!190481 e!190482)))

(declare-fun res!225537 () Bool)

(assert (=> b!270633 (=> (not res!225537) (not e!190482))))

(assert (=> b!270633 (= res!225537 (= (select (arr!7551 (buf!7032 w2!587)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!7551 (buf!7032 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!270634 () Bool)

(assert (=> b!270634 (= e!190482 (arrayRangesEq!1096 (buf!7032 w2!587) (buf!7032 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12997 w2!587)))))

(assert (= (and d!92014 (not res!225536)) b!270633))

(assert (= (and b!270633 res!225537) b!270634))

(declare-fun m!402635 () Bool)

(assert (=> b!270633 m!402635))

(assert (=> b!270633 m!402617))

(declare-fun m!402637 () Bool)

(assert (=> b!270634 m!402637))

(assert (=> b!270522 d!92014))

(declare-fun d!92016 () Bool)

(declare-fun res!225538 () Bool)

(declare-fun e!190483 () Bool)

(assert (=> d!92016 (=> res!225538 e!190483)))

(assert (=> d!92016 (= res!225538 (= (_1!12213 lt!409571) (_2!12213 lt!409571)))))

(assert (=> d!92016 (= (arrayRangesEq!1096 (buf!7032 w1!591) (buf!7032 w2!587) (_1!12213 lt!409571) (_2!12213 lt!409571)) e!190483)))

(declare-fun b!270635 () Bool)

(declare-fun e!190484 () Bool)

(assert (=> b!270635 (= e!190483 e!190484)))

(declare-fun res!225539 () Bool)

(assert (=> b!270635 (=> (not res!225539) (not e!190484))))

(assert (=> b!270635 (= res!225539 (= (select (arr!7551 (buf!7032 w1!591)) (_1!12213 lt!409571)) (select (arr!7551 (buf!7032 w2!587)) (_1!12213 lt!409571))))))

(declare-fun b!270636 () Bool)

(assert (=> b!270636 (= e!190484 (arrayRangesEq!1096 (buf!7032 w1!591) (buf!7032 w2!587) (bvadd (_1!12213 lt!409571) #b00000000000000000000000000000001) (_2!12213 lt!409571)))))

(assert (= (and d!92016 (not res!225538)) b!270635))

(assert (= (and b!270635 res!225539) b!270636))

(declare-fun m!402639 () Bool)

(assert (=> b!270635 m!402639))

(declare-fun m!402641 () Bool)

(assert (=> b!270635 m!402641))

(declare-fun m!402643 () Bool)

(assert (=> b!270636 m!402643))

(assert (=> b!270610 d!92016))

(declare-fun d!92018 () Bool)

(assert (=> d!92018 (= (remainingBits!0 ((_ sign_extend 32) (size!6564 (buf!7032 w2!587))) ((_ sign_extend 32) (currentByte!12997 w2!587)) ((_ sign_extend 32) (currentBit!12992 w2!587))) (bvsub (bvmul ((_ sign_extend 32) (size!6564 (buf!7032 w2!587))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12997 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12992 w2!587)))))))

(assert (=> d!91950 d!92018))

(assert (=> d!91950 d!91940))

(declare-fun d!92020 () Bool)

(assert (=> d!92020 (= (byteRangesEq!0 (select (arr!7551 (buf!7032 w1!591)) (_3!1010 lt!409571)) (select (arr!7551 (buf!7032 w2!587)) (_3!1010 lt!409571)) lt!409570 #b00000000000000000000000000001000) (or (= lt!409570 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7551 (buf!7032 w1!591)) (_3!1010 lt!409571))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409570)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7551 (buf!7032 w2!587)) (_3!1010 lt!409571))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409570)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23230 () Bool)

(assert (= bs!23230 d!92020))

(declare-fun m!402645 () Bool)

(assert (=> bs!23230 m!402645))

(declare-fun m!402647 () Bool)

(assert (=> bs!23230 m!402647))

(assert (=> b!270613 d!92020))

(declare-fun d!92022 () Bool)

(assert (=> d!92022 (= (byteRangesEq!0 (select (arr!7551 (buf!7032 w2!587)) (_3!1010 lt!409574)) (select (arr!7551 (buf!7032 w3!25)) (_3!1010 lt!409574)) lt!409573 #b00000000000000000000000000001000) (or (= lt!409573 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7551 (buf!7032 w2!587)) (_3!1010 lt!409574))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409573)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7551 (buf!7032 w3!25)) (_3!1010 lt!409574))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409573)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23231 () Bool)

(assert (= bs!23231 d!92022))

(assert (=> bs!23231 m!402645))

(declare-fun m!402649 () Bool)

(assert (=> bs!23231 m!402649))

(assert (=> b!270620 d!92022))

(push 1)

(assert (not b!270630))

(assert (not b!270632))

(assert (not b!270634))

(assert (not b!270636))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

