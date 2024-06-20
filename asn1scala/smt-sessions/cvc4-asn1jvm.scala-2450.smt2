; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62152 () Bool)

(assert start!62152)

(declare-fun res!231493 () Bool)

(declare-fun e!198618 () Bool)

(assert (=> start!62152 (=> (not res!231493) (not e!198618))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16073 0))(
  ( (array!16074 (arr!7953 (Array (_ BitVec 32) (_ BitVec 8))) (size!6957 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16073)

(declare-fun to!789 () (_ BitVec 64))

(declare-fun a2!699 () array!16073)

(assert (=> start!62152 (= res!231493 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6957 a1!699) (size!6957 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6957 a1!699))))))))

(assert (=> start!62152 e!198618))

(assert (=> start!62152 true))

(declare-fun array_inv!6681 (array!16073) Bool)

(assert (=> start!62152 (array_inv!6681 a1!699)))

(assert (=> start!62152 (array_inv!6681 a2!699)))

(declare-fun b!278790 () Bool)

(declare-fun res!231494 () Bool)

(assert (=> b!278790 (=> (not res!231494) (not e!198618))))

(declare-fun arrayBitRangesEq!0 (array!16073 array!16073 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278790 (= res!231494 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!278791 () Bool)

(assert (=> b!278791 (= e!198618 (and (bvslt from!822 to!789) (bvslt (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000)))))

(assert (= (and start!62152 res!231493) b!278790))

(assert (= (and b!278790 res!231494) b!278791))

(declare-fun m!411919 () Bool)

(assert (=> start!62152 m!411919))

(declare-fun m!411921 () Bool)

(assert (=> start!62152 m!411921))

(declare-fun m!411923 () Bool)

(assert (=> b!278790 m!411923))

(push 1)

(assert (not start!62152))

(assert (not b!278790))

(check-sat)

(pop 1)

(push 1)

(check-sat)

