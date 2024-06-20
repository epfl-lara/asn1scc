; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62140 () Bool)

(assert start!62140)

(declare-fun res!231457 () Bool)

(declare-fun e!198564 () Bool)

(assert (=> start!62140 (=> (not res!231457) (not e!198564))))

(declare-datatypes ((array!16061 0))(
  ( (array!16062 (arr!7947 (Array (_ BitVec 32) (_ BitVec 8))) (size!6951 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16061)

(declare-fun a2!699 () array!16061)

(declare-fun to!789 () (_ BitVec 64))

(declare-fun from!822 () (_ BitVec 64))

(assert (=> start!62140 (= res!231457 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6951 a1!699) (size!6951 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6951 a1!699))))))))

(assert (=> start!62140 e!198564))

(assert (=> start!62140 true))

(declare-fun array_inv!6675 (array!16061) Bool)

(assert (=> start!62140 (array_inv!6675 a1!699)))

(assert (=> start!62140 (array_inv!6675 a2!699)))

(declare-fun b!278754 () Bool)

(declare-fun res!231458 () Bool)

(assert (=> b!278754 (=> (not res!231458) (not e!198564))))

(declare-fun arrayBitRangesEq!0 (array!16061 array!16061 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278754 (= res!231458 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!278755 () Bool)

(assert (=> b!278755 (= e!198564 (and (bvslt from!822 to!789) (bvslt (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000)))))

(assert (= (and start!62140 res!231457) b!278754))

(assert (= (and b!278754 res!231458) b!278755))

(declare-fun m!411883 () Bool)

(assert (=> start!62140 m!411883))

(declare-fun m!411885 () Bool)

(assert (=> start!62140 m!411885))

(declare-fun m!411887 () Bool)

(assert (=> b!278754 m!411887))

(push 1)

(assert (not start!62140))

(assert (not b!278754))

(check-sat)

(pop 1)

(push 1)

(check-sat)

