; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62132 () Bool)

(assert start!62132)

(declare-fun res!231433 () Bool)

(declare-fun e!198527 () Bool)

(assert (=> start!62132 (=> (not res!231433) (not e!198527))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16053 0))(
  ( (array!16054 (arr!7943 (Array (_ BitVec 32) (_ BitVec 8))) (size!6947 (_ BitVec 32))) )
))
(declare-fun a2!699 () array!16053)

(declare-fun to!789 () (_ BitVec 64))

(declare-fun a1!699 () array!16053)

(assert (=> start!62132 (= res!231433 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6947 a1!699) (size!6947 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6947 a1!699))))))))

(assert (=> start!62132 e!198527))

(assert (=> start!62132 true))

(declare-fun array_inv!6671 (array!16053) Bool)

(assert (=> start!62132 (array_inv!6671 a1!699)))

(assert (=> start!62132 (array_inv!6671 a2!699)))

(declare-fun b!278730 () Bool)

(declare-fun res!231434 () Bool)

(assert (=> b!278730 (=> (not res!231434) (not e!198527))))

(declare-fun arrayBitRangesEq!0 (array!16053 array!16053 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278730 (= res!231434 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!278731 () Bool)

(assert (=> b!278731 (= e!198527 (and (bvslt from!822 to!789) (bvsge (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000)))))

(assert (= (and start!62132 res!231433) b!278730))

(assert (= (and b!278730 res!231434) b!278731))

(declare-fun m!411859 () Bool)

(assert (=> start!62132 m!411859))

(declare-fun m!411861 () Bool)

(assert (=> start!62132 m!411861))

(declare-fun m!411863 () Bool)

(assert (=> b!278730 m!411863))

(check-sat (not start!62132) (not b!278730))
(check-sat)
