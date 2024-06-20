; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66742 () Bool)

(assert start!66742)

(declare-fun at!281 () (_ BitVec 64))

(declare-datatypes ((array!18005 0))(
  ( (array!18006 (arr!8893 (Array (_ BitVec 32) (_ BitVec 8))) (size!7810 (_ BitVec 32))) )
))
(declare-fun a!429 () array!18005)

(assert (=> start!66742 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!281) (bvslt at!281 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7810 a!429)))) (let ((bdg!17853 ((_ extract 31 0) (bvsdiv at!281 #b0000000000000000000000000000000000000000000000000000000000001000)))) (or (bvslt bdg!17853 #b00000000000000000000000000000000) (bvsge bdg!17853 (size!7810 a!429)))))))

(assert (=> start!66742 true))

(declare-fun array_inv!7422 (array!18005) Bool)

(assert (=> start!66742 (array_inv!7422 a!429)))

(declare-fun bs!25821 () Bool)

(assert (= bs!25821 start!66742))

(declare-fun m!437485 () Bool)

(assert (=> bs!25821 m!437485))

(push 1)

(assert (not start!66742))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

