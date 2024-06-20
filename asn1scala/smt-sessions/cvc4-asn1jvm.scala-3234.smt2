; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73766 () Bool)

(assert start!73766)

(declare-datatypes ((array!21203 0))(
  ( (array!21204 (arr!10296 (Array (_ BitVec 32) (_ BitVec 8))) (size!9204 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21203)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21203)

(assert (=> start!73766 (and (bvsle (size!9204 a1!688) (size!9204 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9204 a1!688)))) (bvslt fromBit!81 toBit!81) (bvsge (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(declare-fun array_inv!8756 (array!21203) Bool)

(assert (=> start!73766 (array_inv!8756 a1!688)))

(assert (=> start!73766 (array_inv!8756 a2!688)))

(assert (=> start!73766 true))

(declare-fun bs!28399 () Bool)

(assert (= bs!28399 start!73766))

(declare-fun m!464233 () Bool)

(assert (=> bs!28399 m!464233))

(declare-fun m!464235 () Bool)

(assert (=> bs!28399 m!464235))

(push 1)

(assert (not start!73766))

(check-sat)

(pop 1)

(push 1)

(check-sat)

