; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62122 () Bool)

(assert start!62122)

(declare-fun res!231421 () Bool)

(declare-fun e!198492 () Bool)

(assert (=> start!62122 (=> (not res!231421) (not e!198492))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16043 0))(
  ( (array!16044 (arr!7938 (Array (_ BitVec 32) (_ BitVec 8))) (size!6942 (_ BitVec 32))) )
))
(declare-fun a2!699 () array!16043)

(declare-fun to!789 () (_ BitVec 64))

(declare-fun a1!699 () array!16043)

(assert (=> start!62122 (= res!231421 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6942 a1!699) (size!6942 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6942 a1!699))))))))

(assert (=> start!62122 e!198492))

(assert (=> start!62122 true))

(declare-fun array_inv!6666 (array!16043) Bool)

(assert (=> start!62122 (array_inv!6666 a1!699)))

(assert (=> start!62122 (array_inv!6666 a2!699)))

(declare-fun b!278718 () Bool)

(declare-fun res!231422 () Bool)

(assert (=> b!278718 (=> (not res!231422) (not e!198492))))

(declare-fun arrayBitRangesEq!0 (array!16043 array!16043 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278718 (= res!231422 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!278719 () Bool)

(assert (=> b!278719 (= e!198492 (and (bvsge from!822 to!789) (bvsgt to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6942 a2!699))))))))

(assert (= (and start!62122 res!231421) b!278718))

(assert (= (and b!278718 res!231422) b!278719))

(declare-fun m!411835 () Bool)

(assert (=> start!62122 m!411835))

(declare-fun m!411837 () Bool)

(assert (=> start!62122 m!411837))

(declare-fun m!411839 () Bool)

(assert (=> b!278718 m!411839))

(push 1)

(assert (not start!62122))

(assert (not b!278718))

(check-sat)

(pop 1)

(push 1)

(check-sat)

