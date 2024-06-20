; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73776 () Bool)

(assert start!73776)

(declare-datatypes ((array!21213 0))(
  ( (array!21214 (arr!10301 (Array (_ BitVec 32) (_ BitVec 8))) (size!9209 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21213)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21213)

(assert (=> start!73776 (and (bvsle (size!9209 a1!688) (size!9209 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9209 a1!688)))) (bvslt fromBit!81 toBit!81) (bvsge (bvsrem toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(declare-fun array_inv!8761 (array!21213) Bool)

(assert (=> start!73776 (array_inv!8761 a1!688)))

(assert (=> start!73776 (array_inv!8761 a2!688)))

(assert (=> start!73776 true))

(declare-fun bs!28410 () Bool)

(assert (= bs!28410 start!73776))

(declare-fun m!464253 () Bool)

(assert (=> bs!28410 m!464253))

(declare-fun m!464255 () Bool)

(assert (=> bs!28410 m!464255))

(check-sat (not start!73776))
(check-sat)
