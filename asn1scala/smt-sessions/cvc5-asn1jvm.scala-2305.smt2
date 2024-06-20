; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58356 () Bool)

(assert start!58356)

(declare-fun b!268039 () Bool)

(declare-fun e!188069 () Bool)

(declare-datatypes ((array!14951 0))(
  ( (array!14952 (arr!7507 (Array (_ BitVec 32) (_ BitVec 8))) (size!6520 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11854 0))(
  ( (BitStream!11855 (buf!6988 array!14951) (currentByte!12900 (_ BitVec 32)) (currentBit!12895 (_ BitVec 32))) )
))
(declare-fun w2!587 () BitStream!11854)

(declare-fun array_inv!6244 (array!14951) Bool)

(assert (=> b!268039 (= e!188069 (array_inv!6244 (buf!6988 w2!587)))))

(declare-fun b!268040 () Bool)

(declare-fun res!223593 () Bool)

(declare-fun e!188067 () Bool)

(assert (=> b!268040 (=> (not res!223593) (not e!188067))))

(declare-fun w3!25 () BitStream!11854)

(declare-fun isPrefixOf!0 (BitStream!11854 BitStream!11854) Bool)

(assert (=> b!268040 (= res!223593 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!268041 () Bool)

(declare-fun w1!591 () BitStream!11854)

(assert (=> b!268041 (= e!188067 (not (or (bvsge (currentByte!12900 w1!591) (size!6520 (buf!6988 w1!591))) (bvslt (currentByte!12900 w1!591) (currentByte!12900 w2!587)) (bvsgt (currentBit!12895 w1!591) (currentBit!12895 w2!587)) (and (bvsle #b00000000000000000000000000000000 (currentBit!12895 w1!591)) (bvsle (currentBit!12895 w1!591) #b00000000000000000000000000001000)))))))

(declare-fun arrayRangesEq!1055 (array!14951 array!14951 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!268041 (arrayRangesEq!1055 (buf!6988 w1!591) (buf!6988 w3!25) #b00000000000000000000000000000000 (currentByte!12900 w1!591))))

(declare-datatypes ((Unit!19013 0))(
  ( (Unit!19014) )
))
(declare-fun lt!408230 () Unit!19013)

(declare-fun arrayRangesEqTransitive!330 (array!14951 array!14951 array!14951 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19013)

(assert (=> b!268041 (= lt!408230 (arrayRangesEqTransitive!330 (buf!6988 w1!591) (buf!6988 w2!587) (buf!6988 w3!25) #b00000000000000000000000000000000 (currentByte!12900 w1!591) (currentByte!12900 w2!587)))))

(declare-fun b!268042 () Bool)

(declare-fun e!188065 () Bool)

(assert (=> b!268042 (= e!188065 (array_inv!6244 (buf!6988 w3!25)))))

(declare-fun res!223594 () Bool)

(assert (=> start!58356 (=> (not res!223594) (not e!188067))))

(assert (=> start!58356 (= res!223594 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58356 e!188067))

(declare-fun e!188070 () Bool)

(declare-fun inv!12 (BitStream!11854) Bool)

(assert (=> start!58356 (and (inv!12 w1!591) e!188070)))

(assert (=> start!58356 (and (inv!12 w2!587) e!188069)))

(assert (=> start!58356 (and (inv!12 w3!25) e!188065)))

(declare-fun b!268043 () Bool)

(assert (=> b!268043 (= e!188070 (array_inv!6244 (buf!6988 w1!591)))))

(assert (= (and start!58356 res!223594) b!268040))

(assert (= (and b!268040 res!223593) b!268041))

(assert (= start!58356 b!268043))

(assert (= start!58356 b!268039))

(assert (= start!58356 b!268042))

(declare-fun m!399413 () Bool)

(assert (=> b!268039 m!399413))

(declare-fun m!399415 () Bool)

(assert (=> b!268042 m!399415))

(declare-fun m!399417 () Bool)

(assert (=> start!58356 m!399417))

(declare-fun m!399419 () Bool)

(assert (=> start!58356 m!399419))

(declare-fun m!399421 () Bool)

(assert (=> start!58356 m!399421))

(declare-fun m!399423 () Bool)

(assert (=> start!58356 m!399423))

(declare-fun m!399425 () Bool)

(assert (=> b!268041 m!399425))

(declare-fun m!399427 () Bool)

(assert (=> b!268041 m!399427))

(declare-fun m!399429 () Bool)

(assert (=> b!268043 m!399429))

(declare-fun m!399431 () Bool)

(assert (=> b!268040 m!399431))

(push 1)

(assert (not b!268042))

(assert (not b!268043))

(assert (not start!58356))

(assert (not b!268040))

(assert (not b!268039))

(assert (not b!268041))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!90556 () Bool)

(declare-fun res!223611 () Bool)

(declare-fun e!188117 () Bool)

(assert (=> d!90556 (=> res!223611 e!188117)))

(assert (=> d!90556 (= res!223611 (= #b00000000000000000000000000000000 (currentByte!12900 w1!591)))))

(assert (=> d!90556 (= (arrayRangesEq!1055 (buf!6988 w1!591) (buf!6988 w3!25) #b00000000000000000000000000000000 (currentByte!12900 w1!591)) e!188117)))

(declare-fun b!268078 () Bool)

(declare-fun e!188118 () Bool)

(assert (=> b!268078 (= e!188117 e!188118)))

(declare-fun res!223612 () Bool)

(assert (=> b!268078 (=> (not res!223612) (not e!188118))))

(assert (=> b!268078 (= res!223612 (= (select (arr!7507 (buf!6988 w1!591)) #b00000000000000000000000000000000) (select (arr!7507 (buf!6988 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!268079 () Bool)

(assert (=> b!268079 (= e!188118 (arrayRangesEq!1055 (buf!6988 w1!591) (buf!6988 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12900 w1!591)))))

(assert (= (and d!90556 (not res!223611)) b!268078))

(assert (= (and b!268078 res!223612) b!268079))

(declare-fun m!399473 () Bool)

(assert (=> b!268078 m!399473))

(declare-fun m!399475 () Bool)

(assert (=> b!268078 m!399475))

(declare-fun m!399477 () Bool)

(assert (=> b!268079 m!399477))

(assert (=> b!268041 d!90556))

(declare-fun d!90564 () Bool)

(assert (=> d!90564 (arrayRangesEq!1055 (buf!6988 w1!591) (buf!6988 w3!25) #b00000000000000000000000000000000 (currentByte!12900 w1!591))))

(declare-fun lt!408239 () Unit!19013)

(declare-fun choose!372 (array!14951 array!14951 array!14951 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19013)

(assert (=> d!90564 (= lt!408239 (choose!372 (buf!6988 w1!591) (buf!6988 w2!587) (buf!6988 w3!25) #b00000000000000000000000000000000 (currentByte!12900 w1!591) (currentByte!12900 w2!587)))))

(assert (=> d!90564 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!12900 w1!591)) (bvsle (currentByte!12900 w1!591) (currentByte!12900 w2!587)))))

(assert (=> d!90564 (= (arrayRangesEqTransitive!330 (buf!6988 w1!591) (buf!6988 w2!587) (buf!6988 w3!25) #b00000000000000000000000000000000 (currentByte!12900 w1!591) (currentByte!12900 w2!587)) lt!408239)))

(declare-fun bs!23001 () Bool)

(assert (= bs!23001 d!90564))

(assert (=> bs!23001 m!399425))

(declare-fun m!399479 () Bool)

(assert (=> bs!23001 m!399479))

(assert (=> b!268041 d!90564))

(declare-fun d!90566 () Bool)

(declare-fun res!223634 () Bool)

(declare-fun e!188133 () Bool)

(assert (=> d!90566 (=> (not res!223634) (not e!188133))))

(assert (=> d!90566 (= res!223634 (= (size!6520 (buf!6988 w1!591)) (size!6520 (buf!6988 w2!587))))))

(assert (=> d!90566 (= (isPrefixOf!0 w1!591 w2!587) e!188133)))

(declare-fun b!268099 () Bool)

(declare-fun res!223633 () Bool)

(assert (=> b!268099 (=> (not res!223633) (not e!188133))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!268099 (= res!223633 (bvsle (bitIndex!0 (size!6520 (buf!6988 w1!591)) (currentByte!12900 w1!591) (currentBit!12895 w1!591)) (bitIndex!0 (size!6520 (buf!6988 w2!587)) (currentByte!12900 w2!587) (currentBit!12895 w2!587))))))

(declare-fun b!268100 () Bool)

(declare-fun e!188134 () Bool)

(assert (=> b!268100 (= e!188133 e!188134)))

(declare-fun res!223632 () Bool)

(assert (=> b!268100 (=> res!223632 e!188134)))

(assert (=> b!268100 (= res!223632 (= (size!6520 (buf!6988 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!268101 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14951 array!14951 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!268101 (= e!188134 (arrayBitRangesEq!0 (buf!6988 w1!591) (buf!6988 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6520 (buf!6988 w1!591)) (currentByte!12900 w1!591) (currentBit!12895 w1!591))))))

(assert (= (and d!90566 res!223634) b!268099))

(assert (= (and b!268099 res!223633) b!268100))

(assert (= (and b!268100 (not res!223632)) b!268101))

(declare-fun m!399493 () Bool)

(assert (=> b!268099 m!399493))

(declare-fun m!399495 () Bool)

(assert (=> b!268099 m!399495))

(assert (=> b!268101 m!399493))

(assert (=> b!268101 m!399493))

(declare-fun m!399497 () Bool)

(assert (=> b!268101 m!399497))

(assert (=> start!58356 d!90566))

(declare-fun d!90576 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!90576 (= (inv!12 w1!591) (invariant!0 (currentBit!12895 w1!591) (currentByte!12900 w1!591) (size!6520 (buf!6988 w1!591))))))

(declare-fun bs!23005 () Bool)

(assert (= bs!23005 d!90576))

(declare-fun m!399505 () Bool)

(assert (=> bs!23005 m!399505))

(assert (=> start!58356 d!90576))

(declare-fun d!90580 () Bool)

(assert (=> d!90580 (= (inv!12 w2!587) (invariant!0 (currentBit!12895 w2!587) (currentByte!12900 w2!587) (size!6520 (buf!6988 w2!587))))))

(declare-fun bs!23006 () Bool)

(assert (= bs!23006 d!90580))

(declare-fun m!399507 () Bool)

(assert (=> bs!23006 m!399507))

(assert (=> start!58356 d!90580))

(declare-fun d!90582 () Bool)

(assert (=> d!90582 (= (inv!12 w3!25) (invariant!0 (currentBit!12895 w3!25) (currentByte!12900 w3!25) (size!6520 (buf!6988 w3!25))))))

(declare-fun bs!23007 () Bool)

(assert (= bs!23007 d!90582))

(declare-fun m!399509 () Bool)

(assert (=> bs!23007 m!399509))

(assert (=> start!58356 d!90582))

(declare-fun d!90584 () Bool)

(assert (=> d!90584 (= (array_inv!6244 (buf!6988 w3!25)) (bvsge (size!6520 (buf!6988 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!268042 d!90584))

(declare-fun d!90586 () Bool)

(assert (=> d!90586 (= (array_inv!6244 (buf!6988 w1!591)) (bvsge (size!6520 (buf!6988 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!268043 d!90586))

(declare-fun d!90588 () Bool)

(declare-fun res!223645 () Bool)

(declare-fun e!188141 () Bool)

(assert (=> d!90588 (=> (not res!223645) (not e!188141))))

(assert (=> d!90588 (= res!223645 (= (size!6520 (buf!6988 w2!587)) (size!6520 (buf!6988 w3!25))))))

(assert (=> d!90588 (= (isPrefixOf!0 w2!587 w3!25) e!188141)))

(declare-fun b!268110 () Bool)

(declare-fun res!223644 () Bool)

(assert (=> b!268110 (=> (not res!223644) (not e!188141))))

(assert (=> b!268110 (= res!223644 (bvsle (bitIndex!0 (size!6520 (buf!6988 w2!587)) (currentByte!12900 w2!587) (currentBit!12895 w2!587)) (bitIndex!0 (size!6520 (buf!6988 w3!25)) (currentByte!12900 w3!25) (currentBit!12895 w3!25))))))

(declare-fun b!268111 () Bool)

(declare-fun e!188142 () Bool)

(assert (=> b!268111 (= e!188141 e!188142)))

(declare-fun res!223643 () Bool)

(assert (=> b!268111 (=> res!223643 e!188142)))

(assert (=> b!268111 (= res!223643 (= (size!6520 (buf!6988 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!268112 () Bool)

(assert (=> b!268112 (= e!188142 (arrayBitRangesEq!0 (buf!6988 w2!587) (buf!6988 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6520 (buf!6988 w2!587)) (currentByte!12900 w2!587) (currentBit!12895 w2!587))))))

(assert (= (and d!90588 res!223645) b!268110))

(assert (= (and b!268110 res!223644) b!268111))

(assert (= (and b!268111 (not res!223643)) b!268112))

(assert (=> b!268110 m!399495))

(declare-fun m!399511 () Bool)

(assert (=> b!268110 m!399511))

(assert (=> b!268112 m!399495))

(assert (=> b!268112 m!399495))

(declare-fun m!399513 () Bool)

(assert (=> b!268112 m!399513))

(assert (=> b!268040 d!90588))

(declare-fun d!90590 () Bool)

(assert (=> d!90590 (= (array_inv!6244 (buf!6988 w2!587)) (bvsge (size!6520 (buf!6988 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!268039 d!90590))

(push 1)

(assert (not d!90564))

(assert (not b!268079))

(assert (not b!268099))

(assert (not b!268110))

(assert (not b!268112))

(assert (not d!90582))

(assert (not d!90576))

(assert (not d!90580))

(assert (not b!268101))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!268142 () Bool)

(declare-fun res!223675 () Bool)

(declare-fun lt!408254 () (_ BitVec 32))

(assert (=> b!268142 (= res!223675 (= lt!408254 #b00000000000000000000000000000000))))

(declare-fun e!188170 () Bool)

(assert (=> b!268142 (=> res!223675 e!188170)))

(declare-fun e!188169 () Bool)

(assert (=> b!268142 (= e!188169 e!188170)))

(declare-fun b!268143 () Bool)

(declare-fun e!188167 () Bool)

(declare-fun e!188171 () Bool)

(assert (=> b!268143 (= e!188167 e!188171)))

(declare-fun res!223672 () Bool)

(assert (=> b!268143 (=> (not res!223672) (not e!188171))))

(declare-fun e!188172 () Bool)

(assert (=> b!268143 (= res!223672 e!188172)))

(declare-fun res!223673 () Bool)

(assert (=> b!268143 (=> res!223673 e!188172)))

(declare-datatypes ((tuple4!408 0))(
  ( (tuple4!409 (_1!12187 (_ BitVec 32)) (_2!12187 (_ BitVec 32)) (_3!984 (_ BitVec 32)) (_4!204 (_ BitVec 32))) )
))
(declare-fun lt!408252 () tuple4!408)

(assert (=> b!268143 (= res!223673 (bvsge (_1!12187 lt!408252) (_2!12187 lt!408252)))))

(assert (=> b!268143 (= lt!408254 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6520 (buf!6988 w1!591)) (currentByte!12900 w1!591) (currentBit!12895 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!408253 () (_ BitVec 32))

(assert (=> b!268143 (= lt!408253 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!408)

(assert (=> b!268143 (= lt!408252 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6520 (buf!6988 w1!591)) (currentByte!12900 w1!591) (currentBit!12895 w1!591))))))

(declare-fun b!268144 () Bool)

(declare-fun e!188168 () Bool)

(assert (=> b!268144 (= e!188171 e!188168)))

(declare-fun c!12357 () Bool)

(assert (=> b!268144 (= c!12357 (= (_3!984 lt!408252) (_4!204 lt!408252)))))

(declare-fun b!268145 () Bool)

(assert (=> b!268145 (= e!188172 (arrayRangesEq!1055 (buf!6988 w1!591) (buf!6988 w2!587) (_1!12187 lt!408252) (_2!12187 lt!408252)))))

(declare-fun call!4226 () Bool)

(declare-fun bm!4223 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4223 (= call!4226 (byteRangesEq!0 (select (arr!7507 (buf!6988 w1!591)) (_3!984 lt!408252)) (select (arr!7507 (buf!6988 w2!587)) (_3!984 lt!408252)) lt!408253 (ite c!12357 lt!408254 #b00000000000000000000000000001000)))))

(declare-fun d!90614 () Bool)

(declare-fun res!223674 () Bool)

(assert (=> d!90614 (=> res!223674 e!188167)))

(assert (=> d!90614 (= res!223674 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6520 (buf!6988 w1!591)) (currentByte!12900 w1!591) (currentBit!12895 w1!591))))))

(assert (=> d!90614 (= (arrayBitRangesEq!0 (buf!6988 w1!591) (buf!6988 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6520 (buf!6988 w1!591)) (currentByte!12900 w1!591) (currentBit!12895 w1!591))) e!188167)))

(declare-fun b!268146 () Bool)

(assert (=> b!268146 (= e!188168 call!4226)))

(declare-fun b!268147 () Bool)

(assert (=> b!268147 (= e!188170 (byteRangesEq!0 (select (arr!7507 (buf!6988 w1!591)) (_4!204 lt!408252)) (select (arr!7507 (buf!6988 w2!587)) (_4!204 lt!408252)) #b00000000000000000000000000000000 lt!408254))))

(declare-fun b!268148 () Bool)

(assert (=> b!268148 (= e!188168 e!188169)))

(declare-fun res!223671 () Bool)

(assert (=> b!268148 (= res!223671 call!4226)))

(assert (=> b!268148 (=> (not res!223671) (not e!188169))))

(assert (= (and d!90614 (not res!223674)) b!268143))

(assert (= (and b!268143 (not res!223673)) b!268145))

(assert (= (and b!268143 res!223672) b!268144))

(assert (= (and b!268144 c!12357) b!268146))

(assert (= (and b!268144 (not c!12357)) b!268148))

(assert (= (and b!268148 res!223671) b!268142))

(assert (= (and b!268142 (not res!223675)) b!268147))

(assert (= (or b!268146 b!268148) bm!4223))

(assert (=> b!268143 m!399493))

(declare-fun m!399545 () Bool)

(assert (=> b!268143 m!399545))

(declare-fun m!399547 () Bool)

(assert (=> b!268145 m!399547))

(declare-fun m!399549 () Bool)

(assert (=> bm!4223 m!399549))

(declare-fun m!399551 () Bool)

(assert (=> bm!4223 m!399551))

(assert (=> bm!4223 m!399549))

(assert (=> bm!4223 m!399551))

(declare-fun m!399553 () Bool)

(assert (=> bm!4223 m!399553))

(declare-fun m!399555 () Bool)

(assert (=> b!268147 m!399555))

(declare-fun m!399557 () Bool)

(assert (=> b!268147 m!399557))

(assert (=> b!268147 m!399555))

(assert (=> b!268147 m!399557))

(declare-fun m!399559 () Bool)

(assert (=> b!268147 m!399559))

(assert (=> b!268101 d!90614))

(declare-fun d!90622 () Bool)

(declare-fun e!188179 () Bool)

(assert (=> d!90622 e!188179))

(declare-fun res!223689 () Bool)

(assert (=> d!90622 (=> (not res!223689) (not e!188179))))

(declare-fun lt!408293 () (_ BitVec 64))

(declare-fun lt!408295 () (_ BitVec 64))

(declare-fun lt!408296 () (_ BitVec 64))

(assert (=> d!90622 (= res!223689 (= lt!408295 (bvsub lt!408293 lt!408296)))))

(assert (=> d!90622 (or (= (bvand lt!408293 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408296 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408293 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408293 lt!408296) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!90622 (= lt!408296 (remainingBits!0 ((_ sign_extend 32) (size!6520 (buf!6988 w1!591))) ((_ sign_extend 32) (currentByte!12900 w1!591)) ((_ sign_extend 32) (currentBit!12895 w1!591))))))

(declare-fun lt!408291 () (_ BitVec 64))

(declare-fun lt!408294 () (_ BitVec 64))

(assert (=> d!90622 (= lt!408293 (bvmul lt!408291 lt!408294))))

(assert (=> d!90622 (or (= lt!408291 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408294 (bvsdiv (bvmul lt!408291 lt!408294) lt!408291)))))

(assert (=> d!90622 (= lt!408294 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90622 (= lt!408291 ((_ sign_extend 32) (size!6520 (buf!6988 w1!591))))))

(assert (=> d!90622 (= lt!408295 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12900 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12895 w1!591))))))

(assert (=> d!90622 (invariant!0 (currentBit!12895 w1!591) (currentByte!12900 w1!591) (size!6520 (buf!6988 w1!591)))))

(assert (=> d!90622 (= (bitIndex!0 (size!6520 (buf!6988 w1!591)) (currentByte!12900 w1!591) (currentBit!12895 w1!591)) lt!408295)))

(declare-fun b!268161 () Bool)

(declare-fun res!223688 () Bool)

(assert (=> b!268161 (=> (not res!223688) (not e!188179))))

(assert (=> b!268161 (= res!223688 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408295))))

(declare-fun b!268162 () Bool)

(declare-fun lt!408292 () (_ BitVec 64))

(assert (=> b!268162 (= e!188179 (bvsle lt!408295 (bvmul lt!408292 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268162 (or (= lt!408292 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408292 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408292)))))

(assert (=> b!268162 (= lt!408292 ((_ sign_extend 32) (size!6520 (buf!6988 w1!591))))))

(assert (= (and d!90622 res!223689) b!268161))

(assert (= (and b!268161 res!223688) b!268162))

(declare-fun m!399565 () Bool)

(assert (=> d!90622 m!399565))

(assert (=> d!90622 m!399505))

(assert (=> b!268101 d!90622))

(declare-fun b!268163 () Bool)

(declare-fun res!223694 () Bool)

(declare-fun lt!408299 () (_ BitVec 32))

(assert (=> b!268163 (= res!223694 (= lt!408299 #b00000000000000000000000000000000))))

(declare-fun e!188183 () Bool)

(assert (=> b!268163 (=> res!223694 e!188183)))

(declare-fun e!188182 () Bool)

(assert (=> b!268163 (= e!188182 e!188183)))

(declare-fun b!268164 () Bool)

(declare-fun e!188180 () Bool)

(declare-fun e!188184 () Bool)

(assert (=> b!268164 (= e!188180 e!188184)))

(declare-fun res!223691 () Bool)

(assert (=> b!268164 (=> (not res!223691) (not e!188184))))

(declare-fun e!188185 () Bool)

(assert (=> b!268164 (= res!223691 e!188185)))

(declare-fun res!223692 () Bool)

(assert (=> b!268164 (=> res!223692 e!188185)))

(declare-fun lt!408297 () tuple4!408)

(assert (=> b!268164 (= res!223692 (bvsge (_1!12187 lt!408297) (_2!12187 lt!408297)))))

(assert (=> b!268164 (= lt!408299 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6520 (buf!6988 w2!587)) (currentByte!12900 w2!587) (currentBit!12895 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!408298 () (_ BitVec 32))

(assert (=> b!268164 (= lt!408298 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268164 (= lt!408297 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6520 (buf!6988 w2!587)) (currentByte!12900 w2!587) (currentBit!12895 w2!587))))))

(declare-fun b!268165 () Bool)

(declare-fun e!188181 () Bool)

(assert (=> b!268165 (= e!188184 e!188181)))

(declare-fun c!12358 () Bool)

(assert (=> b!268165 (= c!12358 (= (_3!984 lt!408297) (_4!204 lt!408297)))))

(declare-fun b!268166 () Bool)

(assert (=> b!268166 (= e!188185 (arrayRangesEq!1055 (buf!6988 w2!587) (buf!6988 w3!25) (_1!12187 lt!408297) (_2!12187 lt!408297)))))

(declare-fun bm!4224 () Bool)

(declare-fun call!4227 () Bool)

(assert (=> bm!4224 (= call!4227 (byteRangesEq!0 (select (arr!7507 (buf!6988 w2!587)) (_3!984 lt!408297)) (select (arr!7507 (buf!6988 w3!25)) (_3!984 lt!408297)) lt!408298 (ite c!12358 lt!408299 #b00000000000000000000000000001000)))))

(declare-fun d!90628 () Bool)

(declare-fun res!223693 () Bool)

(assert (=> d!90628 (=> res!223693 e!188180)))

(assert (=> d!90628 (= res!223693 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6520 (buf!6988 w2!587)) (currentByte!12900 w2!587) (currentBit!12895 w2!587))))))

(assert (=> d!90628 (= (arrayBitRangesEq!0 (buf!6988 w2!587) (buf!6988 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6520 (buf!6988 w2!587)) (currentByte!12900 w2!587) (currentBit!12895 w2!587))) e!188180)))

(declare-fun b!268167 () Bool)

(assert (=> b!268167 (= e!188181 call!4227)))

(declare-fun b!268168 () Bool)

(assert (=> b!268168 (= e!188183 (byteRangesEq!0 (select (arr!7507 (buf!6988 w2!587)) (_4!204 lt!408297)) (select (arr!7507 (buf!6988 w3!25)) (_4!204 lt!408297)) #b00000000000000000000000000000000 lt!408299))))

(declare-fun b!268169 () Bool)

(assert (=> b!268169 (= e!188181 e!188182)))

(declare-fun res!223690 () Bool)

(assert (=> b!268169 (= res!223690 call!4227)))

(assert (=> b!268169 (=> (not res!223690) (not e!188182))))

(assert (= (and d!90628 (not res!223693)) b!268164))

(assert (= (and b!268164 (not res!223692)) b!268166))

(assert (= (and b!268164 res!223691) b!268165))

(assert (= (and b!268165 c!12358) b!268167))

(assert (= (and b!268165 (not c!12358)) b!268169))

(assert (= (and b!268169 res!223690) b!268163))

(assert (= (and b!268163 (not res!223694)) b!268168))

(assert (= (or b!268167 b!268169) bm!4224))

(assert (=> b!268164 m!399495))

(declare-fun m!399567 () Bool)

(assert (=> b!268164 m!399567))

(declare-fun m!399569 () Bool)

(assert (=> b!268166 m!399569))

(declare-fun m!399571 () Bool)

(assert (=> bm!4224 m!399571))

(declare-fun m!399573 () Bool)

(assert (=> bm!4224 m!399573))

(assert (=> bm!4224 m!399571))

(assert (=> bm!4224 m!399573))

(declare-fun m!399575 () Bool)

(assert (=> bm!4224 m!399575))

(declare-fun m!399577 () Bool)

(assert (=> b!268168 m!399577))

(declare-fun m!399579 () Bool)

(assert (=> b!268168 m!399579))

(assert (=> b!268168 m!399577))

(assert (=> b!268168 m!399579))

(declare-fun m!399581 () Bool)

(assert (=> b!268168 m!399581))

(assert (=> b!268112 d!90628))

(declare-fun d!90634 () Bool)

(declare-fun e!188186 () Bool)

(assert (=> d!90634 e!188186))

(declare-fun res!223696 () Bool)

(assert (=> d!90634 (=> (not res!223696) (not e!188186))))

(declare-fun lt!408305 () (_ BitVec 64))

(declare-fun lt!408304 () (_ BitVec 64))

(declare-fun lt!408302 () (_ BitVec 64))

(assert (=> d!90634 (= res!223696 (= lt!408304 (bvsub lt!408302 lt!408305)))))

(assert (=> d!90634 (or (= (bvand lt!408302 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408305 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408302 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408302 lt!408305) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!90634 (= lt!408305 (remainingBits!0 ((_ sign_extend 32) (size!6520 (buf!6988 w2!587))) ((_ sign_extend 32) (currentByte!12900 w2!587)) ((_ sign_extend 32) (currentBit!12895 w2!587))))))

(declare-fun lt!408300 () (_ BitVec 64))

(declare-fun lt!408303 () (_ BitVec 64))

(assert (=> d!90634 (= lt!408302 (bvmul lt!408300 lt!408303))))

(assert (=> d!90634 (or (= lt!408300 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408303 (bvsdiv (bvmul lt!408300 lt!408303) lt!408300)))))

(assert (=> d!90634 (= lt!408303 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90634 (= lt!408300 ((_ sign_extend 32) (size!6520 (buf!6988 w2!587))))))

(assert (=> d!90634 (= lt!408304 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12900 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12895 w2!587))))))

(assert (=> d!90634 (invariant!0 (currentBit!12895 w2!587) (currentByte!12900 w2!587) (size!6520 (buf!6988 w2!587)))))

(assert (=> d!90634 (= (bitIndex!0 (size!6520 (buf!6988 w2!587)) (currentByte!12900 w2!587) (currentBit!12895 w2!587)) lt!408304)))

(declare-fun b!268170 () Bool)

(declare-fun res!223695 () Bool)

(assert (=> b!268170 (=> (not res!223695) (not e!188186))))

(assert (=> b!268170 (= res!223695 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408304))))

(declare-fun b!268171 () Bool)

(declare-fun lt!408301 () (_ BitVec 64))

(assert (=> b!268171 (= e!188186 (bvsle lt!408304 (bvmul lt!408301 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268171 (or (= lt!408301 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408301 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408301)))))

(assert (=> b!268171 (= lt!408301 ((_ sign_extend 32) (size!6520 (buf!6988 w2!587))))))

(assert (= (and d!90634 res!223696) b!268170))

(assert (= (and b!268170 res!223695) b!268171))

(declare-fun m!399583 () Bool)

(assert (=> d!90634 m!399583))

(assert (=> d!90634 m!399507))

(assert (=> b!268112 d!90634))

(declare-fun d!90636 () Bool)

(assert (=> d!90636 (= (invariant!0 (currentBit!12895 w2!587) (currentByte!12900 w2!587) (size!6520 (buf!6988 w2!587))) (and (bvsge (currentBit!12895 w2!587) #b00000000000000000000000000000000) (bvslt (currentBit!12895 w2!587) #b00000000000000000000000000001000) (bvsge (currentByte!12900 w2!587) #b00000000000000000000000000000000) (or (bvslt (currentByte!12900 w2!587) (size!6520 (buf!6988 w2!587))) (and (= (currentBit!12895 w2!587) #b00000000000000000000000000000000) (= (currentByte!12900 w2!587) (size!6520 (buf!6988 w2!587)))))))))

(assert (=> d!90580 d!90636))

(assert (=> d!90564 d!90556))

(declare-fun d!90638 () Bool)

(assert (=> d!90638 (arrayRangesEq!1055 (buf!6988 w1!591) (buf!6988 w3!25) #b00000000000000000000000000000000 (currentByte!12900 w1!591))))

(assert (=> d!90638 true))

(declare-fun _$16!98 () Unit!19013)

(assert (=> d!90638 (= (choose!372 (buf!6988 w1!591) (buf!6988 w2!587) (buf!6988 w3!25) #b00000000000000000000000000000000 (currentByte!12900 w1!591) (currentByte!12900 w2!587)) _$16!98)))

(declare-fun bs!23013 () Bool)

(assert (= bs!23013 d!90638))

(assert (=> bs!23013 m!399425))

(assert (=> d!90564 d!90638))

(declare-fun d!90640 () Bool)

(assert (=> d!90640 (= (invariant!0 (currentBit!12895 w3!25) (currentByte!12900 w3!25) (size!6520 (buf!6988 w3!25))) (and (bvsge (currentBit!12895 w3!25) #b00000000000000000000000000000000) (bvslt (currentBit!12895 w3!25) #b00000000000000000000000000001000) (bvsge (currentByte!12900 w3!25) #b00000000000000000000000000000000) (or (bvslt (currentByte!12900 w3!25) (size!6520 (buf!6988 w3!25))) (and (= (currentBit!12895 w3!25) #b00000000000000000000000000000000) (= (currentByte!12900 w3!25) (size!6520 (buf!6988 w3!25)))))))))

(assert (=> d!90582 d!90640))

(assert (=> b!268099 d!90622))

(assert (=> b!268099 d!90634))

(assert (=> b!268110 d!90634))

(declare-fun d!90642 () Bool)

(declare-fun e!188199 () Bool)

(assert (=> d!90642 e!188199))

(declare-fun res!223708 () Bool)

(assert (=> d!90642 (=> (not res!223708) (not e!188199))))

(declare-fun lt!408316 () (_ BitVec 64))

(declare-fun lt!408317 () (_ BitVec 64))

(declare-fun lt!408314 () (_ BitVec 64))

(assert (=> d!90642 (= res!223708 (= lt!408316 (bvsub lt!408314 lt!408317)))))

(assert (=> d!90642 (or (= (bvand lt!408314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408317 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408314 lt!408317) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!90642 (= lt!408317 (remainingBits!0 ((_ sign_extend 32) (size!6520 (buf!6988 w3!25))) ((_ sign_extend 32) (currentByte!12900 w3!25)) ((_ sign_extend 32) (currentBit!12895 w3!25))))))

(declare-fun lt!408312 () (_ BitVec 64))

(declare-fun lt!408315 () (_ BitVec 64))

(assert (=> d!90642 (= lt!408314 (bvmul lt!408312 lt!408315))))

(assert (=> d!90642 (or (= lt!408312 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408315 (bvsdiv (bvmul lt!408312 lt!408315) lt!408312)))))

(assert (=> d!90642 (= lt!408315 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90642 (= lt!408312 ((_ sign_extend 32) (size!6520 (buf!6988 w3!25))))))

(assert (=> d!90642 (= lt!408316 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12900 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12895 w3!25))))))

(assert (=> d!90642 (invariant!0 (currentBit!12895 w3!25) (currentByte!12900 w3!25) (size!6520 (buf!6988 w3!25)))))

(assert (=> d!90642 (= (bitIndex!0 (size!6520 (buf!6988 w3!25)) (currentByte!12900 w3!25) (currentBit!12895 w3!25)) lt!408316)))

(declare-fun b!268186 () Bool)

(declare-fun res!223707 () Bool)

(assert (=> b!268186 (=> (not res!223707) (not e!188199))))

(assert (=> b!268186 (= res!223707 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408316))))

(declare-fun b!268187 () Bool)

(declare-fun lt!408313 () (_ BitVec 64))

(assert (=> b!268187 (= e!188199 (bvsle lt!408316 (bvmul lt!408313 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268187 (or (= lt!408313 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408313 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408313)))))

(assert (=> b!268187 (= lt!408313 ((_ sign_extend 32) (size!6520 (buf!6988 w3!25))))))

(assert (= (and d!90642 res!223708) b!268186))

(assert (= (and b!268186 res!223707) b!268187))

(declare-fun m!399585 () Bool)

(assert (=> d!90642 m!399585))

(assert (=> d!90642 m!399509))

(assert (=> b!268110 d!90642))

(declare-fun d!90644 () Bool)

(assert (=> d!90644 (= (invariant!0 (currentBit!12895 w1!591) (currentByte!12900 w1!591) (size!6520 (buf!6988 w1!591))) (and (bvsge (currentBit!12895 w1!591) #b00000000000000000000000000000000) (bvslt (currentBit!12895 w1!591) #b00000000000000000000000000001000) (bvsge (currentByte!12900 w1!591) #b00000000000000000000000000000000) (or (bvslt (currentByte!12900 w1!591) (size!6520 (buf!6988 w1!591))) (and (= (currentBit!12895 w1!591) #b00000000000000000000000000000000) (= (currentByte!12900 w1!591) (size!6520 (buf!6988 w1!591)))))))))

(assert (=> d!90576 d!90644))

(declare-fun d!90646 () Bool)

(declare-fun res!223709 () Bool)

(declare-fun e!188200 () Bool)

(assert (=> d!90646 (=> res!223709 e!188200)))

(assert (=> d!90646 (= res!223709 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12900 w1!591)))))

(assert (=> d!90646 (= (arrayRangesEq!1055 (buf!6988 w1!591) (buf!6988 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12900 w1!591)) e!188200)))

(declare-fun b!268188 () Bool)

(declare-fun e!188201 () Bool)

(assert (=> b!268188 (= e!188200 e!188201)))

(declare-fun res!223710 () Bool)

(assert (=> b!268188 (=> (not res!223710) (not e!188201))))

(assert (=> b!268188 (= res!223710 (= (select (arr!7507 (buf!6988 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7507 (buf!6988 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!268189 () Bool)

(assert (=> b!268189 (= e!188201 (arrayRangesEq!1055 (buf!6988 w1!591) (buf!6988 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12900 w1!591)))))

(assert (= (and d!90646 (not res!223709)) b!268188))

(assert (= (and b!268188 res!223710) b!268189))

(declare-fun m!399587 () Bool)

(assert (=> b!268188 m!399587))

(declare-fun m!399589 () Bool)

(assert (=> b!268188 m!399589))

(declare-fun m!399591 () Bool)

(assert (=> b!268189 m!399591))

(assert (=> b!268079 d!90646))

(push 1)

(assert (not b!268168))

(assert (not d!90634))

(assert (not bm!4224))

(assert (not d!90642))

(assert (not b!268147))

(assert (not d!90638))

(assert (not b!268143))

(assert (not d!90622))

(assert (not b!268164))

(assert (not b!268166))

(assert (not bm!4223))

(assert (not b!268189))

(assert (not b!268145))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

