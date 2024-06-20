; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70914 () Bool)

(assert start!70914)

(declare-datatypes ((array!20197 0))(
  ( (array!20198 (arr!9897 (Array (_ BitVec 32) (_ BitVec 8))) (size!8805 (_ BitVec 32))) )
))
(declare-fun a!440 () array!20197)

(assert (=> start!70914 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8805 a!440))))))

(declare-fun array_inv!8357 (array!20197) Bool)

(assert (=> start!70914 (array_inv!8357 a!440)))

(declare-fun bs!27592 () Bool)

(assert (= bs!27592 start!70914))

(declare-fun m!458963 () Bool)

(assert (=> bs!27592 m!458963))

(push 1)

(assert (not start!70914))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!104976 () Bool)

(assert (=> d!104976 (= (array_inv!8357 a!440) (bvsge (size!8805 a!440) #b00000000000000000000000000000000))))

(assert (=> start!70914 d!104976))

(push 1)

