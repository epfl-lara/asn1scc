; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66734 () Bool)

(assert start!66734)

(declare-fun at!281 () (_ BitVec 64))

(declare-datatypes ((array!17997 0))(
  ( (array!17998 (arr!8889 (Array (_ BitVec 32) (_ BitVec 8))) (size!7806 (_ BitVec 32))) )
))
(declare-fun a!429 () array!17997)

(assert (=> start!66734 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!281) (bvslt at!281 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7806 a!429)))) (bvslt (bvsrem at!281 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsrem at!281 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> start!66734 true))

(declare-fun array_inv!7418 (array!17997) Bool)

(assert (=> start!66734 (array_inv!7418 a!429)))

(declare-fun bs!25811 () Bool)

(assert (= bs!25811 start!66734))

(declare-fun m!437477 () Bool)

(assert (=> bs!25811 m!437477))

(push 1)

