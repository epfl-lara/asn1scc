; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70774 () Bool)

(assert start!70774)

(declare-fun i!979 () (_ BitVec 64))

(declare-datatypes ((array!20091 0))(
  ( (array!20092 (arr!9846 (Array (_ BitVec 32) (_ BitVec 8))) (size!8754 (_ BitVec 32))) )
))
(declare-fun a!425 () array!20091)

(assert (=> start!70774 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!979) (not (= ((_ sign_extend 32) (size!8754 a!425)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8754 a!425))) ((_ sign_extend 32) (size!8754 a!425))))))))

(assert (=> start!70774 true))

(declare-fun array_inv!8306 (array!20091) Bool)

(assert (=> start!70774 (array_inv!8306 a!425)))

(declare-fun bs!27523 () Bool)

(assert (= bs!27523 start!70774))

(declare-fun m!458625 () Bool)

(assert (=> bs!27523 m!458625))

(push 1)

(assert (not start!70774))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

