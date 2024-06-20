; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70552 () Bool)

(assert start!70552)

(declare-fun at!206 () (_ BitVec 64))

(declare-datatypes ((array!19957 0))(
  ( (array!19958 (arr!9787 (Array (_ BitVec 32) (_ BitVec 8))) (size!8695 (_ BitVec 32))) )
))
(declare-fun arr!335 () array!19957)

(assert (=> start!70552 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!206) (bvslt at!206 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8695 arr!335)))) (let ((bdg!18770 ((_ extract 31 0) (bvsdiv at!206 #b0000000000000000000000000000000000000000000000000000000000001000)))) (or (bvslt bdg!18770 #b00000000000000000000000000000000) (bvsge bdg!18770 (size!8695 arr!335)))))))

(assert (=> start!70552 true))

(declare-fun array_inv!8247 (array!19957) Bool)

(assert (=> start!70552 (array_inv!8247 arr!335)))

(declare-fun bs!27410 () Bool)

(assert (= bs!27410 start!70552))

(declare-fun m!457937 () Bool)

(assert (=> bs!27410 m!457937))

(push 1)

(assert (not start!70552))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

