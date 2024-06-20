; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73762 () Bool)

(assert start!73762)

(declare-datatypes ((array!21199 0))(
  ( (array!21200 (arr!10294 (Array (_ BitVec 32) (_ BitVec 8))) (size!9202 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21199)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21199)

(assert (=> start!73762 (and (bvsle (size!9202 a1!688) (size!9202 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9202 a1!688)))) (bvslt fromBit!81 toBit!81) (bvsge (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(declare-fun array_inv!8754 (array!21199) Bool)

(assert (=> start!73762 (array_inv!8754 a1!688)))

(assert (=> start!73762 (array_inv!8754 a2!688)))

(assert (=> start!73762 true))

(declare-fun bs!28397 () Bool)

(assert (= bs!28397 start!73762))

(declare-fun m!464225 () Bool)

(assert (=> bs!28397 m!464225))

(declare-fun m!464227 () Bool)

(assert (=> bs!28397 m!464227))

(push 1)

(assert (not start!73762))

(check-sat)

(pop 1)

(push 1)

(check-sat)

