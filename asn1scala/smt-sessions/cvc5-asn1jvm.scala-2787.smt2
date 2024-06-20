; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67290 () Bool)

(assert start!67290)

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18299 0))(
  ( (array!18300 (arr!9028 (Array (_ BitVec 32) (_ BitVec 8))) (size!7945 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18299)

(declare-fun a2!948 () array!18299)

(assert (=> start!67290 (and (bvsle (size!7945 a1!948) (size!7945 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258) (not (= ((_ sign_extend 32) (size!7945 a1!948)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7945 a1!948))) ((_ sign_extend 32) (size!7945 a1!948))))))))

(declare-fun array_inv!7557 (array!18299) Bool)

(assert (=> start!67290 (array_inv!7557 a1!948)))

(assert (=> start!67290 (array_inv!7557 a2!948)))

(assert (=> start!67290 true))

(declare-fun bs!26067 () Bool)

(assert (= bs!26067 start!67290))

(declare-fun m!441075 () Bool)

(assert (=> bs!26067 m!441075))

(declare-fun m!441077 () Bool)

(assert (=> bs!26067 m!441077))

(push 1)

(assert (not start!67290))

(check-sat)

(pop 1)

(push 1)

(check-sat)

