; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73770 () Bool)

(assert start!73770)

(declare-datatypes ((array!21207 0))(
  ( (array!21208 (arr!10298 (Array (_ BitVec 32) (_ BitVec 8))) (size!9206 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21207)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21207)

(assert (=> start!73770 (and (bvsle (size!9206 a1!688) (size!9206 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9206 a1!688)))) (bvslt fromBit!81 toBit!81) (bvslt (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun array_inv!8758 (array!21207) Bool)

(assert (=> start!73770 (array_inv!8758 a1!688)))

(assert (=> start!73770 (array_inv!8758 a2!688)))

(assert (=> start!73770 true))

(declare-fun bs!28404 () Bool)

(assert (= bs!28404 start!73770))

(declare-fun m!464241 () Bool)

(assert (=> bs!28404 m!464241))

(declare-fun m!464243 () Bool)

(assert (=> bs!28404 m!464243))

(check-sat (not start!73770))
(check-sat)
