; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70548 () Bool)

(assert start!70548)

(declare-fun at!206 () (_ BitVec 64))

(declare-datatypes ((array!19953 0))(
  ( (array!19954 (arr!9785 (Array (_ BitVec 32) (_ BitVec 8))) (size!8693 (_ BitVec 32))) )
))
(declare-fun arr!335 () array!19953)

(assert (=> start!70548 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!206) (bvslt at!206 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8693 arr!335)))) (bvslt (bvsrem at!206 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsrem at!206 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> start!70548 true))

(declare-fun array_inv!8245 (array!19953) Bool)

(assert (=> start!70548 (array_inv!8245 arr!335)))

(declare-fun bs!27405 () Bool)

(assert (= bs!27405 start!70548))

(declare-fun m!457933 () Bool)

(assert (=> bs!27405 m!457933))

(check-sat (not start!70548))
(check-sat)
