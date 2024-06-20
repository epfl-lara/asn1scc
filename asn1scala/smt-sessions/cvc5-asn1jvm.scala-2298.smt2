; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58248 () Bool)

(assert start!58248)

(declare-fun b!267550 () Bool)

(declare-fun e!187485 () Bool)

(declare-datatypes ((array!14906 0))(
  ( (array!14907 (arr!7486 (Array (_ BitVec 32) (_ BitVec 8))) (size!6499 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11812 0))(
  ( (BitStream!11813 (buf!6967 array!14906) (currentByte!12873 (_ BitVec 32)) (currentBit!12868 (_ BitVec 32))) )
))
(declare-fun w2!587 () BitStream!11812)

(declare-fun array_inv!6223 (array!14906) Bool)

(assert (=> b!267550 (= e!187485 (array_inv!6223 (buf!6967 w2!587)))))

(declare-fun b!267549 () Bool)

(declare-fun e!187480 () Bool)

(declare-fun w1!591 () BitStream!11812)

(assert (=> b!267549 (= e!187480 (array_inv!6223 (buf!6967 w1!591)))))

(declare-fun b!267551 () Bool)

(declare-fun e!187483 () Bool)

(declare-fun w3!25 () BitStream!11812)

(assert (=> b!267551 (= e!187483 (array_inv!6223 (buf!6967 w3!25)))))

(declare-fun res!223315 () Bool)

(declare-fun e!187482 () Bool)

(assert (=> start!58248 (=> (not res!223315) (not e!187482))))

(declare-fun isPrefixOf!0 (BitStream!11812 BitStream!11812) Bool)

(assert (=> start!58248 (= res!223315 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58248 e!187482))

(declare-fun inv!12 (BitStream!11812) Bool)

(assert (=> start!58248 (and (inv!12 w1!591) e!187480)))

(assert (=> start!58248 (and (inv!12 w2!587) e!187485)))

(assert (=> start!58248 (and (inv!12 w3!25) e!187483)))

(declare-fun b!267548 () Bool)

(assert (=> b!267548 (= e!187482 false)))

(declare-fun lt!408014 () Bool)

(assert (=> b!267548 (= lt!408014 (isPrefixOf!0 w2!587 w3!25))))

(assert (= (and start!58248 res!223315) b!267548))

(assert (= start!58248 b!267549))

(assert (= start!58248 b!267550))

(assert (= start!58248 b!267551))

(declare-fun m!398777 () Bool)

(assert (=> start!58248 m!398777))

(declare-fun m!398779 () Bool)

(assert (=> start!58248 m!398779))

(declare-fun m!398781 () Bool)

(assert (=> start!58248 m!398781))

(declare-fun m!398783 () Bool)

(assert (=> start!58248 m!398783))

(declare-fun m!398785 () Bool)

(assert (=> b!267549 m!398785))

(declare-fun m!398787 () Bool)

(assert (=> b!267548 m!398787))

(declare-fun m!398789 () Bool)

(assert (=> b!267550 m!398789))

(declare-fun m!398791 () Bool)

(assert (=> b!267551 m!398791))

(push 1)

(assert (not b!267550))

(assert (not b!267551))

(assert (not b!267549))

(assert (not b!267548))

(assert (not start!58248))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

