; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58242 () Bool)

(assert start!58242)

(declare-fun res!223306 () Bool)

(declare-fun e!187419 () Bool)

(assert (=> start!58242 (=> (not res!223306) (not e!187419))))

(declare-datatypes ((array!14900 0))(
  ( (array!14901 (arr!7483 (Array (_ BitVec 32) (_ BitVec 8))) (size!6496 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11806 0))(
  ( (BitStream!11807 (buf!6964 array!14900) (currentByte!12870 (_ BitVec 32)) (currentBit!12865 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11806)

(declare-fun w2!587 () BitStream!11806)

(declare-fun isPrefixOf!0 (BitStream!11806 BitStream!11806) Bool)

(assert (=> start!58242 (= res!223306 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58242 e!187419))

(declare-fun e!187421 () Bool)

(declare-fun inv!12 (BitStream!11806) Bool)

(assert (=> start!58242 (and (inv!12 w1!591) e!187421)))

(declare-fun e!187417 () Bool)

(assert (=> start!58242 (and (inv!12 w2!587) e!187417)))

(declare-fun w3!25 () BitStream!11806)

(declare-fun e!187422 () Bool)

(assert (=> start!58242 (and (inv!12 w3!25) e!187422)))

(declare-fun b!267515 () Bool)

(declare-fun array_inv!6220 (array!14900) Bool)

(assert (=> b!267515 (= e!187422 (array_inv!6220 (buf!6964 w3!25)))))

(declare-fun b!267513 () Bool)

(assert (=> b!267513 (= e!187421 (array_inv!6220 (buf!6964 w1!591)))))

(declare-fun b!267512 () Bool)

(assert (=> b!267512 (= e!187419 false)))

(declare-fun lt!408005 () Bool)

(assert (=> b!267512 (= lt!408005 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!267514 () Bool)

(assert (=> b!267514 (= e!187417 (array_inv!6220 (buf!6964 w2!587)))))

(assert (= (and start!58242 res!223306) b!267512))

(assert (= start!58242 b!267513))

(assert (= start!58242 b!267514))

(assert (= start!58242 b!267515))

(declare-fun m!398729 () Bool)

(assert (=> start!58242 m!398729))

(declare-fun m!398731 () Bool)

(assert (=> start!58242 m!398731))

(declare-fun m!398733 () Bool)

(assert (=> start!58242 m!398733))

(declare-fun m!398735 () Bool)

(assert (=> start!58242 m!398735))

(declare-fun m!398737 () Bool)

(assert (=> b!267515 m!398737))

(declare-fun m!398739 () Bool)

(assert (=> b!267513 m!398739))

(declare-fun m!398741 () Bool)

(assert (=> b!267512 m!398741))

(declare-fun m!398743 () Bool)

(assert (=> b!267514 m!398743))

(push 1)

(assert (not start!58242))

(assert (not b!267512))

(assert (not b!267513))

(assert (not b!267514))

(assert (not b!267515))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

