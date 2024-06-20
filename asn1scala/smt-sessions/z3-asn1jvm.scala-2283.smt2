; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57890 () Bool)

(assert start!57890)

(declare-fun res!221959 () Bool)

(declare-fun e!185635 () Bool)

(assert (=> start!57890 (=> (not res!221959) (not e!185635))))

(declare-datatypes ((array!14803 0))(
  ( (array!14804 (arr!7442 (Array (_ BitVec 32) (_ BitVec 8))) (size!6455 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11724 0))(
  ( (BitStream!11725 (buf!6923 array!14803) (currentByte!12808 (_ BitVec 32)) (currentBit!12803 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11724)

(declare-fun w2!580 () BitStream!11724)

(declare-fun isPrefixOf!0 (BitStream!11724 BitStream!11724) Bool)

(assert (=> start!57890 (= res!221959 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57890 e!185635))

(declare-fun e!185636 () Bool)

(declare-fun inv!12 (BitStream!11724) Bool)

(assert (=> start!57890 (and (inv!12 w1!584) e!185636)))

(declare-fun e!185637 () Bool)

(assert (=> start!57890 (and (inv!12 w2!580) e!185637)))

(declare-fun b!265635 () Bool)

(assert (=> b!265635 (= e!185635 (not (inv!12 w2!580)))))

(declare-fun b!265636 () Bool)

(declare-fun array_inv!6179 (array!14803) Bool)

(assert (=> b!265636 (= e!185636 (array_inv!6179 (buf!6923 w1!584)))))

(declare-fun b!265637 () Bool)

(assert (=> b!265637 (= e!185637 (array_inv!6179 (buf!6923 w2!580)))))

(assert (= (and start!57890 res!221959) b!265635))

(assert (= start!57890 b!265636))

(assert (= start!57890 b!265637))

(declare-fun m!396399 () Bool)

(assert (=> start!57890 m!396399))

(declare-fun m!396401 () Bool)

(assert (=> start!57890 m!396401))

(declare-fun m!396403 () Bool)

(assert (=> start!57890 m!396403))

(assert (=> b!265635 m!396403))

(declare-fun m!396405 () Bool)

(assert (=> b!265636 m!396405))

(declare-fun m!396407 () Bool)

(assert (=> b!265637 m!396407))

(check-sat (not start!57890) (not b!265636) (not b!265637) (not b!265635))
