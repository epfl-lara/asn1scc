; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73758 () Bool)

(assert start!73758)

(declare-datatypes ((array!21195 0))(
  ( (array!21196 (arr!10292 (Array (_ BitVec 32) (_ BitVec 8))) (size!9200 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21195)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21195)

(assert (=> start!73758 (and (bvsle (size!9200 a1!688) (size!9200 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (not (= ((_ sign_extend 32) (size!9200 a1!688)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9200 a1!688))) ((_ sign_extend 32) (size!9200 a1!688))))))))

(declare-fun array_inv!8752 (array!21195) Bool)

(assert (=> start!73758 (array_inv!8752 a1!688)))

(assert (=> start!73758 (array_inv!8752 a2!688)))

(assert (=> start!73758 true))

(declare-fun bs!28392 () Bool)

(assert (= bs!28392 start!73758))

(declare-fun m!464217 () Bool)

(assert (=> bs!28392 m!464217))

(declare-fun m!464219 () Bool)

(assert (=> bs!28392 m!464219))

(check-sat (not start!73758))
(check-sat)
