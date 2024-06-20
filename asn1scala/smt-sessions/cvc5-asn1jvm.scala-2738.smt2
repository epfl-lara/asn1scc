; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66718 () Bool)

(assert start!66718)

(declare-fun at!281 () (_ BitVec 64))

(declare-datatypes ((array!17981 0))(
  ( (array!17982 (arr!8881 (Array (_ BitVec 32) (_ BitVec 8))) (size!7798 (_ BitVec 32))) )
))
(declare-fun a!429 () array!17981)

(assert (=> start!66718 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!281) (bvslt at!281 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7798 a!429)))) (bvslt (bvsdiv at!281 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsdiv at!281 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> start!66718 true))

(declare-fun array_inv!7410 (array!17981) Bool)

(assert (=> start!66718 (array_inv!7410 a!429)))

(declare-fun bs!25797 () Bool)

(assert (= bs!25797 start!66718))

(declare-fun m!437461 () Bool)

(assert (=> bs!25797 m!437461))

(push 1)

(assert (not start!66718))

(check-sat)

(pop 1)

(push 1)

(check-sat)

