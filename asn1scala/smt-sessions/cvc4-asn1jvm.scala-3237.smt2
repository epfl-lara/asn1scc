; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73784 () Bool)

(assert start!73784)

(declare-datatypes ((array!21221 0))(
  ( (array!21222 (arr!10305 (Array (_ BitVec 32) (_ BitVec 8))) (size!9213 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21221)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21221)

(assert (=> start!73784 (and (bvsle (size!9213 a1!688) (size!9213 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9213 a1!688)))) (bvslt fromBit!81 toBit!81) (bvslt (bvsrem toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsrem toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun array_inv!8765 (array!21221) Bool)

(assert (=> start!73784 (array_inv!8765 a1!688)))

(assert (=> start!73784 (array_inv!8765 a2!688)))

(assert (=> start!73784 true))

(declare-fun bs!28417 () Bool)

(assert (= bs!28417 start!73784))

(declare-fun m!464269 () Bool)

(assert (=> bs!28417 m!464269))

(declare-fun m!464271 () Bool)

(assert (=> bs!28417 m!464271))

(push 1)

(assert (not start!73784))

(check-sat)

(pop 1)

(push 1)

(check-sat)

