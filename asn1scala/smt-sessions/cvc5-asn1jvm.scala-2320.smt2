; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59042 () Bool)

(assert start!59042)

(declare-fun b!270657 () Bool)

(declare-fun e!190516 () Bool)

(declare-datatypes ((array!15080 0))(
  ( (array!15081 (arr!7552 (Array (_ BitVec 32) (_ BitVec 8))) (size!6565 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11944 0))(
  ( (BitStream!11945 (buf!7033 array!15080) (currentByte!13007 (_ BitVec 32)) (currentBit!13002 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11944)

(declare-fun w2!587 () BitStream!11944)

(assert (=> b!270657 (= e!190516 (and (bvsge (currentByte!13007 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!13007 w1!591) (size!6565 (buf!7033 w2!587)))))))

(declare-fun w3!25 () BitStream!11944)

(assert (=> b!270657 (= (select (arr!7552 (buf!7033 w2!587)) (currentByte!13007 w1!591)) (select (arr!7552 (buf!7033 w3!25)) (currentByte!13007 w1!591)))))

(declare-datatypes ((Unit!19085 0))(
  ( (Unit!19086) )
))
(declare-fun lt!409579 () Unit!19085)

(declare-fun arrayRangesEqImpliesEq!157 (array!15080 array!15080 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19085)

(assert (=> b!270657 (= lt!409579 (arrayRangesEqImpliesEq!157 (buf!7033 w2!587) (buf!7033 w3!25) #b00000000000000000000000000000000 (currentByte!13007 w1!591) (currentByte!13007 w2!587)))))

(declare-fun b!270658 () Bool)

(declare-fun e!190512 () Bool)

(assert (=> b!270658 (= e!190512 (not e!190516))))

(declare-fun res!225556 () Bool)

(assert (=> b!270658 (=> res!225556 e!190516)))

(assert (=> b!270658 (= res!225556 (or (bvsge (currentByte!13007 w1!591) (size!6565 (buf!7033 w1!591))) (bvsge (currentByte!13007 w1!591) (currentByte!13007 w2!587))))))

(declare-fun arrayRangesEq!1097 (array!15080 array!15080 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!270658 (arrayRangesEq!1097 (buf!7033 w1!591) (buf!7033 w3!25) #b00000000000000000000000000000000 (currentByte!13007 w1!591))))

(declare-fun lt!409580 () Unit!19085)

(declare-fun arrayRangesEqTransitive!360 (array!15080 array!15080 array!15080 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19085)

(assert (=> b!270658 (= lt!409580 (arrayRangesEqTransitive!360 (buf!7033 w1!591) (buf!7033 w2!587) (buf!7033 w3!25) #b00000000000000000000000000000000 (currentByte!13007 w1!591) (currentByte!13007 w2!587)))))

(declare-fun b!270659 () Bool)

(declare-fun e!190509 () Bool)

(declare-fun array_inv!6289 (array!15080) Bool)

(assert (=> b!270659 (= e!190509 (array_inv!6289 (buf!7033 w3!25)))))

(declare-fun b!270660 () Bool)

(declare-fun e!190514 () Bool)

(assert (=> b!270660 (= e!190514 (array_inv!6289 (buf!7033 w2!587)))))

(declare-fun b!270662 () Bool)

(declare-fun res!225554 () Bool)

(assert (=> b!270662 (=> (not res!225554) (not e!190512))))

(declare-fun isPrefixOf!0 (BitStream!11944 BitStream!11944) Bool)

(assert (=> b!270662 (= res!225554 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun res!225555 () Bool)

(assert (=> start!59042 (=> (not res!225555) (not e!190512))))

(assert (=> start!59042 (= res!225555 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!59042 e!190512))

(declare-fun e!190515 () Bool)

(declare-fun inv!12 (BitStream!11944) Bool)

(assert (=> start!59042 (and (inv!12 w1!591) e!190515)))

(assert (=> start!59042 (and (inv!12 w2!587) e!190514)))

(assert (=> start!59042 (and (inv!12 w3!25) e!190509)))

(declare-fun b!270661 () Bool)

(assert (=> b!270661 (= e!190515 (array_inv!6289 (buf!7033 w1!591)))))

(assert (= (and start!59042 res!225555) b!270662))

(assert (= (and b!270662 res!225554) b!270658))

(assert (= (and b!270658 (not res!225556)) b!270657))

(assert (= start!59042 b!270661))

(assert (= start!59042 b!270660))

(assert (= start!59042 b!270659))

(declare-fun m!402687 () Bool)

(assert (=> b!270660 m!402687))

(declare-fun m!402689 () Bool)

(assert (=> b!270662 m!402689))

(declare-fun m!402691 () Bool)

(assert (=> b!270659 m!402691))

(declare-fun m!402693 () Bool)

(assert (=> b!270661 m!402693))

(declare-fun m!402695 () Bool)

(assert (=> start!59042 m!402695))

(declare-fun m!402697 () Bool)

(assert (=> start!59042 m!402697))

(declare-fun m!402699 () Bool)

(assert (=> start!59042 m!402699))

(declare-fun m!402701 () Bool)

(assert (=> start!59042 m!402701))

(declare-fun m!402703 () Bool)

(assert (=> b!270658 m!402703))

(declare-fun m!402705 () Bool)

(assert (=> b!270658 m!402705))

(declare-fun m!402707 () Bool)

(assert (=> b!270657 m!402707))

(declare-fun m!402709 () Bool)

(assert (=> b!270657 m!402709))

(declare-fun m!402711 () Bool)

(assert (=> b!270657 m!402711))

(push 1)

(assert (not b!270658))

(assert (not b!270659))

(assert (not b!270661))

(assert (not b!270660))

(assert (not b!270657))

(assert (not start!59042))

(assert (not b!270662))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!92058 () Bool)

(assert (=> d!92058 (= (array_inv!6289 (buf!7033 w2!587)) (bvsge (size!6565 (buf!7033 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!270660 d!92058))

(declare-fun d!92060 () Bool)

(assert (=> d!92060 (= (array_inv!6289 (buf!7033 w1!591)) (bvsge (size!6565 (buf!7033 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!270661 d!92060))

(declare-fun d!92062 () Bool)

(assert (=> d!92062 (and (bvsge (currentByte!13007 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!13007 w1!591) (size!6565 (buf!7033 w2!587))) (bvslt (currentByte!13007 w1!591) (size!6565 (buf!7033 w3!25))) (= (select (arr!7552 (buf!7033 w2!587)) (currentByte!13007 w1!591)) (select (arr!7552 (buf!7033 w3!25)) (currentByte!13007 w1!591))))))

(declare-fun lt!409595 () Unit!19085)

(declare-fun choose!398 (array!15080 array!15080 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19085)

(assert (=> d!92062 (= lt!409595 (choose!398 (buf!7033 w2!587) (buf!7033 w3!25) #b00000000000000000000000000000000 (currentByte!13007 w1!591) (currentByte!13007 w2!587)))))

(assert (=> d!92062 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13007 w2!587)))))

(assert (=> d!92062 (= (arrayRangesEqImpliesEq!157 (buf!7033 w2!587) (buf!7033 w3!25) #b00000000000000000000000000000000 (currentByte!13007 w1!591) (currentByte!13007 w2!587)) lt!409595)))

(declare-fun bs!23239 () Bool)

(assert (= bs!23239 d!92062))

(assert (=> bs!23239 m!402707))

(assert (=> bs!23239 m!402709))

(declare-fun m!402765 () Bool)

(assert (=> bs!23239 m!402765))

(assert (=> b!270657 d!92062))

(declare-fun d!92066 () Bool)

(declare-fun res!225597 () Bool)

(declare-fun e!190580 () Bool)

(assert (=> d!92066 (=> (not res!225597) (not e!190580))))

(assert (=> d!92066 (= res!225597 (= (size!6565 (buf!7033 w2!587)) (size!6565 (buf!7033 w3!25))))))

(assert (=> d!92066 (= (isPrefixOf!0 w2!587 w3!25) e!190580)))

(declare-fun b!270720 () Bool)

(declare-fun res!225596 () Bool)

(assert (=> b!270720 (=> (not res!225596) (not e!190580))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!270720 (= res!225596 (bvsle (bitIndex!0 (size!6565 (buf!7033 w2!587)) (currentByte!13007 w2!587) (currentBit!13002 w2!587)) (bitIndex!0 (size!6565 (buf!7033 w3!25)) (currentByte!13007 w3!25) (currentBit!13002 w3!25))))))

(declare-fun b!270721 () Bool)

(declare-fun e!190579 () Bool)

(assert (=> b!270721 (= e!190580 e!190579)))

(declare-fun res!225598 () Bool)

(assert (=> b!270721 (=> res!225598 e!190579)))

(assert (=> b!270721 (= res!225598 (= (size!6565 (buf!7033 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!270722 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15080 array!15080 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!270722 (= e!190579 (arrayBitRangesEq!0 (buf!7033 w2!587) (buf!7033 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6565 (buf!7033 w2!587)) (currentByte!13007 w2!587) (currentBit!13002 w2!587))))))

(assert (= (and d!92066 res!225597) b!270720))

(assert (= (and b!270720 res!225596) b!270721))

(assert (= (and b!270721 (not res!225598)) b!270722))

(declare-fun m!402783 () Bool)

(assert (=> b!270720 m!402783))

(declare-fun m!402787 () Bool)

(assert (=> b!270720 m!402787))

(assert (=> b!270722 m!402783))

(assert (=> b!270722 m!402783))

(declare-fun m!402789 () Bool)

(assert (=> b!270722 m!402789))

(assert (=> b!270662 d!92066))

(declare-fun d!92078 () Bool)

(declare-fun res!225606 () Bool)

(declare-fun e!190586 () Bool)

(assert (=> d!92078 (=> (not res!225606) (not e!190586))))

(assert (=> d!92078 (= res!225606 (= (size!6565 (buf!7033 w1!591)) (size!6565 (buf!7033 w2!587))))))

(assert (=> d!92078 (= (isPrefixOf!0 w1!591 w2!587) e!190586)))

(declare-fun b!270729 () Bool)

(declare-fun res!225605 () Bool)

(assert (=> b!270729 (=> (not res!225605) (not e!190586))))

(assert (=> b!270729 (= res!225605 (bvsle (bitIndex!0 (size!6565 (buf!7033 w1!591)) (currentByte!13007 w1!591) (currentBit!13002 w1!591)) (bitIndex!0 (size!6565 (buf!7033 w2!587)) (currentByte!13007 w2!587) (currentBit!13002 w2!587))))))

(declare-fun b!270730 () Bool)

(declare-fun e!190585 () Bool)

(assert (=> b!270730 (= e!190586 e!190585)))

(declare-fun res!225607 () Bool)

(assert (=> b!270730 (=> res!225607 e!190585)))

(assert (=> b!270730 (= res!225607 (= (size!6565 (buf!7033 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!270731 () Bool)

(assert (=> b!270731 (= e!190585 (arrayBitRangesEq!0 (buf!7033 w1!591) (buf!7033 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6565 (buf!7033 w1!591)) (currentByte!13007 w1!591) (currentBit!13002 w1!591))))))

(assert (= (and d!92078 res!225606) b!270729))

(assert (= (and b!270729 res!225605) b!270730))

(assert (= (and b!270730 (not res!225607)) b!270731))

(declare-fun m!402797 () Bool)

(assert (=> b!270729 m!402797))

(assert (=> b!270729 m!402783))

(assert (=> b!270731 m!402797))

(assert (=> b!270731 m!402797))

(declare-fun m!402803 () Bool)

(assert (=> b!270731 m!402803))

(assert (=> start!59042 d!92078))

(declare-fun d!92088 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!92088 (= (inv!12 w1!591) (invariant!0 (currentBit!13002 w1!591) (currentByte!13007 w1!591) (size!6565 (buf!7033 w1!591))))))

(declare-fun bs!23246 () Bool)

(assert (= bs!23246 d!92088))

(declare-fun m!402805 () Bool)

(assert (=> bs!23246 m!402805))

(assert (=> start!59042 d!92088))

(declare-fun d!92092 () Bool)

(assert (=> d!92092 (= (inv!12 w2!587) (invariant!0 (currentBit!13002 w2!587) (currentByte!13007 w2!587) (size!6565 (buf!7033 w2!587))))))

(declare-fun bs!23247 () Bool)

(assert (= bs!23247 d!92092))

(declare-fun m!402807 () Bool)

(assert (=> bs!23247 m!402807))

(assert (=> start!59042 d!92092))

(declare-fun d!92094 () Bool)

(assert (=> d!92094 (= (inv!12 w3!25) (invariant!0 (currentBit!13002 w3!25) (currentByte!13007 w3!25) (size!6565 (buf!7033 w3!25))))))

(declare-fun bs!23248 () Bool)

(assert (= bs!23248 d!92094))

(declare-fun m!402809 () Bool)

(assert (=> bs!23248 m!402809))

(assert (=> start!59042 d!92094))

(declare-fun d!92096 () Bool)

(declare-fun res!225612 () Bool)

(declare-fun e!190591 () Bool)

(assert (=> d!92096 (=> res!225612 e!190591)))

(assert (=> d!92096 (= res!225612 (= #b00000000000000000000000000000000 (currentByte!13007 w1!591)))))

(assert (=> d!92096 (= (arrayRangesEq!1097 (buf!7033 w1!591) (buf!7033 w3!25) #b00000000000000000000000000000000 (currentByte!13007 w1!591)) e!190591)))

(declare-fun b!270736 () Bool)

(declare-fun e!190592 () Bool)

(assert (=> b!270736 (= e!190591 e!190592)))

(declare-fun res!225613 () Bool)

(assert (=> b!270736 (=> (not res!225613) (not e!190592))))

(assert (=> b!270736 (= res!225613 (= (select (arr!7552 (buf!7033 w1!591)) #b00000000000000000000000000000000) (select (arr!7552 (buf!7033 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!270737 () Bool)

(assert (=> b!270737 (= e!190592 (arrayRangesEq!1097 (buf!7033 w1!591) (buf!7033 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13007 w1!591)))))

(assert (= (and d!92096 (not res!225612)) b!270736))

(assert (= (and b!270736 res!225613) b!270737))

(declare-fun m!402813 () Bool)

(assert (=> b!270736 m!402813))

(declare-fun m!402817 () Bool)

(assert (=> b!270736 m!402817))

(declare-fun m!402819 () Bool)

(assert (=> b!270737 m!402819))

(assert (=> b!270658 d!92096))

(declare-fun d!92102 () Bool)

(assert (=> d!92102 (arrayRangesEq!1097 (buf!7033 w1!591) (buf!7033 w3!25) #b00000000000000000000000000000000 (currentByte!13007 w1!591))))

(declare-fun lt!409604 () Unit!19085)

(declare-fun choose!401 (array!15080 array!15080 array!15080 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19085)

(assert (=> d!92102 (= lt!409604 (choose!401 (buf!7033 w1!591) (buf!7033 w2!587) (buf!7033 w3!25) #b00000000000000000000000000000000 (currentByte!13007 w1!591) (currentByte!13007 w2!587)))))

(assert (=> d!92102 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13007 w1!591)) (bvsle (currentByte!13007 w1!591) (currentByte!13007 w2!587)))))

(assert (=> d!92102 (= (arrayRangesEqTransitive!360 (buf!7033 w1!591) (buf!7033 w2!587) (buf!7033 w3!25) #b00000000000000000000000000000000 (currentByte!13007 w1!591) (currentByte!13007 w2!587)) lt!409604)))

(declare-fun bs!23251 () Bool)

(assert (= bs!23251 d!92102))

(assert (=> bs!23251 m!402703))

(declare-fun m!402833 () Bool)

(assert (=> bs!23251 m!402833))

(assert (=> b!270658 d!92102))

(declare-fun d!92108 () Bool)

(assert (=> d!92108 (= (array_inv!6289 (buf!7033 w3!25)) (bvsge (size!6565 (buf!7033 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!270659 d!92108))

(push 1)

