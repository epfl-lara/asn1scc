; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62138 () Bool)

(assert start!62138)

(declare-fun res!231452 () Bool)

(declare-fun e!198554 () Bool)

(assert (=> start!62138 (=> (not res!231452) (not e!198554))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16059 0))(
  ( (array!16060 (arr!7946 (Array (_ BitVec 32) (_ BitVec 8))) (size!6950 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16059)

(declare-fun to!789 () (_ BitVec 64))

(declare-fun a2!699 () array!16059)

(assert (=> start!62138 (= res!231452 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6950 a1!699) (size!6950 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6950 a1!699))))))))

(assert (=> start!62138 e!198554))

(assert (=> start!62138 true))

(declare-fun array_inv!6674 (array!16059) Bool)

(assert (=> start!62138 (array_inv!6674 a1!699)))

(assert (=> start!62138 (array_inv!6674 a2!699)))

(declare-fun b!278748 () Bool)

(declare-fun res!231451 () Bool)

(assert (=> b!278748 (=> (not res!231451) (not e!198554))))

(declare-fun arrayBitRangesEq!0 (array!16059 array!16059 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278748 (= res!231451 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!278749 () Bool)

(assert (=> b!278749 (= e!198554 (and (bvslt from!822 to!789) (bvslt (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000)))))

(assert (= (and start!62138 res!231452) b!278748))

(assert (= (and b!278748 res!231451) b!278749))

(declare-fun m!411877 () Bool)

(assert (=> start!62138 m!411877))

(declare-fun m!411879 () Bool)

(assert (=> start!62138 m!411879))

(declare-fun m!411881 () Bool)

(assert (=> b!278748 m!411881))

(check-sat (not start!62138) (not b!278748))
(check-sat)
