; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70684 () Bool)

(assert start!70684)

(declare-datatypes ((Unit!21930 0))(
  ( (Unit!21931) )
))
(declare-fun lt!443708 () Unit!21930)

(declare-datatypes ((array!20043 0))(
  ( (array!20044 (arr!9825 (Array (_ BitVec 32) (_ BitVec 8))) (size!8733 (_ BitVec 32))) )
))
(declare-fun a!422 () array!20043)

(declare-fun lt!443707 () (_ BitVec 64))

(declare-fun rec!17 (array!20043 (_ BitVec 64)) Unit!21930)

(assert (=> start!70684 (= lt!443708 (rec!17 a!422 lt!443707))))

(assert (=> start!70684 (= lt!443707 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8733 a!422))))))

(assert (=> start!70684 (and (not (= ((_ sign_extend 32) (size!8733 a!422)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!443707 ((_ sign_extend 32) (size!8733 a!422))))))))

(declare-fun array_inv!8285 (array!20043) Bool)

(assert (=> start!70684 (array_inv!8285 a!422)))

(declare-fun bs!27484 () Bool)

(assert (= bs!27484 start!70684))

(declare-fun m!458311 () Bool)

(assert (=> bs!27484 m!458311))

(declare-fun m!458313 () Bool)

(assert (=> bs!27484 m!458313))

(push 1)

(assert (not start!70684))

(check-sat)

(pop 1)

(push 1)

(check-sat)

