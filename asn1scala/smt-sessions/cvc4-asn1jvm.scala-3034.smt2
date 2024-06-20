; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70544 () Bool)

(assert start!70544)

(declare-fun at!206 () (_ BitVec 64))

(declare-datatypes ((array!19949 0))(
  ( (array!19950 (arr!9783 (Array (_ BitVec 32) (_ BitVec 8))) (size!8691 (_ BitVec 32))) )
))
(declare-fun arr!335 () array!19949)

(assert (=> start!70544 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!206) (bvslt at!206 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8691 arr!335)))) (bvsge (bvsrem at!206 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(assert (=> start!70544 true))

(declare-fun array_inv!8243 (array!19949) Bool)

(assert (=> start!70544 (array_inv!8243 arr!335)))

(declare-fun bs!27400 () Bool)

(assert (= bs!27400 start!70544))

(declare-fun m!457929 () Bool)

(assert (=> bs!27400 m!457929))

(push 1)

(assert (not start!70544))

(check-sat)

(pop 1)

(push 1)

(check-sat)

