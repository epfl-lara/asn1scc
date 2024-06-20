; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70366 () Bool)

(assert start!70366)

(declare-fun to!864 () (_ BitVec 64))

(declare-datatypes ((array!19831 0))(
  ( (array!19832 (arr!9724 (Array (_ BitVec 32) (_ BitVec 8))) (size!8635 (_ BitVec 32))) )
))
(declare-fun a1!898 () array!19831)

(declare-fun from!897 () (_ BitVec 64))

(declare-fun a2!898 () array!19831)

(assert (=> start!70366 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!897) (bvsle from!897 to!864) (= (size!8635 a1!898) (size!8635 a2!898)) (not (= ((_ sign_extend 32) (size!8635 a1!898)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8635 a1!898))) ((_ sign_extend 32) (size!8635 a1!898))))))))

(assert (=> start!70366 true))

(declare-fun array_inv!8187 (array!19831) Bool)

(assert (=> start!70366 (array_inv!8187 a1!898)))

(assert (=> start!70366 (array_inv!8187 a2!898)))

(declare-fun bs!27296 () Bool)

(assert (= bs!27296 start!70366))

(declare-fun m!457007 () Bool)

(assert (=> bs!27296 m!457007))

(declare-fun m!457009 () Bool)

(assert (=> bs!27296 m!457009))

(push 1)

(assert (not start!70366))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

