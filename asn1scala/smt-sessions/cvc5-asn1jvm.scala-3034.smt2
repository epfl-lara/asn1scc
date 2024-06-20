; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70540 () Bool)

(assert start!70540)

(declare-fun at!206 () (_ BitVec 64))

(declare-datatypes ((array!19945 0))(
  ( (array!19946 (arr!9781 (Array (_ BitVec 32) (_ BitVec 8))) (size!8689 (_ BitVec 32))) )
))
(declare-fun arr!335 () array!19945)

(assert (=> start!70540 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!206) (bvslt at!206 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8689 arr!335)))) (bvsge (bvsrem at!206 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(assert (=> start!70540 true))

(declare-fun array_inv!8241 (array!19945) Bool)

(assert (=> start!70540 (array_inv!8241 arr!335)))

(declare-fun bs!27398 () Bool)

(assert (= bs!27398 start!70540))

(declare-fun m!457925 () Bool)

(assert (=> bs!27398 m!457925))

(push 1)

(assert (not start!70540))

(check-sat)

(pop 1)

(push 1)

(check-sat)

