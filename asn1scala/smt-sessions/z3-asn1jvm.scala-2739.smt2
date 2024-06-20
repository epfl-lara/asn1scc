; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66726 () Bool)

(assert start!66726)

(declare-fun at!281 () (_ BitVec 64))

(declare-datatypes ((array!17989 0))(
  ( (array!17990 (arr!8885 (Array (_ BitVec 32) (_ BitVec 8))) (size!7802 (_ BitVec 32))) )
))
(declare-fun a!429 () array!17989)

(assert (=> start!66726 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!281) (bvslt at!281 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7802 a!429)))) (bvsge (bvsrem at!281 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(assert (=> start!66726 true))

(declare-fun array_inv!7414 (array!17989) Bool)

(assert (=> start!66726 (array_inv!7414 a!429)))

(declare-fun bs!25804 () Bool)

(assert (= bs!25804 start!66726))

(declare-fun m!437469 () Bool)

(assert (=> bs!25804 m!437469))

(check-sat (not start!66726))
(check-sat)
