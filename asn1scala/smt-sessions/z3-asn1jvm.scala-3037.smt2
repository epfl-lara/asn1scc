; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70560 () Bool)

(assert start!70560)

(declare-fun at!206 () (_ BitVec 64))

(declare-datatypes ((array!19965 0))(
  ( (array!19966 (arr!9791 (Array (_ BitVec 32) (_ BitVec 8))) (size!8699 (_ BitVec 32))) )
))
(declare-fun arr!335 () array!19965)

(assert (=> start!70560 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!206) (bvslt at!206 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8699 arr!335)))) (let ((bdg!18771 ((_ extract 31 0) (bvsrem at!206 #b0000000000000000000000000000000000000000000000000000000000001000)))) (or (bvslt bdg!18771 #b00000000000000000000000000000000) (bvsge bdg!18771 #b00000000000000000000000000001000))))))

(assert (=> start!70560 true))

(declare-fun array_inv!8251 (array!19965) Bool)

(assert (=> start!70560 (array_inv!8251 arr!335)))

(declare-fun bs!27417 () Bool)

(assert (= bs!27417 start!70560))

(declare-fun m!457945 () Bool)

(assert (=> bs!27417 m!457945))

(check-sat (not start!70560))
(check-sat)
