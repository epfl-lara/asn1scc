; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62124 () Bool)

(assert start!62124)

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16045 0))(
  ( (array!16046 (arr!7939 (Array (_ BitVec 32) (_ BitVec 8))) (size!6943 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16045)

(declare-fun a2!699 () array!16045)

(declare-fun to!789 () (_ BitVec 64))

(assert (=> start!62124 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6943 a1!699) (size!6943 a2!699)) (not (= ((_ sign_extend 32) (size!6943 a1!699)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6943 a1!699))) ((_ sign_extend 32) (size!6943 a1!699))))))))

(assert (=> start!62124 true))

(declare-fun array_inv!6667 (array!16045) Bool)

(assert (=> start!62124 (array_inv!6667 a1!699)))

(assert (=> start!62124 (array_inv!6667 a2!699)))

(declare-fun bs!24206 () Bool)

(assert (= bs!24206 start!62124))

(declare-fun m!411841 () Bool)

(assert (=> bs!24206 m!411841))

(declare-fun m!411843 () Bool)

(assert (=> bs!24206 m!411843))

(push 1)

(assert (not start!62124))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

