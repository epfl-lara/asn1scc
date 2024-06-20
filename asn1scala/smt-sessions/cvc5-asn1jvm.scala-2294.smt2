; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58224 () Bool)

(assert start!58224)

(declare-fun b!267406 () Bool)

(declare-fun e!187230 () Bool)

(declare-datatypes ((array!14882 0))(
  ( (array!14883 (arr!7474 (Array (_ BitVec 32) (_ BitVec 8))) (size!6487 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11788 0))(
  ( (BitStream!11789 (buf!6955 array!14882) (currentByte!12861 (_ BitVec 32)) (currentBit!12856 (_ BitVec 32))) )
))
(declare-fun w2!587 () BitStream!11788)

(declare-fun array_inv!6211 (array!14882) Bool)

(assert (=> b!267406 (= e!187230 (array_inv!6211 (buf!6955 w2!587)))))

(declare-fun res!223279 () Bool)

(declare-fun e!187228 () Bool)

(assert (=> start!58224 (=> (not res!223279) (not e!187228))))

(declare-fun w1!591 () BitStream!11788)

(declare-fun isPrefixOf!0 (BitStream!11788 BitStream!11788) Bool)

(assert (=> start!58224 (= res!223279 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58224 e!187228))

(declare-fun e!187233 () Bool)

(declare-fun inv!12 (BitStream!11788) Bool)

(assert (=> start!58224 (and (inv!12 w1!591) e!187233)))

(assert (=> start!58224 (and (inv!12 w2!587) e!187230)))

(declare-fun w3!25 () BitStream!11788)

(declare-fun e!187227 () Bool)

(assert (=> start!58224 (and (inv!12 w3!25) e!187227)))

(declare-fun b!267404 () Bool)

(assert (=> b!267404 (= e!187228 false)))

(declare-fun lt!407978 () Bool)

(assert (=> b!267404 (= lt!407978 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!267407 () Bool)

(assert (=> b!267407 (= e!187227 (array_inv!6211 (buf!6955 w3!25)))))

(declare-fun b!267405 () Bool)

(assert (=> b!267405 (= e!187233 (array_inv!6211 (buf!6955 w1!591)))))

(assert (= (and start!58224 res!223279) b!267404))

(assert (= start!58224 b!267405))

(assert (= start!58224 b!267406))

(assert (= start!58224 b!267407))

(declare-fun m!398585 () Bool)

(assert (=> b!267407 m!398585))

(declare-fun m!398587 () Bool)

(assert (=> b!267404 m!398587))

(declare-fun m!398589 () Bool)

(assert (=> b!267405 m!398589))

(declare-fun m!398591 () Bool)

(assert (=> b!267406 m!398591))

(declare-fun m!398593 () Bool)

(assert (=> start!58224 m!398593))

(declare-fun m!398595 () Bool)

(assert (=> start!58224 m!398595))

(declare-fun m!398597 () Bool)

(assert (=> start!58224 m!398597))

(declare-fun m!398599 () Bool)

(assert (=> start!58224 m!398599))

(push 1)

(assert (not start!58224))

(assert (not b!267407))

(assert (not b!267406))

(assert (not b!267404))

(assert (not b!267405))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

