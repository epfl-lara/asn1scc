; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61834 () Bool)

(assert start!61834)

(declare-fun res!230182 () Bool)

(declare-fun e!197120 () Bool)

(assert (=> start!61834 (=> (not res!230182) (not e!197120))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!15895 0))(
  ( (array!15896 (arr!7873 (Array (_ BitVec 32) (_ BitVec 8))) (size!6877 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!15895)

(declare-fun a2!699 () array!15895)

(declare-fun to!789 () (_ BitVec 64))

(assert (=> start!61834 (= res!230182 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6877 a1!699) (size!6877 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6877 a1!699))))))))

(assert (=> start!61834 e!197120))

(assert (=> start!61834 true))

(declare-fun array_inv!6601 (array!15895) Bool)

(assert (=> start!61834 (array_inv!6601 a1!699)))

(assert (=> start!61834 (array_inv!6601 a2!699)))

(declare-fun b!277154 () Bool)

(declare-fun res!230181 () Bool)

(assert (=> b!277154 (=> (not res!230181) (not e!197120))))

(declare-fun arrayBitRangesEq!0 (array!15895 array!15895 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!277154 (= res!230181 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!277155 () Bool)

(assert (=> b!277155 (= e!197120 (and (bvslt from!822 to!789) (bvsgt to!789 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (= (and start!61834 res!230182) b!277154))

(assert (= (and b!277154 res!230181) b!277155))

(declare-fun m!410369 () Bool)

(assert (=> start!61834 m!410369))

(declare-fun m!410371 () Bool)

(assert (=> start!61834 m!410371))

(declare-fun m!410373 () Bool)

(assert (=> b!277154 m!410373))

(push 1)

(assert (not start!61834))

(assert (not b!277154))

(check-sat)

(pop 1)

(push 1)

(check-sat)

