; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58236 () Bool)

(assert start!58236)

(declare-fun b!267478 () Bool)

(declare-fun e!187358 () Bool)

(declare-datatypes ((array!14894 0))(
  ( (array!14895 (arr!7480 (Array (_ BitVec 32) (_ BitVec 8))) (size!6493 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11800 0))(
  ( (BitStream!11801 (buf!6961 array!14894) (currentByte!12867 (_ BitVec 32)) (currentBit!12862 (_ BitVec 32))) )
))
(declare-fun w2!587 () BitStream!11800)

(declare-fun array_inv!6217 (array!14894) Bool)

(assert (=> b!267478 (= e!187358 (array_inv!6217 (buf!6961 w2!587)))))

(declare-fun b!267479 () Bool)

(declare-fun e!187359 () Bool)

(declare-fun w3!25 () BitStream!11800)

(assert (=> b!267479 (= e!187359 (array_inv!6217 (buf!6961 w3!25)))))

(declare-fun res!223297 () Bool)

(declare-fun e!187353 () Bool)

(assert (=> start!58236 (=> (not res!223297) (not e!187353))))

(declare-fun w1!591 () BitStream!11800)

(declare-fun isPrefixOf!0 (BitStream!11800 BitStream!11800) Bool)

(assert (=> start!58236 (= res!223297 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58236 e!187353))

(declare-fun e!187357 () Bool)

(declare-fun inv!12 (BitStream!11800) Bool)

(assert (=> start!58236 (and (inv!12 w1!591) e!187357)))

(assert (=> start!58236 (and (inv!12 w2!587) e!187358)))

(assert (=> start!58236 (and (inv!12 w3!25) e!187359)))

(declare-fun b!267476 () Bool)

(assert (=> b!267476 (= e!187353 false)))

(declare-fun lt!407996 () Bool)

(assert (=> b!267476 (= lt!407996 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!267477 () Bool)

(assert (=> b!267477 (= e!187357 (array_inv!6217 (buf!6961 w1!591)))))

(assert (= (and start!58236 res!223297) b!267476))

(assert (= start!58236 b!267477))

(assert (= start!58236 b!267478))

(assert (= start!58236 b!267479))

(declare-fun m!398681 () Bool)

(assert (=> b!267477 m!398681))

(declare-fun m!398683 () Bool)

(assert (=> b!267479 m!398683))

(declare-fun m!398685 () Bool)

(assert (=> start!58236 m!398685))

(declare-fun m!398687 () Bool)

(assert (=> start!58236 m!398687))

(declare-fun m!398689 () Bool)

(assert (=> start!58236 m!398689))

(declare-fun m!398691 () Bool)

(assert (=> start!58236 m!398691))

(declare-fun m!398693 () Bool)

(assert (=> b!267476 m!398693))

(declare-fun m!398695 () Bool)

(assert (=> b!267478 m!398695))

(push 1)

(assert (not b!267479))

(assert (not b!267476))

(assert (not start!58236))

(assert (not b!267477))

(assert (not b!267478))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

