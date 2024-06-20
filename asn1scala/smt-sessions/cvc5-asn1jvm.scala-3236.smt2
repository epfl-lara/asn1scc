; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73774 () Bool)

(assert start!73774)

(declare-datatypes ((array!21211 0))(
  ( (array!21212 (arr!10300 (Array (_ BitVec 32) (_ BitVec 8))) (size!9208 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21211)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21211)

(assert (=> start!73774 (and (bvsle (size!9208 a1!688) (size!9208 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9208 a1!688)))) (bvslt fromBit!81 toBit!81) (bvsge (bvsrem toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(declare-fun array_inv!8760 (array!21211) Bool)

(assert (=> start!73774 (array_inv!8760 a1!688)))

(assert (=> start!73774 (array_inv!8760 a2!688)))

(assert (=> start!73774 true))

(declare-fun bs!28409 () Bool)

(assert (= bs!28409 start!73774))

(declare-fun m!464249 () Bool)

(assert (=> bs!28409 m!464249))

(declare-fun m!464251 () Bool)

(assert (=> bs!28409 m!464251))

(push 1)

(assert (not start!73774))

(check-sat)

(pop 1)

(push 1)

(check-sat)

