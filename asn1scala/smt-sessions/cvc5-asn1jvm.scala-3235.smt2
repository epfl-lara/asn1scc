; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73768 () Bool)

(assert start!73768)

(declare-datatypes ((array!21205 0))(
  ( (array!21206 (arr!10297 (Array (_ BitVec 32) (_ BitVec 8))) (size!9205 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21205)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21205)

(assert (=> start!73768 (and (bvsle (size!9205 a1!688) (size!9205 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9205 a1!688)))) (bvslt fromBit!81 toBit!81) (bvslt (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun array_inv!8757 (array!21205) Bool)

(assert (=> start!73768 (array_inv!8757 a1!688)))

(assert (=> start!73768 (array_inv!8757 a2!688)))

(assert (=> start!73768 true))

(declare-fun bs!28403 () Bool)

(assert (= bs!28403 start!73768))

(declare-fun m!464237 () Bool)

(assert (=> bs!28403 m!464237))

(declare-fun m!464239 () Bool)

(assert (=> bs!28403 m!464239))

(push 1)

(assert (not start!73768))

(check-sat)

(pop 1)

(push 1)

(check-sat)

