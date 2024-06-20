; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62136 () Bool)

(assert start!62136)

(declare-fun res!231446 () Bool)

(declare-fun e!198545 () Bool)

(assert (=> start!62136 (=> (not res!231446) (not e!198545))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16057 0))(
  ( (array!16058 (arr!7945 (Array (_ BitVec 32) (_ BitVec 8))) (size!6949 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16057)

(declare-fun a2!699 () array!16057)

(declare-fun to!789 () (_ BitVec 64))

(assert (=> start!62136 (= res!231446 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6949 a1!699) (size!6949 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6949 a1!699))))))))

(assert (=> start!62136 e!198545))

(assert (=> start!62136 true))

(declare-fun array_inv!6673 (array!16057) Bool)

(assert (=> start!62136 (array_inv!6673 a1!699)))

(assert (=> start!62136 (array_inv!6673 a2!699)))

(declare-fun b!278742 () Bool)

(declare-fun res!231445 () Bool)

(assert (=> b!278742 (=> (not res!231445) (not e!198545))))

(declare-fun arrayBitRangesEq!0 (array!16057 array!16057 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278742 (= res!231445 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!278743 () Bool)

(assert (=> b!278743 (= e!198545 (and (bvslt from!822 to!789) (bvslt (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000)))))

(assert (= (and start!62136 res!231446) b!278742))

(assert (= (and b!278742 res!231445) b!278743))

(declare-fun m!411871 () Bool)

(assert (=> start!62136 m!411871))

(declare-fun m!411873 () Bool)

(assert (=> start!62136 m!411873))

(declare-fun m!411875 () Bool)

(assert (=> b!278742 m!411875))

(push 1)

(assert (not b!278742))

(assert (not start!62136))

(check-sat)

(pop 1)

(push 1)

(check-sat)

