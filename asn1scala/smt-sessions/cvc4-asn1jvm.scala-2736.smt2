; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66710 () Bool)

(assert start!66710)

(declare-fun at!281 () (_ BitVec 64))

(declare-datatypes ((array!17973 0))(
  ( (array!17974 (arr!8877 (Array (_ BitVec 32) (_ BitVec 8))) (size!7794 (_ BitVec 32))) )
))
(declare-fun a!429 () array!17973)

(assert (=> start!66710 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!281) (not (= ((_ sign_extend 32) (size!7794 a!429)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7794 a!429))) ((_ sign_extend 32) (size!7794 a!429))))))))

(assert (=> start!66710 true))

(declare-fun array_inv!7406 (array!17973) Bool)

(assert (=> start!66710 (array_inv!7406 a!429)))

(declare-fun bs!25787 () Bool)

(assert (= bs!25787 start!66710))

(declare-fun m!437453 () Bool)

(assert (=> bs!25787 m!437453))

(push 1)

(assert (not start!66710))

(check-sat)

(pop 1)

(push 1)

(check-sat)

