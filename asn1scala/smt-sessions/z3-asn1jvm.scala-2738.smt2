; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66720 () Bool)

(assert start!66720)

(declare-fun at!281 () (_ BitVec 64))

(declare-datatypes ((array!17983 0))(
  ( (array!17984 (arr!8882 (Array (_ BitVec 32) (_ BitVec 8))) (size!7799 (_ BitVec 32))) )
))
(declare-fun a!429 () array!17983)

(assert (=> start!66720 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!281) (bvslt at!281 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7799 a!429)))) (bvslt (bvsdiv at!281 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsdiv at!281 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> start!66720 true))

(declare-fun array_inv!7411 (array!17983) Bool)

(assert (=> start!66720 (array_inv!7411 a!429)))

(declare-fun bs!25798 () Bool)

(assert (= bs!25798 start!66720))

(declare-fun m!437463 () Bool)

(assert (=> bs!25798 m!437463))

(check-sat (not start!66720))
(check-sat)
