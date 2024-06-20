; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66712 () Bool)

(assert start!66712)

(declare-fun at!281 () (_ BitVec 64))

(declare-datatypes ((array!17975 0))(
  ( (array!17976 (arr!8878 (Array (_ BitVec 32) (_ BitVec 8))) (size!7795 (_ BitVec 32))) )
))
(declare-fun a!429 () array!17975)

(assert (=> start!66712 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!281) (bvslt at!281 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7795 a!429)))) (bvsge (bvsdiv at!281 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(assert (=> start!66712 true))

(declare-fun array_inv!7407 (array!17975) Bool)

(assert (=> start!66712 (array_inv!7407 a!429)))

(declare-fun bs!25791 () Bool)

(assert (= bs!25791 start!66712))

(declare-fun m!437455 () Bool)

(assert (=> bs!25791 m!437455))

(push 1)

(assert (not start!66712))

(check-sat)

(pop 1)

(push 1)

(check-sat)

