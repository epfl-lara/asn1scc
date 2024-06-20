; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62148 () Bool)

(assert start!62148)

(declare-fun res!231482 () Bool)

(declare-fun e!198600 () Bool)

(assert (=> start!62148 (=> (not res!231482) (not e!198600))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16069 0))(
  ( (array!16070 (arr!7951 (Array (_ BitVec 32) (_ BitVec 8))) (size!6955 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16069)

(declare-fun a2!699 () array!16069)

(declare-fun to!789 () (_ BitVec 64))

(assert (=> start!62148 (= res!231482 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6955 a1!699) (size!6955 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6955 a1!699))))))))

(assert (=> start!62148 e!198600))

(assert (=> start!62148 true))

(declare-fun array_inv!6679 (array!16069) Bool)

(assert (=> start!62148 (array_inv!6679 a1!699)))

(assert (=> start!62148 (array_inv!6679 a2!699)))

(declare-fun b!278778 () Bool)

(declare-fun res!231481 () Bool)

(assert (=> b!278778 (=> (not res!231481) (not e!198600))))

(declare-fun arrayBitRangesEq!0 (array!16069 array!16069 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278778 (= res!231481 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!278779 () Bool)

(assert (=> b!278779 (= e!198600 (and (bvslt from!822 to!789) (bvslt (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000)))))

(assert (= (and start!62148 res!231482) b!278778))

(assert (= (and b!278778 res!231481) b!278779))

(declare-fun m!411907 () Bool)

(assert (=> start!62148 m!411907))

(declare-fun m!411909 () Bool)

(assert (=> start!62148 m!411909))

(declare-fun m!411911 () Bool)

(assert (=> b!278778 m!411911))

(push 1)

(assert (not b!278778))

(assert (not start!62148))

(check-sat)

(pop 1)

(push 1)

(check-sat)

