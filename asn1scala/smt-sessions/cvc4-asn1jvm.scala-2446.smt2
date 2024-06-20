; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62128 () Bool)

(assert start!62128)

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16049 0))(
  ( (array!16050 (arr!7941 (Array (_ BitVec 32) (_ BitVec 8))) (size!6945 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16049)

(declare-fun a2!699 () array!16049)

(declare-fun to!789 () (_ BitVec 64))

(assert (=> start!62128 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6945 a1!699) (size!6945 a2!699)) (not (= ((_ sign_extend 32) (size!6945 a1!699)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6945 a1!699))) ((_ sign_extend 32) (size!6945 a1!699))))))))

(assert (=> start!62128 true))

(declare-fun array_inv!6669 (array!16049) Bool)

(assert (=> start!62128 (array_inv!6669 a1!699)))

(assert (=> start!62128 (array_inv!6669 a2!699)))

(declare-fun bs!24208 () Bool)

(assert (= bs!24208 start!62128))

(declare-fun m!411849 () Bool)

(assert (=> bs!24208 m!411849))

(declare-fun m!411851 () Bool)

(assert (=> bs!24208 m!411851))

(push 1)

(assert (not start!62128))

(check-sat)

(pop 1)

(push 1)

(check-sat)

