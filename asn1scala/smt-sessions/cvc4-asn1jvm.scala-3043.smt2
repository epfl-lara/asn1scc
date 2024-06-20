; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70628 () Bool)

(assert start!70628)

(declare-datatypes ((array!20006 0))(
  ( (array!20007 (arr!9810 (Array (_ BitVec 32) (_ BitVec 8))) (size!8718 (_ BitVec 32))) )
))
(declare-fun a!422 () array!20006)

(assert (=> start!70628 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8718 a!422))))))

(declare-fun array_inv!8270 (array!20006) Bool)

(assert (=> start!70628 (array_inv!8270 a!422)))

(declare-fun bs!27457 () Bool)

(assert (= bs!27457 start!70628))

(declare-fun m!458211 () Bool)

(assert (=> bs!27457 m!458211))

(push 1)

(assert (not start!70628))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

