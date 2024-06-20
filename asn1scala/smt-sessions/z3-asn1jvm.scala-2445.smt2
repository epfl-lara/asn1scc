; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62120 () Bool)

(assert start!62120)

(declare-fun res!231415 () Bool)

(declare-fun e!198481 () Bool)

(assert (=> start!62120 (=> (not res!231415) (not e!198481))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16041 0))(
  ( (array!16042 (arr!7937 (Array (_ BitVec 32) (_ BitVec 8))) (size!6941 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16041)

(declare-fun a2!699 () array!16041)

(declare-fun to!789 () (_ BitVec 64))

(assert (=> start!62120 (= res!231415 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6941 a1!699) (size!6941 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6941 a1!699))))))))

(assert (=> start!62120 e!198481))

(assert (=> start!62120 true))

(declare-fun array_inv!6665 (array!16041) Bool)

(assert (=> start!62120 (array_inv!6665 a1!699)))

(assert (=> start!62120 (array_inv!6665 a2!699)))

(declare-fun b!278712 () Bool)

(declare-fun res!231416 () Bool)

(assert (=> b!278712 (=> (not res!231416) (not e!198481))))

(declare-fun arrayBitRangesEq!0 (array!16041 array!16041 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278712 (= res!231416 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!278713 () Bool)

(assert (=> b!278713 (= e!198481 (and (bvsge from!822 to!789) (bvsgt to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6941 a2!699))))))))

(assert (= (and start!62120 res!231415) b!278712))

(assert (= (and b!278712 res!231416) b!278713))

(declare-fun m!411829 () Bool)

(assert (=> start!62120 m!411829))

(declare-fun m!411831 () Bool)

(assert (=> start!62120 m!411831))

(declare-fun m!411833 () Bool)

(assert (=> b!278712 m!411833))

(check-sat (not start!62120) (not b!278712))
(check-sat)
