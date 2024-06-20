; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70908 () Bool)

(assert start!70908)

(declare-datatypes ((array!20191 0))(
  ( (array!20192 (arr!9894 (Array (_ BitVec 32) (_ BitVec 8))) (size!8802 (_ BitVec 32))) )
))
(declare-fun a!440 () array!20191)

(assert (=> start!70908 (and (not (= ((_ sign_extend 32) (size!8802 a!440)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8802 a!440))) ((_ sign_extend 32) (size!8802 a!440))))))))

(declare-fun array_inv!8354 (array!20191) Bool)

(assert (=> start!70908 (array_inv!8354 a!440)))

(declare-fun bs!27586 () Bool)

(assert (= bs!27586 start!70908))

(declare-fun m!458957 () Bool)

(assert (=> bs!27586 m!458957))

(push 1)

(assert (not start!70908))

(check-sat)

(pop 1)

(push 1)

(check-sat)

