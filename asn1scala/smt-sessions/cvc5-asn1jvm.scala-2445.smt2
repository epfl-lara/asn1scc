; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62118 () Bool)

(assert start!62118)

(declare-fun res!231409 () Bool)

(declare-fun e!198474 () Bool)

(assert (=> start!62118 (=> (not res!231409) (not e!198474))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16039 0))(
  ( (array!16040 (arr!7936 (Array (_ BitVec 32) (_ BitVec 8))) (size!6940 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16039)

(declare-fun a2!699 () array!16039)

(declare-fun to!789 () (_ BitVec 64))

(assert (=> start!62118 (= res!231409 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6940 a1!699) (size!6940 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6940 a1!699))))))))

(assert (=> start!62118 e!198474))

(assert (=> start!62118 true))

(declare-fun array_inv!6664 (array!16039) Bool)

(assert (=> start!62118 (array_inv!6664 a1!699)))

(assert (=> start!62118 (array_inv!6664 a2!699)))

(declare-fun b!278706 () Bool)

(declare-fun res!231410 () Bool)

(assert (=> b!278706 (=> (not res!231410) (not e!198474))))

(declare-fun arrayBitRangesEq!0 (array!16039 array!16039 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278706 (= res!231410 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!278707 () Bool)

(assert (=> b!278707 (= e!198474 (and (bvsge from!822 to!789) (bvsgt to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6940 a2!699))))))))

(assert (= (and start!62118 res!231409) b!278706))

(assert (= (and b!278706 res!231410) b!278707))

(declare-fun m!411823 () Bool)

(assert (=> start!62118 m!411823))

(declare-fun m!411825 () Bool)

(assert (=> start!62118 m!411825))

(declare-fun m!411827 () Bool)

(assert (=> b!278706 m!411827))

(push 1)

(assert (not b!278706))

(assert (not start!62118))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

