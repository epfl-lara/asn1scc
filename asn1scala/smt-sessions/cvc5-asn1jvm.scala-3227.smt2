; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73684 () Bool)

(assert start!73684)

(declare-datatypes ((array!21149 0))(
  ( (array!21150 (arr!10273 (Array (_ BitVec 32) (_ BitVec 8))) (size!9181 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21149)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21149)

(assert (=> start!73684 (and (bvsle (size!9181 a1!688) (size!9181 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9181 a1!688)))) (bvslt fromBit!81 toBit!81) (bvsgt toBit!81 #b0000000000000000000000000000001111111111111111111111111111111000))))

(declare-fun array_inv!8733 (array!21149) Bool)

(assert (=> start!73684 (array_inv!8733 a1!688)))

(assert (=> start!73684 (array_inv!8733 a2!688)))

(assert (=> start!73684 true))

(declare-fun bs!28370 () Bool)

(assert (= bs!28370 start!73684))

(declare-fun m!464063 () Bool)

(assert (=> bs!28370 m!464063))

(declare-fun m!464065 () Bool)

(assert (=> bs!28370 m!464065))

(push 1)

(assert (not start!73684))

(check-sat)

(pop 1)

(push 1)

(check-sat)

