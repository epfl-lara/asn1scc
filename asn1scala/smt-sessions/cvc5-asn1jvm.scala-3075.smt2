; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70910 () Bool)

(assert start!70910)

(declare-datatypes ((array!20193 0))(
  ( (array!20194 (arr!9895 (Array (_ BitVec 32) (_ BitVec 8))) (size!8803 (_ BitVec 32))) )
))
(declare-fun a!440 () array!20193)

(assert (=> start!70910 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8803 a!440))))))

(declare-fun array_inv!8355 (array!20193) Bool)

(assert (=> start!70910 (array_inv!8355 a!440)))

(declare-fun bs!27590 () Bool)

(assert (= bs!27590 start!70910))

(declare-fun m!458959 () Bool)

(assert (=> bs!27590 m!458959))

(push 1)

(assert (not start!70910))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!104972 () Bool)

(assert (=> d!104972 (= (array_inv!8355 a!440) (bvsge (size!8803 a!440) #b00000000000000000000000000000000))))

(assert (=> start!70910 d!104972))

(push 1)

(check-sat)

(pop 1)

