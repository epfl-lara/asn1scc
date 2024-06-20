; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57888 () Bool)

(assert start!57888)

(declare-fun res!221956 () Bool)

(declare-fun e!185620 () Bool)

(assert (=> start!57888 (=> (not res!221956) (not e!185620))))

(declare-datatypes ((array!14801 0))(
  ( (array!14802 (arr!7441 (Array (_ BitVec 32) (_ BitVec 8))) (size!6454 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11722 0))(
  ( (BitStream!11723 (buf!6922 array!14801) (currentByte!12807 (_ BitVec 32)) (currentBit!12802 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11722)

(declare-fun w2!580 () BitStream!11722)

(declare-fun isPrefixOf!0 (BitStream!11722 BitStream!11722) Bool)

(assert (=> start!57888 (= res!221956 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57888 e!185620))

(declare-fun e!185622 () Bool)

(declare-fun inv!12 (BitStream!11722) Bool)

(assert (=> start!57888 (and (inv!12 w1!584) e!185622)))

(declare-fun e!185621 () Bool)

(assert (=> start!57888 (and (inv!12 w2!580) e!185621)))

(declare-fun b!265626 () Bool)

(assert (=> b!265626 (= e!185620 (not (inv!12 w2!580)))))

(declare-fun b!265627 () Bool)

(declare-fun array_inv!6178 (array!14801) Bool)

(assert (=> b!265627 (= e!185622 (array_inv!6178 (buf!6922 w1!584)))))

(declare-fun b!265628 () Bool)

(assert (=> b!265628 (= e!185621 (array_inv!6178 (buf!6922 w2!580)))))

(assert (= (and start!57888 res!221956) b!265626))

(assert (= start!57888 b!265627))

(assert (= start!57888 b!265628))

(declare-fun m!396389 () Bool)

(assert (=> start!57888 m!396389))

(declare-fun m!396391 () Bool)

(assert (=> start!57888 m!396391))

(declare-fun m!396393 () Bool)

(assert (=> start!57888 m!396393))

(assert (=> b!265626 m!396393))

(declare-fun m!396395 () Bool)

(assert (=> b!265627 m!396395))

(declare-fun m!396397 () Bool)

(assert (=> b!265628 m!396397))

(push 1)

(assert (not start!57888))

(assert (not b!265628))

(assert (not b!265626))

(assert (not b!265627))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

