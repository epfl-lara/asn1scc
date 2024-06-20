; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66750 () Bool)

(assert start!66750)

(declare-fun at!281 () (_ BitVec 64))

(declare-datatypes ((array!18013 0))(
  ( (array!18014 (arr!8897 (Array (_ BitVec 32) (_ BitVec 8))) (size!7814 (_ BitVec 32))) )
))
(declare-fun a!429 () array!18013)

(assert (=> start!66750 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!281) (bvslt at!281 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7814 a!429)))) (let ((bdg!17854 ((_ extract 31 0) (bvsrem at!281 #b0000000000000000000000000000000000000000000000000000000000001000)))) (or (bvslt bdg!17854 #b00000000000000000000000000000000) (bvsge bdg!17854 #b00000000000000000000000000001000))))))

(assert (=> start!66750 true))

(declare-fun array_inv!7426 (array!18013) Bool)

(assert (=> start!66750 (array_inv!7426 a!429)))

(declare-fun bs!25828 () Bool)

(assert (= bs!25828 start!66750))

(declare-fun m!437493 () Bool)

(assert (=> bs!25828 m!437493))

(check-sat (not start!66750))
(check-sat)
