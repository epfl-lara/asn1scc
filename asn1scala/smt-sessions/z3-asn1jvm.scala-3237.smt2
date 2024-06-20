; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73782 () Bool)

(assert start!73782)

(declare-datatypes ((array!21219 0))(
  ( (array!21220 (arr!10304 (Array (_ BitVec 32) (_ BitVec 8))) (size!9212 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21219)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21219)

(assert (=> start!73782 (and (bvsle (size!9212 a1!688) (size!9212 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9212 a1!688)))) (bvslt fromBit!81 toBit!81) (bvslt (bvsrem toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsrem toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun array_inv!8764 (array!21219) Bool)

(assert (=> start!73782 (array_inv!8764 a1!688)))

(assert (=> start!73782 (array_inv!8764 a2!688)))

(assert (=> start!73782 true))

(declare-fun bs!28416 () Bool)

(assert (= bs!28416 start!73782))

(declare-fun m!464265 () Bool)

(assert (=> bs!28416 m!464265))

(declare-fun m!464267 () Bool)

(assert (=> bs!28416 m!464267))

(check-sat (not start!73782))
(check-sat)
