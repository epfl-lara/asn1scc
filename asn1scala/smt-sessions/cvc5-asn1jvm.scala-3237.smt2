; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73780 () Bool)

(assert start!73780)

(declare-datatypes ((array!21217 0))(
  ( (array!21218 (arr!10303 (Array (_ BitVec 32) (_ BitVec 8))) (size!9211 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21217)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21217)

(assert (=> start!73780 (and (bvsle (size!9211 a1!688) (size!9211 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9211 a1!688)))) (bvslt fromBit!81 toBit!81) (bvslt (bvsrem toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsrem toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun array_inv!8763 (array!21217) Bool)

(assert (=> start!73780 (array_inv!8763 a1!688)))

(assert (=> start!73780 (array_inv!8763 a2!688)))

(assert (=> start!73780 true))

(declare-fun bs!28415 () Bool)

(assert (= bs!28415 start!73780))

(declare-fun m!464261 () Bool)

(assert (=> bs!28415 m!464261))

(declare-fun m!464263 () Bool)

(assert (=> bs!28415 m!464263))

(push 1)

(assert (not start!73780))

(check-sat)

(pop 1)

(push 1)

(check-sat)

