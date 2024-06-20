; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70550 () Bool)

(assert start!70550)

(declare-fun at!206 () (_ BitVec 64))

(declare-datatypes ((array!19955 0))(
  ( (array!19956 (arr!9786 (Array (_ BitVec 32) (_ BitVec 8))) (size!8694 (_ BitVec 32))) )
))
(declare-fun arr!335 () array!19955)

(assert (=> start!70550 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!206) (bvslt at!206 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8694 arr!335)))) (bvslt (bvsrem at!206 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsrem at!206 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> start!70550 true))

(declare-fun array_inv!8246 (array!19955) Bool)

(assert (=> start!70550 (array_inv!8246 arr!335)))

(declare-fun bs!27406 () Bool)

(assert (= bs!27406 start!70550))

(declare-fun m!457935 () Bool)

(assert (=> bs!27406 m!457935))

(push 1)

(assert (not start!70550))

(check-sat)

(pop 1)

(push 1)

(check-sat)

