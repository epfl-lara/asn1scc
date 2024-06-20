; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58252 () Bool)

(assert start!58252)

(declare-fun b!267574 () Bool)

(declare-fun e!187523 () Bool)

(declare-datatypes ((array!14910 0))(
  ( (array!14911 (arr!7488 (Array (_ BitVec 32) (_ BitVec 8))) (size!6501 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11816 0))(
  ( (BitStream!11817 (buf!6969 array!14910) (currentByte!12875 (_ BitVec 32)) (currentBit!12870 (_ BitVec 32))) )
))
(declare-fun w2!587 () BitStream!11816)

(declare-fun array_inv!6225 (array!14910) Bool)

(assert (=> b!267574 (= e!187523 (array_inv!6225 (buf!6969 w2!587)))))

(declare-fun b!267573 () Bool)

(declare-fun e!187521 () Bool)

(declare-fun w1!591 () BitStream!11816)

(assert (=> b!267573 (= e!187521 (array_inv!6225 (buf!6969 w1!591)))))

(declare-fun res!223321 () Bool)

(declare-fun e!187527 () Bool)

(assert (=> start!58252 (=> (not res!223321) (not e!187527))))

(declare-fun isPrefixOf!0 (BitStream!11816 BitStream!11816) Bool)

(assert (=> start!58252 (= res!223321 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58252 e!187527))

(declare-fun inv!12 (BitStream!11816) Bool)

(assert (=> start!58252 (and (inv!12 w1!591) e!187521)))

(assert (=> start!58252 (and (inv!12 w2!587) e!187523)))

(declare-fun w3!25 () BitStream!11816)

(declare-fun e!187525 () Bool)

(assert (=> start!58252 (and (inv!12 w3!25) e!187525)))

(declare-fun b!267572 () Bool)

(assert (=> b!267572 (= e!187527 false)))

(declare-fun lt!408020 () Bool)

(assert (=> b!267572 (= lt!408020 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!267575 () Bool)

(assert (=> b!267575 (= e!187525 (array_inv!6225 (buf!6969 w3!25)))))

(assert (= (and start!58252 res!223321) b!267572))

(assert (= start!58252 b!267573))

(assert (= start!58252 b!267574))

(assert (= start!58252 b!267575))

(declare-fun m!398809 () Bool)

(assert (=> b!267573 m!398809))

(declare-fun m!398811 () Bool)

(assert (=> b!267575 m!398811))

(declare-fun m!398813 () Bool)

(assert (=> start!58252 m!398813))

(declare-fun m!398815 () Bool)

(assert (=> start!58252 m!398815))

(declare-fun m!398817 () Bool)

(assert (=> start!58252 m!398817))

(declare-fun m!398819 () Bool)

(assert (=> start!58252 m!398819))

(declare-fun m!398821 () Bool)

(assert (=> b!267574 m!398821))

(declare-fun m!398823 () Bool)

(assert (=> b!267572 m!398823))

(push 1)

(assert (not b!267575))

(assert (not b!267572))

(assert (not b!267574))

(assert (not start!58252))

(assert (not b!267573))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

