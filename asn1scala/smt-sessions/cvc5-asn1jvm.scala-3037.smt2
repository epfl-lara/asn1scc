; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70558 () Bool)

(assert start!70558)

(declare-fun at!206 () (_ BitVec 64))

(declare-datatypes ((array!19963 0))(
  ( (array!19964 (arr!9790 (Array (_ BitVec 32) (_ BitVec 8))) (size!8698 (_ BitVec 32))) )
))
(declare-fun arr!335 () array!19963)

(assert (=> start!70558 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!206) (bvslt at!206 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8698 arr!335)))) (let ((bdg!18771 ((_ extract 31 0) (bvsrem at!206 #b0000000000000000000000000000000000000000000000000000000000001000)))) (or (bvslt bdg!18771 #b00000000000000000000000000000000) (bvsge bdg!18771 #b00000000000000000000000000001000))))))

(assert (=> start!70558 true))

(declare-fun array_inv!8250 (array!19963) Bool)

(assert (=> start!70558 (array_inv!8250 arr!335)))

(declare-fun bs!27416 () Bool)

(assert (= bs!27416 start!70558))

(declare-fun m!457943 () Bool)

(assert (=> bs!27416 m!457943))

(push 1)

(assert (not start!70558))

(check-sat)

(pop 1)

(push 1)

(check-sat)

