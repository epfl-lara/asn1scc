; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59302 () Bool)

(assert start!59302)

(declare-fun b!271357 () Bool)

(declare-fun res!226086 () Bool)

(declare-fun e!191220 () Bool)

(assert (=> b!271357 (=> (not res!226086) (not e!191220))))

(declare-datatypes ((array!15127 0))(
  ( (array!15128 (arr!7568 (Array (_ BitVec 32) (_ BitVec 8))) (size!6581 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11976 0))(
  ( (BitStream!11977 (buf!7049 array!15127) (currentByte!13032 (_ BitVec 32)) (currentBit!13027 (_ BitVec 32))) )
))
(declare-fun w2!587 () BitStream!11976)

(declare-fun w3!25 () BitStream!11976)

(declare-fun isPrefixOf!0 (BitStream!11976 BitStream!11976) Bool)

(assert (=> b!271357 (= res!226086 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!271358 () Bool)

(declare-fun e!191222 () Bool)

(declare-fun array_inv!6305 (array!15127) Bool)

(assert (=> b!271358 (= e!191222 (array_inv!6305 (buf!7049 w2!587)))))

(declare-fun b!271359 () Bool)

(declare-fun e!191219 () Bool)

(declare-fun w1!591 () BitStream!11976)

(assert (=> b!271359 (= e!191219 (array_inv!6305 (buf!7049 w1!591)))))

(declare-fun res!226087 () Bool)

(assert (=> start!59302 (=> (not res!226087) (not e!191220))))

(assert (=> start!59302 (= res!226087 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!59302 e!191220))

(declare-fun inv!12 (BitStream!11976) Bool)

(assert (=> start!59302 (and (inv!12 w1!591) e!191219)))

(assert (=> start!59302 (and (inv!12 w2!587) e!191222)))

(declare-fun e!191221 () Bool)

(assert (=> start!59302 (and (inv!12 w3!25) e!191221)))

(declare-fun b!271360 () Bool)

(assert (=> b!271360 (= e!191221 (array_inv!6305 (buf!7049 w3!25)))))

(declare-fun b!271361 () Bool)

(assert (=> b!271361 (= e!191220 (not (or (bvsge (currentByte!13032 w1!591) (size!6581 (buf!7049 w1!591))) (bvslt (currentByte!13032 w1!591) (currentByte!13032 w2!587)) (bvsgt (currentBit!13027 w1!591) (currentBit!13027 w2!587)) (bvsge (currentByte!13032 w1!591) #b00000000000000000000000000000000))))))

(declare-fun arrayRangesEq!1113 (array!15127 array!15127 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!271361 (arrayRangesEq!1113 (buf!7049 w1!591) (buf!7049 w3!25) #b00000000000000000000000000000000 (currentByte!13032 w1!591))))

(declare-datatypes ((Unit!19117 0))(
  ( (Unit!19118) )
))
(declare-fun lt!409886 () Unit!19117)

(declare-fun arrayRangesEqTransitive!376 (array!15127 array!15127 array!15127 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19117)

(assert (=> b!271361 (= lt!409886 (arrayRangesEqTransitive!376 (buf!7049 w1!591) (buf!7049 w2!587) (buf!7049 w3!25) #b00000000000000000000000000000000 (currentByte!13032 w1!591) (currentByte!13032 w2!587)))))

(assert (= (and start!59302 res!226087) b!271357))

(assert (= (and b!271357 res!226086) b!271361))

(assert (= start!59302 b!271359))

(assert (= start!59302 b!271358))

(assert (= start!59302 b!271360))

(declare-fun m!403735 () Bool)

(assert (=> start!59302 m!403735))

(declare-fun m!403737 () Bool)

(assert (=> start!59302 m!403737))

(declare-fun m!403739 () Bool)

(assert (=> start!59302 m!403739))

(declare-fun m!403741 () Bool)

(assert (=> start!59302 m!403741))

(declare-fun m!403743 () Bool)

(assert (=> b!271361 m!403743))

(declare-fun m!403745 () Bool)

(assert (=> b!271361 m!403745))

(declare-fun m!403747 () Bool)

(assert (=> b!271358 m!403747))

(declare-fun m!403749 () Bool)

(assert (=> b!271359 m!403749))

(declare-fun m!403751 () Bool)

(assert (=> b!271357 m!403751))

(declare-fun m!403753 () Bool)

(assert (=> b!271360 m!403753))

(check-sat (not b!271358) (not b!271360) (not start!59302) (not b!271361) (not b!271359) (not b!271357))
(check-sat)
(get-model)

(declare-fun d!92546 () Bool)

(declare-fun res!226128 () Bool)

(declare-fun e!191274 () Bool)

(assert (=> d!92546 (=> res!226128 e!191274)))

(assert (=> d!92546 (= res!226128 (= #b00000000000000000000000000000000 (currentByte!13032 w1!591)))))

(assert (=> d!92546 (= (arrayRangesEq!1113 (buf!7049 w1!591) (buf!7049 w3!25) #b00000000000000000000000000000000 (currentByte!13032 w1!591)) e!191274)))

(declare-fun b!271411 () Bool)

(declare-fun e!191275 () Bool)

(assert (=> b!271411 (= e!191274 e!191275)))

(declare-fun res!226129 () Bool)

(assert (=> b!271411 (=> (not res!226129) (not e!191275))))

(assert (=> b!271411 (= res!226129 (= (select (arr!7568 (buf!7049 w1!591)) #b00000000000000000000000000000000) (select (arr!7568 (buf!7049 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!271412 () Bool)

(assert (=> b!271412 (= e!191275 (arrayRangesEq!1113 (buf!7049 w1!591) (buf!7049 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13032 w1!591)))))

(assert (= (and d!92546 (not res!226128)) b!271411))

(assert (= (and b!271411 res!226129) b!271412))

(declare-fun m!403807 () Bool)

(assert (=> b!271411 m!403807))

(declare-fun m!403809 () Bool)

(assert (=> b!271411 m!403809))

(declare-fun m!403811 () Bool)

(assert (=> b!271412 m!403811))

(assert (=> b!271361 d!92546))

(declare-fun d!92564 () Bool)

(assert (=> d!92564 (arrayRangesEq!1113 (buf!7049 w1!591) (buf!7049 w3!25) #b00000000000000000000000000000000 (currentByte!13032 w1!591))))

(declare-fun lt!409898 () Unit!19117)

(declare-fun choose!425 (array!15127 array!15127 array!15127 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19117)

(assert (=> d!92564 (= lt!409898 (choose!425 (buf!7049 w1!591) (buf!7049 w2!587) (buf!7049 w3!25) #b00000000000000000000000000000000 (currentByte!13032 w1!591) (currentByte!13032 w2!587)))))

(assert (=> d!92564 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13032 w1!591)) (bvsle (currentByte!13032 w1!591) (currentByte!13032 w2!587)))))

(assert (=> d!92564 (= (arrayRangesEqTransitive!376 (buf!7049 w1!591) (buf!7049 w2!587) (buf!7049 w3!25) #b00000000000000000000000000000000 (currentByte!13032 w1!591) (currentByte!13032 w2!587)) lt!409898)))

(declare-fun bs!23358 () Bool)

(assert (= bs!23358 d!92564))

(assert (=> bs!23358 m!403743))

(declare-fun m!403829 () Bool)

(assert (=> bs!23358 m!403829))

(assert (=> b!271361 d!92564))

(declare-fun d!92580 () Bool)

(assert (=> d!92580 (= (array_inv!6305 (buf!7049 w1!591)) (bvsge (size!6581 (buf!7049 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!271359 d!92580))

(declare-fun d!92582 () Bool)

(assert (=> d!92582 (= (array_inv!6305 (buf!7049 w3!25)) (bvsge (size!6581 (buf!7049 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!271360 d!92582))

(declare-fun d!92584 () Bool)

(assert (=> d!92584 (= (array_inv!6305 (buf!7049 w2!587)) (bvsge (size!6581 (buf!7049 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!271358 d!92584))

(declare-fun d!92586 () Bool)

(declare-fun res!226143 () Bool)

(declare-fun e!191284 () Bool)

(assert (=> d!92586 (=> (not res!226143) (not e!191284))))

(assert (=> d!92586 (= res!226143 (= (size!6581 (buf!7049 w1!591)) (size!6581 (buf!7049 w2!587))))))

(assert (=> d!92586 (= (isPrefixOf!0 w1!591 w2!587) e!191284)))

(declare-fun b!271425 () Bool)

(declare-fun res!226142 () Bool)

(assert (=> b!271425 (=> (not res!226142) (not e!191284))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!271425 (= res!226142 (bvsle (bitIndex!0 (size!6581 (buf!7049 w1!591)) (currentByte!13032 w1!591) (currentBit!13027 w1!591)) (bitIndex!0 (size!6581 (buf!7049 w2!587)) (currentByte!13032 w2!587) (currentBit!13027 w2!587))))))

(declare-fun b!271426 () Bool)

(declare-fun e!191285 () Bool)

(assert (=> b!271426 (= e!191284 e!191285)))

(declare-fun res!226144 () Bool)

(assert (=> b!271426 (=> res!226144 e!191285)))

(assert (=> b!271426 (= res!226144 (= (size!6581 (buf!7049 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!271427 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15127 array!15127 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!271427 (= e!191285 (arrayBitRangesEq!0 (buf!7049 w1!591) (buf!7049 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6581 (buf!7049 w1!591)) (currentByte!13032 w1!591) (currentBit!13027 w1!591))))))

(assert (= (and d!92586 res!226143) b!271425))

(assert (= (and b!271425 res!226142) b!271426))

(assert (= (and b!271426 (not res!226144)) b!271427))

(declare-fun m!403831 () Bool)

(assert (=> b!271425 m!403831))

(declare-fun m!403833 () Bool)

(assert (=> b!271425 m!403833))

(assert (=> b!271427 m!403831))

(assert (=> b!271427 m!403831))

(declare-fun m!403835 () Bool)

(assert (=> b!271427 m!403835))

(assert (=> start!59302 d!92586))

(declare-fun d!92588 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!92588 (= (inv!12 w1!591) (invariant!0 (currentBit!13027 w1!591) (currentByte!13032 w1!591) (size!6581 (buf!7049 w1!591))))))

(declare-fun bs!23359 () Bool)

(assert (= bs!23359 d!92588))

(declare-fun m!403837 () Bool)

(assert (=> bs!23359 m!403837))

(assert (=> start!59302 d!92588))

(declare-fun d!92590 () Bool)

(assert (=> d!92590 (= (inv!12 w2!587) (invariant!0 (currentBit!13027 w2!587) (currentByte!13032 w2!587) (size!6581 (buf!7049 w2!587))))))

(declare-fun bs!23360 () Bool)

(assert (= bs!23360 d!92590))

(declare-fun m!403839 () Bool)

(assert (=> bs!23360 m!403839))

(assert (=> start!59302 d!92590))

(declare-fun d!92592 () Bool)

(assert (=> d!92592 (= (inv!12 w3!25) (invariant!0 (currentBit!13027 w3!25) (currentByte!13032 w3!25) (size!6581 (buf!7049 w3!25))))))

(declare-fun bs!23361 () Bool)

(assert (= bs!23361 d!92592))

