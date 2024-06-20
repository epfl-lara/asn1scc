; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66728 () Bool)

(assert start!66728)

(declare-fun at!281 () (_ BitVec 64))

(declare-datatypes ((array!17991 0))(
  ( (array!17992 (arr!8886 (Array (_ BitVec 32) (_ BitVec 8))) (size!7803 (_ BitVec 32))) )
))
(declare-fun a!429 () array!17991)

(assert (=> start!66728 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!281) (bvslt at!281 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7803 a!429)))) (bvsge (bvsrem at!281 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(assert (=> start!66728 true))

(declare-fun array_inv!7415 (array!17991) Bool)

(assert (=> start!66728 (array_inv!7415 a!429)))

(declare-fun bs!25805 () Bool)

(assert (= bs!25805 start!66728))

(declare-fun m!437471 () Bool)

(assert (=> bs!25805 m!437471))

(push 1)

