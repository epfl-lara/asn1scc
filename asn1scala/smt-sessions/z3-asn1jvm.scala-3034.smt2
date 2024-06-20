; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70542 () Bool)

(assert start!70542)

(declare-fun at!206 () (_ BitVec 64))

(declare-datatypes ((array!19947 0))(
  ( (array!19948 (arr!9782 (Array (_ BitVec 32) (_ BitVec 8))) (size!8690 (_ BitVec 32))) )
))
(declare-fun arr!335 () array!19947)

(assert (=> start!70542 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!206) (bvslt at!206 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8690 arr!335)))) (bvsge (bvsrem at!206 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(assert (=> start!70542 true))

(declare-fun array_inv!8242 (array!19947) Bool)

(assert (=> start!70542 (array_inv!8242 arr!335)))

(declare-fun bs!27399 () Bool)

(assert (= bs!27399 start!70542))

(declare-fun m!457927 () Bool)

(assert (=> bs!27399 m!457927))

(check-sat (not start!70542))
(check-sat)
