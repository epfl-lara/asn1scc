; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62130 () Bool)

(assert start!62130)

(declare-fun res!231428 () Bool)

(declare-fun e!198518 () Bool)

(assert (=> start!62130 (=> (not res!231428) (not e!198518))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16051 0))(
  ( (array!16052 (arr!7942 (Array (_ BitVec 32) (_ BitVec 8))) (size!6946 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16051)

(declare-fun a2!699 () array!16051)

(declare-fun to!789 () (_ BitVec 64))

(assert (=> start!62130 (= res!231428 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6946 a1!699) (size!6946 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6946 a1!699))))))))

(assert (=> start!62130 e!198518))

(assert (=> start!62130 true))

(declare-fun array_inv!6670 (array!16051) Bool)

(assert (=> start!62130 (array_inv!6670 a1!699)))

(assert (=> start!62130 (array_inv!6670 a2!699)))

(declare-fun b!278724 () Bool)

(declare-fun res!231427 () Bool)

(assert (=> b!278724 (=> (not res!231427) (not e!198518))))

(declare-fun arrayBitRangesEq!0 (array!16051 array!16051 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278724 (= res!231427 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!278725 () Bool)

(assert (=> b!278725 (= e!198518 (and (bvslt from!822 to!789) (bvsge (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000)))))

(assert (= (and start!62130 res!231428) b!278724))

(assert (= (and b!278724 res!231427) b!278725))

(declare-fun m!411853 () Bool)

(assert (=> start!62130 m!411853))

(declare-fun m!411855 () Bool)

(assert (=> start!62130 m!411855))

(declare-fun m!411857 () Bool)

(assert (=> b!278724 m!411857))

(push 1)

(assert (not b!278724))

(assert (not start!62130))

(check-sat)

(pop 1)

(push 1)

(check-sat)

