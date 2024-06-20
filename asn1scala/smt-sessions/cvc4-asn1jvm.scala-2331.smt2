; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59640 () Bool)

(assert start!59640)

(declare-fun b!272496 () Bool)

(declare-fun e!192314 () Bool)

(declare-datatypes ((array!15183 0))(
  ( (array!15184 (arr!7587 (Array (_ BitVec 32) (_ BitVec 8))) (size!6600 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12014 0))(
  ( (BitStream!12015 (buf!7068 array!15183) (currentByte!13069 (_ BitVec 32)) (currentBit!13064 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!12014)

(declare-fun w3!25 () BitStream!12014)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!272496 (= e!192314 (byteRangesEq!0 (select (arr!7587 (buf!7068 w1!591)) (currentByte!13069 w1!591)) (select (arr!7587 (buf!7068 w3!25)) (currentByte!13069 w1!591)) #b00000000000000000000000000000000 (currentBit!13064 w1!591)))))

(declare-fun b!272498 () Bool)

(declare-fun e!192308 () Bool)

(assert (=> b!272498 (= e!192308 (byteRangesEq!0 (select (arr!7587 (buf!7068 w1!591)) (currentByte!13069 w1!591)) (select (arr!7587 (buf!7068 w3!25)) (currentByte!13069 w1!591)) #b00000000000000000000000000000000 (currentBit!13064 w1!591)))))

(declare-fun b!272499 () Bool)

(declare-datatypes ((Unit!19177 0))(
  ( (Unit!19178) )
))
(declare-fun e!192305 () Unit!19177)

(declare-fun Unit!19179 () Unit!19177)

(assert (=> b!272499 (= e!192305 Unit!19179)))

(declare-fun lt!410364 () Unit!19177)

(declare-fun w2!587 () BitStream!12014)

(declare-fun arrayRangesEqImpliesEq!183 (array!15183 array!15183 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19177)

(assert (=> b!272499 (= lt!410364 (arrayRangesEqImpliesEq!183 (buf!7068 w2!587) (buf!7068 w3!25) #b00000000000000000000000000000000 (currentByte!13069 w1!591) (currentByte!13069 w2!587)))))

(declare-fun res!226931 () Bool)

(assert (=> b!272499 (= res!226931 (= (select (arr!7587 (buf!7068 w2!587)) (currentByte!13069 w1!591)) (select (arr!7587 (buf!7068 w3!25)) (currentByte!13069 w1!591))))))

(assert (=> b!272499 (=> (not res!226931) (not e!192314))))

(assert (=> b!272499 e!192314))

(declare-fun b!272500 () Bool)

(declare-fun Unit!19180 () Unit!19177)

(assert (=> b!272500 (= e!192305 Unit!19180)))

(declare-fun b!272501 () Bool)

(declare-fun e!192306 () Bool)

(declare-fun array_inv!6324 (array!15183) Bool)

(assert (=> b!272501 (= e!192306 (array_inv!6324 (buf!7068 w1!591)))))

(declare-fun b!272502 () Bool)

(declare-fun res!226935 () Bool)

(declare-fun e!192307 () Bool)

(assert (=> b!272502 (=> (not res!226935) (not e!192307))))

(declare-fun isPrefixOf!0 (BitStream!12014 BitStream!12014) Bool)

(assert (=> b!272502 (= res!226935 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!272503 () Bool)

(declare-fun e!192315 () Bool)

(assert (=> b!272503 (= e!192315 true)))

(declare-fun lt!410366 () Bool)

(assert (=> b!272503 (= lt!410366 (isPrefixOf!0 w1!591 w3!25))))

(declare-fun b!272497 () Bool)

(declare-fun e!192310 () Bool)

(assert (=> b!272497 (= e!192310 (array_inv!6324 (buf!7068 w3!25)))))

(declare-fun res!226934 () Bool)

(assert (=> start!59640 (=> (not res!226934) (not e!192307))))

(assert (=> start!59640 (= res!226934 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!59640 e!192307))

(declare-fun inv!12 (BitStream!12014) Bool)

(assert (=> start!59640 (and (inv!12 w1!591) e!192306)))

(declare-fun e!192313 () Bool)

(assert (=> start!59640 (and (inv!12 w2!587) e!192313)))

(assert (=> start!59640 (and (inv!12 w3!25) e!192310)))

(declare-fun b!272504 () Bool)

(declare-fun e!192316 () Bool)

(assert (=> b!272504 (= e!192316 (not (byteRangesEq!0 (select (arr!7587 (buf!7068 w1!591)) (currentByte!13069 w1!591)) (select (arr!7587 (buf!7068 w3!25)) (currentByte!13069 w1!591)) #b00000000000000000000000000000000 (currentBit!13064 w1!591))))))

(declare-fun b!272505 () Bool)

(assert (=> b!272505 (= e!192307 (not e!192315))))

(declare-fun res!226933 () Bool)

(assert (=> b!272505 (=> res!226933 e!192315)))

(assert (=> b!272505 (= res!226933 e!192316)))

(declare-fun res!226932 () Bool)

(assert (=> b!272505 (=> (not res!226932) (not e!192316))))

(assert (=> b!272505 (= res!226932 (bvslt (currentByte!13069 w1!591) (size!6600 (buf!7068 w1!591))))))

(declare-fun lt!410363 () Unit!19177)

(assert (=> b!272505 (= lt!410363 e!192305)))

(declare-fun c!12555 () Bool)

(assert (=> b!272505 (= c!12555 (and (bvslt (currentByte!13069 w1!591) (size!6600 (buf!7068 w1!591))) (bvslt (currentByte!13069 w1!591) (currentByte!13069 w2!587))))))

(declare-fun e!192312 () Bool)

(assert (=> b!272505 e!192312))

(declare-fun res!226930 () Bool)

(assert (=> b!272505 (=> (not res!226930) (not e!192312))))

(declare-fun arrayRangesEq!1132 (array!15183 array!15183 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!272505 (= res!226930 (arrayRangesEq!1132 (buf!7068 w1!591) (buf!7068 w3!25) #b00000000000000000000000000000000 (currentByte!13069 w1!591)))))

(declare-fun lt!410365 () Unit!19177)

(declare-fun arrayRangesEqTransitive!395 (array!15183 array!15183 array!15183 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19177)

(assert (=> b!272505 (= lt!410365 (arrayRangesEqTransitive!395 (buf!7068 w1!591) (buf!7068 w2!587) (buf!7068 w3!25) #b00000000000000000000000000000000 (currentByte!13069 w1!591) (currentByte!13069 w2!587)))))

(declare-fun b!272506 () Bool)

(assert (=> b!272506 (= e!192312 e!192308)))

(declare-fun res!226936 () Bool)

(assert (=> b!272506 (=> res!226936 e!192308)))

(assert (=> b!272506 (= res!226936 (or (bvsge (currentByte!13069 w1!591) (size!6600 (buf!7068 w1!591))) (bvslt (currentByte!13069 w1!591) (currentByte!13069 w2!587))))))

(declare-fun b!272507 () Bool)

(assert (=> b!272507 (= e!192313 (array_inv!6324 (buf!7068 w2!587)))))

(assert (= (and start!59640 res!226934) b!272502))

(assert (= (and b!272502 res!226935) b!272505))

(assert (= (and b!272505 res!226930) b!272506))

(assert (= (and b!272506 (not res!226936)) b!272498))

(assert (= (and b!272505 c!12555) b!272499))

(assert (= (and b!272505 (not c!12555)) b!272500))

(assert (= (and b!272499 res!226931) b!272496))

(assert (= (and b!272505 res!226932) b!272504))

(assert (= (and b!272505 (not res!226933)) b!272503))

(assert (= start!59640 b!272501))

(assert (= start!59640 b!272507))

(assert (= start!59640 b!272497))

(declare-fun m!405289 () Bool)

(assert (=> b!272507 m!405289))

(declare-fun m!405291 () Bool)

(assert (=> b!272497 m!405291))

(declare-fun m!405293 () Bool)

(assert (=> start!59640 m!405293))

(declare-fun m!405295 () Bool)

(assert (=> start!59640 m!405295))

(declare-fun m!405297 () Bool)

(assert (=> start!59640 m!405297))

(declare-fun m!405299 () Bool)

(assert (=> start!59640 m!405299))

(declare-fun m!405301 () Bool)

(assert (=> b!272496 m!405301))

(declare-fun m!405303 () Bool)

(assert (=> b!272496 m!405303))

(assert (=> b!272496 m!405301))

(assert (=> b!272496 m!405303))

(declare-fun m!405305 () Bool)

(assert (=> b!272496 m!405305))

(assert (=> b!272504 m!405301))

(assert (=> b!272504 m!405303))

(assert (=> b!272504 m!405301))

(assert (=> b!272504 m!405303))

(assert (=> b!272504 m!405305))

(declare-fun m!405307 () Bool)

(assert (=> b!272499 m!405307))

(declare-fun m!405309 () Bool)

(assert (=> b!272499 m!405309))

(assert (=> b!272499 m!405303))

(assert (=> b!272498 m!405301))

(assert (=> b!272498 m!405303))

(assert (=> b!272498 m!405301))

(assert (=> b!272498 m!405303))

(assert (=> b!272498 m!405305))

(declare-fun m!405311 () Bool)

(assert (=> b!272505 m!405311))

(declare-fun m!405313 () Bool)

(assert (=> b!272505 m!405313))

(declare-fun m!405315 () Bool)

(assert (=> b!272503 m!405315))

(declare-fun m!405317 () Bool)

(assert (=> b!272501 m!405317))

(declare-fun m!405319 () Bool)

(assert (=> b!272502 m!405319))

(push 1)

(assert (not b!272501))

(assert (not b!272502))

(assert (not b!272507))

(assert (not b!272496))

(assert (not b!272497))

(assert (not start!59640))

(assert (not b!272505))

(assert (not b!272503))

(assert (not b!272504))

(assert (not b!272498))

