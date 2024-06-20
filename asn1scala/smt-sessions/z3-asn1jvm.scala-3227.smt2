; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73686 () Bool)

(assert start!73686)

(declare-datatypes ((array!21151 0))(
  ( (array!21152 (arr!10274 (Array (_ BitVec 32) (_ BitVec 8))) (size!9182 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21151)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21151)

(assert (=> start!73686 (and (bvsle (size!9182 a1!688) (size!9182 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9182 a1!688)))) (bvslt fromBit!81 toBit!81) (bvsgt toBit!81 #b0000000000000000000000000000001111111111111111111111111111111000))))

(declare-fun array_inv!8734 (array!21151) Bool)

(assert (=> start!73686 (array_inv!8734 a1!688)))

(assert (=> start!73686 (array_inv!8734 a2!688)))

(assert (=> start!73686 true))

(declare-fun bs!28371 () Bool)

(assert (= bs!28371 start!73686))

(declare-fun m!464067 () Bool)

(assert (=> bs!28371 m!464067))

(declare-fun m!464069 () Bool)

(assert (=> bs!28371 m!464069))

(check-sat (not start!73686))
(check-sat)
