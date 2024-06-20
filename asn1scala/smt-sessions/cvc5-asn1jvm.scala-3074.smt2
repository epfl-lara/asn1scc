; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70904 () Bool)

(assert start!70904)

(declare-datatypes ((array!20187 0))(
  ( (array!20188 (arr!9892 (Array (_ BitVec 32) (_ BitVec 8))) (size!8800 (_ BitVec 32))) )
))
(declare-fun a!440 () array!20187)

(assert (=> start!70904 (and (not (= ((_ sign_extend 32) (size!8800 a!440)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8800 a!440))) ((_ sign_extend 32) (size!8800 a!440))))))))

(declare-fun array_inv!8352 (array!20187) Bool)

(assert (=> start!70904 (array_inv!8352 a!440)))

(declare-fun bs!27584 () Bool)

(assert (= bs!27584 start!70904))

(declare-fun m!458953 () Bool)

(assert (=> bs!27584 m!458953))

(push 1)

(assert (not start!70904))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

