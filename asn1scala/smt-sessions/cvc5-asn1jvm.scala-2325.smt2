; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59300 () Bool)

(assert start!59300)

(declare-fun b!271342 () Bool)

(declare-fun res!226080 () Bool)

(declare-fun e!191200 () Bool)

(assert (=> b!271342 (=> (not res!226080) (not e!191200))))

(declare-datatypes ((array!15125 0))(
  ( (array!15126 (arr!7567 (Array (_ BitVec 32) (_ BitVec 8))) (size!6580 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11974 0))(
  ( (BitStream!11975 (buf!7048 array!15125) (currentByte!13031 (_ BitVec 32)) (currentBit!13026 (_ BitVec 32))) )
))
(declare-fun w2!587 () BitStream!11974)

(declare-fun w3!25 () BitStream!11974)

(declare-fun isPrefixOf!0 (BitStream!11974 BitStream!11974) Bool)

(assert (=> b!271342 (= res!226080 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!271343 () Bool)

(declare-fun e!191198 () Bool)

(declare-fun w1!591 () BitStream!11974)

(declare-fun array_inv!6304 (array!15125) Bool)

(assert (=> b!271343 (= e!191198 (array_inv!6304 (buf!7048 w1!591)))))

(declare-fun b!271345 () Bool)

(assert (=> b!271345 (= e!191200 (not (or (bvsge (currentByte!13031 w1!591) (size!6580 (buf!7048 w1!591))) (bvslt (currentByte!13031 w1!591) (currentByte!13031 w2!587)) (bvsgt (currentBit!13026 w1!591) (currentBit!13026 w2!587)) (bvsge (currentByte!13031 w1!591) #b00000000000000000000000000000000))))))

(declare-fun arrayRangesEq!1112 (array!15125 array!15125 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!271345 (arrayRangesEq!1112 (buf!7048 w1!591) (buf!7048 w3!25) #b00000000000000000000000000000000 (currentByte!13031 w1!591))))

(declare-datatypes ((Unit!19115 0))(
  ( (Unit!19116) )
))
(declare-fun lt!409883 () Unit!19115)

(declare-fun arrayRangesEqTransitive!375 (array!15125 array!15125 array!15125 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19115)

(assert (=> b!271345 (= lt!409883 (arrayRangesEqTransitive!375 (buf!7048 w1!591) (buf!7048 w2!587) (buf!7048 w3!25) #b00000000000000000000000000000000 (currentByte!13031 w1!591) (currentByte!13031 w2!587)))))

(declare-fun b!271346 () Bool)

(declare-fun e!191203 () Bool)

(assert (=> b!271346 (= e!191203 (array_inv!6304 (buf!7048 w2!587)))))

(declare-fun res!226081 () Bool)

(assert (=> start!59300 (=> (not res!226081) (not e!191200))))

(assert (=> start!59300 (= res!226081 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!59300 e!191200))

(declare-fun inv!12 (BitStream!11974) Bool)

(assert (=> start!59300 (and (inv!12 w1!591) e!191198)))

(assert (=> start!59300 (and (inv!12 w2!587) e!191203)))

(declare-fun e!191202 () Bool)

(assert (=> start!59300 (and (inv!12 w3!25) e!191202)))

(declare-fun b!271344 () Bool)

(assert (=> b!271344 (= e!191202 (array_inv!6304 (buf!7048 w3!25)))))

(assert (= (and start!59300 res!226081) b!271342))

(assert (= (and b!271342 res!226080) b!271345))

(assert (= start!59300 b!271343))

(assert (= start!59300 b!271346))

(assert (= start!59300 b!271344))

(declare-fun m!403715 () Bool)

(assert (=> b!271345 m!403715))

(declare-fun m!403717 () Bool)

(assert (=> b!271345 m!403717))

(declare-fun m!403719 () Bool)

(assert (=> b!271342 m!403719))

(declare-fun m!403721 () Bool)

(assert (=> b!271344 m!403721))

(declare-fun m!403723 () Bool)

(assert (=> b!271346 m!403723))

(declare-fun m!403725 () Bool)

(assert (=> start!59300 m!403725))

(declare-fun m!403727 () Bool)

(assert (=> start!59300 m!403727))

(declare-fun m!403729 () Bool)

(assert (=> start!59300 m!403729))

(declare-fun m!403731 () Bool)

(assert (=> start!59300 m!403731))

(declare-fun m!403733 () Bool)

(assert (=> b!271343 m!403733))

(push 1)

(assert (not b!271343))

(assert (not b!271342))

(assert (not b!271344))

(assert (not b!271346))

(assert (not start!59300))

(assert (not b!271345))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!92536 () Bool)

(declare-fun res!226108 () Bool)

(declare-fun e!191254 () Bool)

(assert (=> d!92536 (=> (not res!226108) (not e!191254))))

(assert (=> d!92536 (= res!226108 (= (size!6580 (buf!7048 w2!587)) (size!6580 (buf!7048 w3!25))))))

(assert (=> d!92536 (= (isPrefixOf!0 w2!587 w3!25) e!191254)))

(declare-fun b!271389 () Bool)

(declare-fun res!226107 () Bool)

(assert (=> b!271389 (=> (not res!226107) (not e!191254))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!271389 (= res!226107 (bvsle (bitIndex!0 (size!6580 (buf!7048 w2!587)) (currentByte!13031 w2!587) (currentBit!13026 w2!587)) (bitIndex!0 (size!6580 (buf!7048 w3!25)) (currentByte!13031 w3!25) (currentBit!13026 w3!25))))))

(declare-fun b!271390 () Bool)

(declare-fun e!191255 () Bool)

(assert (=> b!271390 (= e!191254 e!191255)))

(declare-fun res!226106 () Bool)

(assert (=> b!271390 (=> res!226106 e!191255)))

(assert (=> b!271390 (= res!226106 (= (size!6580 (buf!7048 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!271391 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15125 array!15125 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!271391 (= e!191255 (arrayBitRangesEq!0 (buf!7048 w2!587) (buf!7048 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6580 (buf!7048 w2!587)) (currentByte!13031 w2!587) (currentBit!13026 w2!587))))))

(assert (= (and d!92536 res!226108) b!271389))

(assert (= (and b!271389 res!226107) b!271390))

(assert (= (and b!271390 (not res!226106)) b!271391))

(declare-fun m!403775 () Bool)

(assert (=> b!271389 m!403775))

(declare-fun m!403777 () Bool)

(assert (=> b!271389 m!403777))

(assert (=> b!271391 m!403775))

(assert (=> b!271391 m!403775))

(declare-fun m!403779 () Bool)

(assert (=> b!271391 m!403779))

(assert (=> b!271342 d!92536))

(declare-fun d!92544 () Bool)

(declare-fun res!226116 () Bool)

(declare-fun e!191262 () Bool)

(assert (=> d!92544 (=> res!226116 e!191262)))

(assert (=> d!92544 (= res!226116 (= #b00000000000000000000000000000000 (currentByte!13031 w1!591)))))

(assert (=> d!92544 (= (arrayRangesEq!1112 (buf!7048 w1!591) (buf!7048 w3!25) #b00000000000000000000000000000000 (currentByte!13031 w1!591)) e!191262)))

(declare-fun b!271399 () Bool)

(declare-fun e!191263 () Bool)

(assert (=> b!271399 (= e!191262 e!191263)))

(declare-fun res!226117 () Bool)

(assert (=> b!271399 (=> (not res!226117) (not e!191263))))

(assert (=> b!271399 (= res!226117 (= (select (arr!7567 (buf!7048 w1!591)) #b00000000000000000000000000000000) (select (arr!7567 (buf!7048 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!271400 () Bool)

(assert (=> b!271400 (= e!191263 (arrayRangesEq!1112 (buf!7048 w1!591) (buf!7048 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13031 w1!591)))))

(assert (= (and d!92544 (not res!226116)) b!271399))

(assert (= (and b!271399 res!226117) b!271400))

(declare-fun m!403793 () Bool)

(assert (=> b!271399 m!403793))

(declare-fun m!403795 () Bool)

(assert (=> b!271399 m!403795))

(declare-fun m!403797 () Bool)

(assert (=> b!271400 m!403797))

(assert (=> b!271345 d!92544))

(declare-fun d!92556 () Bool)

(assert (=> d!92556 (arrayRangesEq!1112 (buf!7048 w1!591) (buf!7048 w3!25) #b00000000000000000000000000000000 (currentByte!13031 w1!591))))

(declare-fun lt!409892 () Unit!19115)

(declare-fun choose!423 (array!15125 array!15125 array!15125 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19115)

(assert (=> d!92556 (= lt!409892 (choose!423 (buf!7048 w1!591) (buf!7048 w2!587) (buf!7048 w3!25) #b00000000000000000000000000000000 (currentByte!13031 w1!591) (currentByte!13031 w2!587)))))

(assert (=> d!92556 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13031 w1!591)) (bvsle (currentByte!13031 w1!591) (currentByte!13031 w2!587)))))

(assert (=> d!92556 (= (arrayRangesEqTransitive!375 (buf!7048 w1!591) (buf!7048 w2!587) (buf!7048 w3!25) #b00000000000000000000000000000000 (currentByte!13031 w1!591) (currentByte!13031 w2!587)) lt!409892)))

(declare-fun bs!23353 () Bool)

(assert (= bs!23353 d!92556))

(assert (=> bs!23353 m!403715))

(declare-fun m!403805 () Bool)

(assert (=> bs!23353 m!403805))

(assert (=> b!271345 d!92556))

(declare-fun d!92560 () Bool)

(assert (=> d!92560 (= (array_inv!6304 (buf!7048 w2!587)) (bvsge (size!6580 (buf!7048 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!271346 d!92560))

(declare-fun d!92562 () Bool)

(declare-fun res!226132 () Bool)

(declare-fun e!191276 () Bool)

(assert (=> d!92562 (=> (not res!226132) (not e!191276))))

(assert (=> d!92562 (= res!226132 (= (size!6580 (buf!7048 w1!591)) (size!6580 (buf!7048 w2!587))))))

(assert (=> d!92562 (= (isPrefixOf!0 w1!591 w2!587) e!191276)))

(declare-fun b!271413 () Bool)

(declare-fun res!226131 () Bool)

(assert (=> b!271413 (=> (not res!226131) (not e!191276))))

(assert (=> b!271413 (= res!226131 (bvsle (bitIndex!0 (size!6580 (buf!7048 w1!591)) (currentByte!13031 w1!591) (currentBit!13026 w1!591)) (bitIndex!0 (size!6580 (buf!7048 w2!587)) (currentByte!13031 w2!587) (currentBit!13026 w2!587))))))

(declare-fun b!271414 () Bool)

(declare-fun e!191277 () Bool)

(assert (=> b!271414 (= e!191276 e!191277)))

(declare-fun res!226130 () Bool)

(assert (=> b!271414 (=> res!226130 e!191277)))

(assert (=> b!271414 (= res!226130 (= (size!6580 (buf!7048 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!271415 () Bool)

(assert (=> b!271415 (= e!191277 (arrayBitRangesEq!0 (buf!7048 w1!591) (buf!7048 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6580 (buf!7048 w1!591)) (currentByte!13031 w1!591) (currentBit!13026 w1!591))))))

(assert (= (and d!92562 res!226132) b!271413))

(assert (= (and b!271413 res!226131) b!271414))

(assert (= (and b!271414 (not res!226130)) b!271415))

(declare-fun m!403813 () Bool)

(assert (=> b!271413 m!403813))

(assert (=> b!271413 m!403775))

(assert (=> b!271415 m!403813))

(assert (=> b!271415 m!403813))

(declare-fun m!403815 () Bool)

(assert (=> b!271415 m!403815))

(assert (=> start!59300 d!92562))

(declare-fun d!92566 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!92566 (= (inv!12 w1!591) (invariant!0 (currentBit!13026 w1!591) (currentByte!13031 w1!591) (size!6580 (buf!7048 w1!591))))))

(declare-fun bs!23355 () Bool)

(assert (= bs!23355 d!92566))

(declare-fun m!403819 () Bool)

(assert (=> bs!23355 m!403819))

(assert (=> start!59300 d!92566))

(declare-fun d!92570 () Bool)

(assert (=> d!92570 (= (inv!12 w2!587) (invariant!0 (currentBit!13026 w2!587) (currentByte!13031 w2!587) (size!6580 (buf!7048 w2!587))))))

(declare-fun bs!23356 () Bool)

(assert (= bs!23356 d!92570))

(declare-fun m!403821 () Bool)

(assert (=> bs!23356 m!403821))

(assert (=> start!59300 d!92570))

(declare-fun d!92574 () Bool)

(assert (=> d!92574 (= (inv!12 w3!25) (invariant!0 (currentBit!13026 w3!25) (currentByte!13031 w3!25) (size!6580 (buf!7048 w3!25))))))

(declare-fun bs!23357 () Bool)

(assert (= bs!23357 d!92574))

(declare-fun m!403823 () Bool)

(assert (=> bs!23357 m!403823))

(assert (=> start!59300 d!92574))

(declare-fun d!92576 () Bool)

(assert (=> d!92576 (= (array_inv!6304 (buf!7048 w3!25)) (bvsge (size!6580 (buf!7048 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!271344 d!92576))

(declare-fun d!92578 () Bool)

(assert (=> d!92578 (= (array_inv!6304 (buf!7048 w1!591)) (bvsge (size!6580 (buf!7048 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!271343 d!92578))

(push 1)

(assert (not d!92570))

(assert (not b!271400))

(assert (not b!271389))

(assert (not d!92574))

(assert (not b!271413))

(assert (not b!271415))

(assert (not b!271391))

(assert (not d!92566))

(assert (not d!92556))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

