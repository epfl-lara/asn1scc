; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70530 () Bool)

(assert start!70530)

(declare-fun at!206 () (_ BitVec 64))

(declare-datatypes ((array!19935 0))(
  ( (array!19936 (arr!9776 (Array (_ BitVec 32) (_ BitVec 8))) (size!8684 (_ BitVec 32))) )
))
(declare-fun arr!335 () array!19935)

(assert (=> start!70530 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!206) (bvslt at!206 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8684 arr!335)))) (bvsge (bvsdiv at!206 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(assert (=> start!70530 true))

(declare-fun array_inv!8236 (array!19935) Bool)

(assert (=> start!70530 (array_inv!8236 arr!335)))

(declare-fun bs!27387 () Bool)

(assert (= bs!27387 start!70530))

(declare-fun m!457915 () Bool)

(assert (=> bs!27387 m!457915))

(check-sat (not start!70530))
(check-sat)
