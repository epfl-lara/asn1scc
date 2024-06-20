; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70532 () Bool)

(assert start!70532)

(declare-fun at!206 () (_ BitVec 64))

(declare-datatypes ((array!19937 0))(
  ( (array!19938 (arr!9777 (Array (_ BitVec 32) (_ BitVec 8))) (size!8685 (_ BitVec 32))) )
))
(declare-fun arr!335 () array!19937)

(assert (=> start!70532 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!206) (bvslt at!206 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8685 arr!335)))) (bvsge (bvsdiv at!206 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(assert (=> start!70532 true))

(declare-fun array_inv!8237 (array!19937) Bool)

(assert (=> start!70532 (array_inv!8237 arr!335)))

(declare-fun bs!27388 () Bool)

(assert (= bs!27388 start!70532))

(declare-fun m!457917 () Bool)

(assert (=> bs!27388 m!457917))

(push 1)

(assert (not start!70532))

(check-sat)

(pop 1)

(push 1)

(check-sat)

