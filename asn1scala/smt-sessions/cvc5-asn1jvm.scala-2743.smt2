; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66748 () Bool)

(assert start!66748)

(declare-fun at!281 () (_ BitVec 64))

(declare-datatypes ((array!18011 0))(
  ( (array!18012 (arr!8896 (Array (_ BitVec 32) (_ BitVec 8))) (size!7813 (_ BitVec 32))) )
))
(declare-fun a!429 () array!18011)

(assert (=> start!66748 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!281) (bvslt at!281 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7813 a!429)))) (let ((bdg!17854 ((_ extract 31 0) (bvsrem at!281 #b0000000000000000000000000000000000000000000000000000000000001000)))) (or (bvslt bdg!17854 #b00000000000000000000000000000000) (bvsge bdg!17854 #b00000000000000000000000000001000))))))

(assert (=> start!66748 true))

(declare-fun array_inv!7425 (array!18011) Bool)

(assert (=> start!66748 (array_inv!7425 a!429)))

(declare-fun bs!25827 () Bool)

(assert (= bs!25827 start!66748))

(declare-fun m!437491 () Bool)

(assert (=> bs!25827 m!437491))

(push 1)

(assert (not start!66748))

(check-sat)

(pop 1)

(push 1)

(check-sat)

