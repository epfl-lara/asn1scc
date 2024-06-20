; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58228 () Bool)

(assert start!58228)

(declare-fun b!267431 () Bool)

(declare-fun e!187275 () Bool)

(declare-datatypes ((array!14886 0))(
  ( (array!14887 (arr!7476 (Array (_ BitVec 32) (_ BitVec 8))) (size!6489 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11792 0))(
  ( (BitStream!11793 (buf!6957 array!14886) (currentByte!12863 (_ BitVec 32)) (currentBit!12858 (_ BitVec 32))) )
))
(declare-fun w3!25 () BitStream!11792)

(declare-fun array_inv!6213 (array!14886) Bool)

(assert (=> b!267431 (= e!187275 (array_inv!6213 (buf!6957 w3!25)))))

(declare-fun b!267430 () Bool)

(declare-fun e!187273 () Bool)

(declare-fun w2!587 () BitStream!11792)

(assert (=> b!267430 (= e!187273 (array_inv!6213 (buf!6957 w2!587)))))

(declare-fun b!267429 () Bool)

(declare-fun e!187272 () Bool)

(declare-fun w1!591 () BitStream!11792)

(assert (=> b!267429 (= e!187272 (array_inv!6213 (buf!6957 w1!591)))))

(declare-fun res!223285 () Bool)

(declare-fun e!187269 () Bool)

(assert (=> start!58228 (=> (not res!223285) (not e!187269))))

(declare-fun isPrefixOf!0 (BitStream!11792 BitStream!11792) Bool)

(assert (=> start!58228 (= res!223285 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58228 e!187269))

(declare-fun inv!12 (BitStream!11792) Bool)

(assert (=> start!58228 (and (inv!12 w1!591) e!187272)))

(assert (=> start!58228 (and (inv!12 w2!587) e!187273)))

(assert (=> start!58228 (and (inv!12 w3!25) e!187275)))

(declare-fun b!267428 () Bool)

(assert (=> b!267428 (= e!187269 false)))

(declare-fun lt!407984 () Bool)

(assert (=> b!267428 (= lt!407984 (isPrefixOf!0 w2!587 w3!25))))

(assert (= (and start!58228 res!223285) b!267428))

(assert (= start!58228 b!267429))

(assert (= start!58228 b!267430))

(assert (= start!58228 b!267431))

(declare-fun m!398617 () Bool)

(assert (=> start!58228 m!398617))

(declare-fun m!398619 () Bool)

(assert (=> start!58228 m!398619))

(declare-fun m!398621 () Bool)

(assert (=> start!58228 m!398621))

(declare-fun m!398623 () Bool)

(assert (=> start!58228 m!398623))

(declare-fun m!398625 () Bool)

(assert (=> b!267431 m!398625))

(declare-fun m!398627 () Bool)

(assert (=> b!267428 m!398627))

(declare-fun m!398629 () Bool)

(assert (=> b!267430 m!398629))

(declare-fun m!398631 () Bool)

(assert (=> b!267429 m!398631))

(push 1)

(assert (not b!267428))

(assert (not b!267431))

(assert (not b!267430))

(assert (not b!267429))

(assert (not start!58228))

(check-sat)

