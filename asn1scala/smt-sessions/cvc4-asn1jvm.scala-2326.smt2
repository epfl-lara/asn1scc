; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59340 () Bool)

(assert start!59340)

(declare-fun b!271471 () Bool)

(declare-fun e!191350 () Bool)

(declare-datatypes ((array!15138 0))(
  ( (array!15139 (arr!7572 (Array (_ BitVec 32) (_ BitVec 8))) (size!6585 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11984 0))(
  ( (BitStream!11985 (buf!7053 array!15138) (currentByte!13036 (_ BitVec 32)) (currentBit!13031 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11984)

(declare-fun array_inv!6309 (array!15138) Bool)

(assert (=> b!271471 (= e!191350 (array_inv!6309 (buf!7053 w1!591)))))

(declare-fun b!271472 () Bool)

(declare-fun e!191346 () Bool)

(declare-fun w3!25 () BitStream!11984)

(assert (=> b!271472 (= e!191346 (array_inv!6309 (buf!7053 w3!25)))))

(declare-fun b!271474 () Bool)

(declare-fun res!226165 () Bool)

(declare-fun e!191348 () Bool)

(assert (=> b!271474 (=> (not res!226165) (not e!191348))))

(declare-fun w2!587 () BitStream!11984)

(declare-fun isPrefixOf!0 (BitStream!11984 BitStream!11984) Bool)

(assert (=> b!271474 (= res!226165 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!271475 () Bool)

(assert (=> b!271475 (= e!191348 (not (or (bvsge (currentByte!13036 w1!591) (size!6585 (buf!7053 w1!591))) (bvslt (currentByte!13036 w1!591) (currentByte!13036 w2!587)) (bvsgt (currentBit!13031 w1!591) (currentBit!13031 w2!587)) (and (bvsge (currentByte!13036 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!13036 w1!591) (size!6585 (buf!7053 w3!25)))))))))

(declare-fun arrayRangesEq!1117 (array!15138 array!15138 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!271475 (arrayRangesEq!1117 (buf!7053 w1!591) (buf!7053 w3!25) #b00000000000000000000000000000000 (currentByte!13036 w1!591))))

(declare-datatypes ((Unit!19125 0))(
  ( (Unit!19126) )
))
(declare-fun lt!409907 () Unit!19125)

(declare-fun arrayRangesEqTransitive!380 (array!15138 array!15138 array!15138 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19125)

(assert (=> b!271475 (= lt!409907 (arrayRangesEqTransitive!380 (buf!7053 w1!591) (buf!7053 w2!587) (buf!7053 w3!25) #b00000000000000000000000000000000 (currentByte!13036 w1!591) (currentByte!13036 w2!587)))))

(declare-fun b!271473 () Bool)

(declare-fun e!191349 () Bool)

(assert (=> b!271473 (= e!191349 (array_inv!6309 (buf!7053 w2!587)))))

(declare-fun res!226164 () Bool)

(assert (=> start!59340 (=> (not res!226164) (not e!191348))))

(assert (=> start!59340 (= res!226164 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!59340 e!191348))

(declare-fun inv!12 (BitStream!11984) Bool)

(assert (=> start!59340 (and (inv!12 w1!591) e!191350)))

(assert (=> start!59340 (and (inv!12 w2!587) e!191349)))

(assert (=> start!59340 (and (inv!12 w3!25) e!191346)))

(assert (= (and start!59340 res!226164) b!271474))

(assert (= (and b!271474 res!226165) b!271475))

(assert (= start!59340 b!271471))

(assert (= start!59340 b!271473))

(assert (= start!59340 b!271472))

(declare-fun m!403887 () Bool)

(assert (=> b!271473 m!403887))

(declare-fun m!403889 () Bool)

(assert (=> b!271475 m!403889))

(declare-fun m!403891 () Bool)

(assert (=> b!271475 m!403891))

(declare-fun m!403893 () Bool)

(assert (=> b!271471 m!403893))

(declare-fun m!403895 () Bool)

(assert (=> start!59340 m!403895))

(declare-fun m!403897 () Bool)

(assert (=> start!59340 m!403897))

(declare-fun m!403899 () Bool)

(assert (=> start!59340 m!403899))

(declare-fun m!403901 () Bool)

(assert (=> start!59340 m!403901))

(declare-fun m!403903 () Bool)

(assert (=> b!271474 m!403903))

(declare-fun m!403905 () Bool)

(assert (=> b!271472 m!403905))

(push 1)

(assert (not b!271475))

(assert (not start!59340))

(assert (not b!271472))

(assert (not b!271474))

(assert (not b!271473))

(assert (not b!271471))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!92606 () Bool)

(declare-fun res!226182 () Bool)

(declare-fun e!191367 () Bool)

(assert (=> d!92606 (=> res!226182 e!191367)))

(assert (=> d!92606 (= res!226182 (= #b00000000000000000000000000000000 (currentByte!13036 w1!591)))))

(assert (=> d!92606 (= (arrayRangesEq!1117 (buf!7053 w1!591) (buf!7053 w3!25) #b00000000000000000000000000000000 (currentByte!13036 w1!591)) e!191367)))

(declare-fun b!271492 () Bool)

(declare-fun e!191368 () Bool)

(assert (=> b!271492 (= e!191367 e!191368)))

(declare-fun res!226183 () Bool)

(assert (=> b!271492 (=> (not res!226183) (not e!191368))))

(assert (=> b!271492 (= res!226183 (= (select (arr!7572 (buf!7053 w1!591)) #b00000000000000000000000000000000) (select (arr!7572 (buf!7053 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!271493 () Bool)

(assert (=> b!271493 (= e!191368 (arrayRangesEq!1117 (buf!7053 w1!591) (buf!7053 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13036 w1!591)))))

(assert (= (and d!92606 (not res!226182)) b!271492))

(assert (= (and b!271492 res!226183) b!271493))

(declare-fun m!403919 () Bool)

(assert (=> b!271492 m!403919))

(declare-fun m!403921 () Bool)

(assert (=> b!271492 m!403921))

(declare-fun m!403923 () Bool)

(assert (=> b!271493 m!403923))

(assert (=> b!271475 d!92606))

(declare-fun d!92610 () Bool)

(assert (=> d!92610 (arrayRangesEq!1117 (buf!7053 w1!591) (buf!7053 w3!25) #b00000000000000000000000000000000 (currentByte!13036 w1!591))))

(declare-fun lt!409916 () Unit!19125)

(declare-fun choose!427 (array!15138 array!15138 array!15138 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19125)

(assert (=> d!92610 (= lt!409916 (choose!427 (buf!7053 w1!591) (buf!7053 w2!587) (buf!7053 w3!25) #b00000000000000000000000000000000 (currentByte!13036 w1!591) (currentByte!13036 w2!587)))))

(assert (=> d!92610 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13036 w1!591)) (bvsle (currentByte!13036 w1!591) (currentByte!13036 w2!587)))))

(assert (=> d!92610 (= (arrayRangesEqTransitive!380 (buf!7053 w1!591) (buf!7053 w2!587) (buf!7053 w3!25) #b00000000000000000000000000000000 (currentByte!13036 w1!591) (currentByte!13036 w2!587)) lt!409916)))

(declare-fun bs!23366 () Bool)

(assert (= bs!23366 d!92610))

(assert (=> bs!23366 m!403889))

(declare-fun m!403927 () Bool)

(assert (=> bs!23366 m!403927))

(assert (=> b!271475 d!92610))

(declare-fun d!92614 () Bool)

(assert (=> d!92614 (= (array_inv!6309 (buf!7053 w1!591)) (bvsge (size!6585 (buf!7053 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!271471 d!92614))

(declare-fun d!92618 () Bool)

(assert (=> d!92618 (= (array_inv!6309 (buf!7053 w2!587)) (bvsge (size!6585 (buf!7053 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!271473 d!92618))

(declare-fun d!92620 () Bool)

(declare-fun res!226203 () Bool)

(declare-fun e!191381 () Bool)

(assert (=> d!92620 (=> (not res!226203) (not e!191381))))

(assert (=> d!92620 (= res!226203 (= (size!6585 (buf!7053 w1!591)) (size!6585 (buf!7053 w2!587))))))

(assert (=> d!92620 (= (isPrefixOf!0 w1!591 w2!587) e!191381)))

(declare-fun b!271512 () Bool)

(declare-fun res!226202 () Bool)

(assert (=> b!271512 (=> (not res!226202) (not e!191381))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!271512 (= res!226202 (bvsle (bitIndex!0 (size!6585 (buf!7053 w1!591)) (currentByte!13036 w1!591) (currentBit!13031 w1!591)) (bitIndex!0 (size!6585 (buf!7053 w2!587)) (currentByte!13036 w2!587) (currentBit!13031 w2!587))))))

(declare-fun b!271513 () Bool)

(declare-fun e!191382 () Bool)

(assert (=> b!271513 (= e!191381 e!191382)))

(declare-fun res!226204 () Bool)

(assert (=> b!271513 (=> res!226204 e!191382)))

(assert (=> b!271513 (= res!226204 (= (size!6585 (buf!7053 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!271514 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15138 array!15138 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!271514 (= e!191382 (arrayBitRangesEq!0 (buf!7053 w1!591) (buf!7053 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6585 (buf!7053 w1!591)) (currentByte!13036 w1!591) (currentBit!13031 w1!591))))))

(assert (= (and d!92620 res!226203) b!271512))

(assert (= (and b!271512 res!226202) b!271513))

(assert (= (and b!271513 (not res!226204)) b!271514))

(declare-fun m!403947 () Bool)

(assert (=> b!271512 m!403947))

(declare-fun m!403949 () Bool)

(assert (=> b!271512 m!403949))

(assert (=> b!271514 m!403947))

(assert (=> b!271514 m!403947))

(declare-fun m!403951 () Bool)

(assert (=> b!271514 m!403951))

(assert (=> start!59340 d!92620))

(declare-fun d!92634 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!92634 (= (inv!12 w1!591) (invariant!0 (currentBit!13031 w1!591) (currentByte!13036 w1!591) (size!6585 (buf!7053 w1!591))))))

(declare-fun bs!23371 () Bool)

(assert (= bs!23371 d!92634))

(declare-fun m!403953 () Bool)

(assert (=> bs!23371 m!403953))

(assert (=> start!59340 d!92634))

(declare-fun d!92636 () Bool)

(assert (=> d!92636 (= (inv!12 w2!587) (invariant!0 (currentBit!13031 w2!587) (currentByte!13036 w2!587) (size!6585 (buf!7053 w2!587))))))

(declare-fun bs!23372 () Bool)

(assert (= bs!23372 d!92636))

(declare-fun m!403955 () Bool)

(assert (=> bs!23372 m!403955))

(assert (=> start!59340 d!92636))

(declare-fun d!92638 () Bool)

(assert (=> d!92638 (= (inv!12 w3!25) (invariant!0 (currentBit!13031 w3!25) (currentByte!13036 w3!25) (size!6585 (buf!7053 w3!25))))))

(declare-fun bs!23373 () Bool)

(assert (= bs!23373 d!92638))

(declare-fun m!403957 () Bool)

(assert (=> bs!23373 m!403957))

(assert (=> start!59340 d!92638))

(declare-fun d!92640 () Bool)

(assert (=> d!92640 (= (array_inv!6309 (buf!7053 w3!25)) (bvsge (size!6585 (buf!7053 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!271472 d!92640))

(declare-fun d!92642 () Bool)

(declare-fun res!226206 () Bool)

(declare-fun e!191383 () Bool)

(assert (=> d!92642 (=> (not res!226206) (not e!191383))))

(assert (=> d!92642 (= res!226206 (= (size!6585 (buf!7053 w2!587)) (size!6585 (buf!7053 w3!25))))))

(assert (=> d!92642 (= (isPrefixOf!0 w2!587 w3!25) e!191383)))

(declare-fun b!271515 () Bool)

(declare-fun res!226205 () Bool)

(assert (=> b!271515 (=> (not res!226205) (not e!191383))))

(assert (=> b!271515 (= res!226205 (bvsle (bitIndex!0 (size!6585 (buf!7053 w2!587)) (currentByte!13036 w2!587) (currentBit!13031 w2!587)) (bitIndex!0 (size!6585 (buf!7053 w3!25)) (currentByte!13036 w3!25) (currentBit!13031 w3!25))))))

(declare-fun b!271516 () Bool)

(declare-fun e!191384 () Bool)

(assert (=> b!271516 (= e!191383 e!191384)))

(declare-fun res!226207 () Bool)

(assert (=> b!271516 (=> res!226207 e!191384)))

(assert (=> b!271516 (= res!226207 (= (size!6585 (buf!7053 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!271517 () Bool)

(assert (=> b!271517 (= e!191384 (arrayBitRangesEq!0 (buf!7053 w2!587) (buf!7053 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6585 (buf!7053 w2!587)) (currentByte!13036 w2!587) (currentBit!13031 w2!587))))))

(assert (= (and d!92642 res!226206) b!271515))

(assert (= (and b!271515 res!226205) b!271516))

(assert (= (and b!271516 (not res!226207)) b!271517))

(assert (=> b!271515 m!403949))

(declare-fun m!403959 () Bool)

(assert (=> b!271515 m!403959))

(assert (=> b!271517 m!403949))

(assert (=> b!271517 m!403949))

(declare-fun m!403961 () Bool)

(assert (=> b!271517 m!403961))

(assert (=> b!271474 d!92642))

(push 1)

(assert (not d!92638))

(assert (not b!271515))

(assert (not b!271514))

(assert (not b!271517))

(assert (not b!271493))

(assert (not b!271512))

(assert (not d!92634))

(assert (not d!92610))

(assert (not d!92636))

(check-sat)

(pop 1)

(push 1)

(check-sat)

