; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66730 () Bool)

(assert start!66730)

(declare-fun at!281 () (_ BitVec 64))

(declare-datatypes ((array!17993 0))(
  ( (array!17994 (arr!8887 (Array (_ BitVec 32) (_ BitVec 8))) (size!7804 (_ BitVec 32))) )
))
(declare-fun a!429 () array!17993)

(assert (=> start!66730 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!281) (bvslt at!281 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7804 a!429)))) (bvslt (bvsrem at!281 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsrem at!281 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> start!66730 true))

(declare-fun array_inv!7416 (array!17993) Bool)

(assert (=> start!66730 (array_inv!7416 a!429)))

(declare-fun bs!25809 () Bool)

(assert (= bs!25809 start!66730))

(declare-fun m!437473 () Bool)

(assert (=> bs!25809 m!437473))

(push 1)

(assert (not start!66730))

(check-sat)

(pop 1)

(push 1)

(check-sat)

