; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73688 () Bool)

(assert start!73688)

(declare-datatypes ((array!21153 0))(
  ( (array!21154 (arr!10275 (Array (_ BitVec 32) (_ BitVec 8))) (size!9183 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21153)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21153)

(assert (=> start!73688 (and (bvsle (size!9183 a1!688) (size!9183 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9183 a1!688)))) (bvslt fromBit!81 toBit!81) (bvsgt toBit!81 #b0000000000000000000000000000001111111111111111111111111111111000))))

(declare-fun array_inv!8735 (array!21153) Bool)

(assert (=> start!73688 (array_inv!8735 a1!688)))

(assert (=> start!73688 (array_inv!8735 a2!688)))

(assert (=> start!73688 true))

(declare-fun bs!28372 () Bool)

(assert (= bs!28372 start!73688))

(declare-fun m!464071 () Bool)

(assert (=> bs!28372 m!464071))

(declare-fun m!464073 () Bool)

(assert (=> bs!28372 m!464073))

(push 1)

(assert (not start!73688))

(check-sat)

(pop 1)

(push 1)

(check-sat)

