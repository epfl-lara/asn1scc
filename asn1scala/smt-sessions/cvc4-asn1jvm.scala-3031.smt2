; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70526 () Bool)

(assert start!70526)

(declare-fun at!206 () (_ BitVec 64))

(declare-datatypes ((array!19931 0))(
  ( (array!19932 (arr!9774 (Array (_ BitVec 32) (_ BitVec 8))) (size!8682 (_ BitVec 32))) )
))
(declare-fun arr!335 () array!19931)

(assert (=> start!70526 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!206) (not (= ((_ sign_extend 32) (size!8682 arr!335)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8682 arr!335))) ((_ sign_extend 32) (size!8682 arr!335))))))))

(assert (=> start!70526 true))

(declare-fun array_inv!8234 (array!19931) Bool)

(assert (=> start!70526 (array_inv!8234 arr!335)))

(declare-fun bs!27382 () Bool)

(assert (= bs!27382 start!70526))

(declare-fun m!457911 () Bool)

(assert (=> bs!27382 m!457911))

(push 1)

(assert (not start!70526))

(check-sat)

(pop 1)

(push 1)

(check-sat)

