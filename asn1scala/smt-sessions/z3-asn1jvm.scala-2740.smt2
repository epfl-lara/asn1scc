; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66732 () Bool)

(assert start!66732)

(declare-fun at!281 () (_ BitVec 64))

(declare-datatypes ((array!17995 0))(
  ( (array!17996 (arr!8888 (Array (_ BitVec 32) (_ BitVec 8))) (size!7805 (_ BitVec 32))) )
))
(declare-fun a!429 () array!17995)

(assert (=> start!66732 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!281) (bvslt at!281 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7805 a!429)))) (bvslt (bvsrem at!281 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsrem at!281 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> start!66732 true))

(declare-fun array_inv!7417 (array!17995) Bool)

(assert (=> start!66732 (array_inv!7417 a!429)))

(declare-fun bs!25810 () Bool)

(assert (= bs!25810 start!66732))

(declare-fun m!437475 () Bool)

(assert (=> bs!25810 m!437475))

(check-sat (not start!66732))
(check-sat)
