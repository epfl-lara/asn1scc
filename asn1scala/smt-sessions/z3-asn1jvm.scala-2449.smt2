; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62144 () Bool)

(assert start!62144)

(declare-fun res!231469 () Bool)

(declare-fun e!198580 () Bool)

(assert (=> start!62144 (=> (not res!231469) (not e!198580))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16065 0))(
  ( (array!16066 (arr!7949 (Array (_ BitVec 32) (_ BitVec 8))) (size!6953 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16065)

(declare-fun a2!699 () array!16065)

(declare-fun to!789 () (_ BitVec 64))

(assert (=> start!62144 (= res!231469 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6953 a1!699) (size!6953 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6953 a1!699))))))))

(assert (=> start!62144 e!198580))

(assert (=> start!62144 true))

(declare-fun array_inv!6677 (array!16065) Bool)

(assert (=> start!62144 (array_inv!6677 a1!699)))

(assert (=> start!62144 (array_inv!6677 a2!699)))

(declare-fun b!278766 () Bool)

(declare-fun res!231470 () Bool)

(assert (=> b!278766 (=> (not res!231470) (not e!198580))))

(declare-fun arrayBitRangesEq!0 (array!16065 array!16065 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278766 (= res!231470 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!278767 () Bool)

(assert (=> b!278767 (= e!198580 (and (bvslt from!822 to!789) (bvsge (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000)))))

(assert (= (and start!62144 res!231469) b!278766))

(assert (= (and b!278766 res!231470) b!278767))

(declare-fun m!411895 () Bool)

(assert (=> start!62144 m!411895))

(declare-fun m!411897 () Bool)

(assert (=> start!62144 m!411897))

(declare-fun m!411899 () Bool)

(assert (=> b!278766 m!411899))

(check-sat (not start!62144) (not b!278766))
(check-sat)
