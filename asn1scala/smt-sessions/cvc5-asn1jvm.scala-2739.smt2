; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66724 () Bool)

(assert start!66724)

(declare-fun at!281 () (_ BitVec 64))

(declare-datatypes ((array!17987 0))(
  ( (array!17988 (arr!8884 (Array (_ BitVec 32) (_ BitVec 8))) (size!7801 (_ BitVec 32))) )
))
(declare-fun a!429 () array!17987)

(assert (=> start!66724 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!281) (bvslt at!281 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7801 a!429)))) (bvsge (bvsrem at!281 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(assert (=> start!66724 true))

(declare-fun array_inv!7413 (array!17987) Bool)

(assert (=> start!66724 (array_inv!7413 a!429)))

(declare-fun bs!25803 () Bool)

(assert (= bs!25803 start!66724))

(declare-fun m!437467 () Bool)

(assert (=> bs!25803 m!437467))

(push 1)

(assert (not start!66724))

(check-sat)

(pop 1)

(push 1)

(check-sat)

