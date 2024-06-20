; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66706 () Bool)

(assert start!66706)

(declare-fun at!281 () (_ BitVec 64))

(declare-datatypes ((array!17969 0))(
  ( (array!17970 (arr!8875 (Array (_ BitVec 32) (_ BitVec 8))) (size!7792 (_ BitVec 32))) )
))
(declare-fun a!429 () array!17969)

(assert (=> start!66706 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!281) (not (= ((_ sign_extend 32) (size!7792 a!429)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7792 a!429))) ((_ sign_extend 32) (size!7792 a!429))))))))

(assert (=> start!66706 true))

(declare-fun array_inv!7404 (array!17969) Bool)

(assert (=> start!66706 (array_inv!7404 a!429)))

(declare-fun bs!25785 () Bool)

(assert (= bs!25785 start!66706))

(declare-fun m!437449 () Bool)

(assert (=> bs!25785 m!437449))

(push 1)

(assert (not start!66706))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

