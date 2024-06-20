; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73764 () Bool)

(assert start!73764)

(declare-datatypes ((array!21201 0))(
  ( (array!21202 (arr!10295 (Array (_ BitVec 32) (_ BitVec 8))) (size!9203 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21201)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21201)

(assert (=> start!73764 (and (bvsle (size!9203 a1!688) (size!9203 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9203 a1!688)))) (bvslt fromBit!81 toBit!81) (bvsge (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(declare-fun array_inv!8755 (array!21201) Bool)

(assert (=> start!73764 (array_inv!8755 a1!688)))

(assert (=> start!73764 (array_inv!8755 a2!688)))

(assert (=> start!73764 true))

(declare-fun bs!28398 () Bool)

(assert (= bs!28398 start!73764))

(declare-fun m!464229 () Bool)

(assert (=> bs!28398 m!464229))

(declare-fun m!464231 () Bool)

(assert (=> bs!28398 m!464231))

(check-sat (not start!73764))
(check-sat)
