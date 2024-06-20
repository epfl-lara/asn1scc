; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59304 () Bool)

(assert start!59304)

(declare-fun res!226092 () Bool)

(declare-fun e!191244 () Bool)

(assert (=> start!59304 (=> (not res!226092) (not e!191244))))

(declare-datatypes ((array!15129 0))(
  ( (array!15130 (arr!7569 (Array (_ BitVec 32) (_ BitVec 8))) (size!6582 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11978 0))(
  ( (BitStream!11979 (buf!7050 array!15129) (currentByte!13033 (_ BitVec 32)) (currentBit!13028 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11978)

(declare-fun w2!587 () BitStream!11978)

(declare-fun isPrefixOf!0 (BitStream!11978 BitStream!11978) Bool)

(assert (=> start!59304 (= res!226092 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!59304 e!191244))

(declare-fun e!191240 () Bool)

(declare-fun inv!12 (BitStream!11978) Bool)

(assert (=> start!59304 (and (inv!12 w1!591) e!191240)))

(declare-fun e!191242 () Bool)

(assert (=> start!59304 (and (inv!12 w2!587) e!191242)))

(declare-fun w3!25 () BitStream!11978)

(declare-fun e!191241 () Bool)

(assert (=> start!59304 (and (inv!12 w3!25) e!191241)))

(declare-fun b!271372 () Bool)

(declare-fun array_inv!6306 (array!15129) Bool)

(assert (=> b!271372 (= e!191240 (array_inv!6306 (buf!7050 w1!591)))))

(declare-fun b!271373 () Bool)

(assert (=> b!271373 (= e!191241 (array_inv!6306 (buf!7050 w3!25)))))

(declare-fun b!271374 () Bool)

(assert (=> b!271374 (= e!191244 (not (or (bvsge (currentByte!13033 w1!591) (size!6582 (buf!7050 w1!591))) (bvslt (currentByte!13033 w1!591) (currentByte!13033 w2!587)) (bvsgt (currentBit!13028 w1!591) (currentBit!13028 w2!587)) (bvsge (currentByte!13033 w1!591) #b00000000000000000000000000000000))))))

(declare-fun arrayRangesEq!1114 (array!15129 array!15129 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!271374 (arrayRangesEq!1114 (buf!7050 w1!591) (buf!7050 w3!25) #b00000000000000000000000000000000 (currentByte!13033 w1!591))))

(declare-datatypes ((Unit!19119 0))(
  ( (Unit!19120) )
))
(declare-fun lt!409889 () Unit!19119)

(declare-fun arrayRangesEqTransitive!377 (array!15129 array!15129 array!15129 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19119)

(assert (=> b!271374 (= lt!409889 (arrayRangesEqTransitive!377 (buf!7050 w1!591) (buf!7050 w2!587) (buf!7050 w3!25) #b00000000000000000000000000000000 (currentByte!13033 w1!591) (currentByte!13033 w2!587)))))

(declare-fun b!271375 () Bool)

(assert (=> b!271375 (= e!191242 (array_inv!6306 (buf!7050 w2!587)))))

(declare-fun b!271376 () Bool)

(declare-fun res!226093 () Bool)

(assert (=> b!271376 (=> (not res!226093) (not e!191244))))

(assert (=> b!271376 (= res!226093 (isPrefixOf!0 w2!587 w3!25))))

(assert (= (and start!59304 res!226092) b!271376))

(assert (= (and b!271376 res!226093) b!271374))

(assert (= start!59304 b!271372))

(assert (= start!59304 b!271375))

(assert (= start!59304 b!271373))

(declare-fun m!403755 () Bool)

(assert (=> b!271375 m!403755))

(declare-fun m!403757 () Bool)

(assert (=> b!271376 m!403757))

(declare-fun m!403759 () Bool)

(assert (=> b!271372 m!403759))

(declare-fun m!403761 () Bool)

(assert (=> b!271373 m!403761))

(declare-fun m!403763 () Bool)

(assert (=> start!59304 m!403763))

(declare-fun m!403765 () Bool)

(assert (=> start!59304 m!403765))

(declare-fun m!403767 () Bool)

(assert (=> start!59304 m!403767))

(declare-fun m!403769 () Bool)

(assert (=> start!59304 m!403769))

(declare-fun m!403771 () Bool)

(assert (=> b!271374 m!403771))

(declare-fun m!403773 () Bool)

(assert (=> b!271374 m!403773))

(push 1)

(assert (not b!271372))

(assert (not b!271373))

(assert (not b!271375))

(assert (not b!271374))

(assert (not start!59304))

(assert (not b!271376))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!92538 () Bool)

(assert (=> d!92538 (= (array_inv!6306 (buf!7050 w2!587)) (bvsge (size!6582 (buf!7050 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!271375 d!92538))

(declare-fun d!92540 () Bool)

(assert (=> d!92540 (= (array_inv!6306 (buf!7050 w3!25)) (bvsge (size!6582 (buf!7050 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!271373 d!92540))

(declare-fun d!92542 () Bool)

(declare-fun res!226109 () Bool)

(declare-fun e!191256 () Bool)

(assert (=> d!92542 (=> (not res!226109) (not e!191256))))

(assert (=> d!92542 (= res!226109 (= (size!6582 (buf!7050 w1!591)) (size!6582 (buf!7050 w2!587))))))

(assert (=> d!92542 (= (isPrefixOf!0 w1!591 w2!587) e!191256)))

(declare-fun b!271392 () Bool)

(declare-fun res!226110 () Bool)

(assert (=> b!271392 (=> (not res!226110) (not e!191256))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!271392 (= res!226110 (bvsle (bitIndex!0 (size!6582 (buf!7050 w1!591)) (currentByte!13033 w1!591) (currentBit!13028 w1!591)) (bitIndex!0 (size!6582 (buf!7050 w2!587)) (currentByte!13033 w2!587) (currentBit!13028 w2!587))))))

(declare-fun b!271393 () Bool)

(declare-fun e!191257 () Bool)

(assert (=> b!271393 (= e!191256 e!191257)))

(declare-fun res!226111 () Bool)

(assert (=> b!271393 (=> res!226111 e!191257)))

(assert (=> b!271393 (= res!226111 (= (size!6582 (buf!7050 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!271394 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15129 array!15129 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!271394 (= e!191257 (arrayBitRangesEq!0 (buf!7050 w1!591) (buf!7050 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6582 (buf!7050 w1!591)) (currentByte!13033 w1!591) (currentBit!13028 w1!591))))))

(assert (= (and d!92542 res!226109) b!271392))

(assert (= (and b!271392 res!226110) b!271393))

(assert (= (and b!271393 (not res!226111)) b!271394))

(declare-fun m!403781 () Bool)

(assert (=> b!271392 m!403781))

(declare-fun m!403783 () Bool)

(assert (=> b!271392 m!403783))

(assert (=> b!271394 m!403781))

(assert (=> b!271394 m!403781))

(declare-fun m!403785 () Bool)

(assert (=> b!271394 m!403785))

(assert (=> start!59304 d!92542))

(declare-fun d!92548 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!92548 (= (inv!12 w1!591) (invariant!0 (currentBit!13028 w1!591) (currentByte!13033 w1!591) (size!6582 (buf!7050 w1!591))))))

(declare-fun bs!23350 () Bool)

(assert (= bs!23350 d!92548))

(declare-fun m!403787 () Bool)

(assert (=> bs!23350 m!403787))

(assert (=> start!59304 d!92548))

(declare-fun d!92550 () Bool)

(assert (=> d!92550 (= (inv!12 w2!587) (invariant!0 (currentBit!13028 w2!587) (currentByte!13033 w2!587) (size!6582 (buf!7050 w2!587))))))

(declare-fun bs!23351 () Bool)

(assert (= bs!23351 d!92550))

(declare-fun m!403789 () Bool)

(assert (=> bs!23351 m!403789))

(assert (=> start!59304 d!92550))

(declare-fun d!92552 () Bool)

(assert (=> d!92552 (= (inv!12 w3!25) (invariant!0 (currentBit!13028 w3!25) (currentByte!13033 w3!25) (size!6582 (buf!7050 w3!25))))))

(declare-fun bs!23352 () Bool)

(assert (= bs!23352 d!92552))

(declare-fun m!403791 () Bool)

(assert (=> bs!23352 m!403791))

(assert (=> start!59304 d!92552))

(declare-fun d!92554 () Bool)

(declare-fun res!226126 () Bool)

(declare-fun e!191272 () Bool)

(assert (=> d!92554 (=> res!226126 e!191272)))

(assert (=> d!92554 (= res!226126 (= #b00000000000000000000000000000000 (currentByte!13033 w1!591)))))

(assert (=> d!92554 (= (arrayRangesEq!1114 (buf!7050 w1!591) (buf!7050 w3!25) #b00000000000000000000000000000000 (currentByte!13033 w1!591)) e!191272)))

(declare-fun b!271409 () Bool)

(declare-fun e!191273 () Bool)

(assert (=> b!271409 (= e!191272 e!191273)))

(declare-fun res!226127 () Bool)

(assert (=> b!271409 (=> (not res!226127) (not e!191273))))

(assert (=> b!271409 (= res!226127 (= (select (arr!7569 (buf!7050 w1!591)) #b00000000000000000000000000000000) (select (arr!7569 (buf!7050 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!271410 () Bool)

(assert (=> b!271410 (= e!191273 (arrayRangesEq!1114 (buf!7050 w1!591) (buf!7050 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13033 w1!591)))))

(assert (= (and d!92554 (not res!226126)) b!271409))

(assert (= (and b!271409 res!226127) b!271410))

(declare-fun m!403799 () Bool)

(assert (=> b!271409 m!403799))

(declare-fun m!403801 () Bool)

(assert (=> b!271409 m!403801))

(declare-fun m!403803 () Bool)

(assert (=> b!271410 m!403803))

(assert (=> b!271374 d!92554))

(declare-fun d!92558 () Bool)

(assert (=> d!92558 (arrayRangesEq!1114 (buf!7050 w1!591) (buf!7050 w3!25) #b00000000000000000000000000000000 (currentByte!13033 w1!591))))

(declare-fun lt!409895 () Unit!19119)

(declare-fun choose!424 (array!15129 array!15129 array!15129 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19119)

(assert (=> d!92558 (= lt!409895 (choose!424 (buf!7050 w1!591) (buf!7050 w2!587) (buf!7050 w3!25) #b00000000000000000000000000000000 (currentByte!13033 w1!591) (currentByte!13033 w2!587)))))

(assert (=> d!92558 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13033 w1!591)) (bvsle (currentByte!13033 w1!591) (currentByte!13033 w2!587)))))

(assert (=> d!92558 (= (arrayRangesEqTransitive!377 (buf!7050 w1!591) (buf!7050 w2!587) (buf!7050 w3!25) #b00000000000000000000000000000000 (currentByte!13033 w1!591) (currentByte!13033 w2!587)) lt!409895)))

(declare-fun bs!23354 () Bool)

(assert (= bs!23354 d!92558))

(assert (=> bs!23354 m!403771))

(declare-fun m!403817 () Bool)

(assert (=> bs!23354 m!403817))

(assert (=> b!271374 d!92558))

(declare-fun d!92568 () Bool)

(assert (=> d!92568 (= (array_inv!6306 (buf!7050 w1!591)) (bvsge (size!6582 (buf!7050 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!271372 d!92568))

(declare-fun d!92572 () Bool)

(declare-fun res!226133 () Bool)

(declare-fun e!191278 () Bool)

(assert (=> d!92572 (=> (not res!226133) (not e!191278))))

(assert (=> d!92572 (= res!226133 (= (size!6582 (buf!7050 w2!587)) (size!6582 (buf!7050 w3!25))))))

(assert (=> d!92572 (= (isPrefixOf!0 w2!587 w3!25) e!191278)))

(declare-fun b!271416 () Bool)

(declare-fun res!226134 () Bool)

(assert (=> b!271416 (=> (not res!226134) (not e!191278))))

(assert (=> b!271416 (= res!226134 (bvsle (bitIndex!0 (size!6582 (buf!7050 w2!587)) (currentByte!13033 w2!587) (currentBit!13028 w2!587)) (bitIndex!0 (size!6582 (buf!7050 w3!25)) (currentByte!13033 w3!25) (currentBit!13028 w3!25))))))

(declare-fun b!271417 () Bool)

(declare-fun e!191279 () Bool)

(assert (=> b!271417 (= e!191278 e!191279)))

(declare-fun res!226135 () Bool)

(assert (=> b!271417 (=> res!226135 e!191279)))

(assert (=> b!271417 (= res!226135 (= (size!6582 (buf!7050 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!271418 () Bool)

(assert (=> b!271418 (= e!191279 (arrayBitRangesEq!0 (buf!7050 w2!587) (buf!7050 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6582 (buf!7050 w2!587)) (currentByte!13033 w2!587) (currentBit!13028 w2!587))))))

(assert (= (and d!92572 res!226133) b!271416))

(assert (= (and b!271416 res!226134) b!271417))

(assert (= (and b!271417 (not res!226135)) b!271418))

(assert (=> b!271416 m!403783))

(declare-fun m!403825 () Bool)

(assert (=> b!271416 m!403825))

(assert (=> b!271418 m!403783))

(assert (=> b!271418 m!403783))

(declare-fun m!403827 () Bool)

(assert (=> b!271418 m!403827))

(assert (=> b!271376 d!92572))

(push 1)

