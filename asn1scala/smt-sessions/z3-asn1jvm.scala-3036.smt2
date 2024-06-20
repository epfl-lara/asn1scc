; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70554 () Bool)

(assert start!70554)

(declare-fun at!206 () (_ BitVec 64))

(declare-datatypes ((array!19959 0))(
  ( (array!19960 (arr!9788 (Array (_ BitVec 32) (_ BitVec 8))) (size!8696 (_ BitVec 32))) )
))
(declare-fun arr!335 () array!19959)

(assert (=> start!70554 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!206) (bvslt at!206 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8696 arr!335)))) (let ((bdg!18770 ((_ extract 31 0) (bvsdiv at!206 #b0000000000000000000000000000000000000000000000000000000000001000)))) (or (bvslt bdg!18770 #b00000000000000000000000000000000) (bvsge bdg!18770 (size!8696 arr!335)))))))

(assert (=> start!70554 true))

(declare-fun array_inv!8248 (array!19959) Bool)

(assert (=> start!70554 (array_inv!8248 arr!335)))

(declare-fun bs!27411 () Bool)

(assert (= bs!27411 start!70554))

(declare-fun m!457939 () Bool)

(assert (=> bs!27411 m!457939))

(check-sat (not start!70554))
(check-sat)
