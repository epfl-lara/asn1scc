; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59336 () Bool)

(assert start!59336)

(declare-fun b!271441 () Bool)

(declare-fun res!226153 () Bool)

(declare-fun e!191304 () Bool)

(assert (=> b!271441 (=> (not res!226153) (not e!191304))))

(declare-datatypes ((array!15134 0))(
  ( (array!15135 (arr!7570 (Array (_ BitVec 32) (_ BitVec 8))) (size!6583 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11980 0))(
  ( (BitStream!11981 (buf!7051 array!15134) (currentByte!13034 (_ BitVec 32)) (currentBit!13029 (_ BitVec 32))) )
))
(declare-fun w2!587 () BitStream!11980)

(declare-fun w3!25 () BitStream!11980)

(declare-fun isPrefixOf!0 (BitStream!11980 BitStream!11980) Bool)

(assert (=> b!271441 (= res!226153 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!271442 () Bool)

(declare-fun e!191307 () Bool)

(declare-fun array_inv!6307 (array!15134) Bool)

(assert (=> b!271442 (= e!191307 (array_inv!6307 (buf!7051 w2!587)))))

(declare-fun res!226152 () Bool)

(assert (=> start!59336 (=> (not res!226152) (not e!191304))))

(declare-fun w1!591 () BitStream!11980)

(assert (=> start!59336 (= res!226152 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!59336 e!191304))

(declare-fun e!191303 () Bool)

(declare-fun inv!12 (BitStream!11980) Bool)

(assert (=> start!59336 (and (inv!12 w1!591) e!191303)))

(assert (=> start!59336 (and (inv!12 w2!587) e!191307)))

(declare-fun e!191302 () Bool)

(assert (=> start!59336 (and (inv!12 w3!25) e!191302)))

(declare-fun b!271443 () Bool)

(assert (=> b!271443 (= e!191304 (not (or (bvsge (currentByte!13034 w1!591) (size!6583 (buf!7051 w1!591))) (bvslt (currentByte!13034 w1!591) (currentByte!13034 w2!587)) (bvsgt (currentBit!13029 w1!591) (currentBit!13029 w2!587)) (and (bvsge (currentByte!13034 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!13034 w1!591) (size!6583 (buf!7051 w3!25)))))))))

(declare-fun arrayRangesEq!1115 (array!15134 array!15134 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!271443 (arrayRangesEq!1115 (buf!7051 w1!591) (buf!7051 w3!25) #b00000000000000000000000000000000 (currentByte!13034 w1!591))))

(declare-datatypes ((Unit!19121 0))(
  ( (Unit!19122) )
))
(declare-fun lt!409901 () Unit!19121)

(declare-fun arrayRangesEqTransitive!378 (array!15134 array!15134 array!15134 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19121)

(assert (=> b!271443 (= lt!409901 (arrayRangesEqTransitive!378 (buf!7051 w1!591) (buf!7051 w2!587) (buf!7051 w3!25) #b00000000000000000000000000000000 (currentByte!13034 w1!591) (currentByte!13034 w2!587)))))

(declare-fun b!271444 () Bool)

(assert (=> b!271444 (= e!191302 (array_inv!6307 (buf!7051 w3!25)))))

(declare-fun b!271445 () Bool)

(assert (=> b!271445 (= e!191303 (array_inv!6307 (buf!7051 w1!591)))))

(assert (= (and start!59336 res!226152) b!271441))

(assert (= (and b!271441 res!226153) b!271443))

(assert (= start!59336 b!271445))

(assert (= start!59336 b!271442))

(assert (= start!59336 b!271444))

(declare-fun m!403847 () Bool)

(assert (=> b!271444 m!403847))

(declare-fun m!403849 () Bool)

(assert (=> b!271441 m!403849))

(declare-fun m!403851 () Bool)

(assert (=> start!59336 m!403851))

(declare-fun m!403853 () Bool)

(assert (=> start!59336 m!403853))

(declare-fun m!403855 () Bool)

(assert (=> start!59336 m!403855))

(declare-fun m!403857 () Bool)

(assert (=> start!59336 m!403857))

(declare-fun m!403859 () Bool)

(assert (=> b!271443 m!403859))

(declare-fun m!403861 () Bool)

(assert (=> b!271443 m!403861))

(declare-fun m!403863 () Bool)

(assert (=> b!271445 m!403863))

(declare-fun m!403865 () Bool)

(assert (=> b!271442 m!403865))

(push 1)

(assert (not start!59336))

(assert (not b!271441))

(assert (not b!271442))

(assert (not b!271445))

(assert (not b!271444))

(assert (not b!271443))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!92600 () Bool)

(assert (=> d!92600 (= (array_inv!6307 (buf!7051 w2!587)) (bvsge (size!6583 (buf!7051 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!271442 d!92600))

(declare-fun d!92602 () Bool)

(declare-fun res!226176 () Bool)

(declare-fun e!191361 () Bool)

(assert (=> d!92602 (=> res!226176 e!191361)))

(assert (=> d!92602 (= res!226176 (= #b00000000000000000000000000000000 (currentByte!13034 w1!591)))))

(assert (=> d!92602 (= (arrayRangesEq!1115 (buf!7051 w1!591) (buf!7051 w3!25) #b00000000000000000000000000000000 (currentByte!13034 w1!591)) e!191361)))

(declare-fun b!271486 () Bool)

(declare-fun e!191362 () Bool)

(assert (=> b!271486 (= e!191361 e!191362)))

(declare-fun res!226177 () Bool)

(assert (=> b!271486 (=> (not res!226177) (not e!191362))))

(assert (=> b!271486 (= res!226177 (= (select (arr!7570 (buf!7051 w1!591)) #b00000000000000000000000000000000) (select (arr!7570 (buf!7051 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!271487 () Bool)

(assert (=> b!271487 (= e!191362 (arrayRangesEq!1115 (buf!7051 w1!591) (buf!7051 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13034 w1!591)))))

(assert (= (and d!92602 (not res!226176)) b!271486))

(assert (= (and b!271486 res!226177) b!271487))

(declare-fun m!403913 () Bool)

(assert (=> b!271486 m!403913))

(declare-fun m!403915 () Bool)

(assert (=> b!271486 m!403915))

(declare-fun m!403917 () Bool)

(assert (=> b!271487 m!403917))

(assert (=> b!271443 d!92602))

(declare-fun d!92608 () Bool)

(assert (=> d!92608 (arrayRangesEq!1115 (buf!7051 w1!591) (buf!7051 w3!25) #b00000000000000000000000000000000 (currentByte!13034 w1!591))))

(declare-fun lt!409910 () Unit!19121)

(declare-fun choose!426 (array!15134 array!15134 array!15134 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19121)

(assert (=> d!92608 (= lt!409910 (choose!426 (buf!7051 w1!591) (buf!7051 w2!587) (buf!7051 w3!25) #b00000000000000000000000000000000 (currentByte!13034 w1!591) (currentByte!13034 w2!587)))))

(assert (=> d!92608 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13034 w1!591)) (bvsle (currentByte!13034 w1!591) (currentByte!13034 w2!587)))))

(assert (=> d!92608 (= (arrayRangesEqTransitive!378 (buf!7051 w1!591) (buf!7051 w2!587) (buf!7051 w3!25) #b00000000000000000000000000000000 (currentByte!13034 w1!591) (currentByte!13034 w2!587)) lt!409910)))

(declare-fun bs!23365 () Bool)

(assert (= bs!23365 d!92608))

(assert (=> bs!23365 m!403859))

(declare-fun m!403925 () Bool)

(assert (=> bs!23365 m!403925))

(assert (=> b!271443 d!92608))

(declare-fun d!92612 () Bool)

(declare-fun res!226192 () Bool)

(declare-fun e!191373 () Bool)

(assert (=> d!92612 (=> (not res!226192) (not e!191373))))

(assert (=> d!92612 (= res!226192 (= (size!6583 (buf!7051 w1!591)) (size!6583 (buf!7051 w2!587))))))

(assert (=> d!92612 (= (isPrefixOf!0 w1!591 w2!587) e!191373)))

(declare-fun b!271500 () Bool)

(declare-fun res!226190 () Bool)

(assert (=> b!271500 (=> (not res!226190) (not e!191373))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!271500 (= res!226190 (bvsle (bitIndex!0 (size!6583 (buf!7051 w1!591)) (currentByte!13034 w1!591) (currentBit!13029 w1!591)) (bitIndex!0 (size!6583 (buf!7051 w2!587)) (currentByte!13034 w2!587) (currentBit!13029 w2!587))))))

(declare-fun b!271501 () Bool)

(declare-fun e!191374 () Bool)

(assert (=> b!271501 (= e!191373 e!191374)))

(declare-fun res!226191 () Bool)

(assert (=> b!271501 (=> res!226191 e!191374)))

(assert (=> b!271501 (= res!226191 (= (size!6583 (buf!7051 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!271502 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15134 array!15134 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!271502 (= e!191374 (arrayBitRangesEq!0 (buf!7051 w1!591) (buf!7051 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6583 (buf!7051 w1!591)) (currentByte!13034 w1!591) (currentBit!13029 w1!591))))))

(assert (= (and d!92612 res!226192) b!271500))

(assert (= (and b!271500 res!226190) b!271501))

(assert (= (and b!271501 (not res!226191)) b!271502))

(declare-fun m!403931 () Bool)

(assert (=> b!271500 m!403931))

(declare-fun m!403933 () Bool)

(assert (=> b!271500 m!403933))

(assert (=> b!271502 m!403931))

(assert (=> b!271502 m!403931))

(declare-fun m!403935 () Bool)

(assert (=> b!271502 m!403935))

(assert (=> start!59336 d!92612))

(declare-fun d!92622 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!92622 (= (inv!12 w1!591) (invariant!0 (currentBit!13029 w1!591) (currentByte!13034 w1!591) (size!6583 (buf!7051 w1!591))))))

(declare-fun bs!23368 () Bool)

(assert (= bs!23368 d!92622))

(declare-fun m!403937 () Bool)

(assert (=> bs!23368 m!403937))

(assert (=> start!59336 d!92622))

(declare-fun d!92624 () Bool)

(assert (=> d!92624 (= (inv!12 w2!587) (invariant!0 (currentBit!13029 w2!587) (currentByte!13034 w2!587) (size!6583 (buf!7051 w2!587))))))

(declare-fun bs!23369 () Bool)

(assert (= bs!23369 d!92624))

(declare-fun m!403939 () Bool)

(assert (=> bs!23369 m!403939))

(assert (=> start!59336 d!92624))

(declare-fun d!92626 () Bool)

(assert (=> d!92626 (= (inv!12 w3!25) (invariant!0 (currentBit!13029 w3!25) (currentByte!13034 w3!25) (size!6583 (buf!7051 w3!25))))))

(declare-fun bs!23370 () Bool)

(assert (= bs!23370 d!92626))

(declare-fun m!403941 () Bool)

(assert (=> bs!23370 m!403941))

(assert (=> start!59336 d!92626))

(declare-fun d!92628 () Bool)

(assert (=> d!92628 (= (array_inv!6307 (buf!7051 w1!591)) (bvsge (size!6583 (buf!7051 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!271445 d!92628))

(declare-fun d!92630 () Bool)

(assert (=> d!92630 (= (array_inv!6307 (buf!7051 w3!25)) (bvsge (size!6583 (buf!7051 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!271444 d!92630))

(declare-fun d!92632 () Bool)

(declare-fun res!226201 () Bool)

(declare-fun e!191379 () Bool)

(assert (=> d!92632 (=> (not res!226201) (not e!191379))))

(assert (=> d!92632 (= res!226201 (= (size!6583 (buf!7051 w2!587)) (size!6583 (buf!7051 w3!25))))))

(assert (=> d!92632 (= (isPrefixOf!0 w2!587 w3!25) e!191379)))

(declare-fun b!271509 () Bool)

(declare-fun res!226199 () Bool)

(assert (=> b!271509 (=> (not res!226199) (not e!191379))))

(assert (=> b!271509 (= res!226199 (bvsle (bitIndex!0 (size!6583 (buf!7051 w2!587)) (currentByte!13034 w2!587) (currentBit!13029 w2!587)) (bitIndex!0 (size!6583 (buf!7051 w3!25)) (currentByte!13034 w3!25) (currentBit!13029 w3!25))))))

(declare-fun b!271510 () Bool)

(declare-fun e!191380 () Bool)

(assert (=> b!271510 (= e!191379 e!191380)))

(declare-fun res!226200 () Bool)

(assert (=> b!271510 (=> res!226200 e!191380)))

(assert (=> b!271510 (= res!226200 (= (size!6583 (buf!7051 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!271511 () Bool)

(assert (=> b!271511 (= e!191380 (arrayBitRangesEq!0 (buf!7051 w2!587) (buf!7051 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6583 (buf!7051 w2!587)) (currentByte!13034 w2!587) (currentBit!13029 w2!587))))))

(assert (= (and d!92632 res!226201) b!271509))

(assert (= (and b!271509 res!226199) b!271510))

(assert (= (and b!271510 (not res!226200)) b!271511))

(assert (=> b!271509 m!403933))

(declare-fun m!403943 () Bool)

(assert (=> b!271509 m!403943))

(assert (=> b!271511 m!403933))

(assert (=> b!271511 m!403933))

(declare-fun m!403945 () Bool)

(assert (=> b!271511 m!403945))

(assert (=> b!271441 d!92632))

(push 1)

(assert (not b!271487))

(assert (not b!271502))

(assert (not b!271509))

(assert (not d!92624))

(assert (not b!271511))

(assert (not d!92608))

(assert (not b!271500))

(assert (not d!92622))

(assert (not d!92626))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

