; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70654 () Bool)

(assert start!70654)

(declare-datatypes ((Unit!21915 0))(
  ( (Unit!21916) )
))
(declare-fun lt!443654 () Unit!21915)

(declare-datatypes ((array!20022 0))(
  ( (array!20023 (arr!9816 (Array (_ BitVec 32) (_ BitVec 8))) (size!8724 (_ BitVec 32))) )
))
(declare-fun a!422 () array!20022)

(declare-fun rec!17 (array!20022 (_ BitVec 64)) Unit!21915)

(assert (=> start!70654 (= lt!443654 (rec!17 a!422 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8724 a!422)))))))

(assert (=> start!70654 false))

(declare-fun array_inv!8276 (array!20022) Bool)

(assert (=> start!70654 (array_inv!8276 a!422)))

(declare-fun bs!27466 () Bool)

(assert (= bs!27466 start!70654))

(declare-fun m!458269 () Bool)

(assert (=> bs!27466 m!458269))

(declare-fun m!458271 () Bool)

(assert (=> bs!27466 m!458271))

(push 1)

(assert (not start!70654))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

