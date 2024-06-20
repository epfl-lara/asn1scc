; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66722 () Bool)

(assert start!66722)

(declare-fun at!281 () (_ BitVec 64))

(declare-datatypes ((array!17985 0))(
  ( (array!17986 (arr!8883 (Array (_ BitVec 32) (_ BitVec 8))) (size!7800 (_ BitVec 32))) )
))
(declare-fun a!429 () array!17985)

(assert (=> start!66722 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!281) (bvslt at!281 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7800 a!429)))) (bvslt (bvsdiv at!281 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsdiv at!281 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> start!66722 true))

(declare-fun array_inv!7412 (array!17985) Bool)

(assert (=> start!66722 (array_inv!7412 a!429)))

(declare-fun bs!25799 () Bool)

(assert (= bs!25799 start!66722))

(declare-fun m!437465 () Bool)

(assert (=> bs!25799 m!437465))

(push 1)

(assert (not start!66722))

(check-sat)

(pop 1)

(push 1)

(check-sat)

