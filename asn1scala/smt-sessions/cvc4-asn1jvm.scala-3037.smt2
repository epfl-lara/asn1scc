; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70562 () Bool)

(assert start!70562)

(declare-fun at!206 () (_ BitVec 64))

(declare-datatypes ((array!19967 0))(
  ( (array!19968 (arr!9792 (Array (_ BitVec 32) (_ BitVec 8))) (size!8700 (_ BitVec 32))) )
))
(declare-fun arr!335 () array!19967)

(assert (=> start!70562 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!206) (bvslt at!206 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8700 arr!335)))) (let ((bdg!18771 ((_ extract 31 0) (bvsrem at!206 #b0000000000000000000000000000000000000000000000000000000000001000)))) (or (bvslt bdg!18771 #b00000000000000000000000000000000) (bvsge bdg!18771 #b00000000000000000000000000001000))))))

(assert (=> start!70562 true))

(declare-fun array_inv!8252 (array!19967) Bool)

(assert (=> start!70562 (array_inv!8252 arr!335)))

(declare-fun bs!27418 () Bool)

(assert (= bs!27418 start!70562))

(declare-fun m!457947 () Bool)

(assert (=> bs!27418 m!457947))

(push 1)

(assert (not start!70562))

(check-sat)

(pop 1)

(push 1)

(check-sat)

