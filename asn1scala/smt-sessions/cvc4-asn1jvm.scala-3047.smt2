; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70678 () Bool)

(assert start!70678)

(declare-datatypes ((array!20037 0))(
  ( (array!20038 (arr!9822 (Array (_ BitVec 32) (_ BitVec 8))) (size!8730 (_ BitVec 32))) )
))
(declare-fun a!422 () array!20037)

(assert (=> start!70678 (and (not (= ((_ sign_extend 32) (size!8730 a!422)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8730 a!422))) ((_ sign_extend 32) (size!8730 a!422))))))))

(declare-fun array_inv!8282 (array!20037) Bool)

(assert (=> start!70678 (array_inv!8282 a!422)))

(declare-fun bs!27478 () Bool)

(assert (= bs!27478 start!70678))

(declare-fun m!458301 () Bool)

(assert (=> bs!27478 m!458301))

(push 1)

(assert (not start!70678))

(check-sat)

(pop 1)

(push 1)

(check-sat)

