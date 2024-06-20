; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70528 () Bool)

(assert start!70528)

(declare-fun at!206 () (_ BitVec 64))

(declare-datatypes ((array!19933 0))(
  ( (array!19934 (arr!9775 (Array (_ BitVec 32) (_ BitVec 8))) (size!8683 (_ BitVec 32))) )
))
(declare-fun arr!335 () array!19933)

(assert (=> start!70528 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!206) (bvslt at!206 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8683 arr!335)))) (bvsge (bvsdiv at!206 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(assert (=> start!70528 true))

(declare-fun array_inv!8235 (array!19933) Bool)

(assert (=> start!70528 (array_inv!8235 arr!335)))

(declare-fun bs!27386 () Bool)

(assert (= bs!27386 start!70528))

(declare-fun m!457913 () Bool)

(assert (=> bs!27386 m!457913))

(push 1)

(assert (not start!70528))

(check-sat)

(pop 1)

(push 1)

(check-sat)

