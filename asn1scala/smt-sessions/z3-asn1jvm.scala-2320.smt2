; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59044 () Bool)

(assert start!59044)

(declare-fun b!270675 () Bool)

(declare-fun e!190534 () Bool)

(declare-datatypes ((array!15082 0))(
  ( (array!15083 (arr!7553 (Array (_ BitVec 32) (_ BitVec 8))) (size!6566 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11946 0))(
  ( (BitStream!11947 (buf!7034 array!15082) (currentByte!13008 (_ BitVec 32)) (currentBit!13003 (_ BitVec 32))) )
))
(declare-fun w3!25 () BitStream!11946)

(declare-fun array_inv!6290 (array!15082) Bool)

(assert (=> b!270675 (= e!190534 (array_inv!6290 (buf!7034 w3!25)))))

(declare-fun b!270676 () Bool)

(declare-fun e!190538 () Bool)

(declare-fun w1!591 () BitStream!11946)

(assert (=> b!270676 (= e!190538 (array_inv!6290 (buf!7034 w1!591)))))

(declare-fun res!225565 () Bool)

(declare-fun e!190535 () Bool)

(assert (=> start!59044 (=> (not res!225565) (not e!190535))))

(declare-fun w2!587 () BitStream!11946)

(declare-fun isPrefixOf!0 (BitStream!11946 BitStream!11946) Bool)

(assert (=> start!59044 (= res!225565 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!59044 e!190535))

(declare-fun inv!12 (BitStream!11946) Bool)

(assert (=> start!59044 (and (inv!12 w1!591) e!190538)))

(declare-fun e!190540 () Bool)

(assert (=> start!59044 (and (inv!12 w2!587) e!190540)))

(assert (=> start!59044 (and (inv!12 w3!25) e!190534)))

(declare-fun b!270677 () Bool)

(declare-fun e!190537 () Bool)

(assert (=> b!270677 (= e!190537 (and (bvsge (currentByte!13008 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!13008 w1!591) (size!6566 (buf!7034 w2!587)))))))

(assert (=> b!270677 (= (select (arr!7553 (buf!7034 w2!587)) (currentByte!13008 w1!591)) (select (arr!7553 (buf!7034 w3!25)) (currentByte!13008 w1!591)))))

(declare-datatypes ((Unit!19087 0))(
  ( (Unit!19088) )
))
(declare-fun lt!409585 () Unit!19087)

(declare-fun arrayRangesEqImpliesEq!158 (array!15082 array!15082 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19087)

(assert (=> b!270677 (= lt!409585 (arrayRangesEqImpliesEq!158 (buf!7034 w2!587) (buf!7034 w3!25) #b00000000000000000000000000000000 (currentByte!13008 w1!591) (currentByte!13008 w2!587)))))

(declare-fun b!270678 () Bool)

(assert (=> b!270678 (= e!190535 (not e!190537))))

(declare-fun res!225563 () Bool)

(assert (=> b!270678 (=> res!225563 e!190537)))

(assert (=> b!270678 (= res!225563 (or (bvsge (currentByte!13008 w1!591) (size!6566 (buf!7034 w1!591))) (bvsge (currentByte!13008 w1!591) (currentByte!13008 w2!587))))))

(declare-fun arrayRangesEq!1098 (array!15082 array!15082 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!270678 (arrayRangesEq!1098 (buf!7034 w1!591) (buf!7034 w3!25) #b00000000000000000000000000000000 (currentByte!13008 w1!591))))

(declare-fun lt!409586 () Unit!19087)

(declare-fun arrayRangesEqTransitive!361 (array!15082 array!15082 array!15082 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19087)

(assert (=> b!270678 (= lt!409586 (arrayRangesEqTransitive!361 (buf!7034 w1!591) (buf!7034 w2!587) (buf!7034 w3!25) #b00000000000000000000000000000000 (currentByte!13008 w1!591) (currentByte!13008 w2!587)))))

(declare-fun b!270679 () Bool)

(declare-fun res!225564 () Bool)

(assert (=> b!270679 (=> (not res!225564) (not e!190535))))

(assert (=> b!270679 (= res!225564 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!270680 () Bool)

(assert (=> b!270680 (= e!190540 (array_inv!6290 (buf!7034 w2!587)))))

(assert (= (and start!59044 res!225565) b!270679))

(assert (= (and b!270679 res!225564) b!270678))

(assert (= (and b!270678 (not res!225563)) b!270677))

(assert (= start!59044 b!270676))

(assert (= start!59044 b!270680))

(assert (= start!59044 b!270675))

(declare-fun m!402713 () Bool)

(assert (=> b!270678 m!402713))

(declare-fun m!402715 () Bool)

(assert (=> b!270678 m!402715))

(declare-fun m!402717 () Bool)

(assert (=> start!59044 m!402717))

(declare-fun m!402719 () Bool)

(assert (=> start!59044 m!402719))

(declare-fun m!402721 () Bool)

(assert (=> start!59044 m!402721))

(declare-fun m!402723 () Bool)

(assert (=> start!59044 m!402723))

(declare-fun m!402725 () Bool)

(assert (=> b!270677 m!402725))

(declare-fun m!402727 () Bool)

(assert (=> b!270677 m!402727))

(declare-fun m!402729 () Bool)

(assert (=> b!270677 m!402729))

(declare-fun m!402731 () Bool)

(assert (=> b!270680 m!402731))

(declare-fun m!402733 () Bool)

(assert (=> b!270676 m!402733))

(declare-fun m!402735 () Bool)

(assert (=> b!270679 m!402735))

(declare-fun m!402737 () Bool)

(assert (=> b!270675 m!402737))

(check-sat (not b!270677) (not b!270679) (not b!270678) (not b!270676) (not b!270675) (not b!270680) (not start!59044))
(check-sat)
(get-model)

(declare-fun d!92052 () Bool)

(assert (=> d!92052 (= (array_inv!6290 (buf!7034 w3!25)) (bvsge (size!6566 (buf!7034 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!270675 d!92052))

(declare-fun d!92054 () Bool)

(assert (=> d!92054 (= (array_inv!6290 (buf!7034 w2!587)) (bvsge (size!6566 (buf!7034 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!270680 d!92054))

(declare-fun d!92056 () Bool)

(declare-fun res!225600 () Bool)

(declare-fun e!190582 () Bool)

(assert (=> d!92056 (=> (not res!225600) (not e!190582))))

(assert (=> d!92056 (= res!225600 (= (size!6566 (buf!7034 w1!591)) (size!6566 (buf!7034 w2!587))))))

(assert (=> d!92056 (= (isPrefixOf!0 w1!591 w2!587) e!190582)))

(declare-fun b!270723 () Bool)

(declare-fun res!225601 () Bool)

(assert (=> b!270723 (=> (not res!225601) (not e!190582))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!270723 (= res!225601 (bvsle (bitIndex!0 (size!6566 (buf!7034 w1!591)) (currentByte!13008 w1!591) (currentBit!13003 w1!591)) (bitIndex!0 (size!6566 (buf!7034 w2!587)) (currentByte!13008 w2!587) (currentBit!13003 w2!587))))))

(declare-fun b!270724 () Bool)

(declare-fun e!190581 () Bool)

(assert (=> b!270724 (= e!190582 e!190581)))

(declare-fun res!225599 () Bool)

(assert (=> b!270724 (=> res!225599 e!190581)))

(assert (=> b!270724 (= res!225599 (= (size!6566 (buf!7034 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!270725 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15082 array!15082 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!270725 (= e!190581 (arrayBitRangesEq!0 (buf!7034 w1!591) (buf!7034 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6566 (buf!7034 w1!591)) (currentByte!13008 w1!591) (currentBit!13003 w1!591))))))

(assert (= (and d!92056 res!225600) b!270723))

(assert (= (and b!270723 res!225601) b!270724))

(assert (= (and b!270724 (not res!225599)) b!270725))

(declare-fun m!402779 () Bool)

(assert (=> b!270723 m!402779))

(declare-fun m!402781 () Bool)

(assert (=> b!270723 m!402781))

(assert (=> b!270725 m!402779))

(assert (=> b!270725 m!402779))

(declare-fun m!402785 () Bool)

(assert (=> b!270725 m!402785))

(assert (=> start!59044 d!92056))

(declare-fun d!92076 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!92076 (= (inv!12 w1!591) (invariant!0 (currentBit!13003 w1!591) (currentByte!13008 w1!591) (size!6566 (buf!7034 w1!591))))))

(declare-fun bs!23243 () Bool)

(assert (= bs!23243 d!92076))

(declare-fun m!402795 () Bool)

(assert (=> bs!23243 m!402795))

(assert (=> start!59044 d!92076))

(declare-fun d!92082 () Bool)

(assert (=> d!92082 (= (inv!12 w2!587) (invariant!0 (currentBit!13003 w2!587) (currentByte!13008 w2!587) (size!6566 (buf!7034 w2!587))))))

(declare-fun bs!23244 () Bool)

(assert (= bs!23244 d!92082))

(declare-fun m!402799 () Bool)

(assert (=> bs!23244 m!402799))

(assert (=> start!59044 d!92082))

(declare-fun d!92084 () Bool)

(assert (=> d!92084 (= (inv!12 w3!25) (invariant!0 (currentBit!13003 w3!25) (currentByte!13008 w3!25) (size!6566 (buf!7034 w3!25))))))

(declare-fun bs!23245 () Bool)

(assert (= bs!23245 d!92084))

(declare-fun m!402801 () Bool)

(assert (=> bs!23245 m!402801))

(assert (=> start!59044 d!92084))

(declare-fun d!92086 () Bool)

(assert (=> d!92086 (= (array_inv!6290 (buf!7034 w1!591)) (bvsge (size!6566 (buf!7034 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!270676 d!92086))

(declare-fun d!92090 () Bool)

(assert (=> d!92090 (and (bvsge (currentByte!13008 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!13008 w1!591) (size!6566 (buf!7034 w2!587))) (bvslt (currentByte!13008 w1!591) (size!6566 (buf!7034 w3!25))) (= (select (arr!7553 (buf!7034 w2!587)) (currentByte!13008 w1!591)) (select (arr!7553 (buf!7034 w3!25)) (currentByte!13008 w1!591))))))

(declare-fun lt!409598 () Unit!19087)

(declare-fun choose!399 (array!15082 array!15082 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19087)

(assert (=> d!92090 (= lt!409598 (choose!399 (buf!7034 w2!587) (buf!7034 w3!25) #b00000000000000000000000000000000 (currentByte!13008 w1!591) (currentByte!13008 w2!587)))))

(assert (=> d!92090 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13008 w2!587)))))

(assert (=> d!92090 (= (arrayRangesEqImpliesEq!158 (buf!7034 w2!587) (buf!7034 w3!25) #b00000000000000000000000000000000 (currentByte!13008 w1!591) (currentByte!13008 w2!587)) lt!409598)))

(declare-fun bs!23249 () Bool)

(assert (= bs!23249 d!92090))

(assert (=> bs!23249 m!402725))

(assert (=> bs!23249 m!402727))

(declare-fun m!402811 () Bool)

(assert (=> bs!23249 m!402811))

(assert (=> b!270677 d!92090))

(declare-fun d!92098 () Bool)

(declare-fun res!225618 () Bool)

(declare-fun e!190597 () Bool)

(assert (=> d!92098 (=> res!225618 e!190597)))

(assert (=> d!92098 (= res!225618 (= #b00000000000000000000000000000000 (currentByte!13008 w1!591)))))

(assert (=> d!92098 (= (arrayRangesEq!1098 (buf!7034 w1!591) (buf!7034 w3!25) #b00000000000000000000000000000000 (currentByte!13008 w1!591)) e!190597)))

(declare-fun b!270742 () Bool)

(declare-fun e!190598 () Bool)

(assert (=> b!270742 (= e!190597 e!190598)))

(declare-fun res!225619 () Bool)

(assert (=> b!270742 (=> (not res!225619) (not e!190598))))

(assert (=> b!270742 (= res!225619 (= (select (arr!7553 (buf!7034 w1!591)) #b00000000000000000000000000000000) (select (arr!7553 (buf!7034 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!270743 () Bool)

(assert (=> b!270743 (= e!190598 (arrayRangesEq!1098 (buf!7034 w1!591) (buf!7034 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13008 w1!591)))))

(assert (= (and d!92098 (not res!225618)) b!270742))

(assert (= (and b!270742 res!225619) b!270743))

(declare-fun m!402821 () Bool)

(assert (=> b!270742 m!402821))

(declare-fun m!402823 () Bool)

(assert (=> b!270742 m!402823))

(declare-fun m!402825 () Bool)

(assert (=> b!270743 m!402825))

(assert (=> b!270678 d!92098))

(declare-fun d!92104 () Bool)

(assert (=> d!92104 (arrayRangesEq!1098 (buf!7034 w1!591) (buf!7034 w3!25) #b00000000000000000000000000000000 (currentByte!13008 w1!591))))

(declare-fun lt!409607 () Unit!19087)

(declare-fun choose!400 (array!15082 array!15082 array!15082 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19087)

(assert (=> d!92104 (= lt!409607 (choose!400 (buf!7034 w1!591) (buf!7034 w2!587) (buf!7034 w3!25) #b00000000000000000000000000000000 (currentByte!13008 w1!591) (currentByte!13008 w2!587)))))

(assert (=> d!92104 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13008 w1!591)) (bvsle (currentByte!13008 w1!591) (currentByte!13008 w2!587)))))

(assert (=> d!92104 (= (arrayRangesEqTransitive!361 (buf!7034 w1!591) (buf!7034 w2!587) (buf!7034 w3!25) #b00000000000000000000000000000000 (currentByte!13008 w1!591) (currentByte!13008 w2!587)) lt!409607)))

(declare-fun bs!23252 () Bool)

(assert (= bs!23252 d!92104))

(assert (=> bs!23252 m!402713))

(declare-fun m!402835 () Bool)

(assert (=> bs!23252 m!402835))

(assert (=> b!270678 d!92104))

(declare-fun d!92110 () Bool)

(declare-fun res!225627 () Bool)

(declare-fun e!190606 () Bool)

(assert (=> d!92110 (=> (not res!225627) (not e!190606))))

(assert (=> d!92110 (= res!225627 (= (size!6566 (buf!7034 w2!587)) (size!6566 (buf!7034 w3!25))))))

(assert (=> d!92110 (= (isPrefixOf!0 w2!587 w3!25) e!190606)))

(declare-fun b!270750 () Bool)

(declare-fun res!225628 () Bool)

(assert (=> b!270750 (=> (not res!225628) (not e!190606))))

(assert (=> b!270750 (= res!225628 (bvsle (bitIndex!0 (size!6566 (buf!7034 w2!587)) (currentByte!13008 w2!587) (currentBit!13003 w2!587)) (bitIndex!0 (size!6566 (buf!7034 w3!25)) (currentByte!13008 w3!25) (currentBit!13003 w3!25))))))

(declare-fun b!270751 () Bool)

(declare-fun e!190605 () Bool)

(assert (=> b!270751 (= e!190606 e!190605)))

(declare-fun res!225626 () Bool)

(assert (=> b!270751 (=> res!225626 e!190605)))

(assert (=> b!270751 (= res!225626 (= (size!6566 (buf!7034 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!270752 () Bool)

(assert (=> b!270752 (= e!190605 (arrayBitRangesEq!0 (buf!7034 w2!587) (buf!7034 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6566 (buf!7034 w2!587)) (currentByte!13008 w2!587) (currentBit!13003 w2!587))))))

(assert (= (and d!92110 res!225627) b!270750))

(assert (= (and b!270750 res!225628) b!270751))

(assert (= (and b!270751 (not res!225626)) b!270752))

(assert (=> b!270750 m!402781))

(declare-fun m!402837 () Bool)

(assert (=> b!270750 m!402837))

(assert (=> b!270752 m!402781))

(assert (=> b!270752 m!402781))

(declare-fun m!402839 () Bool)

(assert (=> b!270752 m!402839))

(assert (=> b!270679 d!92110))

(check-sat (not d!92082) (not b!270725) (not d!92090) (not d!92104) (not b!270743) (not d!92084) (not b!270750) (not b!270752) (not b!270723) (not d!92076))
(check-sat)
