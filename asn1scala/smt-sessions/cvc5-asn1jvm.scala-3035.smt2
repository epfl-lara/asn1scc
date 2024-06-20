; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70546 () Bool)

(assert start!70546)

(declare-fun at!206 () (_ BitVec 64))

(declare-datatypes ((array!19951 0))(
  ( (array!19952 (arr!9784 (Array (_ BitVec 32) (_ BitVec 8))) (size!8692 (_ BitVec 32))) )
))
(declare-fun arr!335 () array!19951)

(assert (=> start!70546 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!206) (bvslt at!206 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8692 arr!335)))) (bvslt (bvsrem at!206 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsrem at!206 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> start!70546 true))

(declare-fun array_inv!8244 (array!19951) Bool)

(assert (=> start!70546 (array_inv!8244 arr!335)))

(declare-fun bs!27404 () Bool)

(assert (= bs!27404 start!70546))

(declare-fun m!457931 () Bool)

(assert (=> bs!27404 m!457931))

(push 1)

(assert (not start!70546))

(check-sat)

(pop 1)

(push 1)

(check-sat)

