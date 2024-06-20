; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73772 () Bool)

(assert start!73772)

(declare-datatypes ((array!21209 0))(
  ( (array!21210 (arr!10299 (Array (_ BitVec 32) (_ BitVec 8))) (size!9207 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21209)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21209)

(assert (=> start!73772 (and (bvsle (size!9207 a1!688) (size!9207 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9207 a1!688)))) (bvslt fromBit!81 toBit!81) (bvslt (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun array_inv!8759 (array!21209) Bool)

(assert (=> start!73772 (array_inv!8759 a1!688)))

(assert (=> start!73772 (array_inv!8759 a2!688)))

(assert (=> start!73772 true))

(declare-fun bs!28405 () Bool)

(assert (= bs!28405 start!73772))

(declare-fun m!464245 () Bool)

(assert (=> bs!28405 m!464245))

(declare-fun m!464247 () Bool)

(assert (=> bs!28405 m!464247))

(push 1)

(assert (not start!73772))

(check-sat)

(pop 1)

(push 1)

(check-sat)

