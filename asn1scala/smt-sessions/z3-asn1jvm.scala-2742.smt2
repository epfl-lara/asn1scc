; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66744 () Bool)

(assert start!66744)

(declare-fun at!281 () (_ BitVec 64))

(declare-datatypes ((array!18007 0))(
  ( (array!18008 (arr!8894 (Array (_ BitVec 32) (_ BitVec 8))) (size!7811 (_ BitVec 32))) )
))
(declare-fun a!429 () array!18007)

(assert (=> start!66744 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!281) (bvslt at!281 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7811 a!429)))) (let ((bdg!17853 ((_ extract 31 0) (bvsdiv at!281 #b0000000000000000000000000000000000000000000000000000000000001000)))) (or (bvslt bdg!17853 #b00000000000000000000000000000000) (bvsge bdg!17853 (size!7811 a!429)))))))

(assert (=> start!66744 true))

(declare-fun array_inv!7423 (array!18007) Bool)

(assert (=> start!66744 (array_inv!7423 a!429)))

(declare-fun bs!25822 () Bool)

(assert (= bs!25822 start!66744))

(declare-fun m!437487 () Bool)

(assert (=> bs!25822 m!437487))

(check-sat (not start!66744))
(check-sat)
