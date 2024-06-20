; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70674 () Bool)

(assert start!70674)

(declare-datatypes ((array!20033 0))(
  ( (array!20034 (arr!9820 (Array (_ BitVec 32) (_ BitVec 8))) (size!8728 (_ BitVec 32))) )
))
(declare-fun a!422 () array!20033)

(assert (=> start!70674 (and (not (= ((_ sign_extend 32) (size!8728 a!422)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8728 a!422))) ((_ sign_extend 32) (size!8728 a!422))))))))

(declare-fun array_inv!8280 (array!20033) Bool)

(assert (=> start!70674 (array_inv!8280 a!422)))

(declare-fun bs!27476 () Bool)

(assert (= bs!27476 start!70674))

(declare-fun m!458297 () Bool)

(assert (=> bs!27476 m!458297))

(push 1)

(assert (not start!70674))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

