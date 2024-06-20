; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58230 () Bool)

(assert start!58230)

(declare-fun b!267441 () Bool)

(declare-fun e!187293 () Bool)

(declare-datatypes ((array!14888 0))(
  ( (array!14889 (arr!7477 (Array (_ BitVec 32) (_ BitVec 8))) (size!6490 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11794 0))(
  ( (BitStream!11795 (buf!6958 array!14888) (currentByte!12864 (_ BitVec 32)) (currentBit!12859 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11794)

(declare-fun array_inv!6214 (array!14888) Bool)

(assert (=> b!267441 (= e!187293 (array_inv!6214 (buf!6958 w1!591)))))

(declare-fun res!223288 () Bool)

(declare-fun e!187296 () Bool)

(assert (=> start!58230 (=> (not res!223288) (not e!187296))))

(declare-fun w2!587 () BitStream!11794)

(declare-fun isPrefixOf!0 (BitStream!11794 BitStream!11794) Bool)

(assert (=> start!58230 (= res!223288 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58230 e!187296))

(declare-fun inv!12 (BitStream!11794) Bool)

(assert (=> start!58230 (and (inv!12 w1!591) e!187293)))

(declare-fun e!187294 () Bool)

(assert (=> start!58230 (and (inv!12 w2!587) e!187294)))

(declare-fun w3!25 () BitStream!11794)

(declare-fun e!187295 () Bool)

(assert (=> start!58230 (and (inv!12 w3!25) e!187295)))

(declare-fun b!267442 () Bool)

(assert (=> b!267442 (= e!187294 (array_inv!6214 (buf!6958 w2!587)))))

(declare-fun b!267440 () Bool)

(assert (=> b!267440 (= e!187296 false)))

(declare-fun lt!407987 () Bool)

(assert (=> b!267440 (= lt!407987 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!267443 () Bool)

(assert (=> b!267443 (= e!187295 (array_inv!6214 (buf!6958 w3!25)))))

(assert (= (and start!58230 res!223288) b!267440))

(assert (= start!58230 b!267441))

(assert (= start!58230 b!267442))

(assert (= start!58230 b!267443))

(declare-fun m!398633 () Bool)

(assert (=> b!267441 m!398633))

(declare-fun m!398635 () Bool)

(assert (=> start!58230 m!398635))

(declare-fun m!398637 () Bool)

(assert (=> start!58230 m!398637))

(declare-fun m!398639 () Bool)

(assert (=> start!58230 m!398639))

(declare-fun m!398641 () Bool)

(assert (=> start!58230 m!398641))

(declare-fun m!398643 () Bool)

(assert (=> b!267443 m!398643))

(declare-fun m!398645 () Bool)

(assert (=> b!267442 m!398645))

(declare-fun m!398647 () Bool)

(assert (=> b!267440 m!398647))

(push 1)

(assert (not b!267443))

(assert (not b!267440))

(assert (not start!58230))

(assert (not b!267441))

(assert (not b!267442))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

