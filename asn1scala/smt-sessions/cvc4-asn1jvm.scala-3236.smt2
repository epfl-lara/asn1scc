; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73778 () Bool)

(assert start!73778)

(declare-datatypes ((array!21215 0))(
  ( (array!21216 (arr!10302 (Array (_ BitVec 32) (_ BitVec 8))) (size!9210 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21215)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21215)

(assert (=> start!73778 (and (bvsle (size!9210 a1!688) (size!9210 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9210 a1!688)))) (bvslt fromBit!81 toBit!81) (bvsge (bvsrem toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(declare-fun array_inv!8762 (array!21215) Bool)

(assert (=> start!73778 (array_inv!8762 a1!688)))

(assert (=> start!73778 (array_inv!8762 a2!688)))

(assert (=> start!73778 true))

(declare-fun bs!28411 () Bool)

(assert (= bs!28411 start!73778))

(declare-fun m!464257 () Bool)

(assert (=> bs!28411 m!464257))

(declare-fun m!464259 () Bool)

(assert (=> bs!28411 m!464259))

(push 1)

(assert (not start!73778))

(check-sat)

(pop 1)

(push 1)

(check-sat)

