; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66746 () Bool)

(assert start!66746)

(declare-fun at!281 () (_ BitVec 64))

(declare-datatypes ((array!18009 0))(
  ( (array!18010 (arr!8895 (Array (_ BitVec 32) (_ BitVec 8))) (size!7812 (_ BitVec 32))) )
))
(declare-fun a!429 () array!18009)

(assert (=> start!66746 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!281) (bvslt at!281 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7812 a!429)))) (let ((bdg!17853 ((_ extract 31 0) (bvsdiv at!281 #b0000000000000000000000000000000000000000000000000000000000001000)))) (or (bvslt bdg!17853 #b00000000000000000000000000000000) (bvsge bdg!17853 (size!7812 a!429)))))))

(assert (=> start!66746 true))

(declare-fun array_inv!7424 (array!18009) Bool)

(assert (=> start!66746 (array_inv!7424 a!429)))

(declare-fun bs!25823 () Bool)

(assert (= bs!25823 start!66746))

(declare-fun m!437489 () Bool)

(assert (=> bs!25823 m!437489))

(push 1)

(assert (not start!66746))

(check-sat)

(pop 1)

(push 1)

(check-sat)

