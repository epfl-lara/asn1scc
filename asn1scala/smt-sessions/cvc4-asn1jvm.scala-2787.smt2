; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67294 () Bool)

(assert start!67294)

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18303 0))(
  ( (array!18304 (arr!9030 (Array (_ BitVec 32) (_ BitVec 8))) (size!7947 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18303)

(declare-fun a2!948 () array!18303)

(assert (=> start!67294 (and (bvsle (size!7947 a1!948) (size!7947 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258) (not (= ((_ sign_extend 32) (size!7947 a1!948)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7947 a1!948))) ((_ sign_extend 32) (size!7947 a1!948))))))))

(declare-fun array_inv!7559 (array!18303) Bool)

(assert (=> start!67294 (array_inv!7559 a1!948)))

(assert (=> start!67294 (array_inv!7559 a2!948)))

(assert (=> start!67294 true))

(declare-fun bs!26069 () Bool)

(assert (= bs!26069 start!67294))

(declare-fun m!441083 () Bool)

(assert (=> bs!26069 m!441083))

(declare-fun m!441085 () Bool)

(assert (=> bs!26069 m!441085))

(push 1)

(assert (not start!67294))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

