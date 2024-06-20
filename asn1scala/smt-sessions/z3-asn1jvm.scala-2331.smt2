; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59638 () Bool)

(assert start!59638)

(declare-fun b!272460 () Bool)

(declare-fun e!192265 () Bool)

(declare-datatypes ((array!15181 0))(
  ( (array!15182 (arr!7586 (Array (_ BitVec 32) (_ BitVec 8))) (size!6599 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12012 0))(
  ( (BitStream!12013 (buf!7067 array!15181) (currentByte!13068 (_ BitVec 32)) (currentBit!13063 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!12012)

(declare-fun w3!25 () BitStream!12012)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!272460 (= e!192265 (byteRangesEq!0 (select (arr!7586 (buf!7067 w1!591)) (currentByte!13068 w1!591)) (select (arr!7586 (buf!7067 w3!25)) (currentByte!13068 w1!591)) #b00000000000000000000000000000000 (currentBit!13063 w1!591)))))

(declare-fun b!272461 () Bool)

(declare-fun res!226911 () Bool)

(declare-fun e!192267 () Bool)

(assert (=> b!272461 (=> (not res!226911) (not e!192267))))

(declare-fun w2!587 () BitStream!12012)

(declare-fun isPrefixOf!0 (BitStream!12012 BitStream!12012) Bool)

(assert (=> b!272461 (= res!226911 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!272462 () Bool)

(declare-datatypes ((Unit!19173 0))(
  ( (Unit!19174) )
))
(declare-fun e!192276 () Unit!19173)

(declare-fun Unit!19175 () Unit!19173)

(assert (=> b!272462 (= e!192276 Unit!19175)))

(declare-fun lt!410352 () Unit!19173)

(declare-fun arrayRangesEqImpliesEq!182 (array!15181 array!15181 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19173)

(assert (=> b!272462 (= lt!410352 (arrayRangesEqImpliesEq!182 (buf!7067 w2!587) (buf!7067 w3!25) #b00000000000000000000000000000000 (currentByte!13068 w1!591) (currentByte!13068 w2!587)))))

(declare-fun res!226910 () Bool)

(assert (=> b!272462 (= res!226910 (= (select (arr!7586 (buf!7067 w2!587)) (currentByte!13068 w1!591)) (select (arr!7586 (buf!7067 w3!25)) (currentByte!13068 w1!591))))))

(declare-fun e!192268 () Bool)

(assert (=> b!272462 (=> (not res!226910) (not e!192268))))

(assert (=> b!272462 e!192268))

(declare-fun b!272463 () Bool)

(declare-fun e!192271 () Bool)

(declare-fun array_inv!6323 (array!15181) Bool)

(assert (=> b!272463 (= e!192271 (array_inv!6323 (buf!7067 w1!591)))))

(declare-fun b!272464 () Bool)

(declare-fun e!192272 () Bool)

(assert (=> b!272464 (= e!192272 e!192265)))

(declare-fun res!226914 () Bool)

(assert (=> b!272464 (=> res!226914 e!192265)))

(assert (=> b!272464 (= res!226914 (or (bvsge (currentByte!13068 w1!591) (size!6599 (buf!7067 w1!591))) (bvslt (currentByte!13068 w1!591) (currentByte!13068 w2!587))))))

(declare-fun b!272465 () Bool)

(assert (=> b!272465 (= e!192268 (byteRangesEq!0 (select (arr!7586 (buf!7067 w1!591)) (currentByte!13068 w1!591)) (select (arr!7586 (buf!7067 w3!25)) (currentByte!13068 w1!591)) #b00000000000000000000000000000000 (currentBit!13063 w1!591)))))

(declare-fun res!226915 () Bool)

(assert (=> start!59638 (=> (not res!226915) (not e!192267))))

(assert (=> start!59638 (= res!226915 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!59638 e!192267))

(declare-fun inv!12 (BitStream!12012) Bool)

(assert (=> start!59638 (and (inv!12 w1!591) e!192271)))

(declare-fun e!192269 () Bool)

(assert (=> start!59638 (and (inv!12 w2!587) e!192269)))

(declare-fun e!192277 () Bool)

(assert (=> start!59638 (and (inv!12 w3!25) e!192277)))

(declare-fun b!272466 () Bool)

(declare-fun e!192273 () Bool)

(assert (=> b!272466 (= e!192267 (not e!192273))))

(declare-fun res!226912 () Bool)

(assert (=> b!272466 (=> res!226912 e!192273)))

(declare-fun e!192274 () Bool)

(assert (=> b!272466 (= res!226912 e!192274)))

(declare-fun res!226909 () Bool)

(assert (=> b!272466 (=> (not res!226909) (not e!192274))))

(assert (=> b!272466 (= res!226909 (bvslt (currentByte!13068 w1!591) (size!6599 (buf!7067 w1!591))))))

(declare-fun lt!410354 () Unit!19173)

(assert (=> b!272466 (= lt!410354 e!192276)))

(declare-fun c!12552 () Bool)

(assert (=> b!272466 (= c!12552 (and (bvslt (currentByte!13068 w1!591) (size!6599 (buf!7067 w1!591))) (bvslt (currentByte!13068 w1!591) (currentByte!13068 w2!587))))))

(assert (=> b!272466 e!192272))

(declare-fun res!226913 () Bool)

(assert (=> b!272466 (=> (not res!226913) (not e!192272))))

(declare-fun arrayRangesEq!1131 (array!15181 array!15181 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!272466 (= res!226913 (arrayRangesEq!1131 (buf!7067 w1!591) (buf!7067 w3!25) #b00000000000000000000000000000000 (currentByte!13068 w1!591)))))

(declare-fun lt!410351 () Unit!19173)

(declare-fun arrayRangesEqTransitive!394 (array!15181 array!15181 array!15181 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19173)

(assert (=> b!272466 (= lt!410351 (arrayRangesEqTransitive!394 (buf!7067 w1!591) (buf!7067 w2!587) (buf!7067 w3!25) #b00000000000000000000000000000000 (currentByte!13068 w1!591) (currentByte!13068 w2!587)))))

(declare-fun b!272467 () Bool)

(assert (=> b!272467 (= e!192277 (array_inv!6323 (buf!7067 w3!25)))))

(declare-fun b!272468 () Bool)

(declare-fun Unit!19176 () Unit!19173)

(assert (=> b!272468 (= e!192276 Unit!19176)))

(declare-fun b!272469 () Bool)

(assert (=> b!272469 (= e!192274 (not (byteRangesEq!0 (select (arr!7586 (buf!7067 w1!591)) (currentByte!13068 w1!591)) (select (arr!7586 (buf!7067 w3!25)) (currentByte!13068 w1!591)) #b00000000000000000000000000000000 (currentBit!13063 w1!591))))))

(declare-fun b!272470 () Bool)

(assert (=> b!272470 (= e!192269 (array_inv!6323 (buf!7067 w2!587)))))

(declare-fun b!272471 () Bool)

(assert (=> b!272471 (= e!192273 true)))

(declare-fun lt!410353 () Bool)

(assert (=> b!272471 (= lt!410353 (isPrefixOf!0 w1!591 w3!25))))

(assert (= (and start!59638 res!226915) b!272461))

(assert (= (and b!272461 res!226911) b!272466))

(assert (= (and b!272466 res!226913) b!272464))

(assert (= (and b!272464 (not res!226914)) b!272460))

(assert (= (and b!272466 c!12552) b!272462))

(assert (= (and b!272466 (not c!12552)) b!272468))

(assert (= (and b!272462 res!226910) b!272465))

(assert (= (and b!272466 res!226909) b!272469))

(assert (= (and b!272466 (not res!226912)) b!272471))

(assert (= start!59638 b!272463))

(assert (= start!59638 b!272470))

(assert (= start!59638 b!272467))

(declare-fun m!405257 () Bool)

(assert (=> b!272465 m!405257))

(declare-fun m!405259 () Bool)

(assert (=> b!272465 m!405259))

(assert (=> b!272465 m!405257))

(assert (=> b!272465 m!405259))

(declare-fun m!405261 () Bool)

(assert (=> b!272465 m!405261))

(declare-fun m!405263 () Bool)

(assert (=> b!272471 m!405263))

(declare-fun m!405265 () Bool)

(assert (=> b!272461 m!405265))

(declare-fun m!405267 () Bool)

(assert (=> b!272470 m!405267))

(assert (=> b!272460 m!405257))

(assert (=> b!272460 m!405259))

(assert (=> b!272460 m!405257))

(assert (=> b!272460 m!405259))

(assert (=> b!272460 m!405261))

(declare-fun m!405269 () Bool)

(assert (=> b!272462 m!405269))

(declare-fun m!405271 () Bool)

(assert (=> b!272462 m!405271))

(assert (=> b!272462 m!405259))

(declare-fun m!405273 () Bool)

(assert (=> b!272463 m!405273))

(declare-fun m!405275 () Bool)

(assert (=> b!272466 m!405275))

(declare-fun m!405277 () Bool)

(assert (=> b!272466 m!405277))

(assert (=> b!272469 m!405257))

(assert (=> b!272469 m!405259))

(assert (=> b!272469 m!405257))

(assert (=> b!272469 m!405259))

(assert (=> b!272469 m!405261))

(declare-fun m!405279 () Bool)

(assert (=> b!272467 m!405279))

(declare-fun m!405281 () Bool)

(assert (=> start!59638 m!405281))

(declare-fun m!405283 () Bool)

(assert (=> start!59638 m!405283))

(declare-fun m!405285 () Bool)

(assert (=> start!59638 m!405285))

(declare-fun m!405287 () Bool)

(assert (=> start!59638 m!405287))

(check-sat (not start!59638) (not b!272469) (not b!272460) (not b!272465) (not b!272467) (not b!272463) (not b!272471) (not b!272470) (not b!272461) (not b!272466) (not b!272462))
(check-sat)
