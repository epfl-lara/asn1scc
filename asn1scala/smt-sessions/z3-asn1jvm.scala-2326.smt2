; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59338 () Bool)

(assert start!59338)

(declare-datatypes ((array!15136 0))(
  ( (array!15137 (arr!7571 (Array (_ BitVec 32) (_ BitVec 8))) (size!6584 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11982 0))(
  ( (BitStream!11983 (buf!7052 array!15136) (currentByte!13035 (_ BitVec 32)) (currentBit!13030 (_ BitVec 32))) )
))
(declare-fun w2!587 () BitStream!11982)

(declare-fun w1!591 () BitStream!11982)

(declare-fun e!191327 () Bool)

(declare-fun b!271456 () Bool)

(declare-fun w3!25 () BitStream!11982)

(assert (=> b!271456 (= e!191327 (not (or (bvsge (currentByte!13035 w1!591) (size!6584 (buf!7052 w1!591))) (bvslt (currentByte!13035 w1!591) (currentByte!13035 w2!587)) (bvsgt (currentBit!13030 w1!591) (currentBit!13030 w2!587)) (and (bvsge (currentByte!13035 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!13035 w1!591) (size!6584 (buf!7052 w3!25)))))))))

(declare-fun arrayRangesEq!1116 (array!15136 array!15136 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!271456 (arrayRangesEq!1116 (buf!7052 w1!591) (buf!7052 w3!25) #b00000000000000000000000000000000 (currentByte!13035 w1!591))))

(declare-datatypes ((Unit!19123 0))(
  ( (Unit!19124) )
))
(declare-fun lt!409904 () Unit!19123)

(declare-fun arrayRangesEqTransitive!379 (array!15136 array!15136 array!15136 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19123)

(assert (=> b!271456 (= lt!409904 (arrayRangesEqTransitive!379 (buf!7052 w1!591) (buf!7052 w2!587) (buf!7052 w3!25) #b00000000000000000000000000000000 (currentByte!13035 w1!591) (currentByte!13035 w2!587)))))

(declare-fun res!226159 () Bool)

(assert (=> start!59338 (=> (not res!226159) (not e!191327))))

(declare-fun isPrefixOf!0 (BitStream!11982 BitStream!11982) Bool)

(assert (=> start!59338 (= res!226159 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!59338 e!191327))

(declare-fun e!191323 () Bool)

(declare-fun inv!12 (BitStream!11982) Bool)

(assert (=> start!59338 (and (inv!12 w1!591) e!191323)))

(declare-fun e!191324 () Bool)

(assert (=> start!59338 (and (inv!12 w2!587) e!191324)))

(declare-fun e!191328 () Bool)

(assert (=> start!59338 (and (inv!12 w3!25) e!191328)))

(declare-fun b!271457 () Bool)

(declare-fun array_inv!6308 (array!15136) Bool)

(assert (=> b!271457 (= e!191324 (array_inv!6308 (buf!7052 w2!587)))))

(declare-fun b!271458 () Bool)

(assert (=> b!271458 (= e!191328 (array_inv!6308 (buf!7052 w3!25)))))

(declare-fun b!271459 () Bool)

(assert (=> b!271459 (= e!191323 (array_inv!6308 (buf!7052 w1!591)))))

(declare-fun b!271460 () Bool)

(declare-fun res!226158 () Bool)

(assert (=> b!271460 (=> (not res!226158) (not e!191327))))

(assert (=> b!271460 (= res!226158 (isPrefixOf!0 w2!587 w3!25))))

(assert (= (and start!59338 res!226159) b!271460))

(assert (= (and b!271460 res!226158) b!271456))

(assert (= start!59338 b!271459))

(assert (= start!59338 b!271457))

(assert (= start!59338 b!271458))

(declare-fun m!403867 () Bool)

(assert (=> b!271457 m!403867))

(declare-fun m!403869 () Bool)

(assert (=> b!271460 m!403869))

(declare-fun m!403871 () Bool)

(assert (=> b!271459 m!403871))

(declare-fun m!403873 () Bool)

(assert (=> b!271458 m!403873))

(declare-fun m!403875 () Bool)

(assert (=> b!271456 m!403875))

(declare-fun m!403877 () Bool)

(assert (=> b!271456 m!403877))

(declare-fun m!403879 () Bool)

(assert (=> start!59338 m!403879))

(declare-fun m!403881 () Bool)

(assert (=> start!59338 m!403881))

(declare-fun m!403883 () Bool)

(assert (=> start!59338 m!403883))

(declare-fun m!403885 () Bool)

(assert (=> start!59338 m!403885))

(check-sat (not b!271457) (not b!271460) (not b!271458) (not b!271459) (not start!59338) (not b!271456))
(check-sat)
(get-model)

(declare-fun d!92598 () Bool)

(declare-fun res!226170 () Bool)

(declare-fun e!191355 () Bool)

(assert (=> d!92598 (=> res!226170 e!191355)))

(assert (=> d!92598 (= res!226170 (= #b00000000000000000000000000000000 (currentByte!13035 w1!591)))))

(assert (=> d!92598 (= (arrayRangesEq!1116 (buf!7052 w1!591) (buf!7052 w3!25) #b00000000000000000000000000000000 (currentByte!13035 w1!591)) e!191355)))

(declare-fun b!271480 () Bool)

(declare-fun e!191356 () Bool)

(assert (=> b!271480 (= e!191355 e!191356)))

(declare-fun res!226171 () Bool)

(assert (=> b!271480 (=> (not res!226171) (not e!191356))))

(assert (=> b!271480 (= res!226171 (= (select (arr!7571 (buf!7052 w1!591)) #b00000000000000000000000000000000) (select (arr!7571 (buf!7052 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!271481 () Bool)

(assert (=> b!271481 (= e!191356 (arrayRangesEq!1116 (buf!7052 w1!591) (buf!7052 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13035 w1!591)))))

(assert (= (and d!92598 (not res!226170)) b!271480))

(assert (= (and b!271480 res!226171) b!271481))

(declare-fun m!403907 () Bool)

(assert (=> b!271480 m!403907))

(declare-fun m!403909 () Bool)

(assert (=> b!271480 m!403909))

(declare-fun m!403911 () Bool)

(assert (=> b!271481 m!403911))

(assert (=> b!271456 d!92598))

(declare-fun d!92604 () Bool)

(assert (=> d!92604 (arrayRangesEq!1116 (buf!7052 w1!591) (buf!7052 w3!25) #b00000000000000000000000000000000 (currentByte!13035 w1!591))))

(declare-fun lt!409915 () Unit!19123)

(declare-fun choose!428 (array!15136 array!15136 array!15136 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19123)

(assert (=> d!92604 (= lt!409915 (choose!428 (buf!7052 w1!591) (buf!7052 w2!587) (buf!7052 w3!25) #b00000000000000000000000000000000 (currentByte!13035 w1!591) (currentByte!13035 w2!587)))))

(assert (=> d!92604 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13035 w1!591)) (bvsle (currentByte!13035 w1!591) (currentByte!13035 w2!587)))))

(assert (=> d!92604 (= (arrayRangesEqTransitive!379 (buf!7052 w1!591) (buf!7052 w2!587) (buf!7052 w3!25) #b00000000000000000000000000000000 (currentByte!13035 w1!591) (currentByte!13035 w2!587)) lt!409915)))

(declare-fun bs!23367 () Bool)

(assert (= bs!23367 d!92604))

(assert (=> bs!23367 m!403875))

(declare-fun m!403929 () Bool)

(assert (=> bs!23367 m!403929))

(assert (=> b!271456 d!92604))

(declare-fun d!92616 () Bool)

(declare-fun res!226215 () Bool)

(declare-fun e!191389 () Bool)

(assert (=> d!92616 (=> (not res!226215) (not e!191389))))

(assert (=> d!92616 (= res!226215 (= (size!6584 (buf!7052 w1!591)) (size!6584 (buf!7052 w2!587))))))

(assert (=> d!92616 (= (isPrefixOf!0 w1!591 w2!587) e!191389)))

(declare-fun b!271524 () Bool)

(declare-fun res!226216 () Bool)

(assert (=> b!271524 (=> (not res!226216) (not e!191389))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!271524 (= res!226216 (bvsle (bitIndex!0 (size!6584 (buf!7052 w1!591)) (currentByte!13035 w1!591) (currentBit!13030 w1!591)) (bitIndex!0 (size!6584 (buf!7052 w2!587)) (currentByte!13035 w2!587) (currentBit!13030 w2!587))))))

(declare-fun b!271525 () Bool)

(declare-fun e!191390 () Bool)

(assert (=> b!271525 (= e!191389 e!191390)))

(declare-fun res!226214 () Bool)

(assert (=> b!271525 (=> res!226214 e!191390)))

(assert (=> b!271525 (= res!226214 (= (size!6584 (buf!7052 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!271526 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15136 array!15136 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!271526 (= e!191390 (arrayBitRangesEq!0 (buf!7052 w1!591) (buf!7052 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6584 (buf!7052 w1!591)) (currentByte!13035 w1!591) (currentBit!13030 w1!591))))))

(assert (= (and d!92616 res!226215) b!271524))

(assert (= (and b!271524 res!226216) b!271525))

(assert (= (and b!271525 (not res!226214)) b!271526))

(declare-fun m!403963 () Bool)

(assert (=> b!271524 m!403963))

(declare-fun m!403965 () Bool)

(assert (=> b!271524 m!403965))

(assert (=> b!271526 m!403963))

(assert (=> b!271526 m!403963))

(declare-fun m!403967 () Bool)

(assert (=> b!271526 m!403967))

(assert (=> start!59338 d!92616))

(declare-fun d!92644 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!92644 (= (inv!12 w1!591) (invariant!0 (currentBit!13030 w1!591) (currentByte!13035 w1!591) (size!6584 (buf!7052 w1!591))))))

(declare-fun bs!23374 () Bool)

(assert (= bs!23374 d!92644))

(declare-fun m!403969 () Bool)

(assert (=> bs!23374 m!403969))

(assert (=> start!59338 d!92644))

(declare-fun d!92646 () Bool)

(assert (=> d!92646 (= (inv!12 w2!587) (invariant!0 (currentBit!13030 w2!587) (currentByte!13035 w2!587) (size!6584 (buf!7052 w2!587))))))

(declare-fun bs!23375 () Bool)

(assert (= bs!23375 d!92646))

(declare-fun m!403971 () Bool)

(assert (=> bs!23375 m!403971))

(assert (=> start!59338 d!92646))

(declare-fun d!92648 () Bool)

(assert (=> d!92648 (= (inv!12 w3!25) (invariant!0 (currentBit!13030 w3!25) (currentByte!13035 w3!25) (size!6584 (buf!7052 w3!25))))))

(declare-fun bs!23376 () Bool)

(assert (= bs!23376 d!92648))

(declare-fun m!403973 () Bool)

(assert (=> bs!23376 m!403973))

(assert (=> start!59338 d!92648))

(declare-fun d!92650 () Bool)

(assert (=> d!92650 (= (array_inv!6308 (buf!7052 w2!587)) (bvsge (size!6584 (buf!7052 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!271457 d!92650))

(declare-fun d!92652 () Bool)

(assert (=> d!92652 (= (array_inv!6308 (buf!7052 w1!591)) (bvsge (size!6584 (buf!7052 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!271459 d!92652))

(declare-fun d!92654 () Bool)

(assert (=> d!92654 (= (array_inv!6308 (buf!7052 w3!25)) (bvsge (size!6584 (buf!7052 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!271458 d!92654))

(declare-fun d!92656 () Bool)

(declare-fun res!226218 () Bool)

(declare-fun e!191391 () Bool)

(assert (=> d!92656 (=> (not res!226218) (not e!191391))))

(assert (=> d!92656 (= res!226218 (= (size!6584 (buf!7052 w2!587)) (size!6584 (buf!7052 w3!25))))))

(assert (=> d!92656 (= (isPrefixOf!0 w2!587 w3!25) e!191391)))

(declare-fun b!271527 () Bool)

(declare-fun res!226219 () Bool)

(assert (=> b!271527 (=> (not res!226219) (not e!191391))))

(assert (=> b!271527 (= res!226219 (bvsle (bitIndex!0 (size!6584 (buf!7052 w2!587)) (currentByte!13035 w2!587) (currentBit!13030 w2!587)) (bitIndex!0 (size!6584 (buf!7052 w3!25)) (currentByte!13035 w3!25) (currentBit!13030 w3!25))))))

(declare-fun b!271528 () Bool)

(declare-fun e!191392 () Bool)

(assert (=> b!271528 (= e!191391 e!191392)))

(declare-fun res!226217 () Bool)

(assert (=> b!271528 (=> res!226217 e!191392)))

(assert (=> b!271528 (= res!226217 (= (size!6584 (buf!7052 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!271529 () Bool)

(assert (=> b!271529 (= e!191392 (arrayBitRangesEq!0 (buf!7052 w2!587) (buf!7052 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6584 (buf!7052 w2!587)) (currentByte!13035 w2!587) (currentBit!13030 w2!587))))))

(assert (= (and d!92656 res!226218) b!271527))

(assert (= (and b!271527 res!226219) b!271528))

(assert (= (and b!271528 (not res!226217)) b!271529))

(assert (=> b!271527 m!403965))

(declare-fun m!403975 () Bool)

(assert (=> b!271527 m!403975))

(assert (=> b!271529 m!403965))

(assert (=> b!271529 m!403965))

(declare-fun m!403977 () Bool)

(assert (=> b!271529 m!403977))

(assert (=> b!271460 d!92656))

(check-sat (not b!271524) (not d!92648) (not b!271527) (not b!271529) (not d!92646) (not d!92604) (not d!92644) (not b!271481) (not b!271526))
(check-sat)
