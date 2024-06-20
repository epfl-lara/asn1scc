; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70534 () Bool)

(assert start!70534)

(declare-fun at!206 () (_ BitVec 64))

(declare-datatypes ((array!19939 0))(
  ( (array!19940 (arr!9778 (Array (_ BitVec 32) (_ BitVec 8))) (size!8686 (_ BitVec 32))) )
))
(declare-fun arr!335 () array!19939)

(assert (=> start!70534 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!206) (bvslt at!206 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8686 arr!335)))) (bvslt (bvsdiv at!206 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsdiv at!206 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> start!70534 true))

(declare-fun array_inv!8238 (array!19939) Bool)

(assert (=> start!70534 (array_inv!8238 arr!335)))

(declare-fun bs!27392 () Bool)

(assert (= bs!27392 start!70534))

(declare-fun m!457919 () Bool)

(assert (=> bs!27392 m!457919))

(push 1)

(assert (not start!70534))

(check-sat)

(pop 1)

(push 1)

(check-sat)

