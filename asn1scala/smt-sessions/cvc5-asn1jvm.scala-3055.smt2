; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70770 () Bool)

(assert start!70770)

(declare-fun i!979 () (_ BitVec 64))

(declare-datatypes ((array!20087 0))(
  ( (array!20088 (arr!9844 (Array (_ BitVec 32) (_ BitVec 8))) (size!8752 (_ BitVec 32))) )
))
(declare-fun a!425 () array!20087)

(assert (=> start!70770 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!979) (not (= ((_ sign_extend 32) (size!8752 a!425)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8752 a!425))) ((_ sign_extend 32) (size!8752 a!425))))))))

(assert (=> start!70770 true))

(declare-fun array_inv!8304 (array!20087) Bool)

(assert (=> start!70770 (array_inv!8304 a!425)))

(declare-fun bs!27521 () Bool)

(assert (= bs!27521 start!70770))

(declare-fun m!458621 () Bool)

(assert (=> bs!27521 m!458621))

(push 1)

(assert (not start!70770))

(check-sat)

(pop 1)

(push 1)

(check-sat)

