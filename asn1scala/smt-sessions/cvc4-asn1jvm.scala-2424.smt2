; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61838 () Bool)

(assert start!61838)

(declare-fun res!230194 () Bool)

(declare-fun e!197136 () Bool)

(assert (=> start!61838 (=> (not res!230194) (not e!197136))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!15899 0))(
  ( (array!15900 (arr!7875 (Array (_ BitVec 32) (_ BitVec 8))) (size!6879 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!15899)

(declare-fun a2!699 () array!15899)

(declare-fun to!789 () (_ BitVec 64))

(assert (=> start!61838 (= res!230194 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6879 a1!699) (size!6879 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6879 a1!699))))))))

(assert (=> start!61838 e!197136))

(assert (=> start!61838 true))

(declare-fun array_inv!6603 (array!15899) Bool)

(assert (=> start!61838 (array_inv!6603 a1!699)))

(assert (=> start!61838 (array_inv!6603 a2!699)))

(declare-fun b!277166 () Bool)

(declare-fun res!230193 () Bool)

(assert (=> b!277166 (=> (not res!230193) (not e!197136))))

(declare-fun arrayBitRangesEq!0 (array!15899 array!15899 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!277166 (= res!230193 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!277167 () Bool)

(assert (=> b!277167 (= e!197136 (and (bvslt from!822 to!789) (bvsgt to!789 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (= (and start!61838 res!230194) b!277166))

(assert (= (and b!277166 res!230193) b!277167))

(declare-fun m!410381 () Bool)

(assert (=> start!61838 m!410381))

(declare-fun m!410383 () Bool)

(assert (=> start!61838 m!410383))

(declare-fun m!410385 () Bool)

(assert (=> b!277166 m!410385))

(push 1)

(assert (not b!277166))

(assert (not start!61838))

(check-sat)

(pop 1)

(push 1)

(check-sat)

