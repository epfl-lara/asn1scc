; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73756 () Bool)

(assert start!73756)

(declare-datatypes ((array!21193 0))(
  ( (array!21194 (arr!10291 (Array (_ BitVec 32) (_ BitVec 8))) (size!9199 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21193)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21193)

(assert (=> start!73756 (and (bvsle (size!9199 a1!688) (size!9199 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (not (= ((_ sign_extend 32) (size!9199 a1!688)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9199 a1!688))) ((_ sign_extend 32) (size!9199 a1!688))))))))

(declare-fun array_inv!8751 (array!21193) Bool)

(assert (=> start!73756 (array_inv!8751 a1!688)))

(assert (=> start!73756 (array_inv!8751 a2!688)))

(assert (=> start!73756 true))

(declare-fun bs!28391 () Bool)

(assert (= bs!28391 start!73756))

(declare-fun m!464213 () Bool)

(assert (=> bs!28391 m!464213))

(declare-fun m!464215 () Bool)

(assert (=> bs!28391 m!464215))

(push 1)

(assert (not start!73756))

(check-sat)

(pop 1)

(push 1)

(check-sat)

